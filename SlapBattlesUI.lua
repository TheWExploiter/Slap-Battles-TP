local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
	Name = "Teleport UI",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "TeleportConfig"
})

local player = game.Players.LocalPlayer
local username = player.Name

-- Tabs
local HomeTab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeleportsTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FeaturesTab = Window:MakeTab({
	Name = "Features",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Sections
HomeTab:AddSection({Name = "Welcome, " .. username .. "!"})
TeleportsTab:AddSection({Name = "Teleport Points"})
FeaturesTab:AddSection({Name = "Useful Features"})

-- Teleports
local function teleportTo(x, y, z)
	if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
	end
end

TeleportsTab:AddButton({Name = "Normal Arena", Callback = function() teleportTo(-14, 66, -1) end})
TeleportsTab:AddButton({Name = "Slapple Island", Callback = function() teleportTo(-395, 51, -13) end})
TeleportsTab:AddButton({Name = "Cannon Island", Callback = function() teleportTo(263, 33, 197) end})
TeleportsTab:AddButton({Name = "Guide Room (Inside)", Callback = function() teleportTo(17894, -130, -3542) end})
TeleportsTab:AddButton({Name = "Guide Room (Outside)", Callback = function() teleportTo(17938, -130, -3598) end})
TeleportsTab:AddButton({Name = "New Arena (Free Slaps & Null Shards)", Callback = function() teleportTo(3419, 260, -18) end})

-- Teleport to Player
TeleportsTab:AddTextbox({
	Name = "Teleport to Player",
	Default = "",
	TextDisappear = true,
	Callback = function(value)
		local target = game.Players:FindFirstChild(value)
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
		end
	end
})

-- Platform at Fight Arena
local platform = Instance.new("Part")
platform.Size = Vector3.new(50, 2, 5)
platform.Position = Vector3.new(3419, 257, -18)
platform.Anchored = true
platform.Transparency = 0.5
platform.Color = Color3.fromRGB(255, 0, 0)
platform.Parent = game.Workspace

-- Speed Control
FeaturesTab:AddTextbox({
	Name = "WalkSpeed",
	Default = "26",
	TextDisappear = true,
	Callback = function(value)
		local speed = tonumber(value)
		if speed then
			player.Character.Humanoid.WalkSpeed = speed
		end
	end
})

-- Anti Void
local antiVoidPart = Instance.new("Part")
antiVoidPart.Size = Vector3.new(100000, 2, 100000)
antiVoidPart.Position = Vector3.new(0, -12, 0)
antiVoidPart.Anchored = true
antiVoidPart.Color = Color3.fromRGB(255, 255, 255)
antiVoidPart.CanCollide = true
antiVoidPart.Transparency = 1
antiVoidPart.Parent = game.Workspace

FeaturesTab:AddToggle({
	Name = "Anti Void",
	Default = true,
	Callback = function(state)
		if state then
			antiVoidPart.Transparency = 0.7
			antiVoidPart.CanCollide = true
		else
			antiVoidPart.Transparency = 1
			antiVoidPart.CanCollide = false
		end
	end
})

-- Discord Invite
HomeTab:AddButton({
	Name = "Copy Discord Invite",
	Callback = function()
		setclipboard("https://discord.gg/6cVygU3NHU")
	end
})

-- Anti-Ragdoll
FeaturesTab:AddToggle({
	Name = "Anti Ragdoll",
	Default = false,
	Callback = function(state)
		if state then
			player.CharacterAdded:Connect(function(character)
				local humanoid = character:WaitForChild("Humanoid")
				local ragdoll = character:WaitForChild("Ragdolled")

				ragdoll.Changed:Connect(function()
					if ragdoll.Value then
						local hrp = character:FindFirstChild("HumanoidRootPart")
						if hrp then
							hrp.Anchored = true
							wait(2)
							hrp.Anchored = false
						end
					end
				end)
			end)
		end
	end
})

-- Server Hop Feature
FeaturesTab:AddButton({
	Name = "Server Hop (3 Players or Less)",
	Callback = function()
		local placeId = 6403373529 -- Hardcoded the place ID for the target game
		
		-- Get a list of servers
		local success, servers = pcall(function()
			return game:GetService("TeleportService"):GetPlayerPlaceAsync(placeId)
		end)

		-- If we successfully retrieved server data
		if success and servers then
			-- Filter servers with 3 players or fewer
			local validServers = {}
			for _, server in pairs(servers) do
				if server.PlayerCount <= 3 then
					table.insert(validServers, server)
				end
			end

			-- If there are valid servers, sort them by player count (low to high)
			if #validServers > 0 then
				table.sort(validServers, function(a, b)
					return a.PlayerCount < b.PlayerCount
				end)

				-- Choose the server with the least number of players
				local bestServer = validServers[1]

				-- Teleport to the chosen server
				game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, bestServer)
			else
				-- If no servers with 3 or fewer players, show a notification
				OrionLib:MakeNotification({
					Name = "No Low Pop Servers",
					Content = "No servers with 3 players or fewer found for Place ID " .. placeId,
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			end
		else
			-- If there was an error getting server data, show a notification
			OrionLib:MakeNotification({
				Name = "Server Hop Error",
				Content = "Failed to retrieve server information for Place ID " .. placeId,
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end
})

-- Optional: Welcome notification
OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "You're loaded in, " .. username .. "!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
