local part1 = game.Workspace.Part1
local part2 = game.Workspace.Part2

local loop1 = coroutine.create(function()
	while true do
		task.wait(.1)
		part1.Color = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
	end
end)

coroutine.resume(loop1)

while true do
	task.wait(.1)
	part2.Color = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
end