local SlapRemotes = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesTable.luau'))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GloveValue()
	return LocalPlayer.leaderstats.Glove.Value
end

local function Slap(args, mode)
	mode = mode or 1
	if mode == 1 then
		if SlapRemotes[GloveValue()] then
			SlapRemotes[GloveValue()]:FireServer(unpack(args))
		else
			ReplicatedStorage:WaitForChild("GeneralHit"):FireServer(unpack(args))
		end
	elseif mode == 2 then
		ReplicatedStorage:WaitForChild("b"):FireServer(unpack(args))
	end
end

local slapDelay = 0.7
local slapRange = 35

task.spawn(function()
	while true do
		task.wait(slapDelay)
		if _G.SlapAuraEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local playerPos = LocalPlayer.Character.HumanoidRootPart.Position
			for _, target in pairs(Players:GetPlayers()) do
				if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					local targetPos = target.Character.HumanoidRootPart.Position
					if (playerPos - targetPos).Magnitude <= slapRange then
						Slap({target.Character.HumanoidRootPart})
					end
				end
			end
		end
	end
end)
