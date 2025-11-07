-- this is a local script
local MarketPlaceService = game:GetService("MarketplaceService")

local Player = game.Players.LocalPlayer
local PassId = 1574555729

wait(10)
MarketPlaceService:PromptGamePassPurchase(Player, PassId)