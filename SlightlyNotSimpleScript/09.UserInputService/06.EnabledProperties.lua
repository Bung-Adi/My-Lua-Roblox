-- actually if you can detect what device and input player use it's easyer your project
-- try it with mobile and pc
local UserInput = game:GetService("UserInputService")

if UserInput.TouchEnabled then
	print("Mobile Player")
	workspace:WaitForChild("Baseplate").Color = Color3.fromRGB(0, 170, 255)
end
