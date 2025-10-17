local DSS = game:GetService("DataStoreService")

local PlayerCoins = DSS:GetOrderedDataStore("PlayerCoins")

PlayerCoins:SetAsync("Adi",10)
PlayerCoins:SetAsync("Fahreza",15)
PlayerCoins:SetAsync("Raora",20)
PlayerCoins:SetAsync("Risu",12)
PlayerCoins:SetAsync("Meewton",13)
PlayerCoins:SetAsync("Mulyono",16)
PlayerCoins:SetAsync("Vanny",30)
PlayerCoins:SetAsync("Livander",21)
PlayerCoins:SetAsync("Blaxie",21)

local pages = PlayerCoins:GetSortedAsync(false, 3)

while true do
	local entries = pages:GetCurrentPage()
	
	for rank, entity in pairs(entries) do
		print(rank.." - "..entity.key.." : "..entity.value)
	end
	if pages.IsFinished then
		print("Finish !")
		break
	else
		print("---------")
		pages:AdvanceToNextPageAsync()
	end
end