--[[
put it inside ServerScriptService

all of its a basic theory of DataStore.
un comment the one you want to use.
]]

local DataStoreServ = game:GetService("DataStoreService")
local PlayerCoins = DataStoreServ:GetDataStore("PlayerCoins")

---------------------------------------------------------------------
--Set data
--local success, errorMsg = pcall(function()
--	PlayerCoins:SetAsync("datarandom", 10)
--end)
--if not success then
--	print("Error setting data:", errorMsg)
--end

---------------------------------------------------------------------
-- Read with error handling
--local currentCoins
--local success, errorMsg = pcall(function()
--	currentCoins = PlayerCoins:GetAsync("datarandom")
--end)
--if success then
--	print("Retrieve coin data success")
--	print(currentCoins)
--else
--	print("Error retrieving data:", errorMsg)
--end

---------------------------------------------------------------------
--add data with error handling
--local success, currentCoins = pcall(function()
--	return PlayerCoins:IncrementAsync("datarandom",5)
--end)
--if success then
--	print(currentCoins)
--end

---------------------------------------------------------------------
-- change data
--local function incrementValue(currentCoins)
--	return currentCoins+10
--end

--local function decreaseValue(currentCoins)
--	return currentCoins-10
--end

--local success, updateCoins = pcall(function()
--	return PlayerCoins:UpdateAsync("datarandom",decreaseValue)
--end)
--if success then
--	print("Updated coins to "..updateCoins)
--end

---------------------------------------------------------------------
-- remove data with error handling
--local success, currentCoins = pcall(function()
--	return PlayerCoins:RemoveAsync("datarandom")
--end)
--if success then
--	print(currentCoins)
--end
