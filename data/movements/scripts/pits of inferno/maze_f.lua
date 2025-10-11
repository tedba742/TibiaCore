function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	player:teleportTo(Position(32858,32296, 9))
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32858, y = 32296, z = 9})
end