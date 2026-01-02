local DG = script.Parent.DragDetector

DG:GetPropertyChangedSignal("DragFrame"):Connect(function()
	print(DG.DragFrame.Position)
end)
