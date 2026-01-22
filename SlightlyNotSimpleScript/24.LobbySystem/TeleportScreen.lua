-- StarterPlayerScripts/TeleportScreen.lua
local TeleportService = game:GetService("TeleportService")
local TeleportGui = game.ReplicatedStorage:WaitForChild("TeleportScreen")

TeleportService:SetTeleportGui(TeleportGui)