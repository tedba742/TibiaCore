local eventStarted
local playerWon
local intervalDay = ((7 * 24 * 60 * 60) - 120)
local exaustTime = 1 -- ((7 * 24 * 60 * 60) - 60)
local Reward = {
    [1] = {
        --id = 5099,
	id = 4477,
        count = 3
    },
    [2] = {
        id = 4477,
        count = 2
    },
    [3] = {
        id = 4477,
        count = 1
    }
}

function onThink(interval, lastExecution)

    local currentDate = os.date('*t')
    local currentTime = os.time(currentDate)
    local newEventTime = currentTime + intervalDay

    local tableExists = db.storeQuery("SHOW TABLES LIKE 'top_player_week'")
    local playersQuery = db.storeQuery(
        "SELECT name, experience FROM players WHERE (group_id < 2 AND id > 2) ORDER BY experience ") -- DESC LIMIT 5")
    local event_ = db.storeQuery("SELECT * FROM top_player_week")

    local playerName = null
    local playerExp = 0
    local startExp = 0
    local currentExp = 0
    local event_time = 0
    local playerEvent = null
    local lastEvent = 0

    if not tableExists then
        db.query([[
            CREATE TABLE top_player_week (
                event_time INT DEFAULT 0,
                name VARCHAR(255) NOT NULL,
                start_experience INT NOT NULL,
                current_experience INT NOT NULL,
                last_participation INT DEFAULT 0
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]])
        print(">>> Table top_player_week created.")
        return true
    end

    if (playersQuery ~= false) then
        if not eventStarted then
            if event_ ~= false then
                local resultEvent = db:storeQuery(
                    "SELECT event_time FROM top_player_week WHERE event_time = last_participation")
                event_time = tonumber(result.getDataString(resultEvent, "event_time"))
            end
            repeat
                playerName = tostring(result.getDataString(playersQuery, "name"))
                playerExp = tonumber(result.getDataString(playersQuery, "experience"))

                if event_ ~= false then
                    playerEvent = tostring(result.getDataString(event_, "name"))
                    startExp = tonumber(result.getDataString(event_, "start_experience"))
                    currentExp = tonumber(result.getDataString(event_, "current_experience"))
                    lastEvent = tonumber(result.getDataString(event_, "last_participation"))
                end

                if playerWon or event_time ~= nil then
                    local playerExistsQuery = db.storeQuery(
                        "SELECT COUNT(*) as count FROM top_player_week WHERE name = '" .. playerName .. "'")
                    local playerExists = tonumber(result.getDataString(playerExistsQuery, "count"))
                    result.free(playerExistsQuery)

                    if playerExists == 0 then
                        db.query(string.format([[
                            INSERT INTO top_player_week (event_time, name, start_experience, current_experience, last_participation)
                            VALUES (%d, '%s', %d, %d, %d)
                        ]], newEventTime, playerName, playerExp, 0, newEventTime))
                    end
                end
            until not result.next(playersQuery)

            if playerWon then
                print(">>> New Top Week Event Started.")
                for _, targetPlayer in ipairs(Game.getPlayers()) do
                    targetPlayer:sendTextMessage(MESSAGE_STATUS_WARNING, "Event Top Player Week Restarted!")
                end
            else
                print(">>> Continue Top Week Event.")
            end
            result.free(playersQuery)
            result.free(event_)
            eventStarted = true
            return true
        end

        if eventStarted then
            -- Update table player exp.
            -- print(">>> Top Week Event Update.")
            repeat
                playerName = tostring(result.getDataString(playersQuery, "name"))
                playerExp = tonumber(result.getDataString(playersQuery, "experience"))
                local resultEvent = db.storeQuery("SELECT * FROM top_player_week WHERE name = '" .. playerName .. "'")

                if not resultEvent then
                    local newEventPlayer = db.storeQuery("SELECT MAX(event_time) as new_event FROM top_player_week")
                    local newEvent = tonumber(result.getDataString(newEventPlayer, "new_event"))

                    db.query(string.format([[
                        INSERT INTO top_player_week (event_time, name, start_experience, current_experience, last_participation)
                        VALUES (%d, '%s', %d, %d, %d)
                    ]], newEvent, playerName, playerExp, 0, newEvent))
                    result.free(newEventPlayer)
                else
                    event_time = tonumber(result.getDataString(resultEvent, "event_time"))
                    startExp = tonumber(result.getDataString(resultEvent, "start_experience"))
                    lastEvent = tonumber(result.getDataString(resultEvent, "last_participation"))

                    if event_time == lastEvent then -- event_time >= currentTime and event_time == lastEvent then
                        local vatiationExp = (playerExp - startExp)
                        db.query(string.format([[
                            UPDATE top_player_week
                            SET current_experience = %d WHERE name = '%s'
                        ]], vatiationExp, playerName))
                        playerWon = false
                    end
                end
            until not result.next(playersQuery)
            result.free(playersQuery)
            result.free(newEventPlayer)
            result.free(event_)
        end

        if eventStarted and not playerWon then
            -- Final event time.
            if event_ ~= false then
                local finalEvent = db:storeQuery(
                    "SELECT name, current_experience, event_time FROM top_player_week WHERE event_time = last_participation")
                local final = tonumber(result.getDataString(finalEvent, "event_time"))

                if (final <= currentTime) then

                    local max_experience = 0
                    local winners = {}
                    repeat
                        local current_experience = tonumber(result.getDataString(finalEvent, "current_experience"))
                        local name = tostring(result.getDataString(finalEvent, "name"))

                        table.insert(winners, {
                            name = name,
                            experience = current_experience
                        })
                    until not result.next(finalEvent)

                    table.sort(winners, function(a, b)
                        return a.experience > b.experience
                    end)
                    for i = 1, 3 do
                        local winner = winners[i]
                        if winner then

                            local exaustEvent = newEventTime + exaustTime
                            local cid = getPlayerByName(winner.name)
                            -- Send to shop.
                            local dbPlayer = db:storeQuery("SELECT id, account_id FROM players WHERE name = '" ..
                                                               winner.name .. "'")
                            local player_id = tonumber(result.getDataString(dbPlayer, "id"))
                            local account_id = tonumber(result.getDataString(dbPlayer, "account_id"))

                            if i == 1 then
                                db.query(string.format([[
                                    UPDATE top_player_week
                                    SET last_participation = %d WHERE name = '%s'
                                ]], exaustEvent, winner.name))
                                db.query(string.format(
                                    [[INSERT INTO shop (from_player, to_player, offer_name, points, item_id, item_count, item_container, container_count, status, date_created, account_id) VALUES ('%s', '%s', '%s', %d, %d, %d, %d, %d, '%s', DATE_ADD(NOW(), INTERVAL 0 DAY), %d)]],
                                    "Top Player Week", winner.name, ItemType(Reward[i].id):getName(), 0, Reward[i].id,
                                Reward[i].count, 0, 0, "waiting", account_id))
                            end
                            if i == 2 then
                                db.query(string.format(
                                    [[INSERT INTO shop (from_player, to_player, offer_name, points, item_id, item_count, item_container, container_count, status, date_created, account_id) VALUES ('%s', '%s', '%s', %d, %d, %d, %d, %d, '%s', DATE_ADD(NOW(), INTERVAL 0 DAY), %d)]],
                                    "Top Player Week", winner.name, ItemType(Reward[i].id):getName(), 0, Reward[i].id,
                                Reward[i].count, 0, 0, "waiting", account_id))
                            end
                            if i == 3 then
                                db.query(string.format(
                                    [[INSERT INTO shop (from_player, to_player, offer_name, points, item_id, item_count, item_container, container_count, status, date_created, account_id) VALUES ('%s', '%s', '%s', %d, %d, %d, %d, %d, '%s', DATE_ADD(NOW(), INTERVAL 0 DAY), %d)]],
                                    "Top Player Week", winner.name, ItemType(Reward[i].id):getName(), 0, Reward[i].id,
                                Reward[i].count, 0, 0, "waiting", account_id))
                            end
                            -- print(string.format("Lugar %d: %s com uma experiência de %d", i, winner.name,winner.experience))
                        end
                    end
                    result:free(finalEvent)
                    playerWon = true
                    eventStarted = false
                    -- Clear table
                    db.query("DELETE FROM top_player_week WHERE last_participation < '" .. (currentTime + 3600) .. "'")
                    -- db.query("ALTER TABLE top_player_week AUTO_INCREMENT = 1")
                    print(">>> Top Week Event Finished.")
                end
            end
        end
    end --  final
    return true
end
