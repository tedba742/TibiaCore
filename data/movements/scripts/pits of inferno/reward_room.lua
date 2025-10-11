function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end

	player:teleportTo(Position(32826, 32243, 11))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32826, y = 32243, z = 11})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end