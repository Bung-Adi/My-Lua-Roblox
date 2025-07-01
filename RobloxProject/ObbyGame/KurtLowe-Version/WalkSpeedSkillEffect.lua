local WalkSpeedSkills = script.Parent

for i, part in pairs(WalkSpeedSkills:GetChildren()) do
	if part:IsA("Part") then
		part.Touched:Connect(function(Hit)
			local Humanoid = Hit.Parent:FindFirstChild("Humanoid")
			if Humanoid then
				Humanoid.WalkSpeed = part.Speed.Value
			end
		end)
	end
end
