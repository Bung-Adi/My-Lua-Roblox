local CollectionService = game:GetService("CollectionService")

local Part = game.Workspace.Drom

CollectionService:AddTag(Part, "KillBrick")

task.wait(1)
if CollectionService:HasTag(Part, "KillBrick") then
	print("? Drom part is tagged with KillBrick")
end

-- Remove tag after a delay
task.wait(5)
CollectionService:RemoveTag(Part, "KillBrick")

-- Confirm removal
task.wait(1)
if not CollectionService:HasTag(Part, "KillBrick") then
	print("? Drom part is no longer tagged with KillBrick")
end