--[[
reading source : https://create.roblox.com/docs/reference/engine/libraries/coroutine

explanation :
coroutine.create() -- creates a coroutine
coroutine.resume() -- resumes a coroutine
coroutine.yield() -- yields a coroutine
coroutine.running() -- returns the running coroutine
coroutine.status() -- returns the status of a coroutine
coroutine.wrap() -- wraps a function in a coroutine	

how to test it ? uncoment only one of the task bellow (seperated by two spacing)
]]

-- -- create
--local co = coroutine.create(function()
--end)
--print(co)


-- -- resume
--local co = coroutine.create(function()
--	print("this is coroutine resume")
--end)
--coroutine.resume(co)


-- -- wrap
--local co = coroutine.wrap(function()
--	print("this is coroutine wrap")
--end)
--co()

-- -- wrap
--coroutine.wrap(function()
--	print("this is coroutine wrap")
--end)()

-- -- wrap
--local myFunction = function()
--	print("this is coroutine wrap")
--end

--coroutine.wrap(myFunction)()


