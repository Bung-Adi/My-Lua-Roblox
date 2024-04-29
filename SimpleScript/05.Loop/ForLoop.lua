--[[
For loop condition is basically how much its repeat in specifict format
]]
-- put it inside a part
local Part = script.Parent

for i=1,10,1 do -- starting value is 1 and it's repeat untill reach 10, and its increasing by 1
	Part.Size = Vector3.new(i,i,i)
	wait(1)
end