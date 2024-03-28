function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	player:teleportTo(Position(32827,32314, 9))
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32827, y = 32314, z = 9})
end