local water = {
	618, 619,
	620, 621
}

local fishableWater = {
	618, 619,
	620, 621
}

function onUse(player, item, fromPosition, target, toPosition)
	if not target:isItem() then
		return false
	end
	
	if not table.contains(water, target:getId()) then
		return false
	end
	
	if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
			player:addSkillTries(SKILL_FISHING, 1)
			if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.397, 5), 35) then
				player:addItem(3578, 1)
				
			end
		end
	target:getPosition():sendMagicEffect(2)
	return true
end
