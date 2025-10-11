local pos = {x = 32889, y = 32349, z = 15}
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