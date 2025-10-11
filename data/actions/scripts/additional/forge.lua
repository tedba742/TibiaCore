function onUse(player, item, fromPosition, target, itemEx, toPosition)
	config = { 
			[4495] =  {pay = 4495, Take = 4496, EXP = 50, Skill = 30, Count = 1},
			[4497] =  {pay = 4497, Take = 4498, EXP = 80, Skill = 40, Count = 1},
			[4499] =  {pay = 4499, Take = 4444, EXP = 100, Skill = 50, Count = 1},
			[4442] =  {pay = 4442, Take = 4443, EXP = 125, Skill = 60, Count = 1},
	
	}
	local toTarget = target;
	Stone = config[item:getId()]	
	if player:getStorageValue(4484) == 4 then
		if target.actionid == 100 then
			if player:getItemCount(Stone.pay) >= 5 then
				player:addSkillTries(SKILL_FIST, Stone.EXP)
				player:addItem(Stone.Take, Stone.Count)
				player:removeItem(Stone.pay, 5)
				toTarget:getPosition():sendMagicEffect(16)
			else
				player:say('Too little ore to make a bar.', TALKTYPE_MONSTER_SAY)
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Sorry, not possible.")
		end
	else
		player:say('Im not authorized to use this.', TALKTYPE_MONSTER_SAY)
	end
	return true
end
