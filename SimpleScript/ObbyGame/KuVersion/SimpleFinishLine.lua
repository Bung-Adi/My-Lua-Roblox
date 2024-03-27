print("Cash Leaderboard Loaded")


function onPlayerEntered(newPlayer)

	local stats = Instance.new("IntValue")
	stats.Name = "leaderstats"

	local cash = Instance.new("IntValue")
	cash.Name = "Wins"
	cash.Value = 0

	cash.Parent = stats
	stats.Parent = newPlayer
end



game.Players.ChildAdded:connect(onPlayerEntered)