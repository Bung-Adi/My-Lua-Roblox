-- coroutine yield

local loopThread = coroutine.create(function()
	for i = 1, 10 do
		print(i)
	end
end)

coroutine.resume(loopThread)

-- what if we want to stop coroutine above to do other things. afterward resume it again
-- we can use coroutine.yield() to stop coroutine
-- and use coroutine.resume() to resume it again
print("--------------------")
-- example
local loopThread = coroutine.create(function()
	for i = 1, 10 do
		print(i)
		coroutine.yield()
	end
end)

coroutine.resume(loopThread)

print("Execution stoped")

coroutine.resume(loopThread)