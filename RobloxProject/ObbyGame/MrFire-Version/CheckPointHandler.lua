-- put it insdide ServerScriptService

local Players = game:GetService("Players") -- GetService function is to make sure we sellect a service correctly
-- you should name reference to service with Capital like above

local checkpoints = workspace.Checkpoints:GetChildren()

local function onCharacterAdded(character)
	-- function is called when a player has new character added
	local player = Players:GetPlayerFromCharacter(character)
	if player.leaderstats.Checkpoint.Value <= 0 then
		-- this player has not touched a checkpoint yet, so we ignore them!
		return
	end

	for _, checkpoint in ipairs(checkpoints) do
		-- find the checkpoint part whose value matches the value in the player's leaderboard
		if checkpoint:GetAttribute("Value") ~= player.leaderstats.Checkpoint.Value then
			continue
		end
		task.wait(0.05) -- YIELD so the main thread escapes and allows our character to first enter the workspace
		-- and then we can update the CFrame of the player!
		character.HumanoidRootPart.CFrame = checkpoint.CFrame + Vector3.new(0, 4, 0)
	end
end

local function onCheckpointTouched(otherPart, checkpoint)
	-- this is called when a checkpoint is touched
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if player then
		if player.leaderstats.Checkpoint.Value > checkpoint:GetAttribute("Value") then
			-- player tries to go to a previous checkpoint, we ignore them!
			return
		end
		if player.leaderstats.Checkpoint.Value + 1 ~= checkpoint:GetAttribute("Value") then
			-- player tried to skip a checkpoint, we ignore them!
			return
		end

		player.leaderstats.Checkpoint.Value = checkpoint:GetAttribute("Value")
	end
end

Players.PlayerAdded:Connect(function(player)
	-- setup leaderboard for this player
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local checkpoint = Instance.new("IntValue")
	checkpoint.Name = "Checkpoint"
	checkpoint.Parent = leaderstats

	-- and listen for when a new character is added to this player
	player.CharacterAdded:Connect(onCharacterAdded)
end)

for _, checkpoint in ipairs(checkpoints) do
	checkpoint.Touched:Connect(function(otherPart)
		onCheckpointTouched(otherPart, checkpoint)
	end)
end