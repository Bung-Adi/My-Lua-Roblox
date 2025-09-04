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

-- Module
local InventoryClient = {}
InventoryClient.OpenPosition = invFrame.Position
InventoryClient.ClosePosition = invFrame.Position + UDim2.fromScale(0,1) -- if you want inventory open from left change 0 to 1
InventoryClient.OpenCloseDebouncer = false
InventoryClient.IsOpen = false

InventoryClient.InvData = nil
InventoryClient.UpdatingDebounceDisplay = false

-- starting
function InventoryClient.Start()
	SG:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false) -- disable default inventory GUI
	InventoryClient.UpdateInventoryData() -- update list base on server data
	InventoryClient.UpdateDisplay() -- DISPLAY PLAYERS INVENTORY data
	Signal.ListenRemote("InventoryClient:Update", function(newInvData: Types.Inventory)
		InventoryClient.InvData = newInvData
		InventoryClient.UpdateDisplay()
	end) -- conncet signal
	UIS.InputBegan:Connect(InventoryClient.OnInputBegan) -- open close
	invButton.MouseButton1Click:Connect(function()
		InventoryClient.SetWindowOpen(not InventoryClient.IsOpen)
	end)
	equipButton.MouseButton1Click:Connect(InventoryClient.OnEquipButton) -- Equip
	dropButton.MouseButton1Click:Connect(InventoryClient.OnDropButton) -- drop
end

-- Input begin
function InventoryClient.OnInputBegan(input: InputObject, gameProcessingEvent: boolean)
	if gameProcessingEvent then return end
	if input.KeyCode == Enum.KeyCode.B then
		InventoryClient.SetWindowOpen(not InventoryClient.IsOpen)
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

function InventoryClient.OnEquipButton()
	print("Equip btn pressed")
end

function InventoryClient.OnDropButton()
	print("Drop btn pressed")
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
		itemF.Parent = itemSample.Parent
		itemF.Visible = true
		
		if #stackData.Items == 1 then
			itemF.ItemCount.Visible = false
		end
	end
	InventoryClient.UpdatingDebounceDisplay = false
end

return InventoryClient