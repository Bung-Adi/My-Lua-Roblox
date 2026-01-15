local diamondMesh = workspace:WaitForChild("Diamond") -- your mesh
local clickDetector = diamondMesh:WaitForChild("ClickDetector")

-- How many diamonds to give per click
local rewardAmount = 1

clickDetector.MouseClick:Connect(function(player)
	-- Verify leaderstats exist
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local diamonds = leaderstats:FindFirstChild("Diamonds")
		if diamonds then
			diamonds.Value += rewardAmount
		end
	end

	-- Destroy the diamond mesh so it can't be clicked again
	diamondMesh:Destroy()
end)
