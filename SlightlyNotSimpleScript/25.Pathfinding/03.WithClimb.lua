local PF = game:GetService("PathfindingService")

local NPC = script.Parent
local Humanoid = NPC:WaitForChild("Humanoid")
local TheFlag = game.Workspace:WaitForChild("TheFlag")

local path = PF:CreatePath({
	AgentCanJump = true,
	AgentCanClimb = true,
})

local success, error = pcall(function()
	path:ComputeAsync(NPC.PrimaryPart.Position, TheFlag.Position)
end)

if success then
	for _,step in pairs(path:GetWaypoints()) do
		local part = Instance.new("Part")
		part.Material = "Neon"
		part.Anchored = true
		part.CanCollide = false
		part.Shape = "Ball"
		part.Position = step.Position
		part.Parent = game.Workspace
		
		Humanoid:MoveTo(step.Position)
		if step.Action == Enum.PathWaypointAction.Jump then
			Humanoid.Jump = true
		end
		Humanoid.MoveToFinished:Wait()
	end
else
	warn(error)
end