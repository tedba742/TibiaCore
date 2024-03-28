function onUse(player, item, fromPosition, target, toPosition)
config = { 
[4487] =  {Back = 4488, Take = 4495, EXP = 5, Skill = 30, Chance = 100, Count = math.random(1, 3)},
[4489] =  {Back = 4490,Take = 4497, EXP = 8, Skill = 40, Chance = 125, Count = math.random(1, 3)},
[4491] =  {Back = 4492,Take = 4499, EXP = 10, Skill = 50, Chance = 125, Count = math.random(1, 3)},
[4493] =  {Back = 4494,Take = 4442, EXP = 15, Skill = 60, Chance = 150, Count = math.random(1, 3)},
}
local toTarget = target;
Stone = config[target:getId()]
	if Stone and math.random(1, Stone.Chance) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FIST) - 10) * 0.397, 5), 10) and player:getEffectiveSkillLevel(SKILL_FIST) >= Stone.Skill then
		player:addSkillTries(SKILL_FIST, Stone.EXP)
		player:addItem(Stone.Take, Stone.Count)
		toTarget:transform(Stone.Back, 1)
		toTarget:decay()
		toTarget:getPosition():sendMagicEffect(4)
		return true
	elseif Stone and math.random(1, 100) >= 50 then
		player:addSkillTries(SKILL_FIST, Stone.EXP)
		toTarget:getPosition():sendMagicEffect(math.random(3, 4))
		return true
	elseif Stone then
		toTarget:getPosition():sendMagicEffect(3)
		return true
	end
end
