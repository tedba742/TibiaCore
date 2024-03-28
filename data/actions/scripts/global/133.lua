local questNormal = { {3039, 1}, {3295, 1} }
local questRare = { {3390, 1} }
local questType
local questTrue = false
local IntervalDay = 90
local currentDate = os.date('*t')
local currentTime = os.time(currentDate)
local endDateTime = currentTime + IntervalDay * 24 * 60 * 60

function onUse(player, item, fromPosition, target, toPosition)
    if player:getStorageValue(133) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. item:getName() .. " is empty.")
		return true
	end
	
	if (math.random(0, 100) > 1) then
		questType = questNormal
	else
		if(currentTime >= HornedHelmetFound and not questTrue) then
			questType = questRare
			setGlobalStorage("HornedHelmetFound", endDateTime)
			questTrue = true
			--for _, targetPlayer in ipairs(Game.getPlayers()) do
			--targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, player:getName() .. " found a horned helmet.")
			--end
		else
			questType = questNormal
		end
	end
	
    local container = player:addItem(2853, 1)
    for i = 1, #questType do
        local itemid = questType[i][1]
        local count = questType[i][2]
        if not ItemType(itemid):isStackable() then
            for c = 1, count do
                container:addItem(itemid, 1)
            end
        else
            container:addItem(itemid, count)
        end
    end
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a bag.")
	player:setStorageValue(133, 1)
    return true
end