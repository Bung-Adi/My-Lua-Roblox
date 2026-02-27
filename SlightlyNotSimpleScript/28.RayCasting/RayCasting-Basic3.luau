-- this is server script service
local RunS = game:GetService("RunService")
local OriginPart = game.Workspace.RayCasting.OriginPart
local RandomPart = game.Workspace.RayCasting.RandomPart
local Direction = Vector3.new(0,0,100)

local function VisualizeRaycast(Origin,Direction)
	-- length & midpoin
	local Length = Direction.Magnitude
	local Midpoint = Origin + Direction * 0.5
	
	-- create part
	local NewPart = Instance.new("Part")
	NewPart.Anchored = true
	NewPart.CanCollide = false
	NewPart.Material = Enum.Material.Neon
	NewPart.Color = Color3.new(1,0,0)
	NewPart.Transparency = 0.5
	
	NewPart.Size = Vector3.new(0.1,0.1,Length)
	NewPart.CFrame = CFrame.new(Midpoint,Origin + Direction)
	
	NewPart.Parent = workspace
	game.Debris:AddItem(NewPart,0.5)
end	

RunS.Heartbeat:Connect(function()
	local RayCastExclude = RaycastParams.new()
	RayCastExclude.FilterDescendantsInstances = {RandomPart}
	RayCastExclude.FilterType = Enum.RaycastFilterType.Exclude
	
	local Raycast = workspace:Raycast(OriginPart.Position,Direction,RayCastExclude)

	VisualizeRaycast(OriginPart.Position,Direction)
	
	if Raycast then
		print(Raycast.Instance.Name)
	else
		print("Nothing")
	end
end)

