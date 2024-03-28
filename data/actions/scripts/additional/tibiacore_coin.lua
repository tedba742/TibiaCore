function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isPlayer() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if not doRemoveItem(item.uid, 1) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Bug found. Please report to any gamemaster!")	
        return true
	end
	db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + '10' WHERE `id` = '" .. target:getAccountId() .. "';")
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received 10 premium point.")
	target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end