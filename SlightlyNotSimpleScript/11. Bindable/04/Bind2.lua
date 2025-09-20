local BindFunc = game.ReplicatedStorage:WaitForChild("BindableFunction")

BindFunc.OnInvoke = function()
	return "Success!"
end