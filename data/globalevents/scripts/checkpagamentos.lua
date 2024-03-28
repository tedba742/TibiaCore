function onThink(interval, lastExecution)

local result_plr = db.storeQuery("SELECT * FROM pagseguro_transactions")

local acc= tonumber(result.getDataInt(result_plr, "name"))
local status = tostring(result.getDataString(result_plr, "status"))
local item_count = tonumber(result.getDataInt(result_plr, "item_count"))
local code = tostring(result.getDataString(result_plr, "transaction_code"))
local data = tonumber(result.getDataInt(result_plr, "data"))

if(result_plr ~= false) then
repeat

if status == 'PAID' then
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. item_count .. " WHERE `accounts`.`id` = " .. acc .. ";" )
--db.query("INSERT INTO `z_shop_history` (`to_account`, `from_nick`, `trans_state`, `points_received`) VALUES (" .. acc .. ", " .. code .. ", 'RECEIVED', " .. item_count .. ")")
db.query("DELETE FROM `pagseguro_transactions` WHERE `name` = " .. acc .. ";")
end
until not result.next(result_plr)
result.free(result_plr)
end
return true

end
