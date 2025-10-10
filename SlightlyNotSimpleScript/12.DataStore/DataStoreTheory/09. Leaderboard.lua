local DSS = game:GetService("DataStoreService")
local PlayerInventory = DSS:GetDataStore("PlayerInventory")
local PlayerCoins = DSS:GetDataStore("PlayerInventory", "Coins")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats
	
	local success, currentCoins = pcall(function()
		return PlayerCoins:GetAsync(player.UserId)
	end)
	if success then
		coins.Value = currentCoins
	else
		coins.Value = 0
	end
	
	-- Increase coin when player joining to test if its work
	local success, updatedVal = pcall(function()
		return PlayerCoins:IncrementAsync(player.UserId, 10)
	end)
	if success then
		coins.Value = updatedVal
	end
end)
