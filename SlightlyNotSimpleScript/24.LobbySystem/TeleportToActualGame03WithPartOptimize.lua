local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local teleportPart = workspace:WaitForChild("TeleportPart")
local TargetPlaceID = 71874326048737 -- Replace with your actual place ID

local debounce = {}

teleportPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	if player and not debounce[player] then
		debounce[player] = true
		local success, errorMessage = pcall(function()
			TeleportService:TeleportAsync(TargetPlaceID, {player})
		end)
		if not success then
			warn("Teleport failed for " .. player.Name .. ": " .. errorMessage)
			debounce[player] = nil -- reset so they can retry
		end
	end
end)
