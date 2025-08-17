local player = game.Players.LocalPlayer
local axe = player.Backpack:FindFirstChild("Axe Tool")
local batas_hit = 5

axe.Activated:Connect(function()
	local target = player:GetMouse().target
	if target.Name == 'Trunk' then
		local hit_target = target:GetAttribute("hit")
		if hit_target < batas_hit then
			target:SetAttribute('hit',hit_target + 1)
		else
			target.Parent:Destroy()
			local potongan_kayu = game.ReplicatedStorage:FindFirstChild("Logs"):Clone()
			potongan_kayu.Parent = game.Workspace
			potongan_kayu:MoveTo(target.Position)
		end
	end
end)