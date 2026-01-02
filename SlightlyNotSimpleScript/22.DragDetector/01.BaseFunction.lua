local DG = script.Parent.DragDetector

DG.DragStart:Connect(function(plr)
	print("A Block Dragged by "..plr.Name)
end)

DG.DragContinue:Connect(function(plr)
	print(plr.Name.."Still Draging A Block")
end)

DG.DragEnd:Connect(function(plr)
	print(plr.Name.."Stopped Dragging A Block")
end)
