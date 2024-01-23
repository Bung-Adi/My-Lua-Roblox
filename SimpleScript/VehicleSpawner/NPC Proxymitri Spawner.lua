local pp = script.Parent

pp.Triggered:Connect(function()
	local boat = game.ReplicatedStorage["Boat"]:Clone()
	boat.Parent = game.Workspace
end)
