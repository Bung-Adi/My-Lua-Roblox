-- Cutsecene
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local camera = workspace.CurrentCamera
local player = Players.LocalPlayer
local StartPart = workspace.Cutscene:WaitForChild("Start")
local EndPart = workspace.Cutscene:WaitForChild("End")
local TrigerPart = workspace.Cutscene:WaitForChild("Triger")

TrigerPart.Touched:Connect(function(hit)
	local character = player.Character
	if character and hit:IsDescendantOf(character) then
		camera.CameraType = Enum.CameraType.Scriptable
		camera.CFrame = StartPart.CFrame
		TweenService:Create(camera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = EndPart.CFrame}):Play()
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
	end
end)