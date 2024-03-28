function onUse(player, item, fromPosition, target, toPosition)
	if math.random(1,3) >= 2 then
		player:addItem(3035,1)
	else
		player:addItem(3031,1)
		player:addItem(2996,1)
		doRemoveItem(item.uid, 1)
	end
	return true
end
