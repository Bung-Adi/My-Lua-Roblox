local StegeGui = script.Parent
local StageLabel = StegeGui.GuiTextStage
local TimerLaber = StegeGui.GuiTextTimer

local Player = game.Players.LocalPlayer

local InStage = false
local StartDebounce = false
local EndDebounce = false

wait(2)

local Stages = {
	game.Workspace.StageOne,
	game.Workspace.StageTwo,
	game.Workspace.StageTree,
	game.Workspace.StageFour,
	game.Workspace.StageFive
}

local function StartTimer()
	local Minute = 0
	local Second = 0
	
	repeat
		Second = Second + 1
		if Second == 60 then
			Minute = Minute + 1
			Second = 0
		end
		if Minute > 9 and Second > 9 then
			TimerLaber.Text = Minute .. " : " .. Second
		elseif Minute > 9 then
			TimerLaber.Text = Minute .. " : 0" .. Second
		elseif Second > 9 then
			TimerLaber.Text = "0" .. Minute .. " : " .. Second
		else
			TimerLaber.Text = "0" ..Minute .. " : 0" .. Second
		end
		wait(1)
	until not InStage
end

local function EndTimer()
	InStage = false
	TimerLaber.Text = "00 : 00"
end

for i, stage in pairs(Stages) do
	stage.Start.Touched:Connect(function(Hit)
		if Hit.Parent == Player.Character and not StartDebounce then
			InStage = true
			StartDebounce = true
			StageLabel.Text = "Stage: " .. i
			StartTimer()
		end
	end)
	stage.End.Touched:Connect(function(Hit)
		if Hit.Parent:FindFirstChild("Humanoid") and not EndDebounce then
			EndDebounce = true
			
			StageLabel.Text = "Stage: " .. i .. "Compleate"
			EndTimer()
			
			StartDebounce = false
			EndDebounce = false
		end
	end)
end