-- put it inside a tool
-- try un comment SetTitle, SetImage, SetPosition and use touchscreen
local CAS = game:GetService("ContextActionService")
local Tool = script.Parent

local function theE(Action, Input)
	if Action == "Press E" and Input == Enum.UserInputState.Begin then
		print("Player Press E")
	end
end

Tool.Equipped:Connect(function()
	CAS:BindActionAtPriority("Press E", theE, true, 1, Enum.KeyCode.E)
	--CAS:SetTitle("Press E", "Eak")
	--CAS:SetImage("Press E", "rbxassetid://9112078981")
	--CAS:SetPosition("Press E", UDim2.new(0.5, 0, 0.5, 0))
end)

Tool.Unequipped:Connect(function()
	CAS:UnbindAction("Press E")
end)

