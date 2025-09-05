local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")

	humanoid.Jumping:Connect(function(isJumping)
		if isJumping then
			print("Player jumped!")
			-- You can trigger effects, sounds, or animations here
		end
	end)
end

-- Handle character respawn
player.CharacterAdded:Connect(onCharacterAdded)

-- If character already exists
if player.Character then
	onCharacterAdded(player.Character)
end
