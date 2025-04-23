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

-- Fort Spam
local fortSpam = false
Tab:AddToggle({
	Name = "Fort Spam",
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
							Name = "Glove Check",
							Content = "Fort",
							Image = "rbxassetid://7733960981",
							Time = 2
						})
					end
					task.wait(4.3)
				end
			end)
		end
	end
})

-- Barrier Spam (Defense)
local barrierSpam = false
Tab:AddToggle({
	Name = "Barrier Spam",
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
							Name = "Glove Check",
							Content = "Defense",
							Image = "rbxassetid://7733960981",
							Time = 2
						})
					end
					task.wait(0.5)
				end
			end)
		end
	end
})

-- Noclip (fully toggleable even after respawn)
local noclipActive = false
local noclipConn

local function enableNoclip()
	if noclipConn then noclipConn:Disconnect() end
	noclipConn = RunService.Stepped:Connect(function()
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end)
end

local function disableNoclip()
	if noclipConn then noclipConn:Disconnect() end
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide = true end
	end
end

Tab:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(state)
		noclipActive = state
		if noclipActive then
			enableNoclip()
		else
			disableNoclip()
		end
	end
})

player.CharacterAdded:Connect(function(newChar)
	char = newChar
	if noclipActive then
		task.wait(1)
		enableNoclip()
	end
end)

-- Busmoment (Bus)
local busmoment = false
Tab:AddToggle({
	Name = "Busmoment",
	Default = false,
	Callback = function(state)
		busmoment = state
		if busmoment then
			task.spawn(function()
				while busmoment do
					local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
					if glove and glove.Value == "Bus" then
						local event = ReplicatedStorage:FindFirstChild("busmoment")
						if event then
							event:FireServer()
						end
					else
						OrionLib:MakeNotification({
							Name = "Glove Check",
							Content = "Bus",
							Image = "rbxassetid://7733960981",
							Time = 2
						})
					end
					task.wait(5)
				end
			end)
		end
	end
})

OrionLib:Init()
