function onUse(player, item, fromPosition, target, toPosition)
	if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if not doRemoveItem(item.uid, 1) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Bug found. Please report to any gamemaster!")	
        return true
	end
	target:sendTextMessage(MESSAGE_STATUS_DEFAULT, "30 days of premium account has been added to you!")
	target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	target:addPremiumDays(30)
	return true
end
