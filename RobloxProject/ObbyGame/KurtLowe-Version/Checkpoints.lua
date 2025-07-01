local Checkpoin1 = game.Workspace.StageOne.SpawnLocation
local Checkpoin2 = game.Workspace.StageTwo.SpawnLocation
local Checkpoin3 = game.Workspace.StageTree.SpawnLocation
local Checkpoin4 = game.Workspace.StageFour.SpawnLocation
local Checkpoin5 = game.Workspace.StageFive.SpawnLocation
--[[
Important :
For Teams -> 	make sure all 5 teams AutoAssignable = false; 
				but team 0 are true; 
				And dont forget asign team color thats match team color on SpawnLocations too
For SpawnLocation -> Neutral = false. and Forcefield Duration = 0
]]
-- 
-- and  on SpawnLocation

game.Players.PlayerAdded:Connect(function(Player)
	--local Character = Player.Character or Player.CharacterAdded:Wait()
	
	--Player.Team = game.Teams["Stage 0"]
	--Character:MoveTo(game.Workspace.Start.SpawnLocation.Position)
	
	Checkpoin1.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") then
			Player.Team = game.Teams["Stage 1"]
		end
	end)
	
	Checkpoin2.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") then
			Player.Team = game.Teams["Stage 2"]
		end
	end)
	
	Checkpoin3.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") then
			Player.Team = game.Teams["Stage 3"]
		end
	end)
	
	Checkpoin4.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") then
			Player.Team = game.Teams["Stage 4"]
		end
	end)
	
	Checkpoin5.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") then
			Player.Team = game.Teams["Stage 5"]
		end
	end)
end)
