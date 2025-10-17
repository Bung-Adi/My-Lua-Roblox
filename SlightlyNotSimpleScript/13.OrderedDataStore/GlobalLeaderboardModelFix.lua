local DSS = game:GetService("DataStoreService")
local PlayerMoney = DSS:GetOrderedDataStore("PlayerMoney")
local Players = game:GetService("Players")

local item = script:WaitForChild("Item")
local PlayerContainer = script.Parent.Leaderboard.LeaderboardGui.LeaderboardContainer.PlayersContainer

-- Track active saving tasks
local activeTasks = {}

-- Save player coins periodically
local function startSavingCoins(plr, coins)
	local userId = plr.UserId
	activeTasks[userId] = true

	task.spawn(function()
		while activeTasks[userId] and plr.Parent do
			task.wait(10)
			local success, err = pcall(function()
				PlayerMoney:SetAsync(userId, coins.Value)
			end)
			if not success then
				warn("Failed to save coins for", plr.Name, ":", err)
			end
		end
	end)
end

-- Clean up when player leaves
Players.PlayerRemoving:Connect(function(plr)
	activeTasks[plr.UserId] = nil
end)

-- Setup leaderstats and sync with DataStore
Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats

	-- Load saved coins from DataStore
	local success, savedCoins = pcall(function()
		return PlayerMoney:GetAsync(plr.UserId)
	end)
	if success and typeof(savedCoins) == "number" then
		coins.Value = savedCoins
	else
		coins.Value = 0
	end

	startSavingCoins(plr, coins)
end)

-- Update leaderboard every 10 seconds
task.spawn(function()
	while true do
		task.wait(10)

		-- Clear old entries
		for _, child in ipairs(PlayerContainer:GetChildren()) do
			if child:IsA("Frame") then
				child:Destroy()
			end
		end

		local success, pages = pcall(function()
			return PlayerMoney:GetSortedAsync(false, 10)
		end)

		if success then
			local entries = pages:GetCurrentPage()
			for rank, entry in ipairs(entries) do
				local cloneItem = item:Clone()
				local username = "Unknown"

				local nameSuccess, nameResult = pcall(function()
					return Players:GetNameFromUserIdAsync(entry.key)
				end)
				if nameSuccess then
					username = nameResult
				end

				cloneItem.Name = username
				cloneItem:FindFirstChild("NameText").Text = username
				cloneItem:FindFirstChild("CashText").Text = tostring(entry.value)
				cloneItem:FindFirstChild("RankText").Text = tostring(rank)
				cloneItem.Parent = PlayerContainer
			end
		else
			warn("Failed to fetch leaderboard:", pages)
		end
	end
end)
