local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

-- add 5 coin to player
PlayerCoins:IncrementAsync("KuroAdi",5)

-- get coin data of a player
local coins = PlayerCoins:GetAsync("KuroAdi")
print(coins)
