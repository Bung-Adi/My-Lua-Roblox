print("start")

local delayTask = task.delay(5,function()
	print("hello")
end)
local randomNumber = math.random(1,2)
if randomNumber == 1 then
	task.cancel(delayTask)
	print("Random number is 1. so delayed task is canceled")
end

print("end")
