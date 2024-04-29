--[[
to reference things in your game so you can controll them via scripting
- 1 you need to treet the Explorer as a familly three for all object in your game
- 2 dot(.) representing member of in explorer and moduls
- 3 square brackets [] representing indexing in explorer and tables
- 4 you can also use the : (colan) to call a method of a object
- 5 you can also use the :: (double colan) to call a static method of a object
- 6 you can also use the . (dot) to call a static method of a module
- 7 you can also use the : (colan) to call a constructor of a module
- 8 you can also use the :: (double colan) to call a static constructor of a module
- 9 you can also use the . (dot) to call a constructor of a module
- 10 the first u need to type is usually 'script.parent' (representing things arrown the script you right now)
- 11 or 'game' representing the root game
example =>
]]
-- game.Workspace.House
-- script.Parent.House
-- game.Workspace["My Part"] -- for an object with space in its name you need a full stop like thiss

