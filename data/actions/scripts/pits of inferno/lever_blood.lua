local posLadder = {x = 32854, y = 32321, z = 11}
local posBlood = {x = 32845, y = 32282, z = 12}
local itemA = 2772
local itemB = 2773
local Ladder = 1948
local function revertLever(position)
	local leverItem = Tile(position):getItemById(itemB)
	if leverItem then
		leverItem:transform(itemA)
		Game.removeItemOnMap(posLadder, Ladder)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == itemA and Tile(Position(32845, 32282, 12)):getItemById(2886, 5) then
		item:transform(itemB, 1)
		Game.createItem(Ladder, 1, posLadder)
		Game.removeItemOnMap(posBlood, 2886)
		addEvent(revertLever, 15 * 60 * 1000, toPosition)
		Game.sendMagicEffect(posLadder, 3)
		Game.sendMagicEffect(posBlood, 1)
		return true
	end
end