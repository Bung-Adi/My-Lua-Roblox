local MarketPlaceService = game:GetService("MarketplaceService")

local PassId = 1574555729
local HasGamepass = false

local function giveSword(Player)
	local LegendarySword = game.ServerStorage:FindFirstChild("LegendarySword")
	if LegendarySword then
		local Cloned = LegendarySword:Clone()
		Cloned.Parent = Player.Backpack
		if not Player.StarterGear:FindFirstChild(LegendarySword.Name) then
			local Cloned2 = LegendarySword:Clone()
			Cloned2.Parent = Player.StarterGear
		end
	end
end

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
		giveSword(Player)
	end
end)

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(Player, Id, YesPurchased)
	if YesPurchased and Id == PassId then
		print(Player.Name.." has purchased the gamepass!")
		giveSword(Player)
	end
end)