local BadgeService = game:GetService("BadgeService")

local BadgeID = 1520939640643995

game.Players.PlayerAdded:Connect(function(player)
	task.wait(5)
	BadgeService:AwardBadge(player.UserId, BadgeID)
end)
