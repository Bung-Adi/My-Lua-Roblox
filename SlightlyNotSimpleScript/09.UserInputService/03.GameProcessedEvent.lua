-- try it and interact with all UI and you will see the result
local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then
		print("Processed")
	end

	--if gameProcessedEvent then
	--	return
	--end
	
end)

