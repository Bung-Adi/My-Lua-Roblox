print("Custom Leaderboard Runing")

function onPlayerEntered(newPlayer)
  local stats = Instance.new("IntValue")
  stats.Name = "leaderstats"
  local time = Instance.new("IntValue")
  time.Name = "Time"
  time.Value = 0
  time.Parent = stats
  stats.Parent = newPlayer
end
game.Players.ChildAdded:connect(onPlayerEntered)