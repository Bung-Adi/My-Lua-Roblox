--put it inside the Treasure Box Model. this is click to add points implementation
local treasure = script.Parent
local onclick = script.Parent.ClickDetector

onclick.MouseClick:Connect(function(player)
  treasure:Destroy()
  local treasures = player:FindFirstChild("leaderstats"):FindFirstChild("treasures")
  treasures.Value = treasures.Value + 1
end)