--[[
place it in server script service.
]]
local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

-- set coin to player
PlayerCoins:SetAsync("KuroAdi",10)

-- get coin data of a player
local coins = PlayerCoins:GetAsync("KuroAdi")
print(coins)