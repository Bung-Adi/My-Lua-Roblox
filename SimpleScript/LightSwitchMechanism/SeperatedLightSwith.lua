--[[
    Project Structure

    - System Folder
      - Switch model
        - Script
        - ClickDetector
        - Part(SwithOn)
        - Part(SwitchOff)
      - Lamp1
        - PointLight
      - Lamp2
        - PointLight
]]

local SwitchOn = script.Parent.SwithOn
local SwitchOf = script.Parent.SwithOff
local ClickDetector = script.Parent.ClickDetector
local Lamp1 = workspace["Lamp_Switch_Folder_Name"].Lamp1
local Lamp2 = workspace["Lamp_Switch_Folder_Name"].Lamp2

ClickDetector.MouseClick:Connect(function()
	if (SwitchOn.Transparency == 1 ) then
		Lamp1.PointLight.Brightness = 10
		Lamp2.PointLight.Brightness = 10
		SwitchOn.Transparency = 0
		SwitchOf.Transparency = 1
	elseif (SwitchOn.Transparency == 0) then
		Lamp1.PointLight.Brightness = 0
		Lamp2.PointLight.Brightness = 0
		SwitchOn.Transparency = 1
		SwitchOf.Transparency = 0
	end
end)