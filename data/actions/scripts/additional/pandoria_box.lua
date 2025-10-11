items = 
{
[0] = {id = 3035, count = math.random(1, 25), chance = 1000}, -- platinum coins.
[1] = {id = math.random(3032, 3034), count = math.random(1, 5), chance = 500}, -- smalls.
[2] = {id = 3384, count = 1, chance = 200}, -- dark helmet.
[3] = {id = 3557, count = 1, chance = 180}, -- plate legs.
[4] = {id = 3357, count = 1, chance = 160}, -- plate armor.
[5] = {id = 3385, count = 1, chance = 140}, -- crown helmet.

[6] = {id = 3370, count = 1, chance = 100}, -- knight armor.
[7] = {id = 3371, count = 1, chance = 80}, -- knight legs.
[8] = {id = 3324, count = 1, chance = 70}, -- skull staff.
[9] = {id = 3280, count = 1, chance = 65}, -- fire sword.
[10] = {id = 3320, count = 1, chance = 50}, -- fire axe.
[11] = {id = 3419, count = 1, chance = 40}, -- crown shield.
[12] = {id = 3381, count = 1, chance = 35}, -- crown armor.
[13] = {id = 3382, count = 1, chance = 30}, -- crown legs.

[14] = {id = 3043, count = math.random(1, 2), chance = 10}, -- crystal coins.
[15] = {id = 3392, count = 1, chance = 9}, -- royal helmet. --
[16] = {id = 3386, count = 1, chance = 8}, -- dragon scale mail 
[17] = {id = 3079, count = 1, chance = 7}, -- boots of haste.
[18] = {id = 3554, count = 1, chance = 6}, -- steel boots.
[19] = {id = 3057, count = 1, chance = 5}, -- amulet of loss.
[20] = {id = 3414, count = 1, chance = 4}, -- mastermind shield
[21] = {id = 4470, count = 1, chance = 1}, -- za'kalortith.
[22] = {id = 4473, count = 1, chance = 1}, -- zatragil.
[23] = {id = 4472, count = 1, chance = 1} -- uth'maer.
}
function onUse(cid, item, frompos, item2, topos)
	if not doRemoveItem(item.uid, 1) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Bug found. Please report to any gamemaster!")	
        return true
	end
	for i = 0, #items do
		if (items[i].chance >= math.random(0, 1000)) then
			doPlayerAddItem(cid, items[i].id, items[i].count)
		end
	end
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, cid:getName() .. " opened a pandora's box.")
	end
	doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, "You have opened pandora's box")
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	return FALSE
end
