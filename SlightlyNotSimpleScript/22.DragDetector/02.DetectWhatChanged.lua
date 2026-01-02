local DG = script.Parent.DragDetector

DG:GetPropertyChangedSignal("DragFrame"):Connect(function()
	print(DG.DragFrame.Position)
end)

-- ref : https://create.roblox.com/docs/ui/3D-drag-detectors