function onUse(player, item, fromPosition, target, toPosition)
	if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if target:getStorageValue(250) < 5 then
		target:setStorageValue(250, 5)
		target:addItem(2957,1)
		target:addItem(3576,1)
		target:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You received the complete post office quest.")
		target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		doRemoveItem(item.uid, 1)
	else
		target:sendTextMessage(MESSAGE_STATUS_SMALL, "You already have Postman Office quest.")
		target:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

