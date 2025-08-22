-- example of coroutine with return

local loopThread = coroutine.create(function()
	for i = 1, 10 do
		print(i)
		coroutine.yield(true,5,false)
	end
end)

local sucess, value1, value2, value3 = coroutine.resume(loopThread)
print(value1, value2, value3)

print("Execution stoped")

coroutine.resume(loopThread)

coroutine.close(loopThread)

print("Execution really stoped")

coroutine.resume(loopThread)
