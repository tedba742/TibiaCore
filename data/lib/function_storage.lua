function setGlobalStorage(var, value)
    local file = io.open("./data/globalevents/scripts/globalstorage.lua", "r")
    local fileContent = file:read("*all")
    file:close()

    if fileContent:match(var) then
        updateGlobalStorage(var, value)
    else
        file = io.open("./data/globalevents/scripts/globalstorage.lua", "a")
        if file then
            file:write("\n" .. var .. " = " .. tostring(value))
            file:close()
        end
    end
end

function updateGlobalStorage(var, value)
    local filename = "./data/globalevents/scripts/globalstorage.lua"
    local tempfile = os.tmpname()
    local updated = false

    for line in io.lines(filename) do
        if line:match(var) then
            local file = io.open(tempfile, "a")
            if file then
                file:write(var .. " = " .. tostring(value), "\n")
                file:close()
                updated = true
            end
        else
            local file = io.open(tempfile, "a")
            if file then
                file:write(line, "\n")
                file:close()
            end
        end
    end

    if not updated then
        setGlobalStorage(var, value)
    end
    os.remove(filename)
    os.rename(tempfile, filename)
end

function removeGlobalStorage(var)
    local filename = "./data/globalevents/scripts/globalstorage.lua"
    local tempfile = os.tmpname()
    local incomment = false

    for line in io.lines(filename) do
        if not incomment and line:match(var) then
            incomment = true
        else
            local file = io.open(tempfile, "a")
            if file then
                file:write(line, "\n")
                file:close()
            end
        end
    end
    os.remove(filename)
    os.rename(tempfile, filename)
end