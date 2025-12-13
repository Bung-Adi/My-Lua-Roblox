-- Cutsecene
local TweenService = game:GetService("TweenService")

local camera = workspace.CurrentCamera
local StartPart = workspace.Cutscene:WaitForChild("Start")
local EndPart = workspace.Cutscene:WaitForChild("End")

task.wait(10)

camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = StartPart.CFrame
TweenService:Create(camera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = EndPart.CFrame}):Play()