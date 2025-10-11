function onStepIn(creature, item, position, fromPosition)
	if Game.isItemThere({x = 33017, y = 32395, z = 12}, 1949) then
		doRelocate(item:getPosition(),{x = 33013, y = 32372, z = 13})
	end
end

function onAddItem(item, tileitem, position)
	if Game.isItemThere({x = 33017, y = 32395, z = 12}, 1949) then
		doRelocate(item:getPosition(),{x = 33013, y = 32372, z = 13})
	end
end