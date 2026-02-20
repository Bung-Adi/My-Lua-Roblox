local RunS = game:GetService("RunService")
local Firebal = game.ReplicatedStorage.Fireball
local ProjectilePart = game.ServerStorage.cannonball

local SPEED = 100
local GRAVITY_M = 0.25
local MAX_DIS = 250

Firebal.OnServerEvent:Connect(function(player, mousePos)
	-- setup
	local FromWhere = player.Character.HumanoidRootPart.Position
	local Frame = (mousePos - FromWhere).Unit
	local Gravity = Vector3.new(0, -workspace.Gravity, 0) * GRAVITY_M
	
	-- create projectile
	local Projectile = ProjectilePart:Clone()
	Projectile.CFrame = CFrame.new(FromWhere, FromWhere + Frame )
	Projectile.Parent = workspace
	
	-- update movement per frame
	local Velocity = Frame * SPEED
	local position = FromWhere
	local TotalDistance = 0 -- start from 0
	
	local connection
	connection = RunS.Heartbeat:Connect(function(deltaTime)
		local StepVelocity = Velocity + Gravity * deltaTime
		local StepDisplacement = (Velocity + StepVelocity) / 2 * deltaTime
		Velocity = StepVelocity
		
		local NextPosition = position + StepDisplacement
		Projectile.CFrame = CFrame.new(NextPosition, NextPosition + Velocity.Unit)
		position = NextPosition
		
		TotalDistance += StepDisplacement.Magnitude
		
		if TotalDistance >= MAX_DIS then
			Projectile:Destroy() -- destroy if it has traveled too far
			connection:Disconnect()
		end
	end)
end)
