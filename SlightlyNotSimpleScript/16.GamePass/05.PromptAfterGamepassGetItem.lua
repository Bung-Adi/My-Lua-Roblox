--[[
the server script to prompt after player buy game pass.
and give the player the sword.
also need localscript for player buy gamepass.
]]

local MarketPlaceService = game:GetService("MarketplaceService")

local PassId = 1574555729
local HasGamepass = false

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(Player, Id, YesPurchased)
	if YesPurchased and Id == PassId then
		print(Player.Name.." has purchased the gamepass!")
		local LegendarySword = game.ServerStorage:FindFirstChild("LegendarySword")
		if LegendarySword then
			local Cloned = LegendarySword:Clone()
			Cloned.Parent = Player.Backpack
		end
	end
end)