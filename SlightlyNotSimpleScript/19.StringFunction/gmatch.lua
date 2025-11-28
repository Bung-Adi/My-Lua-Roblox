local text = "Yo Everyone"
for word in string.gmatch(text,"%w+") do
	print(text)
end