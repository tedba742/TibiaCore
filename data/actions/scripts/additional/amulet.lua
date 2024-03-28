function onUse(player, item, fromPosition, target, toPosition)
	if target:getId() == 3057 then
		target:transform(4483, 1)
		doRemoveItem(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end