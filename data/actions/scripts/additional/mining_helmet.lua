function onUse(cid, item, frompos, item2, topos)
   	if getPlayerStorageValue(cid, 4484) == 1 then
		doPlayerAddItem(cid,4396,1)
		setPlayerStorageValue(cid, 4484, 2)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You already did that")
	end	
	return true
end