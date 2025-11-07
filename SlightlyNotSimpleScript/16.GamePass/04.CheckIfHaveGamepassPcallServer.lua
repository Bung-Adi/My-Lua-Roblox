--[[
the server script version of check if player have gamepass
]]

local MarketPlaceService = game:GetService("MarketplaceService")

local PassId = 1574555729
local HasGamepass = false

game.Players.PlayerAdded:Connect(function(Player)
	local success, error = pcall(function()
		HasGamepass = MarketPlaceService:UserOwnsGamePassAsync(Player.UserId, PassId)
	end)
	if not success then
		error(error())
		return
	end
	
	if HasGamepass then
		print(Player.Name.." has the gamepass!")
	end
end)
