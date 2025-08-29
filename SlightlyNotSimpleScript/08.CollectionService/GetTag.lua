local CollectionService = game:GetService("CollectionService")

local PartTag = CollectionService:GetTags(game.Workspace.Ball)
for i,tag in pairs(PartTag) do
	print(tag) -- print the tag
end

print("----------")

local AllTag = CollectionService:GetAllTags()
for i,tag in pairs(AllTag) do
	print(tag) -- print all the tag in this project
end