function onSay(player, words, param)
	local defaultParam = param

	param = param:lower()
	if param == '' or param == "on" then
		if not player:isLiveCaster() then
			player:startLiveCast()
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to your live!\nYour active live gain 5% more exp without password on live!\nCommands: /mute Name & /ban Name")
		end
	elseif param == "off" then
		if player:isLiveCaster() then
			if player:getSkull() == SKULL_WHITE then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You cannot close live while it is white skull!")
				return true
			end
			player:stopLiveCast()
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have stop casting your gameplay.")
		end
	else -- a password
		if not player:isLiveCaster() then
			player:startLiveCast(defaultParam)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to your live!\nYour active live gain 5% more exp without password on live!\nCommands: /mute Name & /ban Name")
		end
	end
end 
