--[[
While loop means keep runing the line of code inside it until the condition not meet anymore
]]
-- put it inside a part
local Part = script.Parent

while Part.Anchored do
	Part.Position = Part.Position + Vector3.new(0,0.1,0)
	wait(0.1)
end
