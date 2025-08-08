--[[
this is a local script @ StarterGui.ScreenGui
you also need a 
RemoteFunction @ ReplicatedStorage named BuyRemote,
a script @ ServerScriptService named leaderstat,
a TextLabel named BuyPrompt,
a Button named BuyButton
]]
local BuyRemote = game.ReplicatedStorage.BuyRemote

local gui = script.Parent
local buyButton = gui.BuyButton
local prompt = gui.BuyPrompt

buyButton.MouseButton1Click:Connect(function()
	local purchaseSucces = BuyRemote:InvokeServer()
	
	if purchaseSucces then
		prompt.Text = "Purchase Succes"
		prompt.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	else
		prompt.Text = "Purchase Fail"
		prompt.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	end
end)