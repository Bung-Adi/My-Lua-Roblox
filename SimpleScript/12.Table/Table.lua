--[[
What is table in Lua Roblox ?
it's basically array in other languange.
but in roblox array is tabble, but tablle is maybe not array.
Doc -> https://create.roblox.com/docs/luau/tables
]]

local MyTable = {"First Item","Second Item","Third Item"}

print(MyTable[2])
table.insert(MyTable,"Fourth Item")
table.remove(MyTable,2)
MyTable[2] = nil


