local TeleportService = game:GetService("TeleportService")

local teleportPart = game.Workspace.TeleportPart

local TargetPlaceID = 71874326048737 -- Replace with your actual place ID

teleportPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	if player then
		TeleportService:TeleportAsync(TargetPlaceID,{player})
	end
end)