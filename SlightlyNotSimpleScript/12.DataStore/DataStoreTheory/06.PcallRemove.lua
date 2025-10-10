local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

local success, coinData = pcall(function()
	PlayerCoins:RemoveAsync("KuroAdi")
end)
if not success then
	print(coinData)
end

local success, currentCoins = pcall(function()
	return PlayerCoins:GetAsync("KuroAdi")
end)
if success then
	print(currentCoins)
end
