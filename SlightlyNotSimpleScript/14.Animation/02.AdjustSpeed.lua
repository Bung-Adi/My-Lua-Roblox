local anim = script:WaitForChild("HiAnimation")

local chara = script.Parent
local humanoid = chara:WaitForChild("Humanoid")

local animTrack = humanoid:LoadAnimation(anim)

task.wait(5)
animTrack:Play()

animTrack:AdjustSpeed(0.1)