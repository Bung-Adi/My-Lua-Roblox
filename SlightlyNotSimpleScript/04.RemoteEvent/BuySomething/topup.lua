--[[
this is LocalScript

put it inside StarterGui.ScreenGui
also in ScreenGui you have to put ->
- TextLabel named greeting
- TextLabel named announcement
- TextButton named giveButton
]]
-- 
local gui = script.Parent
local giveButton = gui:WaitForChild("GiveButton")
local giveCurrency = game.ReplicatedStorage.GiveCurency

giveButton.MouseButton1Click:Connect(function()
	giveCurrency:FireServer(50)
end)


local greetPlayer = game.ReplicatedStorage.GreatPlayer
local greetingText = gui.greeting

greetPlayer.OnClientEvent:Connect(function(message)
	greetingText.Text = message
end)


local giveAnnouncement = game.ReplicatedStorage.GiveAnnouncement
giveAnnouncement.OnClientEvent:Connect(function()
	gui.announcement.Visible = true
	--greetingText.Text = "?? Announcement: Limited time offer!"
	--task.wait(5)
	--greetingText.Text = ""
end)