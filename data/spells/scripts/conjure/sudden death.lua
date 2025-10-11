local count = 1
local mana = 220
local txt = 'adori vita vis'
local runeID = 3155 

local blank = 3147

function onCastSpell(creature, variant)
		
	if creature:removeItem(blank,1) then
		if creature:addMana(mana) then
			creature:addItem(runeID,count)
			creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			creature:say(txt, TALKTYPE_SAY)
		 else
		 creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		 --- xml block txt
	    end	
	else
	 creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	   creature:sendCancelMessage("You need a magic item to cast this spell")
    end
	return false
end