-- u need to open AssetManager vrom the view and right click places and add new place
-- can't be tested on roblox studio. need roblox player
-- plus it's better to make it in localscript
-- maybe its better to look at Roblox Studio For this

local TeleportService = game:GetService("TeleportService")
local NextPlaceID = 17441152395
local Player = game.Players.LocalPlayer

local TeleportData = TeleportService:GetLocalPlayerTeleportData()

local Proximity = script.Parent.ProximityPrompt

Proximity.Triggered:Connect(function(Player)
	TeleportService:Teleport(NextPlaceID, Player)
end)
