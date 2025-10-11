local match = string.match
local find = string.find
local gsub = string.gsub
local tonumber = tonumber
local hasOutfit = Player.hasOutfit

function Player.getOwnedOutfits(self)
    local outfits = table.create(200, 0)
    local sexPattern = 'type="'..self:getSex()..'"'
    local lookPattern = 'looktype="(%d*)"'
    local file = io.open([[data/xml/outfits.xml]])
    local str = file:read("*a")
    local i, j = find(str, sexPattern)
    file:close()
    while (i and j) do
        local _i, _j = find(str, sexPattern, j)
        local looktype = tonumber(match(str, lookPattern, i))
        if not outfits[looktype] then
            for addon = 3, 0, -1 do
                if hasOutfit(player, looktype, addon) then
                    outfits[looktype] = addon
                end
            end
        end
        i, j = _i, _j
    end
    return outfits
end
