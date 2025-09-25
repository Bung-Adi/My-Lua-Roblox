local UIS = game:GetService("UserInputService")
local anim = script:WaitForChild("HiAnimation")

local chara = script.Parent
local humanoid = chara:WaitForChild("Humanoid")

local animTrack = humanoid:LoadAnimation(anim)

UIS.InputBegan:Connect(function(input)
	-- press R to play animation
	if input.KeyCode == Enum.KeyCode.R then
		animTrack:Play()
	end
end)
