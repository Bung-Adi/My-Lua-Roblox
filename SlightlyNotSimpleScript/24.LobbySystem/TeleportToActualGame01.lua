local TeleportService = game:GetService("TeleportService")

local TargetPlaceID = 71874326048737 -- Replace with your actual place ID

game.Players.PlayerAdded:Connect(function(player)
	TeleportService:TeleportAsync(TargetPlaceID,{player})
end)