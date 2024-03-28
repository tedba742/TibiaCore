local pos = {x = 32831, y = 32333, z = 11}
local itemA = 1628
local itemB = 1629
function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and Game.isItemThere(pos, itemA) then
		item:transform(2773, 1)
		item:decay()
		Game.transformItemOnMap(pos, itemA, itemB) 
	end
	return true
end