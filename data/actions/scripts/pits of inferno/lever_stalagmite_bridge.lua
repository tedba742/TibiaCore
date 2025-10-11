local pos = {x = 32861, y = 32305, z = 11}
local itemA = 1771
local itemB = 4797
local itemC = 4799
function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and not Game.isItemThere(pos, itemA) then
		item:transform(2773, 1)
		item:decay()
		Game.removeItemOnMap(pos,itemB)
		Game.transformItemOnMap(pos, itemC, itemA) 
	end
	return true
end