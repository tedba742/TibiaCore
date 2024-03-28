local pos = {
	{x = 32874, y = 32334, z = 12},
	{x = 32891, y = 32328, z = 14},
	{x = 32843, y = 32352, z = 14},
	{x = 32889, y = 32349, z = 15},
	{x = 32887, y = 32330, z = 12},
	{x = 32846, y = 32318, z = 12},
	{x = 32887, y = 32355, z = 13},
	{x = 32853, y = 32359, z = 14},
	{x = 32843, y = 32359, z = 12},
	{x = 32847, y = 32332, z = 13},
	{x = 32886, y = 32337, z = 13},
	{x = 32874, y = 32365, z = 13},
	{x = 32850, y = 32366, z = 13},
	{x = 32859, y = 32364, z = 13},
	{x = 32874, y = 32354, z = 14}
}
local itemA = 2772
local itemB = 2773

local function revertLever(position)
	local leverItem = Tile(position):getItemById(itemB)
	if leverItem then
		leverItem:transform(itemA)
		Game.createItem(1791, 1,{x = 32851, y = 32333, z = 12})
		Game.createItem(1791, 1,{x = 32852, y = 32333, z = 12})
	end
end

function onUse(player, item, fromPosition, target, toPosition)
	local allSatisfied = true
	for i = 1, #pos do
		if not Game.isItemThere(pos[i], itemB) then
			allSatisfied = false
			break
		end
	end

	if item:getId() == itemA and Game.isItemThere({x = 32851, y = 32333, z = 12}, 1791)
		and Game.isItemThere({x = 32852, y = 32333, z = 12}, 1791) and allSatisfied then
		item:transform(itemB, 1)
		item:decay()
		addEvent(revertLever, 15 * 60 * 1000, toPosition)
		Game.removeItemOnMap({x = 32851, y = 32333, z = 12},1791)
		Game.removeItemOnMap({x = 32852, y = 32333, z = 12},1791)
	end
	return true
end

--[[
/pos 32874, 32334, 12,
/pos 32891, 32328, 14,
/pos 32843, 32352, 14,
/pos 32889, 32349, 15,
/pos 32887, 32330, 12,
/pos 32846, 32318, 12,
/pos 32887, 32355, 13,
/pos 32853, 32359, 14,
/pos 32843, 32359, 12,
/pos 32847, 32332, 13,
/pos 32886, 32337, 13,
/pos 32874, 32365, 13,
/pos 32850, 32366, 13,
/pos 32859, 32364, 13,
/pos 32874, 32354, 14.]]--
