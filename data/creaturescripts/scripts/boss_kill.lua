local config = {
    ["master of shadow mages"] = {
        pos = {
            {x = 33012, y = 32357, z = 13},
            {x = 33013, y = 32357, z = 13},
            {x = 33014, y = 32357, z = 13},
            {x = 33015, y = 32357, z = 13}
        }, 
        stone = 2028, 
        say = "Damn humans, how can they defeat the lord of death? my monuments that give me power, they broke, it's the end of me."
    }
}
local function revert(name, positions)
	local monster = config[name]
	for i = 1, #positions do
		Game.createItem(monster.stone, 1, positions[i])
	end
end

function onKill(player, target)
    local monster = config[target:getName():lower()]
    if not monster or target:getMaster() then
        return true
    end
    local spoken = false
    for i = 1, #monster.pos do
        if target and Game.isItemThere(monster.pos[i], monster.stone) then
            if not spoken then
                target:say(monster.say, TALKTYPE_MONSTER_SAY)
                spoken = true
            end
            Game.removeItemOnMap(monster.pos[i], monster.stone)
            Game.sendMagicEffect(monster.pos[i], 18)
        end
    end
	addEvent(revert, 3*60*1000, target:getName():lower(), monster.pos)
    return true
end
