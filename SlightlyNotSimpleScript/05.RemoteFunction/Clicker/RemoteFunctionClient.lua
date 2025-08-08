--[[
This is a LocalScript @ StarterPlayer.StarterPlayerScript
you also need a 
RemoteFunction is a RemoteFunction @ ReplicatedStorage,
RemoteFunctionServer is a script @ ServerScriptService,
AdornmenPart is a part with a ClickDetector @ Workspace
]]

local ReplicateStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = game.ReplicatedStorage.RemoteFunction

local AdornmPart = game.Workspace:WaitForChild("AdornmenPart")
local ClickDetector = AdornmPart:WaitForChild("ClickDetector")

ClickDetector.MouseClick:Connect(function(Player)
	local Res = RemoteFunction:InvokeServer(50)
	print(Res)
end)
