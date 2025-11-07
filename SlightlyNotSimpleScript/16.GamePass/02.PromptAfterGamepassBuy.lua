--[[
place it in server script service.
its to prompt player after they buy gamepass
]]
local MarketPlaceService = game:GetService("MarketplaceService")

local PassId = 1574555729

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(Player, Id, YesPurchased)
	if YesPurchased and Id == PassId then
		print(Player.Name.." has purchased the gamepass!")
	end
end)
