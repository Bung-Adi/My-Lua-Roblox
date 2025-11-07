-- with datastore to store purchase history
local MarketPlaceService = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")

local PassId = 1574555729
local HasGamepass = false

local PurchaseHistory = DataStoreService:GetDataStore("PurchaseHistory")

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
	
	local data = PurchaseHistory:GetAsync(Player.UserId)
	if data then
		for i, receipt in ipairs(data) do
			for key,value in pairs(receipt) do
				print(key, value)
			end
		end
	end
end)

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(Player, Id, YesPurchased)
	if YesPurchased and Id == PassId then
		print(Player.Name.." has purchased the gamepass!")
		giveSword(Player)
		
		-- create our receive 
		local receipt = {
			Name = "LegendarySword",
			Id = Id,
			Date = os.date("%x"),
			Price = 1
		}
		
		-- Get the player's purchase history
		local success, data = pcall(function()
			return PurchaseHistory:GetAsync(Player.UserId)
		end)
		if not success then
			error("Failed to fetch purchase history")
			return
		end
		
		-- if not have data atall
		if data == nil then
			data = {}
		end
		
		-- Add receive
		table.insert(data, receipt)
		local success, errorMsg = pcall(function()
			PurchaseHistory:SetAsync(Player.UserId, data)
		end)
		if not success then
			error(errorMsg)
		end
	end
end)