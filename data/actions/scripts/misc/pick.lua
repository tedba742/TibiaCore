function onUse(player, item, fromPosition, target, toPosition)
	local POOLS = {2886, 2887, 2888, 2889, 2890, 2891}
	local fields = {2118, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 2128, 2129}
	
	local groundItem = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 0})
	local fieldItem = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 1})
	local blockingItem = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 255})
	
	local tile = Tile(toPosition)
	if not tile then
		return false
	end

	local ground = tile:getGround()
	if not ground then
		return false
	end
	
	if groundItem.itemid == 372 and blockingItem.itemid == 0 and not isInArray(fields, fieldItem.itemid) and not isInArray(POOLS, blockingItem.itemid) then
		ground:transform(394, 1)
		ground:decay()
		return true
	elseif target:getId() == 1772 and toPosition.x == 32648 and toPosition.y == 32134 and toPosition.z == 10 and math.random(1, 100) <= 40 then 
		Game.sendMagicEffect({x = 32648, y = 32134, z = 10}, 3)
		Game.removeItemOnMap({x = 32648, y = 32134, z = 10}, 1772)
		return true
	elseif target:getId() == 1772 and toPosition.x == 32648 and toPosition.y == 32134 and toPosition.z == 10 then 
		Game.sendMagicEffect({x = 32648, y = 32134, z = 10}, 3)
		doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -40, -40)
		return true
	elseif target:getId() == 1791 and toPosition.x == 32356 and toPosition.y == 32074 and toPosition.z == 10 and math.random(1, 100) <= 40 then 
		Game.sendMagicEffect({x = 32356, y = 32074, z = 10}, 3)
		Game.removeItemOnMap({x = 32356, y = 32074, z = 10}, 1791)
		return true
	elseif target:getId() == 1791 and toPosition.x == 32356 and toPosition.y == 32074 and toPosition.z == 10 then
		Game.sendMagicEffect({x = 32356, y = 32074, z = 10}, 3)
		doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -50, -50)
		return true
	end
	return false
end
