-- put its inside ServerScriptService
-- you can search value explorer btw

game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder",Player)
	Leaderstats.Name = "leaderstats"
	
	local Cash = Instance.new("IntValue",Leaderstats)
	Cash.Name = "Cash"
	Cash.Value = 50
end)
