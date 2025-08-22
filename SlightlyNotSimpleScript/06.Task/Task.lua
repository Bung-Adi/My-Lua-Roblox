--[[
reading source : https://create.roblox.com/docs/reference/engine/libraries/task

explanation :
task.wait() -- like wait() but doesn't yield the main thread
task.delay() -- like wait() but doesn't yield the main thread and executes after the delay
task.cancel() -- cancels a task.delay or task.spawn
task.spawn() -- like coroutine but doesn't require making a function
task.defer() -- like wait() but doesn't yield the main thread and executes as soon as possible

how to test it ? uncoment only one of the task bellow (seperated by two spacing)
]]

print("start")

--task.wait(3)


--task.delay(5,function()
--	print("delayed hello")
--end)


--local delayTask = task.delay(5,function()
--	print("hello")
--end)
--local randomNumber = math.random(1,2)
--if randomNumber == 1 then
--	task.cancel(delayTask)
--	print("Random number is 1. so delayed task is canceled")
--end


--local isLoop = true
--task.spawn(function()
--	while isLoop do
--		print("spawn")
--		task.wait()
--	end
--end)
--for i = 1, 10 do
--	print("hello world")
--	task.wait()
--end
--isLoop = false


--task.defer(function()
--	print("defer")
--end)
--for i = 1, 10000 do
--	print("for loop1")
--end

print("end")
