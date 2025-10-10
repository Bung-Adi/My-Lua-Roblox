local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

local success, errorMsg = pcall(function()
	PlayerCoins:SetAsync("KuroAdi",10)
end)
if not success then
	print(errorMsg)
end

local success, currentCoins = pcall(function()
	return PlayerCoins:GetAsync("KuroAdi")
end)
if success then
	print("Player coin saves data successfully loaded")
	print(currentCoins)
end