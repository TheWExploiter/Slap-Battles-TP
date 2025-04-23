local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Slap Battles Spam", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
	Name = "Abilities",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Fort Spam Toggle with 4.3 seconds cooldown
local fortSpam = false
Tab:AddToggle({
	Name = "Auto Fort Spam (4.3s)",
	Default = false,
	Callback = function(state)
		fortSpam = state
		if fortSpam then
			task.spawn(function()
				while fortSpam do
					local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
					if glove and glove.Value == "Fort" then
						local fort = ReplicatedStorage:FindFirstChild("Fortlol")
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
					task.wait(4.3)
				end
			end)
		end
	end
})

-- Barrier Spam with "Defense" glove check
local barrierSpam = false
Tab:AddToggle({
	Name = "Auto Barrier Spam (Defense Glove)",
	Default = false,
	Callback = function(state)
		barrierSpam = state
		if barrierSpam then
			task.spawn(function()
				while barrierSpam do
					local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
					if glove and glove.Value == "Defense" then
						local barrier = ReplicatedStorage:FindFirstChild("Barrier")
						if barrier then
							barrier:FireServer()
						end
					else
						OrionLib:MakeNotification({
							Name = "Missing Defense Glove",
							Content = "Equip the 'Defense' glove to use this!",
							Image = "rbxassetid://7733960981",
							Time = 3
						})
					end
					task.wait(0.2)
				end
			end)
		end
	end
})

-- Noclip Toggle
local noclipActive = false
local noclipConn

Tab:AddToggle({
	Name = "Toggle Noclip",
	Default = false,
	Callback = function(state)
		noclipActive = state
		if noclipActive then
			noclipConn = RunService.Stepped:Connect(function()
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") and part.CanCollide then
						part.CanCollide = false
					end
				end
			end)
		else
			if noclipConn then
				noclipConn:Disconnect()
			end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
})

OrionLib:Init()
