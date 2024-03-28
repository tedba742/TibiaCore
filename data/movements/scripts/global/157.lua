function onStepIn(creature, item, position, fromPosition)
	doRelocate(item:getPosition(),{x = 32874, y = 31953, z = 12})
	Game.sendMagicEffect(item:getPosition(), 11)
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32874, y = 31953, z = 12})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end