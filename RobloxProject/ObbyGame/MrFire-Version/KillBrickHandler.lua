-- put it insdide ServerScriptService

local killbricks = workspace.KillBricks:GetChildren()

local function onBrickTouched(otherPart)
	if otherPart.Parent:FindFirstChildWhichIsA("Humanoid") then
		-- make sure the part belongs to a player's character
		otherPart.Parent.Humanoid.Health = 0 -- kills them
	end
end

for _, brick in ipairs(killbricks) do
	brick.Touched:Connect(onBrickTouched)
end