--[[
put it inside ReplicatedFirst.

And u need UI, with structure ->
LoadingScreen (This script)
	-> LoadingScreen (ScreenGui)
		-> Frame
			-> TextLabel
			-> LoadingBar (Frame)
				-> Bar (TextLabel)

]]
local Players = game:GetService("Players")
local ReplicateFirst = game:GetService("ReplicatedFirst")

ReplicateFirst:RemoveDefaultLoadingScreen()

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local LoadingScreen = script:WaitForChild("LoadingScreen"):Clone()
LoadingScreen.Parent = PlayerGui

local Frame = LoadingScreen:WaitForChild("Frame")
local LoadingText = Frame:WaitForChild("TextLabel")
local Bar = Frame:WaitForChild("LoadingBar"):WaitForChild("Bar")

task.wait(5)
LoadingText.Text = "LoadingCompleate"
Bar.Size = UDim2.new(1,0,1,0)

task.wait(2)
LoadingScreen:Destroy()

