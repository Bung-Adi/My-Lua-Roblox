local part =  script.Parent
local debounce = false
local cooldown = 1

part.Touched:Connect(function(touched)
	
	local hum = touched.Parent:FindFirstChild('Humanoid')
	
	if hum then
		
		local plrInst = game:GetService('Players'):GetPlayerFromCharacter(hum.Parent)
		
		if plrInst and not debounce then
			debounce = true
			
			local playerCoinsV = plrInst:WaitForChild('PlayerCoins')
			playerCoinsV.Value -= 1
			
			wait(cooldown)
			
			debounce = false
			
		end
		
	end
	
end)
