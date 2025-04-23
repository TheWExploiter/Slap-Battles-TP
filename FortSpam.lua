local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Jet & Fort Spammer", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
	Name = "Abilities",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local fortSpam = false
local fortLoop

Tab:AddToggle({
	Name = "Auto Fort Spam",
	Default = false,
	Callback = function(state)
		fortSpam = state
		if fortSpam then
			fortLoop = task.spawn(function()
				local player = game:GetService("Players").LocalPlayer
				local leaderstats = player:FindFirstChild("leaderstats")
				while fortSpam do
					if leaderstats and leaderstats:FindFirstChild("Glove") then
						if leaderstats.Glove.Value == "Fort" then
							local fort = game:GetService("ReplicatedStorage"):FindFirstChild("Fortlol")
							if fort then
								fort:FireServer()
							end
						else
							OrionLib:MakeNotification({
								Name = "Missing Fort Glove",
								Content = "Equip the 'Fort' glove to use this!",
								Image = "rbxassetid://7733960981",
								Time = 3
							})
							task.wait(4.3)
						end
					else
						OrionLib:MakeNotification({
							Name = "Checking...",
							Content = "Looking for 'Fort' glove...",
							Image = "rbxassetid://7734054307",
							Time = 2
						})
					end
					task.wait(4.3)
				end
			end)
		else
			if fortLoop then task.cancel(fortLoop) end
		end
	end
})

OrionLib:Init()
