local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant)
	creature:removeCondition(CONDITION_POISON)
	creature:removeCondition(CONDITION_CUSTOM_POISON)
	return combat:execute(creature, variant)
end

