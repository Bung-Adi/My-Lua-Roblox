--[[
why you need function ? To simplify some repetitive code and more

function format in roblox ->
local function Function_Name(You_can_put_variable)
	-- fill it
end

to run the function ->
type_function_name()

example ->
]]

local function AddPart()
	local NewModel = Instance.new("Model",game.Workspace)
	NewModel.Name = "PartModel"
	local NewPart = Instance.new("Part",NewModel)
	NewPart.Anchored = true
	NewPart.Color = Color3.new(0.427451, 1, 0.25098)
	NewPart.Material = Enum.Material.Neon
	NewPart.Shape = Enum.PartType.Ball
end
AddPart()
