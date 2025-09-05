-- lets detect your jump. but with debounce
local UserInput = game:GetService("UserInputService")

local isJumping = false

UserInput.JumpRequest:Connect(function(input, gpe)
	if not isJumping then
		isJumping = true
		print("Jump")
		task.wait(3)
		isJumping = false
	end
end)
