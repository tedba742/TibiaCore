function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end

	player:teleportTo(Position(32826, 32273, 12))
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32826, y = 32273, z = 12})
end