-- very simple example but why ? why not use UserInputService instead ? find out at the end of leasson
local CAS = game:GetService("ContextActionService")

local function theE(Action, Input)
	if Action == "Press E" and Input == Enum.UserInputState.Begin then
		print("Player Press E")
	end
end

CAS:BindAction("Press E", theE, true, Enum.KeyCode.E)