function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end

	player:teleportTo(Position(32835, 32275, 9))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32835, y = 32275, z = 9})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end