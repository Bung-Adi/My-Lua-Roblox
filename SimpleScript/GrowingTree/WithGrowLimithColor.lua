-- same like Script next to it. but with grow limit and color change.
local pohon = script.Parent
local batang = pohon.Batang
local pp = batang.ProximityPrompt
local daun = pohon.Daun

local tambah_tinggi = 2
local batas_tumbuh = 5
local klik = 1

pp.Triggered:Connect(function()
  if klik <= batas_tumbuh then
    batang.Size = batang.Size + Vector3.new(0.2,tambah_tinggi,0.2)
    daun.Position = daun.Position + Vector3.new(0,tambah_tinggi/2,0)
    daun.Size = daun.Size + Vector3.new(1,1,1)
    klik += 1
  else
    daun.BrickColor = BrickColor.new('Yellow')
  end
end)