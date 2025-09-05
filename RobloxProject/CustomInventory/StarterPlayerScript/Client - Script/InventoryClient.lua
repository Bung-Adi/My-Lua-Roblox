-- Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local SG = game:GetService("StarterGui")
local TS = game:GetService("TweenService")

-- Modules
local Janitor = require(RS.Modules.Janitor)
local Signal = require(RS.Modules.Signal)
local Types = require(RS.Modules.Types)

-- Player Variables
local player  = Players.LocalPlayer
local playerGui = player.PlayerGui
-- GUI Variables
local gui = playerGui:WaitForChild("Inventory")
-- sub GUI Variables
local hotbarFrame = gui:WaitForChild("Hotbar")
local invFrame = gui:WaitForChild("Inventory"); invFrame.Visible = false
local invButton = gui:WaitForChild("Open")
local errorText = gui:WaitForChild("Error"); errorText.Visible = false
--sub sub GUI Variables
local tips = invFrame:WaitForChild("tips"); tips.Visible = false
-- Items Scroll Variables
local itemScrFrame = invFrame:WaitForChild("ItemsScroll")
local itemSample = itemScrFrame:WaitForChild("Sample"); itemSample.Visible = false
-- Item Info Variables
local itemInfoFrame = invFrame:WaitForChild("ItemInfo"); itemInfoFrame.Visible = false
local dropButton = itemInfoFrame:WaitForChild("Drop")
local equipButton = itemInfoFrame:WaitForChild("Equip")
local itemNameText = itemInfoFrame:WaitForChild("ItemName")
local itemDescText = itemInfoFrame:WaitForChild("ItemDesc");
-- Armor Variables
local armorFrame = invFrame:WaitForChild("Armor")
local armorIner = armorFrame:WaitForChild("Inner")
-- Hotbar
local hotbarSlots = {
	hotbarFrame.Slot1,
	hotbarFrame.Slot2,
	hotbarFrame.Slot3,
	hotbarFrame.Slot4,
	hotbarFrame.Slot5,
	hotbarFrame.Slot6,
	hotbarFrame.Slot7,
	hotbarFrame.Slot8,
	hotbarFrame.Slot9,
	hotbarFrame.Slot0,
}
local KeyToSlots = {
	[Enum.KeyCode.One] = hotbarFrame.Slot1;
	[Enum.KeyCode.Two] = hotbarFrame.Slot2;
	[Enum.KeyCode.Three] = hotbarFrame.Slot3;
	[Enum.KeyCode.Four] = hotbarFrame.Slot4;
	[Enum.KeyCode.Five] = hotbarFrame.Slot5;
	[Enum.KeyCode.Six] = hotbarFrame.Slot6;
	[Enum.KeyCode.Seven] = hotbarFrame.Slot7;
	[Enum.KeyCode.Eight] = hotbarFrame.Slot8;
	[Enum.KeyCode.Nine] = hotbarFrame.Slot9;
	[Enum.KeyCode.Zero] = hotbarFrame.Slot0;
}

-- Module
local InventoryClient = {}
InventoryClient.OpenPosition = invFrame.Position
InventoryClient.ClosePosition = invFrame.Position + UDim2.fromScale(0,1) -- if you want inventory open from left change 0 to 1
InventoryClient.OpenCloseDebouncer = false
InventoryClient.IsOpen = false

InventoryClient.InvData = nil
InventoryClient.SelectedStackId = nil
InventoryClient.UpdatingDebounceDisplay = false

InventoryClient.EquipInstrucT = tips.Text
InventoryClient.HeldSlotNum = nil

-- starting
function InventoryClient.Start()
	SG:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false) -- disable default inventory GUI
	InventoryClient.UpdateInventoryData() -- update list base on server data
	InventoryClient.UpdateDisplay() -- DISPLAY PLAYERS INVENTORY data
	InventoryClient.UpdateHeldItem()
	-- conncet signal
	Signal.ListenRemote("InventoryClient:Update", function(newInvData: Types.Inventory)
		InventoryClient.InvData = newInvData
		InventoryClient.UpdateDisplay()
		InventoryClient.UpdateHeldItem()
	end)
	
	UIS.InputBegan:Connect(InventoryClient.OnInputBegan) -- open close
	invButton.MouseButton1Click:Connect(function()
		InventoryClient.SetWindowOpen(not InventoryClient.IsOpen)
	end)
	equipButton.MouseButton1Click:Connect(InventoryClient.OnEquipButton) -- Equip
	dropButton.MouseButton1Click:Connect(InventoryClient.OnDropButton) -- drop
	-- connect slot btn
	for i, slotF: TextButton in hotbarSlots do
		slotF.MouseButton1Click:Connect(function()
			InventoryClient.ToggleHold(i)
		end)
	end
end

