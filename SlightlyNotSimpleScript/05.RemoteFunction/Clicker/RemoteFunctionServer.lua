--[[
This is a script @ ServerScriptService
]]
local ReplicateStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = game.ReplicatedStorage.RemoteFunction

RemoteFunction.OnServerInvoke = function(Player,Number)
	Number = Number * 2
	return Player.Name .. ' ' .. tostring(Number)
end
