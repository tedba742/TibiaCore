function onStepIn(creature, item, position, fromPosition)

	if not Game.isItemThere ({x = 32826, y = 32274, z = 11},1772) then
		Game.createItem(1772, 1,{x = 32826, y = 32274, z = 11})
		return true
	end
end