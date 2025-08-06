--[[
Put it inside StarterGui.ScreenGui
---
Its a LocalScript
---
Remote Event it's basically allowing you to comunicate betwen client and server script
Remote Function it's basically allowing you to comunicate betwen client and server script and get a response from server
---
u need other file ->
a TextButton @ StarterGui.ScreenGui named "SpawnButton"
a Script @ ServerScriptService named "blockspawn"
a RemoteEvent @ ReplicatedStorage named "GiveBlock"
]]

local ReplicateStorage = game:GetService("ReplicatedStorage")
local RemoteEven = ReplicateStorage:WaitForChild("GiveBlock")

--[[
RemoteEvent have 3 methode
RemoteEven:FireClient()
RemoteEven:FireServer()
RemoteEven:FireAllClients()

in a LocalScript u only need FireServer
]]
script.Parent.SpawnButton.MouseButton1Click:Connect(function()
	RemoteEven:FireServer("Spawn Button Pressed")
end)
