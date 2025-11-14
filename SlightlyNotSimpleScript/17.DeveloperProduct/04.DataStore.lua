local MPS = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local DSS = game:GetService("DataStoreService")

local purchaseHistory = DSS:GetDataStore("PurchaseHistory")

local SPEED_BOOST_PRODUCT_ID = 3455306726
local SPEED_BOOST_AMOUNT = 50

local productList = {}

productList[3455301863] = function(r, player)
	-- donate	
	return true
end

productList[SPEED_BOOST_PRODUCT_ID] = function(r, player)
	-- faster run
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = humanoid.WalkSpeed + SPEED_BOOST_AMOUNT
		return true
	end
	return false
end

-- Function to get total speed boosts purchased by player
local function getSpeedBoostCount(playerId)
	local success, data = pcall(function()
		return purchaseHistory:GetAsync(playerId .. "_SpeedBoosts")
	end)

	if success and data then
		return data
	end
	return 0
end

-- Function to increment speed boost count
local function incrementSpeedBoost(playerId)
	pcall(function()
		purchaseHistory:UpdateAsync(playerId .. "_SpeedBoosts", function(oldValue)
			return (oldValue or 0) + 1
		end)
	end)
end

-- Function to apply saved speed boosts when player joins
local function applySavedSpeed(player)
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChild("Humanoid")

	if humanoid then
		local boostCount = getSpeedBoostCount(player.UserId)
		if boostCount > 0 then
			-- Apply all purchased speed boosts
			humanoid.WalkSpeed = 16 + (boostCount * SPEED_BOOST_AMOUNT)
			print("Applied " .. boostCount .. " speed boosts to " .. player.Name)
		end
	end
end

-- Handle player joining
Players.PlayerAdded:Connect(function(player)
	applySavedSpeed(player)

	-- Also apply when character respawns
	player.CharacterAdded:Connect(function()
		applySavedSpeed(player)
	end)
end)

function processOrder(receipt)
	local productId = receipt.ProductId
	local playerId = receipt.PlayerId
	local playerProductKey = playerId .. "_" .. receipt.PurchaseId

	local success, alreadyPurchased = pcall(function()
		return purchaseHistory:GetAsync(playerProductKey)
	end)

	if success and alreadyPurchased then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end

	local success, result = pcall(function()
		return purchaseHistory:UpdateAsync(playerProductKey, function(oldValue)
			if oldValue then return true end

			local player = Players:GetPlayerByUserId(playerId)
			if player and productList[productId] then
				local ok, granted = pcall(productList[productId], receipt, player)
				if ok and granted then
					-- Increment speed boost counter if it's the speed product
					if productId == SPEED_BOOST_PRODUCT_ID then
						incrementSpeedBoost(playerId)
					end
					return true
				else
					warn("Handler failed for product " .. productId)
					return nil
				end
			end
			return nil
		end)
	end)

	if success and result then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	else
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
end

MPS.ProcessReceipt = processOrder
