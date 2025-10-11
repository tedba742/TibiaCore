local CHANNEL_CAST = 255
function onJoin(player)
	if not player:isLiveCaster() then
		player:startLiveCast()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Welcome to your live!\nYour active live gain 5% more exp without password on live!\nCommands: /mute Name & /ban Name")
	end
	return true
end
function onLeave(player)
	if player:isLiveCaster() then
		player:stopLiveCast()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You closed your live!")
	end
	return true
end
