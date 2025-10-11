function onUse(player, item, fromPosition, target, toPosition)

	if item:getId() == 4397 and player:getStorageValue(4393) == 0 then
		doRemoveItem(item.uid, 1)
		Game.createMonster("lord bigfoot", fromPosition)
		
		return true
	end
end
