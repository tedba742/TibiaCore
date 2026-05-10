#!/bin/bash
# Run the game server under gdb for anti-rollback (saveServer() on crash)
# and take a periodic mysqldump after each run. Loops to auto-restart.

set -u
set -o pipefail

readonly SERVER_BIN="./TibiaCore"
readonly GDB_CONFIG="antirollback_config"
readonly WORKDIR="/opt/TibiaCore"
readonly LOG_DIR="${WORKDIR}/logs"
readonly BACKUP_DIR="${LOG_DIR}/backups"

# DB connection from environment (set by docker-compose).
DB_HOST="${DB_HOST:-db}"
DB_USER="${DB_USER:-root}"
DB_NAME="${DB_NAME:-tibiacore}"
# Pass password via MYSQL_PWD so it does not appear in `ps` output.
export MYSQL_PWD="${DB_PASSWORD:-${MYSQL_ROOT_PASSWORD:-}}"

readonly RESTART_DELAY_OK=180   # clean exit: pause before relaunch
readonly RESTART_DELAY_CRASH=5  # crash: short pause before relaunch

cd "${WORKDIR}" || exit 1
mkdir -p "${LOG_DIR}" "${BACKUP_DIR}"

# Required for gdb anti-rollback: allow core dumps and propagate child exit code.
ulimit -c unlimited

# Track the gdb child PID so we can stop it cleanly on signals.
gdb_pid=""
shutdown_requested=0

cleanup() {
    shutdown_requested=1
    if [[ -n "${gdb_pid}" ]] && kill -0 "${gdb_pid}" 2>/dev/null; then
        echo "Received shutdown signal; forwarding to gdb (pid ${gdb_pid})..."
        kill -TERM "${gdb_pid}" 2>/dev/null || true
        wait "${gdb_pid}" 2>/dev/null || true
    fi
    exit 0
}
trap cleanup SIGTERM SIGINT

run_backup() {
    local stamp dumpfile
    stamp="$(date '+%Y-%m-%d_%H-%M-%S')"
    dumpfile="${BACKUP_DIR}/${DB_NAME}-${stamp}.sql"

    if mysqldump \
            -h "${DB_HOST}" \
            -u "${DB_USER}" \
            --add-drop-table \
            --add-locks \
            --allow-keywords \
            --extended-insert \
            --quick \
            --compress \
            "${DB_NAME}" > "${dumpfile}"; then
        gzip -f "${dumpfile}"
        echo "Backup written: ${dumpfile}.gz"
    else
        echo "Backup FAILED for ${DB_NAME} on ${DB_HOST}" >&2
        rm -f "${dumpfile}"
    fi
}

echo "Starting TibiaCore game server loop (db=${DB_HOST})"

while (( shutdown_requested == 0 )); do
    log_file="${LOG_DIR}/$(date '+%Y-%m-%d_%H-%M-%S').log"

    gdb --batch \
        -return-child-result \
        --command="${GDB_CONFIG}" \
        --args "${SERVER_BIN}" 2>&1 \
        | awk '{ print strftime("%F %T - "), $0; fflush(); }' \
        | tee "${log_file}" &
    gdb_pid=$!
    wait "${gdb_pid}"
    gdb_exit=$?
    gdb_pid=""

    (( shutdown_requested == 1 )) && break

    run_backup

    if (( gdb_exit == 0 )); then
        echo "Server exited cleanly (code 0). Sleeping ${RESTART_DELAY_OK}s before relaunch."
        sleep "${RESTART_DELAY_OK}"
    else
        echo "Server crashed (code ${gdb_exit}). Restarting in ${RESTART_DELAY_CRASH}s. Log: ${log_file}"
        sleep "${RESTART_DELAY_CRASH}"
    fi
done
