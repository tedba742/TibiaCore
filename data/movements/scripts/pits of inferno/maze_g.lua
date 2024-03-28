function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	player:teleportTo(Position(32856,32289, 9))
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32856, y = 32289, z = 9})
end