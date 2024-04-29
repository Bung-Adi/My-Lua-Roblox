--[[
Parameter : Its like a variable but placeholder for the function to customize function
Argument : When you call a function with parameter. the value that you put into the function is called argument.
]]

local function AddBall(TheColor,TheMaterial)
	local NewModel = Instance.new("Model",game.Workspace)
	NewModel.Name = "PartModel"
	local NewPart = Instance.new("Part",NewModel)
	NewPart.Anchored = true
	NewPart.Position = Vector3.new(0,30,0)
	NewPart.Color = TheColor
	NewPart.Material = TheMaterial
	NewPart.Shape = Enum.PartType.Ball
end

AddBall(Color3.new(0.529412, 1, 0.584314),Enum.Material.Neon)