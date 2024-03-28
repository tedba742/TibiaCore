function onStepIn(creature, item, position, fromPosition)
	doRelocate(item:getPosition(),{x = 33290, y = 32481, z = 7})
end

function onAddItem(creature, item, position, fromPosition)
	doRelocate(item:getPosition(),{x = 33290, y = 32481, z = 7})
end
