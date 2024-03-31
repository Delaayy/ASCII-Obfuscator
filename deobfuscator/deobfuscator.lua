function deobfuscate(input_file)
    local f = io.open(input_file, "r")
    local obfuscated_code = f:read("*all")
    f:close()

    obfuscated_code = string.sub(obfuscated_code, string.len('load("') + 1)
    obfuscated_code = string.sub(obfuscated_code, 1, -string.len('")()'))


    local parts = {}
    for part in string.gmatch(obfuscated_code, "[^\\]+") do
        table.insert(parts, part)
    end

    local deobfuscated_code = ""
    for _, part in ipairs(parts) do
        local ascii_value = tonumber(part)
        if ascii_value then
            deobfuscated_code = deobfuscated_code .. string.char(ascii_value)
        else
            print("Invalid value:", part)
        end
    end
    return deobfuscated_code
end

local obfuscated_file = "obfuscated.lua" -- The ASCII "Obfuscated" File, you want to deobfuscate here
local deobfuscated_code = deobfuscate(obfuscated_file)
print(deobfuscated_code)
