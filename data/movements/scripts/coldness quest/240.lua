function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:getPlayer():getStorageValue(4482)  >= 2 then
	doRelocate(item:getPosition(),{x = 32119, y = 31464, z = 9})
	Game.sendMagicEffect(item:getPosition(), 11)
	else
	doRelocate(item:getPosition(),{x = 32113, y = 31452, z = 3})
	Game.sendMagicEffect(item:getPosition(), 11)
end
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32119, y = 31464, z = 9})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end
