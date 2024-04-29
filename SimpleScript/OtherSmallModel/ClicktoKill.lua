--[[
structure ->
---
Part
	ClickDetector
		this_script
---
]]

local ClickDetector = script.Parent

ClickDetector.MouseClick:Connect(function(Player)
	local Character = Player.Character
	local Humanoid = Character.Humanoid
	Humanoid.Health = 0
end)
