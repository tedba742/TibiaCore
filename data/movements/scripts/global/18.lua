function onStepIn(creature, item, position, fromPosition)
	if(not spiker_sword_global_quest) then
		if creature:isPlayer() and Game.isItemThere({x = 32104, y = 32082, z = 07},618) and Game.isItemThere ({x = 32102, y = 32084, z = 07},2123) then 
			Game.removeItemOnMap({x = 32101, y = 32085, z = 07}, 3271)
			Game.createItem(3271, 1,{x = 32101, y = 32085, z = 12})
			Game.sendMagicEffect({x = 32101, y = 32085, z = 07}, 14)
			Game.removeItemOnMap({x = 32100, y = 32103, z = 5}, 2123) -- fire mino mountain
			Game.transformItemOnMap({x = 32100, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32101, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32100, y = 32085, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32085, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32100, y = 32086, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32101, y = 32086, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32086, z = 07}, 2123, 2125)
		end
	end
end
