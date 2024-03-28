function onUse(player, item, fromPosition, target, toPosition)
	if player:getStorageValue(120) > 0 then
		--:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. item:getName() .. " is empty.")
		return true
	end
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found golden key.")
	local key = player:addItem(2972)
    key:setAttribute(ITEM_ATTRIBUTE_KEYNUMBER, 3271)
	player:setStorageValue(120, 1)
	return true
end