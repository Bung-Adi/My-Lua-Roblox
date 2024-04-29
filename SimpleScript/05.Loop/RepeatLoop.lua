--[[
Repeat loop repeat code until condition meet
]]

local Part = script.Parent
local Fire = Part.Fire

repeat
	Fire.Color = Color3.new(1, 0.235294, 0.0431373)
	wait(1)
	Fire.Color = Color3.new(1, 0.941176, 0.27451)
	wait(1)
	Fire.Color = Color3.new(0.266667, 1, 0.184314)
	wait(1)
until not Fire.Enabled