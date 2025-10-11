function onUse(player, item, fromPosition, target, toPosition)
    if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if target:getStorageValue(279) == 0 then
		target:setStorageValue(279, 1)
		target:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You did the trader Rashid.")
		target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		doRemoveItem(item.uid, 1)
	else
		target:sendTextMessage(MESSAGE_STATUS_SMALL, "You already have trader Rashid.")
		target:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
