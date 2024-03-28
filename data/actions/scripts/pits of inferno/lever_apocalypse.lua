local pos = {x = 32822, y = 32234, z = 12}
local pos2 = {x = 32826, y = 32234, z = 12}
local leverOff = 2772
local leverOn = 2773
local stone = 1791
local function revertLever(position)
	local leverItem = Tile(position):getItemById(leverOn)
	if leverItem then
		leverItem:transform(leverOff)
		Game.createItem(stone, 1, pos)
		Game.createItem(stone, 1, pos2)
	end
end

function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == leverOff and Game.isItemThere(pos, stone) then
		item:transform(leverOn, 1)
		item:decay()
		Game.removeItemOnMap(pos, stone)
		Game.removeItemOnMap(pos2, stone)
		addEvent(revertLever, 180 * 60 * 1000, toPosition)
	end
	return true
end