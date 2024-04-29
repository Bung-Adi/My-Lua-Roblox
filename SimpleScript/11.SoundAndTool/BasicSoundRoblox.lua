-- Here is bassic of sound in roblox

local Alarm = script.Parent.Alarm

-- list of event
Alarm:Play()
Alarm:Pause()
Alarm:Stop()

-- if you need repetitive fast and many sound its recomended to use clone event
Alarm.PlayOnRemove = true
local AlarmClone = Alarm:Clone()
AlarmClone.Parent = script.Parent
AlarmClone:Play()
AlarmClone:Destroy()