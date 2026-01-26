-- ServerScriptService
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StartDialogEvent = ReplicatedStorage:WaitForChild("StartDialogEvent")

local function setupProxyPromt()
	for _, descendant in pairs(workspace:GetDescendants()) do
		if descendant:isA "ProximityPrompt" then
			local npcModel = descendant.Parent
			if npcModel:isA "Model" and npcModel:FindFirstChild("Humanoid") then
				descendant.Triggered:Connect(function(player)
					StartDialogEvent:FireClient(player, npcModel.Name)
				end)
			end
		end
	end
end

setupProxyPromt()