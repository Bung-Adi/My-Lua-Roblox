local lavas = script.Parent 

for i, v in pairs(lavas:GetChildren()) do
	if v:IsA("Part") then
		v.Touched:Connect(function(Hit)
			local Humanoid = Hit.Parent:FindFirstChild("Humanoid")
			if Humanoid then
				Humanoid.Health = 0
			end
		end)
	end
end