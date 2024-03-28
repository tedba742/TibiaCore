function onLogin(player)
    local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"

    if player:getLastLoginSaved() <= 0 then
        loginStr = loginStr .. " Please choose your outfit."
        player:sendOutfitWindow()
    else
        if loginStr ~= "" then
            player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
        end

        loginStr = string.format("Your last visit on " .. configManager.getString(configKeys.SERVER_NAME) .. ": %s.",
            os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
    end
    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
	
	-- GM's Outfits
    if player:getAccountType() > ACCOUNT_TYPE_SENIORTUTOR and player:getGroup():getAccess() then
        local outfit = player:getOutfit()
        if outfit.lookType ~= 75 then
            player:setOutfit({
                lookType = 75,
				lookHead = 78,
                lookBody = 106,
                lookLegs = 58,
                lookFeet = 95
            })
		end
		if getPlayerTown(player) ~= 10 then
			player:teleportTo({
                x = 32316,
                y = 31942,
                z = 7
            })
			player:setTown(Town(10))
		end
		if player:getAccountType() == ACCOUNT_TYPE_GAMEMASTER then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Commands GM's:\nBan a player: /ban playername, reason, days\n" ..
				"Go to player: /goto playername\nTalk to all players: /b text\nKick player: /kick playername\nCheck MC: /mccheck\n" ..
				"Promote tutor: /addtutor playername\nDemote tutor: /removetutor playername\nInformation Player: /info playername" ..
				"Check your position: /pos\nGo to home: /t\nGo to city: /town cityname\nChange outfit: /looktype number"
			)
		end
    end

    -- Promotion
    if player:isPremium() then
        if player:getVocation():getId() ~= 0 and player:getVocation():getId() < 5 and player:getStorageValue(30018) == 1 then
            player:setVocation(player:getVocation():getId() + 4)
        end
    else
        if player:getVocation():getId() ~= 0 and player:getVocation():getId() > 4 then
            player:setVocation(player:getVocation():getId() - 4)
        end
    end

    -- Outfits
    if not player:isPremium() then
        if player:getSex() == PLAYERSEX_FEMALE then
            local outfit = player:getOutfit()
            if outfit.lookType > 139 then
                player:setOutfit({
                    lookType = 136,
                    lookHead = 78,
                    lookBody = 106,
                    lookLegs = 58,
                    lookFeet = 95
                })
            end
        else
            local outfit = player:getOutfit()
            if outfit.lookType > 131 then
                player:setOutfit({
                    lookType = 128,
                    lookHead = 78,
                    lookBody = 106,
                    lookLegs = 58,
                    lookFeet = 95
                })
            end
        end
    end

    -- Premium system
    if player:isPremium() then
        player:setStorageValue(43434, 1)
    end
    if player:getVocation():getId() == 0 then
        if not player:isPremium() then
            if player:getStorageValue(43434) == 1 then
                player:teleportTo({
                    x = 32097,
                    y = 32219,
                    z = 7
                })
                player:setTown(Town("Rookgaard"))
                player:setStorageValue(43434, 0)
            end
        end
    else
        if not player:isPremium() then
            if player:getStorageValue(43434) == 1 then
                player:teleportTo({
                    x = 32369,
                    y = 32241,
                    z = 7
                })
                player:setTown(Town("Thais"))
                player:setStorageValue(43434, 0)
            end
        end
    end

    -- Events
    player:registerEvent("PlayerDeath")
    player:registerEvent("kills")
    player:registerEvent("Task_Race")
    player:registerEvent("Task_Solo")
    player:registerEvent("Storage_Time_Login")
    player:registerEvent("Storage_Time_Real")
    player:registerEvent("Boss_Kill")
	player:registerEvent("Minotaur_Mage_Rook")

    if player:getStorageValue(285300) == 1 and player:getItemCount(CONST_SLOT_BACKPACK) then
        player:addItem(2853, true, CONST_SLOT_BACKPACK)
        player:setStorageValue(285300, 0)
    end

    --[[ bigfoot corpse reward time--]]
    local config = {
        rate = 1,
        storage = 4393
    }
    local function endboss(player)

        if isPlayer() == TRUE then
            player:setStorageValue(config.storage, -1)
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Cooldown is over, you can fight the boss again.")
        end
    end

    local str = player:getStorageValue(config.storage)

    if (str >= 0 and (str - os.time()) > 0) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,
            "Your coodown against the boss will expire in: " .. os.date("%d/%m/%X", str))
        addEvent(endboss, (str - os.time()) * 86400)
    else
        player:setStorageValue(config.storage, -1)
        -- doPlayerSendTextMessage( MESSAGE_STATUS_CONSOLE_BLUE, "Your change gold time has ended.")

    end

    local config = {
        max = 3,
        text = "Only 3 characters allowed per IP.",
        group_id = 1, -- it apply the limit to players with a group less than or equal to the id
        milliseconds_before_kick_to_read_popup = 500 -- 3000 = 3 seconds
    }
    local accepted_ip_list = {"127.0.0.1"} -- here put the Ip you whant to be allowed to use Mc/Magebomb..
    function delayedKickPlayerMCLimit(cid)
        doRemoveCreature(cid)
    end
    if player:getGroup():getId() <= config.group_id then
        if isInArray(accepted_ip_list, Game.convertIpToString(player:getIp())) == false then
            if #getPlayersByIPAddress(player:getIp()) > config.max then
                addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())
                -- player:popupFYI(config.text)
            end
        end
        return true
    end
    -- add new script here

    return true
end
