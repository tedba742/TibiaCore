function onSay(player, words, param)
	
	if  getWorldType() == 1 then
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server Info:"
					.. "\nServer Mode: No-PvP Day" 
					.. "\nExp rate: " .. Game.getExperienceStage(player:getLevel())
					.. "\nSkill rate: " .. configManager.getNumber(configKeys.RATE_SKILL)
					.. "\nMagic rate: " .. configManager.getNumber(configKeys.RATE_MAGIC)
					.. "\nLoot rate: " .. configManager.getNumber(configKeys.RATE_LOOT))
	elseif  getWorldType() == 2 then
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server Info:"
					.. "\nServer Mode: PvP Day" 
					.. "\nExp rate: " .. Game.getExperienceStage(player:getLevel())
					.. "\nSkill rate: " .. configManager.getNumber(configKeys.RATE_SKILL)
					.. "\nMagic rate: " .. configManager.getNumber(configKeys.RATE_MAGIC)
					.. "\nLoot rate: " .. configManager.getNumber(configKeys.RATE_LOOT))
	
				end
	return false
end
