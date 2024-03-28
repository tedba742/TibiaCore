function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and Game.isPlayerThere({x = 33190, y = 31629, z = 13}) and Game.isItemThere({x = 33210, y = 31630, z = 13},1295) then 
		Game.removeItemOnMap({x = 33210, y = 31630, z = 13}, 1295)
		Game.removeItemOnMap({x = 33211, y = 31630, z = 13}, 1295)
		Game.removeItemOnMap({x = 33212, y = 31630, z = 13}, 1295)
		item:transform(430, 1)
	end
end

function onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() and Game.isPlayerThere({x = 33190, y = 31629, z = 13}) and not Game.isItemThere({x = 33210, y = 31630, z = 13},1295) then 
		Game.createItem(1295, 1, {x = 33210, y = 31630, z = 13})
		Game.createItem(1295, 1, {x = 33211, y = 31630, z = 13})
		Game.createItem(1295, 1, {x = 33212, y = 31630, z = 13})
		item:transform(431, 1)
	end
end
