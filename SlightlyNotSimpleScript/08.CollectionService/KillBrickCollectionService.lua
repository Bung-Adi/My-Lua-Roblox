--[[
You can put this in ServerScriptService.
It will automatically detect any part that has KillBrick tag and connect it to the function.
it's use CollectionService GetTagged
]]
local CollectionService = game:GetService("CollectionService")

local KillBricks = CollectionService:GetTagged("KillBrick")

for i,KB in pairs(KillBricks) do 
	KB.Touched:Connect(function(senggol)
		local orang = senggol.parent:FindFirstChild("Humanoid")
		if orang then
			orang.Health = 0
		end
	end)
end
