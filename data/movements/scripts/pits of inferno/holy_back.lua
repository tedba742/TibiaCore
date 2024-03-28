function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getItemCount(2836) < 1 then
		player:teleportTo(fromPosition, true)
		return true
	end

	player:teleportTo(Position(32791, 32331, 10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onAddItem(item, tileitem, position)
	doRelocate(item:getPosition(),{x = 32791, y = 32331, z = 10})
	Game.sendMagicEffect(tileitem:getPosition(), 11)
end