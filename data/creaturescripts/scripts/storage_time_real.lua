function onThink(player, interval, lastExecution)

-- 0 > Santa Claus Storage
-- 1 > Change Gold
--seg = 86400 = 24h
---Todo nova Config deve ser copiada e colada em storage_time_login.lua
local config = {
	[0] = {storage = 4404, storage2 = 44041, storage3 = 44042, day = 4.5, seg = 86400,
	startText = "Your time to receive the present again ends in: ", 
	endText = "Santa Claus is reset, you can receive a present again"},
	[1] = {storage = 4476, storage2 = 44761, storage3 = 44762, day = 1, seg = 86400,
	startText = "You activated change gold, ends in: ", 
	endText = "Your change gold time has ended."},
	[2] = {storage = 4477, storage2 = 44771, storage3 = 44772, day = 7, seg = 86400,
	startText = "You activated change gold, ends in: ", 
	endText = "Your change gold time has ended."},
	[3] = {storage = 4478, storage2 = 44781, storage3 = 44782, day = 30, seg = 86400,
	startText = "You activated change gold, ends in: ", 
	endText = "Your change gold time has ended."},
	}
	
	for i = 0, #config do
	
	local str = player:getStorageValue(config[i].storage2)
		-- check new storage from npc or action.
		if player:getStorageValue(config[i].storage) == 1 or player:getStorageValue(config[i].storage) == 2 then
			player:setStorageValue(config[i].storage, 3)
			player:setStorageValue(config[i].storage3, -1)
			player:setStorageValue(config[i].storage2, (os.time() + config[i].day * config[i].seg))
		end	
		-- send confimed storage to player.
		if(str >= 0 and (str - os.time()) > 0) and player:getStorageValue(config[i].storage3) == 0 then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config[i].startText .. os.date("%d/%m - %X", str))
			player:setStorageValue(config[i].storage3, 1)
		else
		-- ending storage to player online or login.
			if not (str >= 0 and (str - os.time()) > 0) and player:getStorageValue(config[i].storage3) == 1 then
				player:setStorageValue(config[i].storage, -1)
				player:setStorageValue(config[i].storage2, -1)
				player:setStorageValue(config[i].storage3, -1)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, config[i].endText)
			end
		end
	
	end
	--new scripts
	
	return true
end
