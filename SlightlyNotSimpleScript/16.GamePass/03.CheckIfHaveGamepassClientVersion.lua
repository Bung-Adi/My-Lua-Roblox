local MarketPlaceService = game:GetService("MarketplaceService")

local Player = game.Players.LocalPlayer
local PassId = 1574555729

wait(5)
local hasGamepass = MarketPlaceService:UserOwnsGamePassAsync(Player.UserId, PassId)
if hasGamepass then
	print(Player.Name.." has the gamepass!")
end