-- formula -> Reference_Object.Property_Name = Data_Type_Value
game.Workspace["My Part"].Transparency = 0.5 -- integer
script.Parent["My Part"].Anchored = true -- boolean
game.Workspace["My Part"].Name = "My Part" -- string
game.Workspace["My Part"].Parent = game.Workspace -- object

-- Function Based data types
game.Workspace["My Part"].BrickColor = BrickColor.new("Bright red") -- BrickColor
game.Workspace["My Part"].Color = Color3.new(1, 0, 0) -- BrickColor
game.Workspace["My Part"].Material = Enum.Material.Concrete -- Enum
game.Workspace["My Part"].Position = Vector3.new(47, 1, -26) -- Vector3
game.Workspace["My Part"].Size = Vector3.new(2, 2, 2) -- Vector3
game.Workspace["My Part"].CFrame = CFrame.new(47, 1, -26) -- CFrame
game.Workspace["My Part"].Orientation = Vector3.new(0, 0, 0) -- Vector3
game.Workspace["My Part"].Velocity = Vector3.new(0, 0, 0) -- Vector3
game.Workspace["My Part"].AssemblyLinearVelocity = Vector3.new(0, 0, 0) -- Vector3

-- plus you actually can use math operation
game.Workspace["My Part"].Position = game.Workspace["My Part"].Position + Vector3.new(0, 1, 0)