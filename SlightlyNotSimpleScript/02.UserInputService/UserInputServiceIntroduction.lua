--[[
This is local script
---
Put this inside of StarterPlayer.StarterPlayerScript
---
UserInputService is to detect and capture the different types of input on user device
https://create.roblox.com/docs/reference/engine/classes/UserInputService
]]

-- We must get the UserInputService before we can use it
local UserInputService = game:GetService("UserInputService")

-- A sample function providing one usage of InputBegan
local function onInputBegan(input, _gameProcessed) 
	-- _gameProcessed will return true if you clicked a GUI element such as a button
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("The left mouse button has been pressed!")
	end
end

UserInputService.InputBegan:Connect(onInputBegan)

--[[Other Usefull method
UserInputService.GetMouseLocation()
UserInputService.IsKeyDown()
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter -- locak your mouse position in game
]]
