local MPS = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local productList = {}

productList[00000] = function(r,player) -- fill with the right id
	-- donate	
end

productList[000000] = function(r,player) -- fill with the right id
	-- faster run
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = humanoid.WalkSpeed + 50
		return true
	end
end

function processOrder(receiveInfo)
	local productId = receiveInfo.ProductId
	local playerId = receiveInfo.PlayerId
	local player = Players:GetPlayerByUserId(playerId)
	if player then
		local handler = productList[productId]
		if handler then
			local success, result = pcall(handler, receiveInfo, player)
			if success then
				return Enum.ProductPurchaseDecision.PurchaseGranted
			else
				warn("Error processing product purchase:", result)
			end
		end
	end
	return Enum.ProductPurchaseDecision.NotProcessedYet
end

MPS.ProcessReceipt = processOrder