-- put at starterplayer > starterplayerscripts
local MPS = game:GetService("MarketplaceService")
local Players = game.Players.LocalPlayer
local productId = 3455306726 -- replace with your product id btw its just donate

task.wait(10)
MPS:PromptProductPurchase(Players,productId)

local success, productInfo = pcall(function()
	return MPS:GetProductInfo(productId, Enum.InfoType.Product)
end)

for k, v in pairs(productInfo) do
	print(k, v)
end
