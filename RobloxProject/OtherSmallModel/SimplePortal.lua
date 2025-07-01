--[[
Portals Family Tree
->Portals
	SimplePortal (script)
	Portal1 (model)
		PortalBox
		Teleport
	Portal2 (model)
		PortalBox
		Teleport
- makesure CanCollide is off
]]

local Portals = script.Parent

local Portal1 = Portals.Portal1
local Portal2 = Portals.Portal2

local Debounce = false

game.Players.PlayerAdded:Connect(function(Player) -- PlayerAdded is a powerfull event to make sure player is on the game
	local Character = Player.Character or Player.CharacterAdded:Wait() -- two arguments with or its make sure character is here
	
	Portal1.PortalBox.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") and not Debounce then
			Debounce = true
			Character:MoveTo(Portal2.Teleport.Position)
			wait(0.5)
			Debounce = false
		end
	end)
	
	Portal2.PortalBox.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") and not Debounce then
			Debounce = true
			Character:MoveTo(Portal1.Teleport.Position)
			wait(0.5)
			Debounce = false
		end
	end)
	
end)