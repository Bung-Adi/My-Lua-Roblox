game.Players.PlayerAdded:Connect(function(player)
	local JoinData = player:GetJoinData()
	local teleportData = JoinData.TeleportData
	local Difficulty = teleportData.Difficulty
	print("Difficulty -> "..Difficulty)
end)
