local PlayerPos = {
	{x = 32994, y = 32381, z = 12},
	{x = 33043, y = 32381, z = 12},
	{x = 32994, y = 32429, z = 12},
	{x = 33017, y = 32435, z = 12},
	{x = 33043, y = 32429, z = 12}
}

local teleport = {x = 33017, y = 32395, z = 12}
local sacrificPos = {x = 33017, y = 32382, z = 12}
local function revert(position)
Game.removeItemOnMap(teleport, 1949)
Game.createItem(1842, 1, teleport)
end

function onAddItem(item, tileitem, position)
	if Tile(sacrificPos):getItemById(2886, 5) and not Game.isItemThere(teleport, 1842) then
		for i = 1, #PlayerPos do
		local player = Tile(PlayerPos[i]):getTopCreature()
			if player == NULL then
				return false
			end
			if player:isPlayer() then
				Game.sendMagicEffect(PlayerPos[i], 1)
				doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -200, -300)
				Game.createItem(2886, 5, PlayerPos[i])
				if player:getSex() == PLAYERSEX_FEMALE then
					Game.createItem(4247, 1, PlayerPos[i])
				else
					Game.createItem(4240, 1, PlayerPos[i])
				end
			end
		end
		Game.removeItemOnMap(sacrificPos, 2886)
		Game.sendMagicEffect(tileitem:getPosition(), 1)
		Game.createItem(1949, 1, teleport)
		addEvent(revert, 5*60*1000, teleport)
		Game.createMonster("master of shadow mages", {x = 33013, y = 32359, z = 13})
		Game.createMonster("necromancer", {x = 33010, y = 32363, z = 13})
		Game.createMonster("necromancer", {x = 33010, y = 32368, z = 13})
		Game.createMonster("necromancer", {x = 33017, y = 32363, z = 13})
		Game.createMonster("necromancer", {x = 33017, y = 32368, z = 13})
	end
	return true
end
