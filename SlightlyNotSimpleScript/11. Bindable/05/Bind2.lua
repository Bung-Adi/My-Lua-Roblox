local BindFunc = game.ReplicatedStorage:WaitForChild("BindableFunction")

BindFunc.OnInvoke = function(num1, num2)
	return num1 + num2
end