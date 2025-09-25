local anim = script:WaitForChild("HiAnimation")

local chara = script.Parent
local humanoid = chara:WaitForChild("Humanoid")

local animTrack = humanoid:LoadAnimation(anim)

task.wait(5)
animTrack:Play()

animTrack:GetMarkerReachedSignal("Halfway"):Connect(function(TheParam)
	print(TheParam)
end)