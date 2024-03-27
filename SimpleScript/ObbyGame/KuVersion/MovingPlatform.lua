--[[ If you add more parts titled "Destination 3" or "Destination 4" etc. Then the platform will work with those new destinations.
Use Ctrl + D to duplicate a destination block while it is selected, which keeps the duplicate under the same folder.
If a destination is outside the folder, then it won't be added to the destination list.


SETTINGS - Edit the settings to change how the platform works.
------------------------------------------------------------------------------------------------------------------------------]]
moveDelay = 4 -- The delay (in seconds) for moving between destinations.

topSpeed = 30 -- The maximum speed that the platform can move at.
-- If the platform is too slow and moveDelay is too fast, then the platform might not reach the destination in time.

hideDestinationBlocks = true --[[ If you set this to true, then the destination blocks will be hidden when you play.
Otherwise, set it to false if you want to see them.
------------------------------------------------------------------------------------------------------------------------------]]


-- Below is the script to make the moving platform work. It won't work if something is wrong with the destination blocks.

local mainFolder = script.Parent
local platform = mainFolder.Platform
local alignPosition = platform.AlignPosition

-- Creating a sorted list of positions to move between
local positionList = {}
while true do
	local lowest = {nil, math.huge} -- Contains the destination with the lowest number and its number
	for _, value in pairs(mainFolder:GetChildren()) do
		if not value:IsA("BasePart") then continue end -- Skip this item if it's not a base part
		local nameSplit = string.split(value.Name, " ")
		-- In these conditional statements, we check:
		if #nameSplit ~= 2 then continue end -- That the name contains one space
		local destinationNumber = tonumber(nameSplit[2])
		if string.lower(nameSplit[1]) == "destination" -- The word before the space is "destination"
			and destinationNumber -- The word after the space is a number
			and destinationNumber < lowest[2] -- And the number after the space is lower than the current lowest number
		then
			lowest = {value, destinationNumber} -- If the previous checks succeed, the current part is now the lowest one
		end
	end
	if not lowest[1] then
		break -- End the loop if there are no destination blocks remaining
	else
		table.insert(positionList, lowest[1].Position)
		if hideDestinationBlocks then -- Destroy or rename the current lowest destination to continue the sorting process
			lowest[1]:Destroy()
		else
			lowest[1].Name = "Destination"
		end
	end
end

alignPosition.MaxVelocity = topSpeed
alignPosition.Position = positionList[1]
platform.AlignOrientation.CFrame = platform.CFrame.Rotation -- Match the target orientation to the current orientation
platform.Anchored = false

while true do -- The moving platform can now endlessly go through the sorted list in order
	for index, _ in pairs(positionList) do
		alignPosition.Position = positionList[index]
		task.wait(moveDelay)
	end
end