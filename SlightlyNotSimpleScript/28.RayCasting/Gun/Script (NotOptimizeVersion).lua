local tool = script.Parent
local firegun = tool.FireGun
local distanceMultiplier = 50
local excludePart = {}
local damage = 5

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
	table.insert(excludePart, NewPart)

	NewPart.Parent = workspace
	game.Debris:AddItem(NewPart,0.5)
end	

firegun.OnServerEvent:Connect(function(player, origin, mousePos)
	local direction = (mousePos - origin).Unit * distanceMultiplier
	
	local RayCastExclude = RaycastParams.new()
	RayCastExclude.FilterDescendantsInstances = excludePart
	RayCastExclude.FilterType = Enum.RaycastFilterType.Exclude

	local Raycast = workspace:Raycast(origin, direction, RayCastExclude)
	
	if Raycast then
		print(Raycast.Instance.Name)
		table.insert(excludePart, player.Character)
		VisualizeRaycast(origin,direction)
		local char = Raycast.Instance:FindFirstAncestorOfClass("Model")
		if char then
			local humanoid = char:FindFirstChild("Humanoid")
			if humanoid then
				humanoid:TakeDamage(damage)
			end
		end
	else
		print("Nothing")
		VisualizeRaycast(origin,direction)
	end
end)
