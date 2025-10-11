local IntervalDay = 30
local currentDate = os.date('*t')
local currentTime = os.time(currentDate)
local startDateTime = os.time({year = currentDate.year, month = 12, day = 10, hour = 0, min = 0, sec = 0})
local endDateTime = startDateTime + IntervalDay * 24 * 60 * 60

local npc_spawn = {
    [1] = {pos = {x = 32362, y = 32207, z = 7}, npc = "santaclaus"}, --thais
    [2] = {pos = {x = 32313, y = 31839, z = 8}, npc = "santaclaus"}, --carlin
    [3] = {pos = {x = 32654, y = 31664, z = 8}, npc = "santaclaus"}, --ab'dendriel
    [4] = {pos = {x = 32641, y = 31895, z = 9}, npc = "santaclaus"}, --kazordoon
    [5] = {pos = {x = 32917, y = 32070, z = 9}, npc = "santaclaus"}, --venore
    [6] = {pos = {x = 33192, y = 31810, z = 7}, npc = "santaclaus"}, --edron
    [7] = {pos = {x = 33234, y = 32484, z = 7}, npc = "santaclaus"}, --darashia
    [8] = {pos = {x = 33070, y = 32877, z = 6}, npc = "santaclaus"}, -- ankrahmun
    [9] = {pos = {x = 32622, y = 32755, z = 7}, npc = "santaclaus"} -- port hope
}

function onStartup()

	local endTime = 0
	if not endDateTimeSantaClaus == 0 then
		endTime = endDateTimeSantaClaus
	else
		endTime = endDateTime
	end
	
	if tonumber(endDateTimeSantaClaus) > 0 then
		if (currentTime <= tonumber(endDateTimeSantaClaus)) then
			for _, npc_data in pairs(npc_spawn) do
				doCreateNpc(npc_data.npc, npc_data.pos, 3)
			end
		else
			setGlobalStorage("endDateTimeSantaClaus", 0)
		end
	else
		if currentTime >= startDateTime and currentTime <= endTime then
			for _, npc_data in pairs(npc_spawn) do
				doCreateNpc(npc_data.npc, npc_data.pos, 3)
			end
			if tonumber(endDateTimeSantaClaus) < 1 then
				setGlobalStorage("endDateTimeSantaClaus", endTime)
			end
		end
	end
    return true
end
