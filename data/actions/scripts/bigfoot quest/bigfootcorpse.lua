function onUse(cid, player, item, fromPos, itemEx, toPos)
Time = (os.time() + 1 * 72000)
items = 
{
[0] = {id = 4399, count = math.random(1, 9), chance = 1000}, -- storm core
[1] = {id = 3035, count = math.random(3, 15), chance = 900},
[2] = {id = math.random(3032, 3035), count = math.random(1, 5), chance = 500},
[3] = {id = math.random(3032, 3035), count = math.random(3, 8), chance = 400},
[4] = {id = 3356, count = 1, chance = 250}, -- devil helmet
[5] = {id = 3284, count = 1, chance = 220}, -- ice rapier

[6] = {id = 3370, count = 1, chance = 75}, -- knight armor
[7] = {id = 3371, count = 1, chance = 65}, -- knight legs
[8] = {id = 4484, count = 1, chance = 55}, -- pickaxe
[9] = {id = 3333, count = 1, chance = 55}, -- crystal mace
[10] = {id = 4400, count = 1, chance = 50}, -- shock helmet
[11] = {id = 4402, count = 1, chance = 45}, -- shock legs
[12] = {id = 4401, count = 1, chance = 40}, -- shock armor
[13] = {id = 5298, count = 1, chance = 35}, -- backpack

[14] = {id = 3414, count = 1, chance = 10}, -- mastermind shield
[15] = {id = 4482, count = 1, chance = 2}, --amulet of the sky
[16] = {id = 3553, count = 1, chance = 1} --bunnyslipper
}
	if getPlayerStorageValue(cid, 4393) == 0 then
		for i = 0, #items do
			if (items[i].chance >= math.random(0, 1000)) then
				doPlayerAddItem(cid, items[i].id, items[i].count)
			end
		end
		setPlayerStorageValue(cid, 4393, Time)
	end
	if getPlayerStorageValue(cid, 4482) == 2 then -- quest
		setPlayerStorageValue(cid, 4482, 3)
		doPlayerAddItem(cid, 4399, 50)
	end
return FALSE
end