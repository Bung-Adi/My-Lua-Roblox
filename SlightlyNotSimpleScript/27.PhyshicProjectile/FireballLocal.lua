local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local firebal = game.ReplicatedStorage.Fireball

script.Parent.Activated:Connect(function()
	local mousePos = mouse.Hit.Position
	firebal:FireServer(mousePos)
end)
