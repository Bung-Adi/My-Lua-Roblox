--[[
Model Structure ->
---
Root (can be folder or model)
	Core (model)
		StrobeLightRotating (script)
		BlueCube (Part)
			SpotLight
			WeldConstraint
		RedCube (Part)
			SpotLight
			WeldConstraint
		cube (Part)
			WeldConstraint
	Union (Part)
]]

local Core = script.Parent.cube

repeat
	Core.CFrame = Core.CFrame * CFrame.Angles(0, math.rad(1), 0)
	wait(0.001)
until false

