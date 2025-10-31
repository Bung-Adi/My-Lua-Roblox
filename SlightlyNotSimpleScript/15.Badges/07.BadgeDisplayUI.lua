--[[
this is a LocalScript in StarterPlayerScripts
it is used to display the badge list in the game.
You also need UI with structure like this :
- BadgeDisplay (ScreenGui)
	- BadgeList (Frame)
		- ScrollingFrame
			- Template (Frame)
				- BadgeTexts (Frame)
					- BadgeName (TextLabel)
					- BadgeDescription (TextLabel)
				- BadgeImage (ImageLabel)
				- Status (TextLabel)
	- BadgeButton (Textbutton)
]]

local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")

local player  = Players.LocalPlayer
local Gui = player.PlayerGui:WaitForChild("BadgeDisplay")
local BadgeList = Gui.BadgeList
BadgeList.Visible = false
local ScrollingFrame = BadgeList.ScrollingFrame
local Template = ScrollingFrame.Template
Template.Visible = false
local BadgeButton = Gui.BadgeButton

local BadgeIdList = {
	1520939640643995, 2537032170201562
}

-- show hide BadgeList
BadgeButton.MouseButton1Click:Connect(function()
	BadgeList.Visible = not BadgeList.Visible
end)

-- display all badges
for _, badgeId in pairs(BadgeIdList) do
	local TemplateClone = Template:Clone()
	TemplateClone.Name = "Badge_" .. badgeId
	TemplateClone.Visible = true
	TemplateClone.Parent = ScrollingFrame
	
	local Status = TemplateClone.Status
	local success, result = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
	end)
	if success then
		if result then
			Status.Text = "Earned"
		else
			Status.Text = "Not Earned"
		end
	else
		Status.Text = "Error"
	end
	
	local BadgeImage = TemplateClone.BadgeImage
	local BadgeTexts = TemplateClone.BadgeTexts
	local BadgeName = BadgeTexts.BadgeName
	local BadgeDescription = BadgeTexts.BadgeDescription

	local Success, BadgeInfo = pcall(BadgeService.GetBadgeInfoAsync, BadgeService, badgeId)
	if not Success then
		BadgeName.Text = "Error"
	else
		BadgeName.Text = BadgeInfo.Name
		BadgeDescription.Text = BadgeInfo.Description
		BadgeImage.Image = "rbxassetid://" .. BadgeInfo.IconImageId
	end
end
	