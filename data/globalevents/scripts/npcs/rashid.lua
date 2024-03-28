function onStartup()
	local days = {
	["Sunday"] = {
		{npc = "rashid", pos = {x = 32327, y = 31783, z = 6}}, -- 1 carlin
		{npc = "rashid", pos = {x = 32358, y = 32232, z = 7}}, -- thias
		{npc = "rashid", pos = {x = 32662, y = 31684, z = 7}}, -- ab'dendriel
		{npc = "rashid", pos = {x = 32638, y = 31919, z = 8}}, -- kazordoon
		{npc = "rashid", pos = {x = 32930, y = 32075, z = 5}} -- venore
	},
	["Monday"] = { -- no city
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}}, -- port hope
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- ankrahmun
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- darashia
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}} -- edron
	},
    ["Tuesday"] = { -- no city
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}}, -- port hope
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- ankrahmun
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- darashia
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}} -- edron
	},
    ["Wednesday"] = {
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}}, -- 1 port hope
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- ankrahmun
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- darashia
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}} -- edron
	},
    ["Thursday"] = {
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- 1 ankrahmun
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- darashia
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}}, -- port hope
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}} -- edron
	},
    ["Friday"] = {
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- 1 darashia
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- ankrahmun
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}}, -- port hope
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}} -- edron
	},
    ["Saturday"] = {
		{npc = "rashid", pos = {x = 33170, y = 31811, z = 6}}, -- 1 edron
		{npc = "rashid", pos = {x = 33234, y = 32481, z = 7}}, -- darashia
		{npc = "rashid", pos = {x = 33065, y = 32878, z = 6}}, -- ankrahmun
		{npc = "rashid", pos = {x = 32579, y = 32754, z = 7}} -- port hope
	},
    }
    local currentDay = os.date('%A')
    for v, k in pairs(days) do
        if currentDay == v then
            for i = 1, #k do
				doCreateNpc(k[i].npc, k[i].pos, 3)
            end
            break
        end
    end
    return true
end