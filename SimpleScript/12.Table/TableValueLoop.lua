local Box = {"Chainsaw","Knife","Whetstone","Lighter"}

-- cycle throught Box table and delete index 4 and more
for i, v in pairs(Box) do
	if i > 3 then
		table.remove(Box,i)
	end
end
