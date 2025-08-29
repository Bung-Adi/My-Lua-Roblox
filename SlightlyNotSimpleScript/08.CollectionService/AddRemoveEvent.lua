local CollectionService = game:GetService("CollectionService")


task.wait(7)
CollectionService:GetInstanceAddedSignal("KillBrick"):Connect(function()
	print("KillBrick added to Collection !")
end)

CollectionService:GetInstanceRemovedSignal("KillBrick"):Connect(function()
	print("KillBrick removed from Collection !")
end)
