local Part = script.Parent

local StartPos = Vector3.new(-9.5, 9, -226.5)
local EndPos = Vector3.new(-9.5, 9, -260.5)
-- 34stud diferent

repeat
	for i = 1, 340, 1 do
		Part.Position = StartPos - Vector3.new(0,0,i/10) --Move 0,1 stud once loop so it moves 1 stud
		wait(0.02)
	end
	wait(1)
	for i = 1, 340, 1 do
		Part.Position = EndPos + Vector3.new(0,0,i/10) --Move 0,1 stud once loop so it moves 1 stud
		wait(0.02)
	end
until false
