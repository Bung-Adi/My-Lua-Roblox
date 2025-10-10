local increasePart = workspace:WaitForChild('Increase')
local decreasePart = workspace:WaitForChild('Decrease')

local players = game:GetService('Players')

local dataStoreService = game:GetService('DataStoreService')
local playerCoinsDataStore = dataStoreService:GetDataStore('PlayerCoins')

players.PlayerAdded:Connect(function(plr)
	
	local playerCoins = Instance.new('NumberValue')
	playerCoins.Name = 'PlayerCoins'
	playerCoins.Parent = plr
	
	wait(1)
	
	playerCoins.Value = 0
	
	local coinsData = playerCoinsDataStore:GetAsync(plr.UserId)
	
	if coinsData then
		
		print('Player has data')
		
		playerCoins.Value = coinsData
		
		else
		
		print('Player has no coins data')
		
		playerCoinsDataStore:SetAsync(plr.UserId, 0)
		
		print('Player coins data created for the player')
		
	end
	
end)

players.PlayerRemoving:Connect(function(plr)
	
	local playerCoins = plr:WaitForChild('PlayerCoins')
	
	playerCoinsDataStore:SetAsync(plr.UserId, playerCoins.Value)
	
	print('Data saved')
	
end)