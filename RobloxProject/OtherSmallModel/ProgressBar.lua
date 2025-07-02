--[[
	Source Code : https://devforum.roblox.com/t/tutorial-how-to-make-a-player-progress-bar/3466247
	Structure :
	Workspace -> 
		Points (Folder)-> 
			Start (Part)
			End (Part)
	StarterGui -> 
		ProgressBar (ScreenGUI)-> 
			LocalScript -> 
				playersample (ImageLabel)
			Vertical (Frame)-> 
				UICcorner,UISroke,WhatEverUIYouWant
]]
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local Runs = game:GetService("RunService")

-- VARIABLES
local verticalbar = script.Parent:WaitForChild("Vertical")
local pointfolder = game.Workspace:WaitForChild("Points")
local startpoint = pointfolder:WaitForChild("Start")
local endpoint = pointfolder:WaitForChild("End")
local StartToEnd = endpoint.Position - startpoint.Position
local characters = {}

-- FUNCTIONS
local function get_player_ui(player)
	local sample = script:WaitForChild("playersample"):Clone()
	sample.Position = UDim2.fromScale(0.5, 0)
	sample.Parent = verticalbar

	local s, e = pcall(function()
		sample.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)
	if not s then
		sample.Image = "rbxassetid://1584763539"
	end
	return sample
end

local function trackplayer(player)
	local character = player.Character or player.CharacterAdded:Wait()

	if not character then
		characters[player.Name] = nil
		return
	end

	characters[player.Name] = {
		Char = character,
		UIObject = verticalbar:FindFirstChild(player.Name) or get_player_ui(player)
	}
end

-- EVENTS
Players.PlayerAdded:Connect(function(player)
	trackplayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
	if characters[player.Name] then
		if characters[player.Name].UIObject then
			characters[player.Name].UIObject:Destroy()
		end
		characters[player.Name] = nil
	end
end)

-- RUN
for i, v in pairs(game.Players:GetChildren()) do
	trackplayer(v)
end

while true do
	for i, v in pairs(characters) do
		if not v or not v.Char or not v.UIObject then
			continue
		end

		local StartToPlayer = v.Char:GetPivot().Position - startpoint.Position
		local length = StartToEnd:Dot(StartToEnd)
		local progression = math.clamp(StartToPlayer:Dot(StartToEnd) / length, 0, 1)

		v.UIObject.Position = UDim2.fromScale(progression, 0.5)
	end
	task.wait()
end
