game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		char.Humanoid.BreakJointsOnDeath = false
		
		char.Humanoid.Died:Connect(function()
			for _, v in pairs(char:GetDescendants()) do
				if v:IsA("Motor6D") then
					local attachment0 = Instance.new("Attachment")
					local attachment1 = Instance.new("Attachment")
					attachment1.CFrame = v.C1
					attachment0.CFrame = v.C0
					attachment1.Parent = v.Part1
					attachment0.Parent = v.Part0
				end
			end
		end)
	end)
end)
