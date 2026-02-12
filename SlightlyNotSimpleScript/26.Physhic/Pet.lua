local RunS = game:GetService("RunService")

local pet = script.Parent
local AlignP = pet.AlignPosition
local AlignO = pet.AlignOrientation

local char = game.Workspace:WaitForChild("Kuro13r")
local hrp = char.HumanoidRootPart

RunS.Stepped:Connect(function()
	AlignP.Position = hrp.Position + (hrp.CFrame.LookVector * -3) + (hrp.CFrame.RightVector * 3)
	AlignO.CFrame = hrp.CFrame
end)

