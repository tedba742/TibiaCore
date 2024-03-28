function onStepIn(creature, item, position, fromPosition)
	doRelocate(item:getPosition(),{x = 32874, y = 31942, z = 11})
	Game.sendMagicEffect(item:getPosition(), 11)
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32874, y = 31942, z = 11})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end