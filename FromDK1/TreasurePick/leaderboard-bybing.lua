-- WARNING not tested yet
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local function leaderboardSetup(player)
    local leaderboard = Instance.new("Folder", player)
    leaderboard.Name = "leaderboard"

    local points = Instance.new("IntValue", leaderboard)
    points.Name = "Points"
    points.Value = 0

    local leaderboardGui = Instance.new("ScreenGui", player.PlayerGui)
    leaderboardGui.Name = "LeaderboardGui"

    local leaderboardFrame = Instance.new("Frame", leaderboardGui)
    leaderboardFrame.Name = "LeaderboardFrame"
    leaderboardFrame.Size = UDim2.new(0, 200, 0, 300)
    leaderboardFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
    leaderboardFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    leaderboardFrame.BackgroundTransparency = 0.5

    local leaderboardTitle = Instance.new("TextLabel", leaderboardFrame)
    leaderboardTitle.Name = "LeaderboardTitle"
    leaderboardTitle.Size = UDim2.new(1, 0, 0, 30)
    leaderboardTitle.Position = UDim2.new(0, 0, 0, 0)
    leaderboardTitle.BackgroundColor3 = Color3.new(1, 1, 1)
    leaderboardTitle.BackgroundTransparency = 0.5
    leaderboardTitle.Text = "Leaderboard"
    leaderboardTitle.Font = Enum.Font.SourceSansBold
    leaderboardTitle.TextSize = 20

    local playerPoints = Instance.new("TextLabel", leaderboardFrame)
    playerPoints.Name = "PlayerPoints"
    playerPoints.Size = UDim2.new(1, 0, 0, 30)
    playerPoints.Position = UDim2.new(0, 0, 0, 40)
    playerPoints.BackgroundColor3 = Color3.new(1, 1, 1)
    playerPoints.BackgroundTransparency = 0.5
    playerPoints.Text = "Your Points: " .. points.Value
    playerPoints.Font = Enum.Font.SourceSans
    playerPoints.TextSize = 18

    local leaderboardList = Instance.new("Frame", leaderboardFrame)
    leaderboardList.Name = "LeaderboardList"
    leaderboardList.Size = UDim2.new(1, 0, 1, -80)
    leaderboardList.Position = UDim2.new(0, 0, 0, 80)
    leaderboardList.BackgroundColor3 = Color3.new(1, 1, 1)
    leaderboardList.BackgroundTransparency = 1

    local function updateLeaderboard()
        leaderboardList:ClearAllChildren()

        local sortedPlayers = {}
        for _, player in pairs(Players:GetPlayers()) do
            table.insert(sortedPlayers, player)
        end

        table.sort(sortedPlayers, function(a, b)
            return a.leaderboard.Points.Value > b.leaderboard.Points.Value
        end)

        for i, player in ipairs(sortedPlayers) do
            local playerFrame = Instance.new("Frame", leaderboardList)
            playerFrame.Name = "PlayerFrame"
            playerFrame.Size = UDim2.new(1, 0, 0, 30)
            playerFrame.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
            playerFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            playerFrame.BackgroundTransparency = 0.5

            local playerName = Instance.new("TextLabel", playerFrame)
            playerName.Name = "PlayerName"
            playerName.Size = UDim2.new(0.5, 0, 1, 0)
            playerName.Position = UDim2.new(0, 0, 0, 0)
            playerName.BackgroundColor3 = Color3.new(1, 1, 1)
            playerName.BackgroundTransparency = 1
            playerName.Text = player.Name
            playerName.Font = Enum.Font.SourceSans
            playerName.TextSize = 18

            local playerPoints = Instance.new("TextLabel", playerFrame)
            playerPoints.Name = "PlayerPoints"
            playerPoints.Size = UDim2.new(0.5, 0, 1, 0)
            playerPoints.Position = UDim2.new(0.5, 0, 0, 0)
            playerPoints.BackgroundColor3 = Color3.new(1, 1, 1)
            playerPoints.BackgroundTransparency = 1
            playerPoints.Text = player.leaderboard.Points.Value
            playerPoints.Font = Enum.Font.SourceSans
            playerPoints.TextSize = 18
        end
    end

    points.Changed:Connect(function()
        playerPoints.Text = "Your Points: "