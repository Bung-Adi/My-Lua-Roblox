local BE = game.ReplicatedStorage:WaitForChild("BindableEvent")

BE.Event:Connect(function()
	print("Event Fired")
end)
