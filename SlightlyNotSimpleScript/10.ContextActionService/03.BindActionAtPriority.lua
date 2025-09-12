-- put it inside a tool
-- T_T you can make certain action more prioritize than others with BindActionAtPriority
local CAS = game:GetService("ContextActionService")
local Tool = script.Parent

local function theE(Action, Input)
	if Action == "Press E" and Input == Enum.UserInputState.Begin then
		print("Player Press E")
	end
	if Action == "Press another E" and Input == Enum.UserInputState.Begin then
		print("Player Press another E")
	end
end

Tool.Equipped:Connect(function()
	CAS:BindActionAtPriority("Press E", theE, true, 0, Enum.KeyCode.E)
	CAS:BindActionAtPriority("Press another E", theE, true, 1, Enum.KeyCode.E)
end)

Tool.Unequipped:Connect(function()
	CAS:UnbindAction("Press E")
	CAS:UnbindAction("Press another E")
end)
