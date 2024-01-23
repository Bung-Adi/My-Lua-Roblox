-- put this inside server script service
-- LoopingPart here is the name of the block we gona turn into RGB disco color
local LoopingPart = game.Workspace.LoopingPart
while true do
  LoopingPart.BrickColor = BrickColor.new(0.7,0.9,0.9)
  wait(3)
  LoopingPart.BrickColor = BrickColor.new(0.9,0.7,0.9)
  wait(3)
  LoopingPart.BrickColor = BrickColor.new(0.9,0.9,0.7)
  wait(3)
end