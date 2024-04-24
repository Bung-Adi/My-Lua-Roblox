local PartOne = game.Workspace.PartOne
local PartTwo = game.Workspace.PartTwo

if PartOne.Transparency == 0.5 then
	print("PartOne is half-transparent.")
elseif PartTwo.Transparency == 0.5 then
	print("PartTwo is half-transparent.")
else
	print("Neither PartOne nor PartTwo is half-transparent.")
end
