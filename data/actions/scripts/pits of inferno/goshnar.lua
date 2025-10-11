function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if Tile(Position(32791, 32334, 9)):getItemById(2886, 5) then
		Game.sendMagicEffect({x = 32791, y = 32334, z = 9}, 1)
		toPosition.z = toPosition.z + 1
		player:teleportTo(toPosition)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
end