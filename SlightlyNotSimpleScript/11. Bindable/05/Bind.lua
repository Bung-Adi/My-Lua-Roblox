local BindFunc = game.ReplicatedStorage:WaitForChild("BindableFunction")

local Result = BindFunc:Invoke(2,4)
print(Result)