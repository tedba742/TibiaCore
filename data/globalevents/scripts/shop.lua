-- ### CONFIG ###
-- message send to player by script "type" (types you can check in "global.lua")
SHOP_MSG_TYPE = 18
-- time (in seconds) between connections to SQL database by shop script
SQL_interval = 30
-- ### END OF CONFIG ###
function onThink(interval, lastExecution)
    local select_db = db.storeQuery("SELECT * FROM shop WHERE `status` = 'waiting'")
    if (select_db ~= false) then
        repeat
            local id = tonumber(result.getDataInt(select_db, "id"))
            local to_player = tostring(result.getDataString(select_db, "to_player"))
            local offer_name = tostring(result.getDataString(select_db, "offer_name"))
            local item_id = tonumber(result.getDataString(select_db, "item_id"))
            local item_count = tonumber(result.getDataString(select_db, "item_count"))
            local item_container = tonumber(result.getDataString(select_db, "item_container"))
            local container_count = tonumber(result.getDataString(select_db, "container_count"))
            local status = tostring(result.getDataString(select_db, "status"))

            local cid = getPlayerByName(to_player)
            if (cid) then

                local received_item = 0
                local full_weight = 0
                local free_cap = getPlayerFreeCap(cid)

                if (item_container > 0) then
                    container_weight = getItemWeight(item_container, 1)
                    if (isItemRune(item_id)) then
                        items_weight = container_count * getItemWeight(item_id, 1)
                    else
                        items_weight = container_count * getItemWeight(item_id, item_count)
                    end
                    full_weight = items_weight + container_weight
                else
                    full_weight = getItemWeight(item_id, item_count)
                    if (isItemRune(item_id)) then
                        full_weight = getItemWeight(item_id, 1)
                    else
                        full_weight = getItemWeight(item_id, item_count)
                    end
                end

                if (full_weight <= free_cap) then
                    if (item_container > 0) then
                        local new_container = doCreateItemEx(item_container, 1)
                        local iter = 0
                        while (iter ~= container_count) do
                            doAddContainerItem(new_container, item_id, item_count)
                            iter = iter + 1
                        end
                        received_item = doPlayerAddItemEx(cid, new_container)
                    else
                        local new_item = doCreateItemEx(item_id, item_count)
                        received_item = doPlayerAddItemEx(cid, new_item)
                    end
                    if (type(received_item) == "number" and received_item == RETURNVALUE_NOERROR) then
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'You received ' .. offer_name ..
                            ' from TibiaCore Website. Thanks for the purchase, have a good fun in the game.')
                        db.query("UPDATE `shop` SET `status` = 'received', `date_update` = DATE_ADD(NOW(), INTERVAL 0 DAY) WHERE id = " .. id .. ";")
                    else
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, ' ' .. offer_name ..
                            ' from TibiaCore Website is waiting for you. Please make place for this item in your backpack/hands and wait about ' ..
                            SQL_interval .. ' seconds to get it.')
                    end
                else
                    doPlayerSendTextMessage(cid, SHOP_MSG_TYPE,
                        ' ' .. offer_name .. ' from TibiaCore Website is waiting for you. It weight is ' .. full_weight ..
                            ' oz., you have only ' .. free_cap ..
                            ' oz. free capacity. Put some items in depot and wait about ' .. SQL_interval ..
                            ' seconds to get it.')
                end
            end
        until not result.next(select_db)
        result.free(select_db)
    end
    return true
end
