local tool = script.Parent
local firegun = tool.FireGun
local bullet = game.ServerStorage.Bullet
local distanceMultiplier = 50
local damage = 5
local BulletRadius = 0.5

local visualizationFolder = Instance.new("Folder")
visualizationFolder.Name = "BulletVisuals"
visualizationFolder.Parent = workspace

local function VisualizeShape(Origin,Direction,RayResult)
	local position = if RayResult then RayResult.Position else Origin + Direction
	local distance = (position - Origin).Magnitude
	local midpoint = Origin + Direction * 0.5
	
	local newBullet = bullet:Clone()
	newBullet.Size = Vector3.new(distance,BulletRadius * 2,BulletRadius * 2)
	newBullet.CFrame = CFrame.lookAt(midpoint, position) * CFrame.Angles(0,math.rad(90),0)
	newBullet.Parent = visualizationFolder
	return newBullet
end

firegun.OnServerEvent:Connect(function(player, origin, mousePos)
	local direction = (mousePos - origin).Unit * distanceMultiplier

	local excludePart = {player.Character, visualizationFolder}
	
	local RayCastExclude = RaycastParams.new()
	RayCastExclude.FilterDescendantsInstances = excludePart
	RayCastExclude.FilterType = Enum.RaycastFilterType.Exclude

	local Raycast = workspace:Spherecast(origin, BulletRadius,direction, RayCastExclude)
	local visualPart = VisualizeShape(origin,direction,Raycast)
	
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
