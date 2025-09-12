-- put it inside a tool
-- remember it's just begining example
local CAS = game:GetService("ContextActionService")
local Tool = script.Parent

local function theE(Action, Input)
	if Action == "Press E" and Input == Enum.UserInputState.Begin then
		print("Player Press E")
	end
end

Tool.Equipped:Connect(function()
	CAS:BindAction("Press E", theE, true, Enum.KeyCode.E)
end)

Tool.Unequipped:Connect(function()
	CAS:UnbindAction("Press E")
end)

