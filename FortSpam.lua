local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Jet & Fort Spammer", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
	Name = "Abilities",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local jetSpam = false
local fortSpam = false
local jetLoop, fortLoop

Tab:AddToggle({
	Name = "Auto Jet Spam (4s)",
	Default = false,
	Callback = function(state)
		jetSpam = state
		if jetSpam then
			jetLoop = task.spawn(function()
				local player = game:GetService("Players").LocalPlayer
				local leaderstats = player:FindFirstChild("leaderstats")
				while jetSpam do
					if leaderstats and leaderstats:FindFirstChild("Glove") then
						if leaderstats.Glove.Value == "Jet" then
							local airstrike = game:GetService("ReplicatedStorage"):FindFirstChild("AirStrike")
							if airstrike then
								airstrike:FireServer()
							end
						else
							OrionLib:MakeNotification({
								Name = "Missing Jet Glove",
								Content = "Equip the 'Jet' glove to use this!",
								Image = "rbxassetid://7733960981",
								Time = 3
							})
							task.wait(3)
						end
					else
						OrionLib:MakeNotification({
							Name = "Checking...",
							Content = "Looking for 'Jet' glove...",
							Image = "rbxassetid://7734054307",
							Time = 2
						})
					end
					task.wait(4)
				end
			end)
		else
			if jetLoop then task.cancel(jetLoop) end
		end
	end
})

Tab:AddToggle({
	Name = "Auto Fort Spam (3s)",
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
							task.wait(4)
						end
					else
						OrionLib:MakeNotification({
							Name = "Checking...",
							Content = "Looking for 'Fort' glove...",
							Image = "rbxassetid://7734054307",
							Time = 2
						})
					end
					task.wait(3)
				end
			end)
		else
			if fortLoop then task.cancel(fortLoop) end
		end
	end
})

OrionLib:Init()
