-- LocalScript at StarterGui > DialogueGui
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local DialogData = require(ReplicatedStorage:WaitForChild("DialogueData"))
local StartDialogEvent = ReplicatedStorage:WaitForChild("StartDialogEvent")
local player = Players.LocalPlayer

local gui = script.Parent
local mainFrame = gui:WaitForChild("MainFrame")
local portraitImage = mainFrame:WaitForChild("Portrait")
local nameLabel = mainFrame:WaitForChild("NameLabel")
local dialogueLabel = mainFrame:WaitForChild("DialogueLabel")
local buttonContainer = mainFrame:WaitForChild("ButtonController")
local typeSound = mainFrame:WaitForChild("TypeSound")
local optionBtn = {
	buttonContainer:WaitForChild("Option1"),
	buttonContainer:WaitForChild("Option2"),
	buttonContainer:WaitForChild("Option3"),
}

local TYPE_SPEED = 0.03
local TWEEN_INFO = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local isTyping = false
local skipRequested = false
local dialogueOpen = false
local currentNpcData = nil
local buttonConnections = {}
local currentPromt = nil

mainFrame.Visible = false
mainFrame.Position = UDim2.new(0.5, 0, 1.1, 0)

local function playTypeSound()
	typeSound.PlaybackSpeed = 0.9 + (math.random() * 0.2)
	typeSound:Play()
end

local function togglePlayerMovement(canMove)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChild("Humanoid")
		if canMove then
			humanoid.WalkSpeed = 16
			humanoid.JumpPower = 50
		else
			humanoid.WalkSpeed = 0
			humanoid.JumpPower = 0
		end
	end
end

local function typewriteText(textToType)
	isTyping = true
	skipRequested = false
	dialogueLabel.Text = ""
	for i = 1, #textToType do
		if skipRequested then
			dialogueLabel.Text = textToType
			playTypeSound()
			break
		end
		dialogueLabel.Text = string.sub(textToType, 1, i)
		local lastChar = string.sub(textToType, i, i)
		if lastChar ~= " " then
			playTypeSound()
		end
		task.wait(TYPE_SPEED)
	end
	isTyping = false
	skipRequested = false
end

local function closeDialogue()
	if not dialogueOpen then return end
	dialogueOpen = false
	if currentPromt then
		currentPromt.Enabled = true
		currentPromt = nil
	end
	togglePlayerMovement(true)
	local targetPos = UDim2.new(0.5, 0, 1.1, 0)
	local tween = TweenService:Create(mainFrame, TWEEN_INFO, {Position = targetPos})
	tween:Play()
	tween.Completed:Wait()
	mainFrame.Visible = false
	currentNpcData = nil
end

local function displayNode(nodeId)
	if not currentNpcData then return end
	local nodeData = currentNpcData.Nodes[nodeId]
	if not nodeData then
		closeDialogue()
		return
	end
	for i, button in ipairs(optionBtn) do
		local choiceData = nodeData.Choices and nodeData.Choices[i]
		if buttonConnections[i] then
			buttonConnections[i]:Disconnect()
			buttonConnections[i] = nil
		end
		if choiceData then
			button.Text = choiceData.Text
			button.Visible = true
			local connection = button.MouseButton1Click:Connect(function()
				if isTyping then return end
				if choiceData.Next == "Exit" then
					closeDialogue()
				else
					displayNode(choiceData.Next)
				end
			end)
			buttonConnections[i] = connection
		else
			button.Visible = false
		end
	end
	typewriteText(nodeData.Text)
end

local function openDialog(npcName)
	local data = DialogData[npcName]
	if not data then
		return
	end
	togglePlayerMovement(false)
	local npcModel = workspace:FindFirstChild(npcName)
	if npcModel then
		local promt = npcModel:FindFirstChildWhichIsA("ProximityPrompt")
		if promt then
			currentPromt = promt
			promt.Enabled = false
		end
	end
	currentNpcData = data
	dialogueOpen = true
	mainFrame.Visible = true
	nameLabel.Text = npcName
	portraitImage.Image = data.PortraitId
	local targetPos = UDim2.new(0.5, 0, 0.95, 0)
	mainFrame.Position = UDim2.new(0.5, 0, 1.1, 0)
	TweenService:Create(mainFrame, TWEEN_INFO, {Position = targetPos}):Play()
	displayNode(data.StartNode)
end

StartDialogEvent.OnClientEvent:Connect(openDialog)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if isTyping and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		skipRequested = true
	end
end)