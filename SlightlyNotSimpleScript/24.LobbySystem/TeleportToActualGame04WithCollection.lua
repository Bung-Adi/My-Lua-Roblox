local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

-- Tag your teleport parts in Studio with "TeleportPart"
local debounce = {}

-- Function to handle teleport
local function onTouched(teleportPart, hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	if player and not debounce[player] then
		debounce[player] = true

		-- Get target place ID from attribute (set in Studio)
		local targetPlaceID = 71874326048737
		if targetPlaceID then
			local success, errorMessage = pcall(function()
				TeleportService:TeleportAsync(targetPlaceID, {player})
			end)
			if not success then
				warn("Teleport failed for " .. player.Name .. ": " .. errorMessage)
				debounce[player] = nil -- reset so they can retry
			end
		else
			warn("TeleportPart missing TargetPlaceID attribute")
			debounce[player] = nil
		end
	end
end

-- Connect all tagged teleport parts
for _, teleportPart in ipairs(CollectionService:GetTagged("TeleportPart")) do
	teleportPart.Touched:Connect(function(hit)
		onTouched(teleportPart, hit)
	end)
end

