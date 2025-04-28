local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

local webhookUrl = "https://discord.com/api/webhooks/1366093954726101012/7ciBVLgguCpWBwuHUeSYB6L4v3ytPvIpxl11tkEmANA3AExUvCSsaKx_S1tlEkTMX0zJ"

local success, gameInfo = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local gameName = success and gameInfo.Name or "Unknown Game"

local data = {
    ["username"] = "Script Logger",
    ["embeds"] = {{
        ["title"] = "Someone Executed Bob Script",
        ["color"] = tonumber(0x00ff00),
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = LocalPlayer.Name,
                ["inline"] = true
            },
            {
                ["name"] = "UserId",
                ["value"] = tostring(LocalPlayer.UserId),
                ["inline"] = true
            },
            {
                ["name"] = "Game",
                ["value"] = gameName,
                ["inline"] = false
            },
            {
                ["name"] = "Server JobId",
                ["value"] = string.format("[Join Server](https://www.roblox.com/games/%s/-%s?jobId=%s)", game.PlaceId, "Join", game.JobId),
                ["inline"] = false
            },
            {
                ["name"] = "Account Age",
                ["value"] = tostring(LocalPlayer.AccountAge).." days",
                ["inline"] = true
            },
            {
                ["name"] = "Execution Time",
                ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                ["inline"] = true
            }
        }
    }}
}

-- This is the updated method for Delta-based executors
local function sendWebhook(data)
    local jsonData = game:GetService("HttpService"):JSONEncode(data)
    local requestData = {
        Url = webhookUrl,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonData
    }

    -- Use the built-in Delta request method (getgenv().request)
    if getgenv().request then
        getgenv().request(requestData)
    else
        warn("Delta executor doesn't support external HTTP requests!")
    end
end

-- Sending the webhook using Delta-compatible request method
sendWebhook(data)

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TeleportService")
local gs = game:GetService("GuiService")

repeat task.wait() until lp:FindFirstChild("PlayerGui")

local sg = Instance.new("ScreenGui")
sg.Name = "BobGui"
sg.ResetOnSpawn = false
sg.Parent = lp:WaitForChild("PlayerGui")

local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 250, 0, 140)
f.Position = UDim2.new(0.5, -125, 0.5, -70)
f.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
f.Active = true
f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1, 0, 0, 30)
t.BackgroundTransparency = 1
t.Text = "Bob Auto Spammer"
t.Font = Enum.Font.GothamBold
t.TextSize = 18
t.TextColor3 = Color3.new(1, 1, 1)

local b = Instance.new("TextButton", f)
b.Position = UDim2.new(0.1, 0, 0.4, 0)
b.Size = UDim2.new(0.8, 0, 0.4, 0)
b.Text = "(Start Bob Grind)"
b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
b.TextColor3 = Color3.new(1, 1, 1)
b.Font = Enum.Font.Gotham
b.TextSize = 16
Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

local function hasReplica()
	local s = lp:FindFirstChild("leaderstats")
	return s and s:FindFirstChild("Glove") and s.Glove.Value == "Replica"
end

local function notif(txt)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Missing Replica",
			Text = txt,
			Duration = 9
		})
	end)
end

local running = false
local coords = Vector3.new(-910, 329, 4)

b.MouseButton1Click:Connect(function()
	if running then return end
	if not hasReplica() then
		notif("You need to equip the Replica glove bruh")
		return
	end
	running = true
	local c = lp.Character or lp.CharacterAdded:Wait()
	local hrp = c:WaitForChild("HumanoidRootPart")
	hrp.CFrame = CFrame.new(coords)
	task.wait(1)
	while running and hasReplica() do
		local bob = rs:FindFirstChild("bob")
		local dup = rs:FindFirstChild("Duplicate")
		if bob and dup then
			bob:FireServer()
			dup:FireServer()
		end
		task.wait(0.01)
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if not game:GetService("Players"):FindFirstChild(lp.Name) or not workspace:FindFirstChild(lp.Name) then
		ts:Teleport(game.PlaceId, lp)
	end
end)

gs:GetPropertyChangedSignal("ErrorMessage"):Connect(function()
	if gs.ErrorMessage ~= "" and gs.ErrorMessage ~= "imagine exploiting hahahahaha" then
		ts:Teleport(game.PlaceId, lp)
	end
end)
