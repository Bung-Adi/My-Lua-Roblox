-- basically used for debugging and used with other I mean it's an event
-- it's have only 2 argumen : input and gameProcessedEvent
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
	print(input)
end)