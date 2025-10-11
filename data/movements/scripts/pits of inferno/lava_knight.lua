function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player:isKnight() then
		doTargetCombatHealth(0, creature, COMBAT_FIREDAMAGE, -300, -1000)
	else
		doTargetCombatHealth(0, creature, COMBAT_FIREDAMAGE, -100, -300)
	end
	return true
end