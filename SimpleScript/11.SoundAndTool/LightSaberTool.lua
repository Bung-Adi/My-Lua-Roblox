--[[
Structure ->
---
Tool (Tool --our root)
	LightSaberTool (LocalScript)
	Handle (MeshPart)
		Ignition (sound)
		Whomps (sound)
		PointLight (PointLight)
---
]]

local Tool = script.Parent

local EquipSound = Tool.Handle.Whomps
local ActivSound = Tool.Handle.Ignition

local isLightOn = Tool.Handle.PointLight.Enabled

Tool.Equipped:Connect(function()
	print("Light Saber Equiped")
	EquipSound:Play()
end)

Tool.Unequipped:Connect(function()
	print("Light Saber Unequepped")
	EquipSound:Play()
end)

Tool.Activated:Connect(function()
	if isLightOn then
		isLightOn = false
		ActivSound:Play()
	else
		isLightOn = true
		ActivSound:Play()
	end
end)
