local startTime = os.clock()

local sum = 0
for i = 1, 1000000 do
	sum += i
end
local endTime = os.clock()
print("Time taken: ", endTime - startTime)