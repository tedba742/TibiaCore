local scroll = 4476
local storage = 44760
local RewardGive = false

function onAdvance(player, skill, oldlevel, newlevel)
    if skill == SKILL_LEVEL then
	if  newlevel >= 7  and player:getStorageValue(storage) == 0 then
        player:setStorageValue(storage, 1)
        player:addItem(scroll, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You receive 1 change gold scroll.")
		
    elseif newlevel >= 15 and player:getStorageValue(storage) == 1 then
        player:setStorageValue(storage, 2)
        player:addItem(scroll, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You receive 1 change gold scroll.")

    elseif newlevel >= 20 and player:getStorageValue(storage) == 2 then
        player:setStorageValue(storage, 3)
        player:addItem(scroll, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You receive 1 change gold scroll.")

    elseif newlevel >= 25 and player:getStorageValue(storage) == 3 then
        player:setStorageValue(storage, 4)
        player:addItem(scroll, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You receive 1 change gold scroll.")
		
    elseif newlevel >= 30 and player:getStorageValue(storage) == 4 then
        player:setStorageValue(storage, 5)
        player:addItem(scroll, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You receive 1 change gold scroll.")
	
    --elseif newlevel >= 100 and FirstGoldenHelmetPlayer == 0 and not RewardGive then
        --player:addItem(3365, 1)
		--updateGlobalStorage("FirstGoldenHelmetPlayer", 1)
		--RewardGive = true
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations, you got the only golden helmet when you reached level 100!")
		--for _, targetPlayer in ipairs(Game.getPlayers()) do
		--		targetPlayer:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations! " .. player:getName() .. " won the only golden helmet upon reaching level 100!")
		--end
    end
end
    return true
end
