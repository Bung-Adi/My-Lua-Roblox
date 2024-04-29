--[[
---
See more at Roblox Doc
-> https://create.roblox.com/docs/luau/functions#function-techniques
---
There are some basic build in function - >
]]

local Part = game.Workspace.FuncPart

Part:Clone() -- Clone object
Part:Destroy() -- Destroy object
Part:FindFirstChild("Fire") -- Attempt to find a child with a given name
Part:WaitForChild("Fire") -- Same as above but it's waiting until those child exist


Part:GetChildren() -- Get all children of an object
Part:GetDescendants() -- Get all descendants of an object
Part:GetFullName() -- Get full name of an object
Part:GetAttribute("Name") -- Get attribute of an object
Part:SetAttribute("Name", "NewName") -- Set attribute of an object
Part:GetAttributes() -- Get all attributes of an object
Part:SetAttributes({ -- Set all attributes of an object
	Name = "NewName",
	Age = 10,
})
Part:GetAttributeChangedSignal("Name") -- Get signal of attribute changed
Part:GetPropertyChangedSignal("Name") -- Get signal of property changed


wait(10)
Part.Parent = nil -- Remove object from parent

