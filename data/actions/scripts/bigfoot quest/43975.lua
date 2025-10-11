function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and Game.isItemThere ({x = 32123, y = 31466, z = 3},2129) 
	and Game.isItemThere ({x = 32119, y = 31463, z = 3},2773) 
	and Game.isItemThere ({x = 32127, y = 31463, z = 3},2772) 
	and Game.isItemThere ({x = 32119, y = 31466, z = 3},2773) 
	and Game.isItemThere ({x = 32122, y = 31467, z = 3},2773) 
	and Game.isItemThere ({x = 32124, y = 31467, z = 3},2772) 
	and Game.isItemThere ({x = 32127, y = 31466, z = 3},2772) then
		item:transform(2773, 1)
		item:decay()
		Game.removeItemOnMap({x = 32123, y = 31466, z = 3},2129) 
	elseif item:getId() == 2772 then
		item:transform(2773, 1)
		item:decay()
	elseif item:getId() == 2773 then
		item:transform(2772, 1)
		item:decay()
	end
	return true
end