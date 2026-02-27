-- this is server script service
local RunS = game:GetService("RunService")
local OriginPart = game.Workspace.RayCasting.OriginPart
local Direction = Vector3.new(0,0,100)

RunS.Heartbeat:Connect(function()
	local Raycast = workspace:Raycast(OriginPart.Position,Direction)
	if Raycast then
		print(Raycast.Instance.Name)
	else
		print("Nothing")
	end
end)

