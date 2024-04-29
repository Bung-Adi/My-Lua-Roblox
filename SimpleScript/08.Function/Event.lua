--[[
Defenition ->
	Event is a signal which can be fired when something occures.
	
	You don't need to create event in roblox studio. they already have been created for you.
	you just need to use them (reference them).
	see doc -> https://create.roblox.com/docs/scripting/events
]]

local SparkledPart = game.Workspace.sparkle
local Debounce = false

-- touched event
SparkledPart.Touched:Connect(function(Hit) -- Hit is placeholder of other part that colide with the part
	if not Debounce and Hit.Parent:FindFirstChild("Humanoid") then -- Check if true and Touch a 'Humanoid' Character
		Debounce = true
		print("Ouch")
		wait(1)
		Debounce = false
	end
end)

SparkledPart.Changed:Connect(function(Property)
	if Property == "Transparency" then
		print("Transparancy changed")
	end
end)
