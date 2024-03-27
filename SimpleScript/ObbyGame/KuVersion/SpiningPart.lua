-- put it inside a part will make the part spin
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild('Humanoid') then
		hit.Parent:BreakJoints()
	end
end)


local speed = 0.06

while true do
	script.Parent.CFrame = script.Parent.CFrame * CFrame.new(0,0,0)*CFrame.fromEulerAnglesXYZ(0,""..speed.."",0)
	wait()
end