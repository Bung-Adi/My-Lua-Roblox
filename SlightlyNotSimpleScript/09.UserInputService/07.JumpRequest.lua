-- lets detect your jump. but...
local UserInput = game:GetService("UserInputService")

UserInput.JumpRequest:Connect(function(input, gpe)
	print("Jump")
end)
