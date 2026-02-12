game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		char.Humanoid.BreakJointsOnDeath = false
	end)
end)
