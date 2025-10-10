local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

local success, newCoin = pcall(function()
	PlayerCoins:IncrementAsync("KuroAdi",10)
end)
if not success then
	print(newCoin)
end

local success, currentCoins = pcall(function()
	return PlayerCoins:GetAsync("KuroAdi")
end)
if success then
	print(currentCoins)
end
