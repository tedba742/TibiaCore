function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition, true)
	end
	player:teleportTo(Position(32130, 32062, 12))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32130, y = 32062, z = 12})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end