-- Input begin
function InventoryClient.OnInputBegan(input: InputObject, gameProcessingEvent: boolean)
	if gameProcessingEvent then return end
	if input.KeyCode == Enum.KeyCode.B then
		InventoryClient.SetWindowOpen(not InventoryClient.IsOpen)
	end
	-- hotbar button
	for key: Enum.KeyCode, slotF: TextButton in KeyToSlots do
		if input.KeyCode == key then
			InventoryClient.ToggleHold(table.find(hotbarSlots, slotF))
			break
		end
	end
end

-- open close
function InventoryClient.SetWindowOpen(toSet: boolean)
	if InventoryClient.OpenCloseDebouncer then return end
	InventoryClient.OpenCloseDebouncer = true
	if toSet == true then
		invFrame.Position = InventoryClient.ClosePosition
		invFrame.Visible = true
		invFrame:TweenPosition(InventoryClient.OpenPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5)
		task.wait(0.5)
		InventoryClient.IsOpen = true
	else
		invFrame:TweenPosition(InventoryClient.ClosePosition, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.5)
		task.wait(0.5)
		invFrame.Visible = false
		InventoryClient.IsOpen = false
	end
	InventoryClient.OpenCloseDebouncer = false
end

-- equip btn
function InventoryClient.OnEquipButton()
	local stackData = InventoryClient.FindStackDataFromId(InventoryClient.SelectedStackId) -- finding stack data
	if equipButton.Text == "Equip" and stackData ~= nil then
		-- instructions for equipping item
		local tempJanitor = Janitor.new()
		tips.Visible = true
		tempJanitor:GiveChore(function() tips.Visible = false end)
		equipButton.Text = "Select Slot"
		tempJanitor:GiveChore(function() equipButton.Text = "Equip" end)
		-- checking item type
		if stackData.ItemType == "Armor" then
			warn("Setup armor equip") -- TODO: Setup equip armor
		else
			-- var
			local chosenSlot: TextButton = nil
			local slotNum: number = nil
			-- keyboard input slot select
			tempJanitor:GiveChore(UIS.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
				if gameProcessedEvent then return end
				if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
				-- selecting slot
				for key: Enum.KeyCode, slotF: TextButton in KeyToSlots do
					if input.KeyCode == key then
						chosenSlot = slotF
						tempJanitor:Clean()
						return
					end
				end
				-- canceling
				tips.Text = "Not Valid Key"
				tempJanitor:GiveChore(function() tips.Text = InventoryClient.EquipInstrucT end)
				task.wait(2)
				tempJanitor.Clean()
			end))
			-- use button press
			for i, slotF: TextButton in hotbarSlots do
				tempJanitor:GiveChore(slotF.MouseButton1Click:Connect(function()
					chosenSlot = slotF
					slotNum = i
					tempJanitor:Clean()
				end))
			end
			-- waiting for selection
			while chosenSlot == nil do task.wait() end
			if slotNum == nil then
				slotNum = table.find(hotbarSlots, chosenSlot)
			end
			-- equiping
			Signal.FireServer("InventoryServer:EquipToHotbar", slotNum, stackData.StackId)
		end
	elseif equipButton.Text == "Unequip" and stackData ~= nil then
		if stackData.ItemType == "Armor" then
			warn("Setup armor equip") -- TODO: Setup equip armor
		else
			Signal.FireServer("InventoryServer:UnequipFromHotbar", InventoryClient.SelectedStackId)
		end
	end
end
-- drop btn
function InventoryClient.OnDropButton()
	print("Drop btn pressed")
end
-- seting equip unequip btn
function InventoryClient.SetEquipButton(toSet: boolean)
	if toSet == true then
		equipButton.Text = "Equip"
		equipButton.BackgroundColor3 = equipButton:GetAttribute("EquipColor")
	else
		equipButton.Text = "Unequip"
		equipButton.BackgroundColor3 = equipButton:GetAttribute("UnequipColor")
	end
end

-- togging held item
function InventoryClient.ToggleHold(slotNum: number)
	if slotNum == nil then return end
	if InventoryClient.HeldSlotNum == slotNum then
		Signal.FireServer("InventoryServer.UnholdItem")
	else
		Signal.FireServer("InventoryServer.HoldItem", slotNum)
	end
end
-- update held item
function InventoryClient.UpdateHeldItem()
	local char: Model = player.Character; if not char then return end
	local tool: Tool = char:FindFirstChildOfClass("Tool")
	if tool then
		-- finding slot num
		local slotNum: number = nil
		for i = 1, 10 do
			local stackId: number? = InventoryClient.InvData.Hotbar["Slot"..i]
			local stackData: Types.StackData? = InventoryClient.FindStackDataFromId(stackId)
			if stackData ~= nil and table.find(stackData.Items, tool) then
				slotNum = i
				break
			end
		end
		-- updating
		if slotNum ~= nil then
			InventoryClient.HeldSlotNum = slotNum
			local slotF: TextButton = hotbarSlots[slotNum]
			for i, otherSlotF: TextButton in hotbarSlots do
				if otherSlotF == slotF then
					otherSlotF.BackgroundColor3 = otherSlotF:GetAttribute("SelectedColor")
				else
					otherSlotF.BackgroundColor3 = otherSlotF:GetAttribute("NormalColor")
				end
			end
		else
			InventoryClient.HeldSlotNum = nil
			Signal.FireServer("InventoryServer.UnholdItem")
		end
	else
		-- set all slot back to normal
		for i, slotF: TextButton in hotbarSlots do
			slotF.BackgroundColor3 = slotF:GetAttribute("NormalColor")
		end
		InventoryClient.HeldSlotNum = nil
	end
