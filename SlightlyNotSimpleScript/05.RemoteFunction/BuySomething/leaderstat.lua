--[[
leaderstat

put its inside ServerScriptService
also you need to put ...
]]
-- 
game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder",Player)
	Leaderstats.Name = "leaderstats"

	local Coins = Instance.new("IntValue",Leaderstats)
	Coins.Name = "Coins"
	Coins.Value = 50
end)


local BuyRemote = game.ReplicatedStorage.BuyRemote

BuyRemote.OnServerInvoke = function(player)
	local purschaseSucces = false
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins
	
	if coins.Value >= 50 then
		coins.Value -= 50
		purschaseSucces = true
	end
	
	return purschaseSucces
end
