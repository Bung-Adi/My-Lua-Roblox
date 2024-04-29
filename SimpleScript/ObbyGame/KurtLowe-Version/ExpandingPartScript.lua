local Part = script.Parent
-- the part size = 1, 5, 5

repeat
	-- larger the part
	for i = 1, 50, 1 do
		Part.Size = Vector3.new(1, 5 + i/10, 5 +i/10)
		wait(0.01)
	end
	wait(1)
	-- smaller the part
	for i = 1, 50, 1 do
		Part.Size = Vector3.new(1, 10 - i/10, 10 -i/10)
		wait(0.01)
	end
	wait(1)
until false