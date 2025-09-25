--[[
this is simple animation play script.
it's a LocalScript place it in StarterPlayerScript.
and add an animation.
see the animation in core priority vs action... whats th different.
]]

local anim = script:WaitForChild("HiAnimation")

local chara = script.Parent
local humanoid = chara:WaitForChild("Humanoid")

local animTrack = humanoid:LoadAnimation(anim)

task.wait(5)
animTrack:Play()