local finish = script.Parent

finish.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if humanoid and hit.Parent:GetAttribute("DetectStart") then
		hit.Parent:SetAttribute("DetectStart",false)
		humanoid.Health = 0
	end
end)

finish.Touched:Connect(function(hit)
	if hit.Parent.Parent.Name == 'Car' then
		hit.Parent.Parent:Destroy()
	end
end)