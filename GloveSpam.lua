local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Slap Battles Spam", HidePremium = false, SaveConfig = false, ConfigFolder = "XScripts"})

local Tab = Window:MakeTab({
    Name = "Spammable Abilities",
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
                    if glove and glove.Value == "Woah" then
                        ReplicatedStorage:WaitForChild("VineThud"):FireServer()
                    else
                        OrionLib:MakeNotification({
                            Name = "Glove Check",
                            Content = "Equip Woah bruh",
                            Image = "rbxassetid://7733960981",
                            Time = 2
                        })
                    end
                    task.wait(5.8)
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
                    task.wait(5.9)
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
    Name = "Glovel Spam (LAGGY)",
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
                    task.wait(0.01)
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
