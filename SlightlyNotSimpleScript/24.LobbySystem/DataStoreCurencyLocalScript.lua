--[[
save it inside the Stat GUI. with structure ->
Stat (ScreenGui)
--(LocalScript)
--Diamond (Frame)
----Sum (TextLabel)
]]
local player = game.Players.LocalPlayer
local statGui = player:WaitForChild("PlayerGui"):WaitForChild("Stat")
local diamondFrame = statGui:WaitForChild("Diamond")
local sumLabel = diamondFrame:WaitForChild("Sum")

-- Wait for leaderstats
local leaderstats = player:WaitForChild("leaderstats")
local diamonds = leaderstats:WaitForChild("Diamonds")

-- Update GUI whenever diamonds change
diamonds:GetPropertyChangedSignal("Value"):Connect(function()
	sumLabel.Text = tostring(diamonds.Value)
end)

-- Initial update
sumLabel.Text = tostring(diamonds.Value)

