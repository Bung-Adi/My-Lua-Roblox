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
	CAS:SetTitle("Press E", "E")
	CAS:SetPosition("Press E", UDim2.new(-1, 0, -1, 0))
	
	local btn = CAS:GetButton("Press E")
	if btn then
		btn.ImageColor3 = Color3.fromRGB(0, 255, 17)
		btn.ImageTransparency = 0.5
	end
end)

Tool.Unequipped:Connect(function()
	CAS:UnbindAction("Press E")
end)


