local config = {
    ["rat"] = {count = 100, storage = 1000, start = 1, plural = "rats"},
	["cave rat"] = {count = 100, storage = 1001, start = 1, plural = "cave rats"},
	["snake"] = {count = 100, storage = 1002, start = 1, plural = "snakes"},
	["bug"] = {count = 100, storage = 1003, start = 1, plural = "bugs"},
	["wasp"] = {count = 100, storage = 1004, start = 1, plural = "wasps"},
	["lion"] = {count = 200, storage = 1005, start = 1, plural = "lions"},
	["scorpion"] = {count = 200, storage = 1006, start = 1, plural = "scorpions"},
	
	["troll"] = {count = 50, storage = 1007, start = 1, plural = "trolls"},
	["dwarf"] = {count = 100, storage = 1008, start = 1, plural = "dwarfs"},
	["minotaur"] = {count = 200, storage = 1009, start = 1, plural = "minotaurs"},
	["skeleton"] = {count = 200, storage = 1010, start = 1, plural = "skeletons"},
	["swamp troll"] = {count = 500, storage = 1011, start = 1, plural = "swamp trolls"},
	["elf arcanist"] = {count = 500, storage = 1012, start = 1, plural = "elf arcanists"},
	["wild warrior"] = {count = 300, storage = 1013, start = 1, plural = "wild warriors"},
	["dragon"] = {count = 200, storage = 1014, start = 1, plural = "dragons"},
	["giant spider"] = {count = 100, storage = 1015, start = 1, plural = "giant spiders"},
	["demon"] = {count = 1000, storage = 1016, start = 1, plural = "demons"},
	["demon"] = {count = 666, storage = 1017, start = 1, plural = "demons"},
	["grorlam"] = {count = 5, storage = 1018, start = 1, plural = "grorlams"},

	["necromancer"] = {count = 200, storage = 1019, start = 1, plural = "necromancers"},
	["orc leader"] = {count = 200, storage = 1020, start = 1, plural = "orc leaders"},
	["orc warlord"] = {count = 200, storage = 1021, start = 1, plural = "orc warlords"},
	["orc"] = {count = 200, storage = 1022, start = 1, plural = "orcs"},
	["dworc voodoomaster"] = {count = 50, storage = 1023, start = 1, plural = "dworc voodoomasters"},
	["elephant"] = {count = 200, storage = 1024, start = 1, plural = "elephants"},
	["black knight"] = {count = 100, storage = 1025, start = 1, plural = "black knights"},
	["demon skeleton"] = {count = 100, storage = 1026, start = 1, plural = "demon skeletons"},
	["elf"] = {count = 200, storage = 1027, start = 1, plural = "elfs"},
	["elf scout"] = {count = 300, storage = 1028, start = 1, plural = "elf scouts"},
	["spider"] = {count = 200, storage = 1029, start = 1, plural = "spiders"},
	["behemoth"] = {count = 200, storage = 1030, start = 1, plural = "behemoths"},
	["banshee"] = {count = 200, storage = 1031, start = 1, plural = "banshees"},
	["ancient scarab"] = {count = 200, storage = 1032, start = 1, plural = "ancient scarabs"},
	["amazon"] = {count = 200, storage = 1033, start = 1, plural = "amazons"},
	["crocodile"] = {count = 200, storage = 1034, start = 1, plural = "crocodiles"},
	["dark monk"] = {count = 300, storage = 1035, start = 1, plural = "dark monks"},
	["dwarf guard"] = {count = 300, storage = 1036, start = 1, plural = "dwarf guards"},
	["dwarf geomancer"] = {count = 100, storage = 1037, start = 1, plural = "dwarf geomancers"},
	["dragon lord"] = {count = 200, storage = 1038, start = 1, plural = "dragon lords"},
	["dwarf"] = {count = 200, storage = 1039, start = 1, plural = "dwarfs"},
	["elder beholder"] = {count = 200, storage = 1040, start = 1, plural = "elder beholders"},
	["fire devil"] = {count = 200, storage = 1041, start = 1, plural = "fire devils"},
	["ghost"] = {count = 200, storage = 1042, start = 1, plural = "ghosts"},
	["hero"] = {count = 200, storage = 1043, start = 1, plural = "heros"},
	["green djinn"] = {count = 100, storage = 1044, start = 1, plural = "green djinns"},
	["blue djinn"] = {count = 100, storage = 1045, start = 1, plural = "blue djinns"},
	["lich"] = {count = 100, storage = 1046, start = 1, plural = "lichs"},
	["hydra"] = {count = 250, storage = 1047, start = 1, plural = "hydras"},
	["hunter"] = {count = 200, storage = 1048, start = 1, plural = "hunters"},
	["serpent spawn"] = {count = 100, storage = 1049, start = 1, plural = "serpent spawns"},
	["scarab"] = {count = 100, storage = 1050, start = 1, plural = "scarabs"},
	["terror bird"] = {count = 100, storage = 1051, start = 1, plural = "terror birds"},
	["warlock"] = {count = 300, storage = 1052, start = 1, plural = "warlocks"},
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
