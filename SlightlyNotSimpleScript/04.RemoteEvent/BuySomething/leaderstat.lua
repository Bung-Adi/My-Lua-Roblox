--[[
leaderstat

put its inside ServerScriptService
also you need to put RemoteEvent named 
GreatPlayer,
GiveCurency,
GiveAnnouncement,
inside ReplicatedStorage
]]
-- 
local greetPlayer = game.ReplicatedStorage.GreatPlayer
local giveAnnouncement = game.ReplicatedStorage.GiveAnnouncement

game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder",Player)
	Leaderstats.Name = "leaderstats"

	local Coins = Instance.new("IntValue",Leaderstats)
	Coins.Name = "Coins"
	Coins.Value = 50
	
	greetPlayer:FireClient(Player,"Hello welcome "..Player.Name)
end)

local giveCurrency = game.ReplicatedStorage.GiveCurency

giveCurrency.OnServerEvent:Connect(function(player,coinAmmount)
	local leaderstat = player.leaderstats
	local coin = leaderstat.Coins
	
	coin.Value += coinAmmount
end)

task.wait(20)
giveAnnouncement:FireAllClients()
