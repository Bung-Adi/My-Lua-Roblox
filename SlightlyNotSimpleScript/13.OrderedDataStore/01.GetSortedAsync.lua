local DSS = game:GetService("DataStoreService")

local PlayerCoins = DSS:GetOrderedDataStore("PlayerCoins")

-- disclaimer name bellow just example.
PlayerCoins:SetAsync("Adi",10)
PlayerCoins:SetAsync("Fahreza",15)
PlayerCoins:SetAsync("Raora",20)

local pages = PlayerCoins:GetSortedAsync(false, 3)

local entries = pages:GetCurrentPage()

for rank, entity in pairs(entries) do
	print(rank.." - "..entity.key.." : "..entity.value)
end

