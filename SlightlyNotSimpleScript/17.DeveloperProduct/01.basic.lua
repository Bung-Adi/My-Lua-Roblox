-- put at starterplayer > starterplayerscripts
local MPS = game:GetService("MarketplaceService")
local Players = game.Players.LocalPlayer
local productId = 00000 -- replace with your product id btw its just donate

task.wait(10)
MPS:PromptProductPurchase(Players,productId)