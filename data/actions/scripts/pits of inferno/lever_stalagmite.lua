local pos = {x = 32860, y = 32313, z = 11}
local itemA = 389
function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and Game.isItemThere(pos, itemA) then
		item:transform(2773, 1)
		item:decay()
		Game.removeItemOnMap(pos,itemA)
	end
	return true
end