--[[
put it inside ServerScriptService

all of its a basic theory of DataStore.
un comment the one you want to use.
]]
local DataStoreServ = game:GetService("DataStoreService")
local PlayerCoins = DataStoreServ:GetDataStore("PlayerCoins")

--[[
-- save data
PlayerCoins:SetAsync("datarandom",10)
local coins = PlayerCoins:GetAsync("Kuro13r")
print(coins)
]]

--[[
-- read data
PlayerCoins:IncrementAsync("datarandom",5)
local coins = PlayerCoins:GetAsync("Kuro13r")
print(coins)
]]

--[[
-- remove data
PlayerCoins:RemoveAsync("datarandom")
local coins = PlayerCoins:GetAsync("Kuro13r")
print(coins)
]]


--[[
-- save data with error handling
local success, errorMsg = pcall(function()
	PlayerCoins:SetAsync("datarandom",10)
end)
if not success then
	print(errorMsg)
end
]]

--[[
-- read with error handling
local success, currentCoins pcall(function()
	return PlayerCoins:GetAsync("datarandom")
end)
if success then
	print("retrieve coin data succes")
	print(currentCoins)
end
]]

--[[
-- add data with error handling
local success, newCoinValue = pcall(function()
	return PlayerCoins:IncrementAsync("datarandom",5)
end)
if success then
	print(newCoinValue)
end
]]

--[[
-- remove data with error handling
local success, coinsValue = pcall(function()
	return PlayerCoins:RemoveAsync("datarandom")
end)
if success then
	print(coinsValue)
end
]]

--[[
-- update data with UpdateAsync error handling
local function incrementValue(currentCoin)
	return currentCoin+10
end

local success, updateCoins = pcall(function()
	return PlayerCoins:UpdateAsync("datarandom",incrementValue)
end)
if success then
	print("Updated coins to "..updateCoins)
end
]]

--[[
Pro tips:

- instead change the datastore every time, save data in certain time. 
you can use 
while true do
	wait(10)
end
to make it save every 10 seconds

- try use table to save data, its more easy to manage and edit.

- you can use "game:BindToClose" to make it save when game closed.
]]

