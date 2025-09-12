-- unbine the E key will make the player can't use the E key.
local CAS = game:GetService("ContextActionService")

local function theE(Action, Input)
	if Action == "Press E" and Input == Enum.UserInputState.Begin then
		print("Player Press E")
	end
end

CAS:BindAction("Press E", theE, true, Enum.KeyCode.E)
CAS:UnbindAction("Press E")