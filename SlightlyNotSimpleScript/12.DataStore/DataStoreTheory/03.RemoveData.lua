local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

-- Remove Coin Data of a player
PlayerCoins:RemoveAsync("KuroAdi")

-- get coin data of a player
local coins = PlayerCoins:GetAsync("KuroAdi")
print(coins)
