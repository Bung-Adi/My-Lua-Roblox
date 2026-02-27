local tool = script.Parent
local firegun = tool.FireGun
local distanceMultiplier = 50
local damage = 5

local visualizationFolder = Instance.new("Folder")
visualizationFolder.Name = "BulletVisuals"
visualizationFolder.Parent = workspace

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

	NewPart.Parent = visualizationFolder
	return NewPart
end	

firegun.OnServerEvent:Connect(function(player, origin, mousePos)
	local direction = (mousePos - origin).Unit * distanceMultiplier
	
	local visualPart = VisualizeRaycast(origin,direction)
	local excludePart = {player.Character, visualizationFolder}
	
	local RayCastExclude = RaycastParams.new()
	RayCastExclude.FilterDescendantsInstances = excludePart
	RayCastExclude.FilterType = Enum.RaycastFilterType.Exclude

	local Raycast = workspace:Raycast(origin, direction, RayCastExclude)
	
	if Raycast then
		print(Raycast.Instance.Name)
		local char = Raycast.Instance:FindFirstAncestorOfClass("Model")
		if char then
			local humanoid = char:FindFirstChild("Humanoid")
			if humanoid then
				humanoid:TakeDamage(damage)
			end
		end
	end
	game.Debris:AddItem(visualPart, 0.5)
end)
