-- Create leaderboard when a player joins
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local wins = Instance.new("IntValue")
	wins.Name = "Wins"
	wins.Value = 0
	wins.Parent = leaderstats
end)

-- Teleport and increase wins on touching 'Finish'
local finishPart = workspace:WaitForChild("FinishPart")
local spawnLocation = workspace:FindFirstChildOfClass("SpawnLocation")

finishPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	if player then
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart and spawnLocation then
			-- Give player 1 win
			local stats = player:FindFirstChild("leaderstats")
			if stats and stats:FindFirstChild("Wins") then
				stats.Wins.Value += 1
			end

			-- Teleport back to spawn
			humanoidRootPart.CFrame = spawnLocation.CFrame + Vector3.new(0, 3, 0) -- a little above ground
		end
	end
end)
