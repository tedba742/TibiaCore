function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and Game.isItemThere({x = 32104, y = 32082, z = 07}, 619) then 
		Game.transformItemOnMap({x = 32104, y = 32082, z = 07}, 619, 618)
	end
end
