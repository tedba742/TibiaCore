local config = {
	storage = 4478,
	notStorage1 = 4477,
	notStorage2 = 4476,
	value = 1
}
function onUse(player, item, fromPosition, target, toPosition)
	if not target:isPlayer() then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Can not use this is, it is not human!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
    if target:getStorageValue(config.storage) == 0 and
			target:getStorageValue(config.notStorage1) == 0 and
				target:getStorageValue(config.notStorage2) == 0 then
		target:setStorageValue(config.storage,config.value)
		target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		doRemoveItem(item.uid, 1)
	else
		target:sendTextMessage(MESSAGE_STATUS_SMALL, "You already did that")
		target:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
