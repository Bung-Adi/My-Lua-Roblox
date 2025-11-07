--[[
the server script version of check if player have gamepass
]]

local MarketPlaceService = game:GetService("MarketplaceService")

local PassId = 1574555729

game.Players.PlayerAdded:Connect(function(Player)
	local hasGamepass = MarketPlaceService:UserOwnsGamePassAsync(Player.UserId, PassId)
	if hasGamepass then
		print(Player.Name.." has the gamepass!")
	end
end)
