local text = "Yo Everyone"
print(string.gsub(text,"Yo","Hello"))
-- print(string.gsub(text,"%w+","Hello"))
-- print(string.gsub(text,"%w+",{Yo = "Hello", Everyone = "People"}))
--[[
local function addNyan(theText)
  return theText.."nyan"
end
local newText = string.gsub(text,"%w+",addNyan)
print(newText)
]]