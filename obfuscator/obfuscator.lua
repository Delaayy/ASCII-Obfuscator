print("^4[ASCII-OBFUSCATOR]^0 ^3[INITIALISING...]^0")


if Config.input == nil or Config.input == "" then
    print("^4[ASCII-OBFUSCATOR]^0 ^1[CANCELED]^0")
    return 
end

print("^4[ASCII-OBFUSCATOR]^0 ^3[OBFUSCATING...]^0")

local input = Config.input

local function obf(input)
    local output = ""
    for i = 1, #input do
        local charCode = input:byte(i)
        output = output .. "\\" .. charCode
    end
    return output
end

local output = obf(input)

local outputFile = io.open("done.lua", "w")
outputFile:write('load("' .. output .. '")()')
outputFile:close()


print("^4[ASCII-OBFUSCATOR]^0 ^2[COMPLETE]^0")