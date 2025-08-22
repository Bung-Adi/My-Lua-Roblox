-- example of coroutine close

local loopThread = coroutine.create(function()
	for i = 1, 10 do
		print(i)
		coroutine.yield()
	end
end)

coroutine.resume(loopThread)

print("Execution stoped")

coroutine.resume(loopThread)

coroutine.close(loopThread)

print("Execution really stoped")

coroutine.resume(loopThread)
