local BE = game.ReplicatedStorage:WaitForChild("BindableEvent")

BE.Event:Connect(function(num1, num2)
	print(num1 + num2)
end)
