	function onSay(player, words, param)
		if not player:getGroup():getAccess() then
			return true
		end

		local name = param
		local reason = ''
		local days = nil

		local separatorPos = param:find(',')
		if separatorPos ~= nil then
			name = param:sub(0, separatorPos - 1)
			reason = string.trim(param:sub(separatorPos + 1))
		end

		-- , "%d+" Verifica se o número de dias foi especificado na descrição
		days = string.match(reason, "%d+")
		if not days then
			-- Exibe uma mensagem de erro se o número de dias não for especificado
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please specify the number of ban days after the reasons.")
			return false
		end

		-- Converte o número de dias em um número inteiro
		days = tonumber(days)

		-- Adiciona a informação do número de dias na descrição
		reason = reason .." days banned from the game."

		local accountId = getAccountNumberByPlayerName(name)
		if accountId == 0 then
			return false
		end

		local resultId = db.storeQuery("SELECT 1 FROM `account_bans` WHERE `account_id` = " .. accountId)
		if resultId ~= false then
			result.free(resultId)
			return false
		end

		local timeNow = os.time()
		db.query("INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..
				accountId .. ", " .. db.escapeString(reason) .. ", " .. timeNow .. ", " .. timeNow + (days * 86400) .. ", " .. player:getGuid() .. ")")

		local target = Player(name)
		if target ~= nil then
			for _, targetPlayer in ipairs(Game.getPlayers()) do
				targetPlayer:sendTextMessage(MESSAGE_STATUS_WARNING, target:getName() .. " banned for reasons: " .. reason)
			end
			target:remove()
		else
			for _, targetPlayer in ipairs(Game.getPlayers()) do
				targetPlayer:sendTextMessage(MESSAGE_STATUS_WARNING, target:getName() .. " banned for reasons: " .. reason)
			end
		end
	end
