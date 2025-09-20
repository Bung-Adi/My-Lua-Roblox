local BE = game.ReplicatedStorage:WaitForChild("BindableEvent")

BE.Event:Connect(function(...)
	local arg = {...}
	for i, v in pairs(arg) do
		print(v)
	end
	if arg[1] == "1" then
		print("first arg is 1")
	else
		print("First arg not 1")
	end
end)
