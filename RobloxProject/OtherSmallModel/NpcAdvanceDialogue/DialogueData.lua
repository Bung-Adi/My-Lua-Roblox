-- modulescript at ReplicatedStorage
local DialogueData = {
	["Kuro"] = {
		PortraitId = "rbxassetid://116866977067285",
		StartNode = "Greeting",
		Nodes = {
			["Greeting"] = {
				Text = "Hewwwo Meow!, Hows your day ?",
				Choices = {
					{Text = "What!!!", Next = "AskWhy"},
					{Text = "Yeah Good", Next = "AskMore"},
					{Text = "Bye", Next = "Exit"},
				}
			},
			["AskWhy"] = {
				Text = "U are so rude, Meow!",
				Choices = {
					{Text = "Bye", Next = "Exit"},
				}
			},
			["AskMore"] = {
				Text = "Nice weather, Meow!",
				Choices = {
					{Text = "Bye", Next = "Exit"},
				}
			}
		}
	}
}

return DialogueData
