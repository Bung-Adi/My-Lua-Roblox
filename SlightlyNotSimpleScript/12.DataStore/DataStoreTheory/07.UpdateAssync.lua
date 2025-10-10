local DSS = game:GetService("DataStoreService")
local PlayerCoins = DSS:GetDataStore("PlayerCoins")

-- set first
local success, errorMsg = pcall(function()
	PlayerCoins:SetAsync("KuroAdi",10)
end)
if not success then
	print(errorMsg)
end

-- update
function addCoin(curentCoin)
	return curentCoin + 10
end

local success, updatedCoins = pcall(function()
	return PlayerCoins:UpdateAsync("KuroAdi", addCoin)
end)
if success then
	print("Coin changed into "..updatedCoins)
end