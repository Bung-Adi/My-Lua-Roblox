-- put it inside server script service
--[[
To add object like part,model, folder, etc 
formula -> Instance.new(Class_Name,Object_Parent)
one importan things please asign the position so it's not falling of outof map
]]

local NewPart = Instance.new("Part",game.Workspace)

NewPart.Anchored = true
NewPart.Position = Vector3.new(0,20,0)
NewPart.Material = Enum.Material.Neon
NewPart.BrickColor = BrickColor.new("Gold")

wait(3)

local Megumin = Instance.new('Explosion',NewPart)
Megumin.Position = NewPart.Position