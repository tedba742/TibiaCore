local config = {
    rate = 1.25,
    storage = 1000,
    expstorage = 1100,
    register = 1200,
    time = 3600,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, config.storage) <= 0 then
        local rates = getPlayerRates(cid)
        setPlayerStorageValue(cid, config.expstorage, rates[SKILL__LEVEL])
        setPlayerStorageValue(cid, config.register, 1)
        itemEx=itemid == 9004
        doCreatureSay(cid, "Your extra experience rate has been activated! Your experience rate is now: " .. config.rate .. "x higher than normal.", TALKTYPE_ORANGE_1, true, cid)
        setPlayerStorageValue(cid, config.storage, os.time()+config.time)
        doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]*config.rate)
        doRemoveItem(item.uid,1)
        registerCreatureEvent(cid, "ExpStage")
    else
        doCreatureSay(cid, "You must wait until your extra experience rate expire to use another one!", TALKTYPE_ORANGE_1, true, cid)
    end
return true
end
function onThink(cid, interval)
    if getPlayerStorageValue(cid, config.register) == 1 then
        if getPlayerStorageValue(cid, config.storage) <= os.time() then
            doCreatureSay(cid, "Your extra experience rate has finished! It is now back to normal.", TALKTYPE_ORANGE_1, true, cid)
            setPlayerStorageValue(cid, config.storage, 0)
            setPlayerStorageValue(cid, config.register, 0)
            local oldexp = getPlayerStorageValue(cid, config.expstorage)
            doPlayerSetExperienceRate(cid, oldexp)
            unregisterCreatureEvent(cid, "ExpStage")
        end
    end
return true
end
function onLogin(cid)
    if getPlayerStorageValue(cid, config.register) == 1 then
        registerCreatureEvent(cid, "ExpStage")
        local rates = getPlayerRates(cid)
        doCreatureSay(cid, "Your extra experience rate is still activated! It is: " .. config.rate .. "x higher than normal.", TALKTYPE_ORANGE_1, true, cid)
        if getPlayerStorageValue(cid, config.storage) > os.time() then
        local oldexp = getPlayerStorageValue(cid, config.expstorage)
        doPlayerSetExperienceRate(cid, oldexp+config.rate)
        end
    end
return true
end