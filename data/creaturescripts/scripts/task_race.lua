local config = {

    ["beholder"] = {count = 200, storage = 1051, start = 1, plural = "beholders"},
    ["elder beholder"] = {count = 200, storage = 1051, start = 1, plural = "beholders"},
	
    ["dwarf"] = {count = 200, storage = 1002, start = 1, plural = "dwarves"},
    ["dwarf soldier"] = {count = 200, storage = 1002, start = 1, plural = "dwarves"},
    ["dwarf guard"] = {count = 200, storage = 1002, start = 1, plural = "dwarves"},

    ["minotaur"] = {count = 500, storage = 1006, start = 1, plural = "minotaurs all kind"},
    ["minotaur guard"] = {count = 500, storage = 1006, start = 1, plural = "minotaurs all kind"},
    ["minotaur mage"] = {count = 500, storage = 1006, start = 1, plural = "minotaurs all kind"},
    ["minotaur archer"] = {count = 500, storage = 1006, start = 1, plural = "minotaurs all kind"},

    ["orc"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc spearman"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc shaman"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc rider"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc warlord"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc leader"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc berserker"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},
    ["orc warrior"] = {count = 250, storage = 1008, start = 1, plural = "orcs all kind"},

    ["kongra"] = {count = 150, storage = 1014, start = 1, plural = "apes"},
    ["merlkin"] = {count = 150, storage = 1014, start = 1, plural = "apes"},
    ["sibang"] = {count = 150, storage = 1014, start = 1, plural = "apes"},

    ["dragon"] = {count = 300, storage = 1018, start = 1, plural = "dragons"},
    ["dragon lord"] = {count = 300, storage = 1018, start = 1, plural = "dragons"},

    ["lizard sentinel"] = {count = 500, storage = 1023, start = 1, plural = "lizards"},
    ["lizard snakecharmer"] = {count = 500, storage = 1023, start = 1, plural = "lizards"},
    ["lizard templar"] = {count = 500, storage = 1023, start = 1, plural = "lizards"},

    ["amazon"] = {count = 200, storage = 1048, start = 1, plural = "amazons"},
    ["valkyrie"] = {count = 200, storage = 1048, start = 1, plural = "amazons"}
}

function onKill(player, target)
    local monster = config[target:getName():lower()]
    if not monster or target:getMaster() then
        return true
    end

    local storageValue = player:getStorageValue(monster.storage)
    if storageValue >= monster.start then
        if storageValue >= monster.count then
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have already killed " .. monster.count .. " " .. monster.plural .. ". report the task to any npc post office.")
        else
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have killed [" .. storageValue .. "/" .. monster.count .. "] " .. monster.plural .. ".")
        end
            player:setStorageValue(monster.storage, storageValue + 1)
    end
    return true
end
