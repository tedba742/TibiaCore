local config = {
    ["minotaur mage "] = {
        pos = {
            {x = 32114, y = 32047, z = 12}
        }, 
        stone = 1631, 
        say = "Damn humans, how can they defeat the lord of death? my monuments that give me power, they broke, it's the end of me."
    }
}

function onKill(player, target)
    local monster = config[target:getName():lower()]
    if not monster or target:getMaster() then
        return true
    end
    local spoken = false
    for i = 1, #monster.pos do
        if target and Game.isItemThere(monster.pos[i], monster.stone) then
            if not spoken then
                --target:say(monster.say, TALKTYPE_MONSTER_SAY)
                spoken = true
				Game.transformItemOnMap(monster.pos[i], 1631, 1633)
				Game.sendMagicEffect(monster.pos[i], 3)
			end
        end
    end
    return true
end