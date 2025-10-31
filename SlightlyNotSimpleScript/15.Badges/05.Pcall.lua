-- basic pcall structure
local success, errorMsg = pcall(function(number)
	print(number)
end, 100)
