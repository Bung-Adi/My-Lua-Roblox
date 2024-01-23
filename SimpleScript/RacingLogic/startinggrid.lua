local start = script.Parent

start.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") and not hit.Parent:GetAttribute("DetectStart") then
		hit.Parent:SetAttribute("DetectStart",true)
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		local leaderstats = player:FindFirstChild("leaderstats")
		local time = leaderstats:FindFirstChild("Time")
		time.Value = 0
		while hit.Parent:GetAttribute("DetectStart") do
			wait(1)
			time.Value = time.Value + 1
		end
	end
end)