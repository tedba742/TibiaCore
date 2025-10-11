local pos = {x = 32849, y = 32282, z = 10}
local leverOff = 2772
local leverOn = 2773
local stone = 1791
local function revertLever(position)
	local leverItem = Tile(position):getItemById(leverOn)
	if leverItem then
		leverItem:transform(leverOff)
		Game.createItem(stone, 1, pos)
	end
end

function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == leverOff and Game.isItemThere(pos, stone) then
		item:transform(leverOn, 1)
		item:decay()
		Game.removeItemOnMap(pos, stone)
		addEvent(revertLever, 30 * 1000, toPosition)
	end
	return true
end