-- services
local Players = game:GetService("Players")
local StarterPack = game:GetService("StarterPack")
local RS = game:GetService("ReplicatedStorage")

-- modules
local Types = require(RS.Modules.Types)
local Janitor = require(RS.Modules.Janitor)

-- constrants
local AUTOSAVE_TIME = 60 * 5

-- module
local InventoryServer = {}
InventoryServer.AllInventories = {}
InventoryServer.Janitors = {}

-- start
function InventoryServer.Start()
	
	-- player added
	for i, player: Player in Players:GetPlayers() do
		task.spawn(InventoryServer.OnPlayerAdded, player)
	end
	Players.PlayerAdded:Connect(InventoryServer.OnPlayerAdded)
	
	-- player remove
	Players.PlayerRemoving:Connect(InventoryServer.OnPlayerRemoving)
	
	-- game bind closed
	game:BindToClose(function()
		for i, player: Player in Players:GetPlayers() do
			InventoryServer.SaveData(player)
		end
	end)
	
	-- auto saving
	task.spawn(function()
		while true do
			task.wait()
			for i, player: Player in Players:GetPlayers() do
				task.wait(AUTOSAVE_TIME / #Players:GetPlayers())
				InventoryServer.SaveData(player)
			end
		end
	end)
end

-- player added
function InventoryServer.OnPlayerAdded(player: Player)
	--print(player.Name .. " Joined Game")
	
	-- waiting starter pack
	for i, tool in StarterPack:GetChildren() do
		while not player.Backpack:FindFirstChild(tool.Name) do
			task.wait()
			--tool:Clone().Parent = player.Backpack
		end
	end
	
	-- creating janitor
	local janitor = Janitor.new()
	InventoryServer.Janitors[player] = janitor
	janitor:GiveChore(function()
		InventoryServer.Janitors[player] = nil
	end)
	
	-- creating inventory
	local inv: Types.Inventory = {
		Inventory = {};
		Hotbar = {};
		Armor = {};
		NextStackId = 0;
	}
	InventoryServer.AllInventories[player] = inv
	--print(inv)
	janitor:GiveChore(function() InventoryServer.AllInventories[player] = nil end)
	
	-- waiting for character to load in the first time
	if not player.Character then player.CharacterAdded:Wait()  end
	InventoryServer.LoadData(player)
	
	-- character added
	local function charAdded(char: Model)
		print(char.Name.." Has Spawned")
	end
	
	-- connecting character added
	task.spawn(charAdded, player.Character)
	janitor:GiveChore(player.CharacterAdded:Connect(charAdded))
end

-- player removing
function InventoryServer.OnPlayerRemoving(player: Player)
	--print(player.Name .. " left Game")
	
	-- clearing extra data & save data
	InventoryServer.SaveData(player)
	InventoryServer.Janitors[player]:Destroy()
end

-- save data
function InventoryServer.SaveData(player)
	warn("not implemented saving yet")
end

-- loading data
function InventoryServer.LoadData(player)
	warn("not implemented loading yet")
end

-- return
return InventoryServer
