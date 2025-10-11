function onStepIn(creature, item, position, fromPosition)
	doRelocate(item:getPosition(),{x = 32232, y = 31525, z = 8})
	Game.sendMagicEffect(item:getPosition(), 11)
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32232, y = 31525, z = 8})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end
