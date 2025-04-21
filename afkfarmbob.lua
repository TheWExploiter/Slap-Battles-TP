local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TeleportService")
local hs = game:GetService("HttpService")
local badgeService = game:GetService("BadgeService")

repeat task.wait() until lp:FindFirstChild("leaderstats") and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")

local badgeId = 2125950512

local function notifyBadge(status)
	local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
	gui.Name = "BadgeNotify"

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 200, 0, 50)
	frame.Position = UDim2.new(0.5, -100, 0.1, 0)
	frame.BackgroundColor3 = status and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)

	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(0, 12)

	local txt = Instance.new("TextLabel", frame)
	txt.Size = UDim2.new(1, 0, 1, 0)
	txt.BackgroundTransparency = 1
	txt.TextColor3 = Color3.fromRGB(255,255,255)
	txt.TextScaled = true
	txt.Text = status and "Badge Owned!" or "Badge NOT Owned!"

	task.delay(3, function()
		gui:Destroy()
	end)
end

local function hasBadge()
	local success, has = pcall(function()
		return badgeService:UserHasBadgeAsync(lp.UserId, badgeId)
	end)
	notifyBadge(success and has)
	return success and has
end

local function hasReplica()
	local s = lp:FindFirstChild("leaderstats")
	return s and s:FindFirstChild("Glove") and s.Glove.Value == "Replica"
end

local function hop()
	local servers = {}
	local req = syn and syn.request or http and http.request or http_request or request
	if not req then return end

	local success, res = pcall(function()
		return req({Url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"})
	end)

	if not success or not res then return end

	local data = hs:JSONDecode(res.Body)
	for _, s in pairs(data.data) do
		if s.playing < s.maxPlayers and s.id ~= game.JobId then
			table.insert(servers, s.id)
		end
	end

	if #servers > 0 then
		ts:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
	else
		ts:Teleport(game.PlaceId, lp)
	end
end

local function startGrind()
	while task.wait(1) do
		if not lp or not lp.Parent then break end
		if hasBadge() then break end
		if hasReplica() then
			local hrp = lp.Character:WaitForChild("HumanoidRootPart")
			hrp.CFrame = CFrame.new(-910, 329, 4)
			task.wait(1)

			local startTime = tick()
			while tick() - startTime < 5 and hasReplica() do
				if hasBadge() then return end
				local bob = rs:FindFirstChild("bob")
				local dup = rs:FindFirstChild("Duplicate")
				if bob and dup then
					for i = 1, 10 do
						bob:FireServer()
						dup:FireServer()
						task.wait(0.01)
					end
				end
				task.wait(0.1)
			end

			hop()
			break
		end
	end
end

startGrind()
