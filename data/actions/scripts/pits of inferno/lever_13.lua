local pos = {x = 32874, y = 32365, z = 13}
local itemA = 2772
local itemB = 2773

local function revertLever(position)
	local leverItem = Tile(position):getItemById(itemB)
	if leverItem then
		leverItem:transform(itemA)
	end
end

function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == itemA and Game.isItemThere(pos, itemB) then
		item:transform(itemB, 1)
		item:decay()
		addEvent(revertLever, 15 * 60 * 1000, toPosition)
	end
	return true
end