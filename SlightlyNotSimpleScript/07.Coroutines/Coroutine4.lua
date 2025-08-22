--[[
coroutine status = 
	1. suspended
	2. running
	3. dead
]]

local co = coroutine.create(function()
end)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))