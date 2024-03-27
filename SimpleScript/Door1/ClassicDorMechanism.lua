-- Put it inside dor model
local TweenService = game:GetService("TweenService")

local engsel = script.Parent.Engsel -- Part for engsel
local prompt = script.Parent.Pintu.ProximityPrompt -- Part for main dor

local buka = {}
buka.CFrame = engsel.CFrame * CFrame.Angles(0,math.rad(90),0)

local tutup = {}
tutup.CFrame = engsel.CFrame * CFrame.Angles(0,0,0)

local tweeninfo = TweenInfo.new(1)
local tweenopen = TweenService:Create(engsel,tweeninfo,buka)
local tweenclose = TweenService:Create(engsel,tweeninfo,tutup)

prompt.Triggered:Connect(function()
	if prompt.ActionText == "Tutup" then
		tweenclose:Play()
		prompt.ActionText = "Buka"
	else
		tweenopen:Play()
		prompt.ActionText = "Tutup"
	end
end)