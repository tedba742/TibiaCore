function onUse(player, item, fromPosition, target, toPosition)

    local tile = Tile(fromPosition)
    if not tile then
        item:getPosition():sendMagicEffect(3)
        return false
    end

    local ground = tile:getGround()
    if not ground then
        item:getPosition():sendMagicEffect(3)
        return false
    end

    if tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        item:getPosition():sendMagicEffect(3)
    else
        item:transform(3482, 1)
        item:decay()
    end
    return true
end
