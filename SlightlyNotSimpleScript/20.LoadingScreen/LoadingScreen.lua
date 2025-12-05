--[[
put it inside ReplicatedFirst.

And u need UI, with structure ->
LoadingScreen (This script)
	-> LoadingScreen (ScreenGui)
		-> Frame
			-> TextLabel
			-> LoadingBar (Frame)
				-> Bar (TextLabel)

You can change the Loading Text, and the Bar Color, and the Loading Time.
And the LoadingBar will change size, when the LoadingCompleate event is fired.
]]
local Players = game:GetService("Players")
local ReplicateFirst = game:GetService("ReplicatedFirst")
local ContentProvider = game:GetService("ContentProvider")

ReplicateFirst:RemoveDefaultLoadingScreen()

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local LoadingScreen = script:WaitForChild("LoadingScreen"):Clone()
LoadingScreen.Parent = PlayerGui

local Frame = LoadingScreen:WaitForChild("Frame")
local LoadingText = Frame:WaitForChild("TextLabel")
local Bar = Frame:WaitForChild("LoadingBar"):WaitForChild("Bar")

local assets = game:GetChildren()

for index, asset in pairs(assets) do
	LoadingText.Text = "Loading " .. asset.Name .. "..."
	ContentProvider:PreloadAsync({asset})
	
	local progres = index / #assets
	Bar.Size = UDim2.new(progres,0,1,0)
end

LoadingText.Text = "LoadingCompleate"
Bar.Size = UDim2.new(1,0,1,0)

task.wait(2)
LoadingScreen:Destroy()

