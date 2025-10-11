local Status = 0
function onThink(interval, lastExecution)
    local currentDate = os.date('*t')
    local targetDate = {
        year = 2023,
        month = 11,
        day = 30,
        hour = 17,
        min = 59,
        sec = 58
    }

    local currentTimestamp = os.time(currentDate)
    local targetTimestamp = os.time(targetDate)

    if (currentTimestamp >= targetTimestamp and Status == 1) then
        Game.setGameState(GAME_STATE_NORMAL)
        print(">> Servidor Aberto")
	Status = 0
	db.query("UPDATE accounts SET premdays = 7 WHERE premdays < 7;")
        return true
    end

   if (currentTimestamp < targetTimestamp and Status == 0) then
        Game.setGameState(GAME_STATE_CLOSED)
        print(">> Servidor Fechado")
	Status = 1
	return true
    end

    return true
end

