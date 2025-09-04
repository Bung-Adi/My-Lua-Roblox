-- services
local Players = game:GetService("Players")
local StarterPack = game:GetService("StarterPack")
local RS = game:GetService("ReplicatedStorage")

-- modules
local Types = require(RS.Modules.Types)
local Janitor = require(RS.Modules.Janitor)
local Signal = require(RS.Modules.Signal)

-- constrants
local AUTOSAVE_TIME = 60 * 5

-- module
local InventoryServer = {}
InventoryServer.AllInventories = {}
InventoryServer.Janitors = {}

InventoryServer.MaxStackData = {
	Armor = 1,
	Special = 1,
	Weapon = 1,
	Consumable = 10,
	Resource = 30,
}
InventoryServer.MaxStacks = 6

-- start
function InventoryServer.Start()
	for i, player: Player in Players:GetPlayers() do
		task.spawn(InventoryServer.OnPlayerAdded, player)
	end -- player added
	Players.PlayerAdded:Connect(InventoryServer.OnPlayerAdded)
	Players.PlayerRemoving:Connect(InventoryServer.OnPlayerRemoving) -- player remove
	Signal.ListenRemote("InventoryServer:GetInventoryData", InventoryServer.GetInventoryData) -- Signal events
	game:BindToClose(function()
		for i, player: Player in Players:GetPlayers() do
			InventoryServer.SaveData(player)
		end
	end) -- game bind closed
	task.spawn(function()
		while true do
			task.wait()
			for i, player: Player in Players:GetPlayers() do
				task.wait(AUTOSAVE_TIME / #Players:GetPlayers())
				InventoryServer.SaveData(player)
			end
		end
	end) -- auto saving
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
		--print(char.Name.." Has Spawned")
		
		-- registering items
		for i, tool in pairs(player.Backpack:GetChildren()) do
			InventoryServer.RegisterItem(player, tool)
		end
		-- connecting event with items in player non backpack
		char.ChildAdded:Connect(function(child: Instance)
			InventoryServer.RegisterItem(player, child)
		end)
		char.ChildRemoved:Connect(function(child: Instance)
			InventoryServer.UnRegisterItem(player, child)
		end)
		player.Backpack.ChildAdded:Connect(function(child: Instance)
			InventoryServer.RegisterItem(player, child)
		end)
		player.Backpack.ChildRemoved:Connect(function(child: Instance)
			InventoryServer.UnRegisterItem(player, child)
		end)
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

-- Register Items
function InventoryServer.RegisterItem(player: Player, tool: Tool)
	--print("Registering Item")
	if tool.ClassName ~= "Tool" then return end 
	local inv: Types.Inventory = InventoryServer.AllInventories[player] -- get inventory
	-- checking if already in inventory
	for i, stackData: Types.StackData in inv.Inventory do
		if table.find(stackData.Items, tool) then
			return
		end
	end
	-- looping all stack
	local foundStack: Types.StackData = nil
	for i, stackData: Types.StackData in inv.Inventory do
		if stackData.Name == tool.Name and #stackData.Items < InventoryServer.MaxStackData[stackData.ItemType] then
			table.insert(stackData.Items, tool)
			foundStack = stackData
			break	
		end
	end
	-- if no stack found
	if not foundStack then
		if #inv.Inventory < InventoryServer.MaxStacks then
			-- create new stack
			local stack: Types.StackData = {
				Name = tool.Name;
				Description = tool.ToolTip;
				Image = tool.TextureId;
				ItemType = tool:GetAttribute("ItemType");
				IsDroppabe = tool:GetAttribute("IsDroppable");
				Items = {tool};
				StackId = inv.NextStackId
			}
			inv.NextStackId += 1
			table.insert(inv.Inventory, stack)
			-- Equiping to first open slot
			if stack.ItemType == "Armor" then
				-- TODO: Set Up armor equipping
				warn("Armor Equipping not setup yet")
			else
				for slotNum: number = 1, 10 do
					if inv.Hotbar["Slot"..slotNum] == nil then
						InventoryServer.EquipToHotbar(player, slotNum, stack.StackId)
						break
					end
				end
			end
		else
			warn("Inventory is full")
		end
	end
	--print("register new item : ",inv) -- test
	Signal.FireClient(player, "InventoryClient:Update", inv) -- update client. added last
end
-- unRegister  Items
function InventoryServer.UnRegisterItem(player: Player, tool: Tool)
	--print("Unregistering Item")
	if tool.ClassName ~= "Tool" then return end
	if tool.Parent == player.Backpack or (player.Character ~= nil and tool.Parent == player.Character) then return end
	-- geting inventory
	local inv: Types.Inventory = InventoryServer.AllInventories[player]
	-- looping all stack
	for i, stackData: Types.StackData in inv.Inventory do
		local found: number = table.find(stackData.Items, tool)
		if found then
			table.remove(stackData.Items, found)
			if #stackData.Items == 0 then
				local stackFound: number = table.find(inv.Inventory, stackData)
				if stackFound then
					table.remove(inv.Inventory, stackFound)
					InventoryServer.UnequipFromHotbar(player, stackData.StackId)
					-- TODO: unequip armor
				end
			end
			break
		end
	end
	--print("unregister item : ",inv) -- test
	Signal.FireClient(player, "InventoryClient:Update", inv) -- update client. added last
end

-- equipping item to hotbar
function InventoryServer.EquipToHotbar(player: Player, equipTo: number, stackId: number)
	local inv: Types.Inventory = InventoryServer.AllInventories[player] -- get inventory data
	InventoryServer.UnequipFromHotbar(player, stackId) -- remove if exist already
	-- validate stack
	local isValid: boolean = false
	for i, stackData: Types.StackData in inv.Inventory do
		if stackData.StackId == stackId then
			if stackData.StackId == stackId and stackData.ItemType ~= "Armor" then
				isValid = true
			end
		end
	end
	if isValid == false then return end
	inv.Hotbar["Slot"..equipTo] = stackId -- equiping
	--print(inv) -- test
	Signal.FireClient(player, "InventoryClient:Update", inv) -- update client. added last
end
-- unequipping item from hotbar
function InventoryServer.UnequipFromHotbar(player: Player, stackId: number)
	local inv: Types.Inventory = InventoryServer.AllInventories[player] -- get inventory data
	for slotKey: string, equippedId: number in inv.Hotbar do
		if equippedId == stackId then
			inv.Hotbar[slotKey] = nil
			break
		end
	end -- remove existing
	--print(inv) -- test
	Signal.FireClient(player, "InventoryClient:Update", inv) -- update client. added last
end

-- Getting Inventory Data
function InventoryServer.GetInventoryData(player: Player)
	while not InventoryServer.AllInventories[player] do task.wait() end -- is there is inventory for player if not wait
	return InventoryServer.AllInventories[player]
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
