function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:getStorageValue(4482) == 0  and Game.isItemThere({x=32222,y=31438,z=09},2918) and Game.isItemThere ({x=32224,y=31438,z=09},2918) and Game.isItemThere ({x=32222,y=31440,z=09},2918) and Game.isItemThere ({x=32224,y=31440,z=09},2918) then 
		doRelocate(item:getPosition(),{x = 32133, y = 31509, z = 05})
		Game.sendMagicEffect(item:getPosition(), 11)
		creature:setStorageValue(4482, 1)
		Game.sendMagicEffect({x = 32222, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32222, y = 31440, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31440, z = 09}, 3)
	elseif creature:isPlayer() and creature:getStorageValue(4482) >= 1  and Game.isItemThere({x=32222,y=31438,z=09},2918) and Game.isItemThere ({x=32224,y=31438,z=09},2918) and Game.isItemThere ({x=32222,y=31440,z=09},2918) and Game.isItemThere ({x=32224,y=31440,z=09},2918) then 
		doRelocate(item:getPosition(),{x = 32133, y = 31509, z = 05})
		Game.sendMagicEffect(item:getPosition(), 11)
		Game.sendMagicEffect({x = 32222, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32222, y = 31440, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31440, z = 09}, 3)
	end
end

function onAddItem(item, tileitem, position)
	if Game.isItemThere({x=32222,y=31438,z=09},2918) and Game.isItemThere ({x=32224,y=31438,z=09},2918) and Game.isItemThere ({x=32222,y=31440,z=09},2918) and Game.isItemThere ({x=32224,y=31440,z=09},2918) then 
		doRelocate(item:getPosition(),{x = 32133, y = 31509, z = 05})
		Game.sendMagicEffect(tileitem:getPosition(), 11)
		Game.sendMagicEffect({x = 32222, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31438, z = 09}, 3)
		Game.sendMagicEffect({x = 32222, y = 31440, z = 09}, 3)
		Game.sendMagicEffect({x = 32224, y = 31440, z = 09}, 3)
	end
end
