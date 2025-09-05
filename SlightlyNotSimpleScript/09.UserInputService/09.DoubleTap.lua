local UserInput = game:GetService("UserInputService")

local ct = tick()

UserInput.InputBegan:Connect(function(input, gpe)
	if input.KeyCode == Enum.KeyCode.W and (tick() - ct <= 0.2) then
		print("Double Tap W")
	end
	ct = tick()
end)
