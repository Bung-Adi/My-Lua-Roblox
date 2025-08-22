-- multiple task in coroutine
local loop1 = coroutine.create(function()
	while true do
		print("loop1")
		task.wait(.01)
	end
end)

coroutine.resume(loop1)

while true do
	print("Hello ...")
	task.wait(.01)
end