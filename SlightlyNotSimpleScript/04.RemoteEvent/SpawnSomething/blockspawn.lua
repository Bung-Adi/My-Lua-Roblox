local ReplicateStorage = game:GetService("ReplicatedStorage")
local RemoteEven = game.ReplicatedStorage.GiveBlock

-- Spawning a part on the server
RemoteEven.OnServerEvent:Connect(function(Player, Message)
	local Part = Instance.new("Part",game.Workspace)
	Part.Anchored = true
	Part.Position = Vector3.one * 1
	print(Message)
end)
