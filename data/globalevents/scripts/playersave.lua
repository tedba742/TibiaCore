local function serverSave()
    Game.saveGameState()
    return true
end

function onThink(interval, lastExecution, thinkInterval)
    --broadcastMessage("System: Automatic server save in 10 seconds!", MESSAGE_STATUS_WARNING)
    print(">> Player and House Saved")
    addEvent(serverSave, 10000)
    
    return true
end
