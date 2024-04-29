-- this loop will delete all children in a Folder named Folder
-- basicaly for i, v is cycle whats argument you put into pairs()
for i, v in pairs(game.Workspace.Folder:GetChildren()) do
	v.Color = Color3.new(1,0,0)
	wait(0.5)
	v:Destroy()
end
