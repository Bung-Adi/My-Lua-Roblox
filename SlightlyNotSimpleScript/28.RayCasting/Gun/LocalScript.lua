local tool = script.Parent
local tip = tool:WaitForChild("Handle"):WaitForChild("Tip")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local firegun = tool:WaitForChild("FireGun")

tool.Activated:Connect(function()
	firegun:FireServer(tip.Position, mouse.Hit.Position)
end)