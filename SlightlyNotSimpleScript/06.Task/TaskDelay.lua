print("start")

task.delay(5,function()
	print("delayed hello")
end)

print("end")