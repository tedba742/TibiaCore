local pos = {x = 32826, y = 32274, z = 11}
local leverOff = 2772
local leverOn = 2773
local stone = 1772

function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == leverOff and Game.isItemThere(pos, stone) then
		item:transform(leverOn, 1)
		item:decay()
		Game.removeItemOnMap(pos, stone)
	elseif item:getId() == leverOn then
		item:transform(leverOff, 1)
	end
	return true
end