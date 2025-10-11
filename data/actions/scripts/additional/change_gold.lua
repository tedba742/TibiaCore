function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 4476) >= 1 or 
	getPlayerStorageValue(cid, 4477) >= 1 or 
		getPlayerStorageValue(cid, 4478) >= 1 then
		
--Gold Coins--
	if item.itemid == 3031 and item.type == 100 then
		doRemoveItem(item.uid, item.type)
		doPlayerAddItem(cid,3035,1)

--Platinum Coin--	
	elseif item.itemid == 3035 and item.type == 100 then
		doRemoveItem(item.uid, item.type)
		doPlayerAddItem(cid,3043,1)
	elseif item.itemid == 3035 and item.type <= 99 then
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid,3031,100)
	
--Crystal Coin--
	elseif item.itemid == 3043 and item.type <= 100 then
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid,3035,100)
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "You do not have privilege to exchange.")
end
return true
end