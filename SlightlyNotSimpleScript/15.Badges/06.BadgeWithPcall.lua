--[[
pcall here is importan in badge.
Because if you not use pcall, when you run the game, if the badge is not exist, 
the game will crash.
]]

local BadgeService = game:GetService("BadgeService")

local BadgeID = 1520939640643995

game.Players.PlayerAdded:Connect(function(player)
	task.wait(5)
	
	local Success, BadgeInfo = pcall(BadgeService.GetBadgeInfoAsync, BadgeService, BadgeID)
	if not Success then
		warn("Fail to get badge info!")
	else
		print(BadgeInfo.Name)
		print(BadgeInfo.IconImageId)
		print(BadgeInfo.Description)
		print(BadgeInfo.Enabled)
	end
	
	local Success, HasBadge = pcall(BadgeService.UserHasBadgeAsync, BadgeService, player.UserId, BadgeID)
	if not Success then
		warn("Fail to check if player has badge!")
	end
	if HasBadge and BadgeInfo.IsEnabled then
		local Success, ErrorMsg = pcall(BadgeService.AwardBadge, BadgeService, player.UserId, BadgeID)
		if not Success then
			warn(ErrorMsg)
		end
	end
end)
