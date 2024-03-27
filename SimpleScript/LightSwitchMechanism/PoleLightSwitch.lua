-- put it inside a lamp model

local button = script.Parent.Pole.ProximityPrompt
local lamp = script.Parent.TheLamp
local light = lamp.SpotLight

button.Triggered:Connect(function()
	if button.ActionText == "Turn Off" then
		lamp.Material = Enum.Material.Plastic
		light.Brightness = 0
		button.ActionText = "Turn On"
	else
		lamp.Material = Enum.Material.Neon
		light.Brightness = 40
		button.ActionText = "Turn Off"
	end
end)