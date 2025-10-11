function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end

	player:teleportTo(Position(32861, 32279, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32861, y = 32279, z = 15})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end