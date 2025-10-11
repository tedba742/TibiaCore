function onThink(interval, lastExecution, thinkInterval)
local config = {
	[0] = {seg = 100,
	startText = "Visit the page facebook.com/tibiacore"},
	--[1] = {seg = 5000,startText = "Join Discord discord.gg/VT6uz7Eg6X"},

	--[2] = {seg = 10000,startText = "Raids without or with warnings, have a chance to drop rare items or special."},

	--[3] = {seg = 15000,startText = "Are you in doubt with the drops? Check out the creatures on web tibiacore.online/?creatures"},
	
	[4] = {seg = 20000,
        startText = "More information about server on web tibiacore.online/?serverinfo"}
	}

for i = 0, #config do
	addEvent(broadcastMessage, config[i].seg, config[i].startText, MESSAGE_STATUS_DEFAULT)
end	
return true
end
