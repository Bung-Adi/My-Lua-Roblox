-- detect Multiple key presses
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gpe)
	if UserInput:IsKeyDown(Enum.KeyCode.Q) and input.KeyCode == Enum.KeyCode.E then
		print("Player has pressed E while holding Q")
	end
end)

