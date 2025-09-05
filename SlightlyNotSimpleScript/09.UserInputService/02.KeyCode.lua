-- used to detect whats key pressed
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.B then
		print("B was pressed")
	end
end)
