local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Auto Fort Placer", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
	Name = "Fort Auto",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local autoFort = false
local fortLoop

Tab:AddToggle({
	Name = "Auto Place Fort",
	Default = false,
	Callback = function(state)
		autoFort = state
		if autoFort then
			fortLoop = task.spawn(function()
				while autoFort do
					local player = game:GetService("Players").LocalPlayer
					local char = player.Character
					local stats = player:FindFirstChild("leaderstats")
					local glove = stats and stats:FindFirstChild("Glove")
					
					if glove and glove.Value == "Fort" then
						if char and not char:FindFirstChild("Fort") then
							game:GetService("ReplicatedStorage"):WaitForChild("Fortlol"):FireServer()
						end
					else
						OrionLib:MakeNotification({
							Name = "Wrong Glove!",
							Content = "Equip the 'Fort' glove to use Auto Place! bruhhh",
							Image = "rbxassetid://7733964641",
							Time = 3
						})
					end
					
					task.wait(4)
				end
			end)
		else
			if fortLoop then task.cancel(fortLoop) end
		end
	end
})

OrionLib:Init()