end

-- Checking if an item currently equiped
function InventoryClient.CheckItemEquiped(stackData: Types.StackData): boolean
	if stackData.ItemType == "Armor" then
		for armorType: string, stackId: number in InventoryClient.InvData.Armor do
			if stackId == stackData.StackId then
				return true
			end
		end
		return false
	else
		for slotKey: string, stackId: number in InventoryClient.InvData.Hotbar do
			if stackId == stackData.StackId then
				return true
			end
		end
		return false
	end
end

-- update inventory data from server
function InventoryClient.UpdateInventoryData()
	InventoryClient.InvData = Signal.InvokeServer("InventoryServer:GetInventoryData")
end

-- updating display
function InventoryClient.UpdateDisplay()
	while InventoryClient.UpdatingDebounceDisplay do task.wait() end
	InventoryClient.UpdatingDebounceDisplay = true
	for i, itemF: Frame in itemScrFrame:GetChildren() do
		if itemF.ClassName == "TextButton" and itemF ~= itemSample then
			itemF:Destroy()
		end
	end -- clear items
	local inv: Types.Inventory = InventoryClient.InvData
	for i, stackData: Types.StackData in inv.Inventory do
		local itemF = itemSample:Clone()
		itemF.Name = "Stack-"..stackData.StackId
		itemF.Image.Image = stackData.Image
		itemF.ItemCount.Text = #stackData.Items.."X"
		itemF.Equipped.Visible = InventoryClient.CheckItemEquiped(stackData)
		itemF.Parent = itemSample.Parent
		itemF.Visible = true
		
		if #stackData.Items == 1 then
			itemF.ItemCount.Visible = false
		end
		
		itemF.MouseButton1Click:Connect(function()
			if InventoryClient.SelectedStackId == stackData.StackId then
				InventoryClient.SelectItem(nil)
			else
				InventoryClient.SelectItem(stackData)
			end
		end) -- selecting item
	end -- create item frame list
	
	for slotNum = 1, 10 do
		local slotF: TextButton = hotbarSlots[slotNum] -- geting slot frame
		local stackId: number? = InventoryClient.InvData.Hotbar["Slot"..slotNum] -- geting slot id
		if stackId == nil then
			slotF.ItemCount.Visible = false
			slotF.Image.Image = ""
		else
			local foundStack: Types.StackData = InventoryClient.FindStackDataFromId(stackId) -- finding stack data
			if foundStack ~= nil then
				slotF.ItemCount.Text = #foundStack.Items.."X"
				slotF.Image.Image = foundStack.Image
				if #foundStack.Items == 1 then
					slotF.ItemCount.Visible = false
				else
					slotF.ItemCount.Visible = true
				end
			else
				slotF.ItemCount.Visible = false
				slotF.Image.Image = ""
			end -- updating information
		end -- updating display of hotbar slot
	end -- updating hotbar
	local selectedStack: Types.StackData = InventoryClient.FindStackDataFromId(InventoryClient.SelectedStackId)
	InventoryClient.SelectItem(selectedStack) -- reselecting item
	InventoryClient.UpdatingDebounceDisplay = false
end

-- selecing item
function InventoryClient.SelectItem(stackData: Types.StackData)
	InventoryClient.SelectedStackId = if stackData ~= nil then stackData.StackId else nil -- selecting item
	local itemF: TextButton? = if stackData ~= nil then itemScrFrame:FindFirstChild("Stack-"..stackData.StackId) else nil -- finding item frame
	for i, otherItemF: TextButton in itemScrFrame:GetChildren() do
		if otherItemF.ClassName == "TextButton" and otherItemF ~= itemSample then
			if otherItemF == itemF then
				otherItemF.BackgroundColor3 = otherItemF:GetAttribute("SelectedColor")
			else
				otherItemF.BackgroundColor3 = otherItemF:GetAttribute("NormalColor")
			end
		end
	end -- seting frame colors
	if stackData ~= nil then
		itemInfoFrame.Visible = true
		itemNameText.Text = stackData.Name
		itemDescText.Text = stackData.Description
		local isEquiped = InventoryClient.CheckItemEquiped(stackData)
		InventoryClient.SetEquipButton(not isEquiped)
	else
		itemInfoFrame.Visible = false
		InventoryClient.SetEquipButton(true)
	end -- updating information
end

-- finding stack data from id
function InventoryClient.FindStackDataFromId(stackId: number): Types.StackData?
	if stackId == nil then return end
	for i, stackData: Types.StackData in InventoryClient.InvData.Inventory do
		if stackData.StackId == stackId then
			return stackData
		end
	end
end

return InventoryClient