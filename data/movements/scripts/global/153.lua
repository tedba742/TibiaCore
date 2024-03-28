function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:getPlayer():getStorageValue(293) >= 17 then 
		doRelocate(item:getPosition(),{x = 32748, y = 32537, z = 10})
		item:getPosition():sendMagicEffect(21)
		Game.sendMagicEffect({x = 32748, y = 32537, z = 10}, 21)
	elseif creature:isPlayer() and creature:getPlayer():getStorageValue(293) < 17 then
		doRelocate(item:getPosition(),{x = 32839, y = 32532, z = 09})
		item:getPosition():sendMagicEffect(21)
		Game.sendMagicEffect({x = 32839, y = 32532, z = 09}, 21)
	end
end
function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32748, y = 32537, z = 10})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end
