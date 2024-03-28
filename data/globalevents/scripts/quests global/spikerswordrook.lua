local IntervalDay = 90
local currentDate = os.date('*t')
local currentTime = os.time(currentDate)
local endDateTime = currentTime + IntervalDay * 24 * 60 * 60

function onStartup()
	if spiker_sword_global_quest then
		if(currentTime < spiker_sword_global_quest and not spiker_sword_global_quest == false) then
			Game.removeItemOnMap({x = 32101, y = 32085, z = 07}, 3271)
			--Game.createItem(3271, 1,{x = 32101, y = 32085, z = 12})
			--Game.sendMagicEffect({x = 32101, y = 32085, z = 07}, 14)
			Game.transformItemOnMap({x = 32100, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32101, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32084, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32100, y = 32085, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32085, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32100, y = 32086, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32101, y = 32086, z = 07}, 2123, 2125)
			Game.transformItemOnMap({x = 32102, y = 32086, z = 07}, 2123, 2125)
		else
			setGlobalStorage("spiker_sword_global_quest", false)
		end
	end
	return true
end