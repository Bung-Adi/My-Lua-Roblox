--print("start")

local isLoop = true

task.spawn(function()
	while isLoop do
		print("spawn")
		task.wait()
	end
end)

for i = 1, 10 do
	print("hello world")
	task.wait()
end

isLoop = false

--print("start")