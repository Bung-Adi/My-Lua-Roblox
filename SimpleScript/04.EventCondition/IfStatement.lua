local PartOne = game.Workspace.PartOne
local PartTwo = game.Workspace.PartTwo

-- in a condition if we use double equal (==) because we asking not changing
if PartOne.BrickColor == BrickColor.new("Really red") then
	---- the code bellow will run if the statement above are true
	PartTwo.BrickColor = BrickColor.new("Really red")
end

-- ususally if statement followed with 'or' & 'and' statement
if PartOne.BrickColor == BrickColor.new("Really red") or PartTwo.BrickColor == BrickColor.new("Really red") then
	print("One of brick are red")
end

-- and also equal '=' and not equal '~=' symbol. and other like (>,<,>=,=>)
if PartOne.BrickColor ~= BrickColor.new("Really red") then
	print("PartOne aren't red")
end
