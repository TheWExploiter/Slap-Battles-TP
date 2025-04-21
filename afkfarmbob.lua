task.spawn(function()
	task.wait(5) -- Full delay before script execution

	local lp = game:GetService("Players").LocalPlayer
	local badgeService = game:GetService("BadgeService")
	local ts = game:GetService("TeleportService")
	local hs = game:GetService("HttpService")
	local rs = game:GetService("ReplicatedStorage")

	local badgeId = 2125950512

	local function hasBadge()
		local success, has = pcall(function()
			return badgeService:UserHasBadgeAsync(lp.UserId, badgeId)
		end)
		return success and has
	end

	local function hasReplica()
		local s = lp:FindFirstChild("leaderstats")
		return s and s:FindFirstChild("Glove") and s.Glove.Value == "Replica"
	end

	local function hop()
		local servers = {}
		local req = syn and syn.request or http and http.request or http_request or request
		local res = req({Url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"})
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
				local t0 = tick()
				while tick() - t0 < 3 and hasReplica() do
					if hasBadge() then return end
					local bob = rs:FindFirstChild("bob")
					local dup = rs:FindFirstChild("Duplicate")
					if bob and dup then
						bob:FireServer()
						dup:FireServer()
					end
					task.wait(0.01)
				end
				hop()
				break
			end
		end
	end

	startGrind()
end)
