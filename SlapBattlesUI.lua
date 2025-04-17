local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Teleport UI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "TeleportConfig"
})

local player = game.Players.LocalPlayer
local username = player.Name

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

local GlovesTab = Window:MakeTab({
    Name = "Gloves",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HomeTab:AddSection({Name = "Welcome, " .. username .. "!"})
TeleportsTab:AddSection({Name = "Teleport Points"})
FeaturesTab:AddSection({Name = "Useful Features"})
GlovesTab:AddSection({Name = "Get Gloves"})

local gloveScripts = {
    ["Elude & Counter Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/EludeAndCounterGloves.luau",
    ["Fan & Boxer Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FanAndBoxerGloves.luau",
    ["Fan Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FanGlove.luau",
    ["Hexa Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HexaGlove.luau",
    ["Mouse Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/MouseGlove.luau",
    ["Metaverse Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/MetaverseGlove.luau",
    ["UTG Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/UTGGlove.luau",
    ["Bind Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/BindGlove.luau",
    ["Frostbite Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FrostbiteGlove.luau",
    ["Hybrid Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HybridGlove.luau",
    ["Hunter Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HunterGlove.luau",
    ["Relude Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/ReludeGlove.luau",
    ["Avatar & Hunter Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AvatarAndHunterGloves.luau"
}

for name, link in pairs(gloveScripts) do
    GlovesTab:AddButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(link))()
        end
    })
end

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

local platform = Instance.new("Part")
platform.Size = Vector3.new(5, 2, 5)
platform.Position = Vector3.new(3419, 257, -18)
platform.Anchored = true
platform.Transparency = 0.7
platform.Color = Color3.fromRGB(255, 0, 0)
platform.Parent = game.Workspace

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

HomeTab:AddButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/6cVygU3NHU")
    end
})

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

FeaturesTab:AddButton({
    Name = "Server Hop (3 Players or Less)",
    Callback = function()
        local placeId = 6403373529

        local success, servers = pcall(function()
            return game:GetService("TeleportService"):GetPlayerPlaceAsync(placeId)
        end)

        if success and servers then
            local validServers = {}
            for _, server in pairs(servers) do
                if server.PlayerCount <= 3 then
                    table.insert(validServers, server)
                end
            end

            if #validServers > 0 then
                table.sort(validServers, function(a, b)
                    return a.PlayerCount < b.PlayerCount
                end)

                local bestServer = validServers[1]

                game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, bestServer)
            else
                OrionLib:MakeNotification({
                    Name = "No Low Pop Servers",
                    Content = "No servers with 3 players or fewer found for Place ID " .. placeId,
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "Server Hop Error",
                Content = "Failed to retrieve server information for Place ID " .. placeId,
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

OrionLib:Init()
