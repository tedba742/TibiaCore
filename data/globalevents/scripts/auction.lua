function onThink(interval, lastExecution)
    local results = db.storeQuery("SELECT * FROM character_trade")

    if (results == false) then
        return true
    end

    if results ~= nil then
        repeat
            local character_id = result.getDataString(results, "character_id")
            local trade_time_str = result.getDataString(results, "time")
            local account_new = result.getDataString(results, "account_new")
            local account_old = result.getDataString(results, "account_old")
            local trade_time = os.time {
                year = tonumber(trade_time_str:sub(1, 4)),
                month = tonumber(trade_time_str:sub(6, 7)),
                day = tonumber(trade_time_str:sub(9, 10)),
                hour = tonumber(trade_time_str:sub(12, 13)),
                min = tonumber(trade_time_str:sub(15, 16)),
                sec = tonumber(trade_time_str:sub(18, 19))
            }

            if trade_time ~= nil then
                local current_time = os.time()

                if trade_time - current_time <= 3600 then
                    if result.getDataString(results, "status") ~= 'finality' then
                        db.query(string.format(
                            "UPDATE character_trade SET status = 'finality' WHERE character_id = '%s'", character_id))
                    end
                end

                if trade_time <= current_time then
                    if account_new and account_new ~= "" then
                        db.query(string.format("UPDATE players SET account_id = '%s' WHERE id = '%s'", account_new,
                            character_id))

                        local points_end = tonumber(result.getDataString(results, "points_end"))
                        db.query(string.format(
                            "UPDATE accounts SET premium_points = premium_points + %d WHERE id = '%s'", points_end,
                            account_old))
                    else
                        db.query(string.format("UPDATE players SET account_id = '%s' WHERE id = '%s'", account_old,
                            character_id))
                    end

                    db.query(string.format("DELETE FROM character_trade WHERE character_id = '%s'", character_id))
                end
            end
        until not result.next(results)
        result.free(results)
    end
    return true
end
