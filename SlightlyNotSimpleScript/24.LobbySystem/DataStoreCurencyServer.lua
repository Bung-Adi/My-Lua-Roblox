local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local diamondStore = DataStoreService:GetDataStore("Diamonds")

-- Load diamonds
local function loadDiamonds(player)
	local success, diamonds = pcall(function()
		return diamondStore:GetAsync(player.UserId)
	end)
	if success then
		return diamonds or 0
	else
		warn("Failed to load diamonds for " .. player.Name)
		return 0
	end
end

-- Save diamonds
local function saveDiamonds(player, diamonds)
	local success, errorMessage = pcall(function()
		diamondStore:SetAsync(player.UserId, diamonds)
	end)
	if not success then
		warn("Failed to save diamonds for " .. player.Name .. ": " .. errorMessage)
	end
end

-- Player joins
Players.PlayerAdded:Connect(function(player)
	local diamonds = loadDiamonds(player)

	-- Leaderstats (server-side tracking)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local diamondStat = Instance.new("IntValue")
	diamondStat.Name = "Diamonds"
	diamondStat.Value = diamonds
	diamondStat.Parent = leaderstats
end)

-- Player leaves
Players.PlayerRemoving:Connect(function(player)
	local diamonds = player:FindFirstChild("leaderstats") and player.leaderstats.Diamonds.Value or 0
	saveDiamonds(player, diamonds)
end)

