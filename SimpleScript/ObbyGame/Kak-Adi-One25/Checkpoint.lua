-- put it insdide ServerScriptService

local Players = game:GetService("Players")
local checkpoints = workspace.Checkpoints:GetChildren()

-- Table to store each player's current checkpoint part name
local playerCheckpoints = {}

local function onCharacterAdded(character)
	local player = Players:GetPlayerFromCharacter(character)
	if not player then return end

	local checkpointName = playerCheckpoints[player]
	if not checkpointName then
		-- Player has not touched a checkpoint yet
		return
	end

	for _, checkpoint in ipairs(checkpoints) do
		if checkpoint.Name == checkpointName then
			task.wait(0.05)
			character:WaitForChild("HumanoidRootPart").CFrame = checkpoint.CFrame + Vector3.new(0, 4, 0)
			break
		end
	end
end

local function onCheckpointTouched(otherPart, checkpoint)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if player then
		playerCheckpoints[player] = checkpoint.Name
	end
end

Players.PlayerAdded:Connect(function(player)
	playerCheckpoints[player] = nil -- No checkpoint at start
	player.CharacterAdded:Connect(onCharacterAdded)
	player.AncestryChanged:Connect(function(_, parent)
		if not parent then
			playerCheckpoints[player] = nil -- Clean up when player leaves
		end
	end)
end)

for _, checkpoint in ipairs(checkpoints) do
	checkpoint.Touched:Connect(function(otherPart)
		onCheckpointTouched(otherPart, checkpoint)
	end)
end