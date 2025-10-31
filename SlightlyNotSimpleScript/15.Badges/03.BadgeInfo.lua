local BadgeService = game:GetService("BadgeService")

local BadgeID = 1520939640643995

game.Players.PlayerAdded:Connect(function(player)
	task.wait(5)
	local HasBadge = BadgeService:UserHasBadgeAsync(player.UserId, BadgeID)
	if HasBadge then
		BadgeService:AwardBadge(player.UserId, BadgeID)
	else
		print(player.Name.." Already have this Welcome badge")
	end
	
	local BadgeInfo = BadgeService:GetBadgeInfoAsync(BadgeID)
	print(BadgeInfo.Name)
	print(BadgeInfo.IconImageId)
	print(BadgeInfo.Description)
	print(BadgeInfo.Enabled)
end)
