local IntervalDay = 90
local currentDate = os.date('*t')
local currentTime = os.time(currentDate)
local endDateTime = currentTime + IntervalDay * 24 * 60 * 60

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
		return true
	end
	if player:getStorageValue(32712) > 0 then
		creature:teleportTo(fromPosition, true)
		return true
	end
	if(not spiker_sword_global_quest)then
		setGlobalStorage("spiker_sword_global_quest", endDateTime)
	end
	player:setStorageValue(32712, 1)
	player:teleportTo(Position(32095, 32085, 12))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32095, y = 32085, z = 12})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end