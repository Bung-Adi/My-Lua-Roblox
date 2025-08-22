-- run coroutine with argument
local task = coroutine.create(function(num1,num2)
	print(num1 + num2)
	print("coroutine task")
end)

coroutine.resume(task,2,2)
