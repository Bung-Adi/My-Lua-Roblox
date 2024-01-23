local poh
on = script.Parent
local batang = pohon.Batang
local pp = batang.ProximityPrompt
local daun = pohon.Daun

local tambah_tinggi = 2

pp.Triggered:Connect(function()
  batang.Size = batang.Size + Vector3.new(0.2,tambah_tinggi,0.2)
  daun.Position = daun.Position + Vector3.new(0,tambah_tinggi/2,0)
  daun.Size = daun.Size + Vector3.new(1,1,1)
end)