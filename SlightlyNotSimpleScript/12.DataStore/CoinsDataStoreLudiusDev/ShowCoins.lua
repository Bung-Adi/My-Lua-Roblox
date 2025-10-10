local player = game:GetService('Players').LocalPlayer
local playerCoinsV = player:WaitForChild('PlayerCoins')

local coinsLabel = script.Parent

playerCoinsV.Changed:Connect(function()
	
	coinsLabel.Text = 'Coins: '..tostring(playerCoinsV.Value)
	
end)
