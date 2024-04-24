-- put it inside a StarterGui.ScreenGui
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local wonEvent = ReplicatedStorage.WonRemoteEvent
local gui = script.Parent

wonEvent.OnClientEvent:Connect(function()
	gui.Enabled = true
end)
