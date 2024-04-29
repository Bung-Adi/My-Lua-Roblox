--[[
Returning Function is a function resulting a value output from it's process with keyword return
]]

local Folder = game.Workspace.SimpleFolder

local function HasPart()
	if Folder:FindFirstChildWhichIsA("Part") then -- check is have object with classname part inside
		return true
	else
		return false
	end
end

if HasPart() then
	print("The Folder 'SimpleFolder' has Part as a children")
end


