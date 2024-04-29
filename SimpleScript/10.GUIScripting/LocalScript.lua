--[[
put this in StarterGui.ScreenGui

Fun Fact ->
---
1. You cant use 'game.StarterGui' because thing in Gui will moved to playerwhen game started

]]

local ScreenGui = script.Parent
local TextButton = ScreenGui.TextButton
local Frame = ScreenGui.Frame

local Player = game.Players.LocalPlayer

-- values you can assigned in GUI object
ScreenGui.IgnoreGuiInset = true

TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton.Position = UDim2.new(0.05, 0, 0.5, 0)
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.BackgroundColor3 = Color3.fromRGB(75, 255, 159)
TextButton.Text = "open"
TextButton.ZIndex = 2

Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.ZIndex = 1
Frame.Visible = false

-- function you can do on GUI object
-- for example this is open & close frame function
TextButton.MouseButton1Click:Connect(function()
	if Frame.Visible then
		Frame.Visible = false
		TextButton.Text = "open"
	else
		Frame.Visible = true
		TextButton.Text = "close"
	end
end)
