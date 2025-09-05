-- actually if you can detect what device and input player use it's easyer your project
-- try it with mobile and pc
local UserInput = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local Text = GUI:WaitForChild("TextLabel")

Text.Visible = false

if UserInput.TouchEnabled then
	Text.Visible = false
	print("Mobile Player")
	workspace:WaitForChild("Baseplate").Color = Color3.fromRGB(0, 170, 255)
else
	Text.Visible = true
	print("PC Player")
	workspace:WaitForChild("Baseplate").Color = Color3.fromRGB(255, 0, 0)
end
