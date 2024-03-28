local posDoor = {x = 32846, y = 32286, z = 12}
local lockDoor = 1628
local normalDoor = 1629
function onAddItem(item, tileitem, position)
	if Tile(Position(32849, 32292, 12)):getItemById(2886, 5) and Game.isItemThere(posDoor, lockDoor) then
		Game.sendMagicEffect(posDoor, 3)
		Game.sendMagicEffect(tileitem:getPosition(), 1)
		Game.removeItemOnMap({x = 32849, y = 32292, z = 12}, 2886)
		Game.transformItemOnMap(posDoor, lockDoor, normalDoor) 
		return true
	end
end