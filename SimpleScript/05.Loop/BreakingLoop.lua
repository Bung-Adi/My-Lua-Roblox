local Part = script.Parent
local Decal = Part.Decal

if Decal.Face == Enum.NormalId.Top then
	for i=1,100,1 do
		Decal.Transparency = Decal.Transparency + 0.01
		wait(0.1)
		if Decal.Face ~= Enum.NormalId.Top then
			break
		end
	end
end
