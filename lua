local function hookfunction(oldFunction, hookFunction)
    if type(oldFunction) ~= "function" then
        error("The first argument must be a function.")
    end
    if type(hookFunction) ~= "function" then
        error("The second argument must be a function.")
    end

    local funcName = debug.getinfo(oldFunction, "n").name
    if not funcName then
        error("Could not determine function name.")
    end

    local environment = getgenv()
    if not environment[funcName] then
        environment[funcName] = oldFunction
    end

    environment[funcName] = hookFunction
    
    return oldFunction
end

getgenv().hookfunction = hookfunction

print("Hookfunction for custom identity added.")
