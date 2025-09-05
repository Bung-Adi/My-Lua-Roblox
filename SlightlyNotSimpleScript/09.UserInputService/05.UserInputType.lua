-- what if user not using keyboard?
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("Click")
	end
end)

UserInput.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("Click Relesed")
	end
end)

