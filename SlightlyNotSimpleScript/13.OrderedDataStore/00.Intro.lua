local DSS = game:GetService("DataStoreService") -- calling datastore service

local PlayerCoins = DSS:GetOrderedDataStore("PlayerCoins") -- use ordered datastore instead of normal datastore

--[[
Basically ordered datastore is like a normal datastore but it's can be sorted.

The data is seperated by page.
]]
