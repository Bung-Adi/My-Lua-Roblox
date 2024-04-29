--[[
Put it inside StarterPlayer.StarterPlayerScripts 
---
LocalScript makes sure every player has their own unique experience in the game!
That's means local script effect player but might be not all player
---
The things in StarterPlayer.StarterPlayerScripts will be copied into player when game runing
]]

local Player = game.Players.LocalPlayer -- Player Entitie where this script contained
wait(3)
local Character = Player.Character -- Player humanoid form

Character.Head.Material = Enum.Material.ForceField -- ForceField will make character head transparant