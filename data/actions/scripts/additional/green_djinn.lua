function onUse(player, item, fromPosition, target, toPosition)
	if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if target:getStorageValue(278) == 0 or player:getStorageValue(278) < 2 then
		target:setStorageValue(278,3)
		target:setStorageValue(288,3)
		target:addItem(3231,1)
		target:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You did the Efreet faction quest.")
		target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		doRemoveItem(item.uid, 1)
	else
		target:sendTextMessage(MESSAGE_STATUS_SMALL, "You already have Efreet or Marid faction quest.")
		target:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end