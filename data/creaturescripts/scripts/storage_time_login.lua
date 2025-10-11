function onLogin(player)

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
	endText = "Your change gold time has ended."}
	}
	
	for i = 0, #config do
		local str = player:getStorageValue(config[i].storage2)
		-- send confimed storage to player login.
		if(str >= 0 and (str - os.time()) > 0) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config[i].startText .. os.date("%d/%m - %X", str))
		end
	end
	return true
end
