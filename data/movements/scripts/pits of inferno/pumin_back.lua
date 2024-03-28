function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end

	player:teleportTo(Position(32828, 32239, 12))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32828, y = 32239, z = 12})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end