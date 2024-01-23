-- this code to show leaderboard UI on Roblox game. Put it inside ServerScriptService on Explorer
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
  -- add leaderstats
  local leaderstats = Instance.new("Folder")
  leaderstats.Name = 'leaderstats'
  leaderstats.Parent = player

  -- add leaderstats poins
  local treasures = Instance.new("IntValue")
  treasures.Name = 'treasures'
  treasures.Value = 0
  treasures.Parent = leaderstats

end)