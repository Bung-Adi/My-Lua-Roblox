--[[
use this model -> https://create.roblox.com/store/asset/17483209710/BrawlDev-Leaderboard
in the Leaderboard model make a script and put item Frame inside of it
]]

local DSS = game:GetService("DataStoreService")
local PlayerMoney = DSS:GetOrderedDataStore("PlayerMoney")

local item = script:WaitForChild("Item")
local PlayerContainer = script.Parent.Leaderboard.LeaderboardGui.LeaderboardContainer.PlayersContainer

game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"
	
	local coins = Instance.new("IntValue",leaderstats)
	coins.Name = "Coins"
	
	while true do
		task.wait(10)
		local success, errorMsg = pcall(function()
			PlayerMoney:SetAsync(plr.UserId, coins.Value)
		end)
		if not success then
			print(errorMsg)
		end
	end
end)

while true do
	task.wait(10)
	local success, pages = pcall(function()
		return PlayerMoney:GetSortedAsync(false,10)
	end)
	if success then
		local entries = pages:GetCurrentPage()
		for rank, entity in pairs(entries) do
			local cloneItem = item:Clone()
			local username = game.Players:GetNameFromUserIdAsync(entity.key)
			if username then
				cloneItem.Name = username
				cloneItem.NameText.Text = username
			end
			cloneItem.CashText.Text = entity.value
			cloneItem.RankText.Text = rank
			cloneItem.Parent = PlayerContainer
		end
	end
end