-- ever wonder how people make key hold move ?
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.B then
		print("B was pressed")
	end
end)

UserInput.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.B then
		print("B was released")
	end
end)
