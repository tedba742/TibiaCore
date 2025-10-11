function onUse(player, item, fromPosition, target, toPosition)
    if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if target:getStorageValue(4441) == 0 then
		target:setStorageValue(4441, 1)
		target:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You have been given the privilege of purchasing all blessings.")
		target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		doRemoveItem(item.uid, 1)
	else
		target:sendTextMessage(MESSAGE_STATUS_SMALL, "You already have privilege of purchasing all blessings.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end