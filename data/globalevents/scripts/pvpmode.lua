local days = {"Monday","Wednesday","Friday","Saturday"}

function onThink(interval)

    local day = os.date("%A")
    if table.contains(days, day)  and Game.getWorldType() == 1 then
        Game.setWorldType(2)
        Game.broadcastMessage("Server Just change to PvP", MESSAGE_EVENT_ADVANCE)
        return true
    end
	
    if not table.contains(days, day) and Game.getWorldType() == 2 then
		Game.setWorldType(1)
		Game.broadcastMessage("Server Just change to No-PvP", MESSAGE_EVENT_ADVANCE)
    end

    return true
end
