local OPENED_HOLE = {294, 385, 394, 435, 594, 595, 607, 609, 610, 615}
local OPENED_TRAP = {435}
local DOWN_LADDER = {369, 370, 411, 412, 432, 433, 476, 482, 483, 1156} 
local ROPE_SPOT = {386, 421}
local POOLS = {2886, 2887, 2888, 2889, 2890, 2891}
local fields = {2118, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 2128, 2129}

-- Rope for 7.4 protocol.
function onUse(cid, item, frompos, item2, topos)
    local newPos = {x = topos.x, y = topos.y, z = topos.z, stackpos = 0}
    local groundItem = getThingfromPos(newPos)
    local blockingItem = getThingfromPos({x = topos.x, y = topos.y, z = topos.z, stackpos = 255})
	local fieldItem = getThingfromPos({x = topos.x, y = topos.y, z = topos.z, stackpos = 1})
    if(isInArray(ROPE_SPOT, groundItem.itemid) == TRUE) then
        newPos.y = newPos.y + 1
        newPos.z = newPos.z - 1
        if((blockingItem.itemid > 0 and not isInArray(POOLS, blockingItem.itemid)) or isCreature(blockingItem.uid) or isInArray(fields, fieldItem.itemid)) then
            doPlayerSendCancel(cid, "You cannot use this object.")
        else
            doTeleportThing(cid, newPos)
        end
    elseif(isInArray(OPENED_HOLE, groundItem.itemid) == TRUE or isInArray(OPENED_HOLE, item2.itemid) == TRUE or isInArray(OPENED_TRAP, groundItem.itemid) == TRUE or isInArray(DOWN_LADDER, groundItem.itemid) == TRUE) then
        newPos.y = newPos.y + 1
        local downPos = {x = topos.x, y = topos.y, z = topos.z + 1, stackpos = 255}
        local downItem = getThingfromPos(downPos)
        if(downItem.itemid > 0) then
            doTeleportThing(downItem.uid, newPos)
        else
            doPlayerSendCancel(cid, "You cannot use this object.")
        end
    end
    return true
end
