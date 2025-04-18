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

local TrollTab = Window:MakeTab({
    Name = "Troll Stuff",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


HomeTab:AddSection({Name = "Welcome, " .. username .. "!"})
TeleportsTab:AddSection({Name = "Teleport Points"})
FeaturesTab:AddSection({Name = "Useful Features"})
GlovesTab:AddSection({Name = "Get Gloves"})
CreditsTab:AddSection({Name = "Credits"})
TrollTab:AddSection({Name = "Troll Scripts"})

local gloveScripts = {
    ["Boxer Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/BoxerGlove.luau",
    ["Clock Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/ClockGlove.luau",
    ["Counter Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/CounterGlove.luau",
    ["Elude Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/EludeGlove.luau",
    ["Fan Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FanGlove.luau",
    ["Mouse Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/MouseGlove.luau",
    ["Bind Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/BindGlove.luau",
    ["Water Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/WaterGlove.luau",
    ["Trap Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/TrapGlove.luau",
    ["Hexa Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HexaGlove.luau",
    ["Hybrid Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HybridGlove.luau",
    ["Hunter Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HunterGlove.luau",
    ["Relude Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/ReludeGlove.luau",
    ["Avatar & Hunter Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AvatarAndHunterGloves.luau",
    ["Avatar & Relude Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AvatarAndReludeGloves.luau",
    ["Metaverse Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/MetaverseGlove.luau",
    ["Frostbite Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FrostbiteGlove.luau",
    ["Elude & Counter Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/EludeAndCounterGloves.luau",
    ["Fan & Boxer Gloves"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FanAndBoxerGloves.luau",
    ["RNG Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/RNGGlove.luau",
    ["Hitman Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/HitmanGlove.luau",
    ["Kinetic Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/KineticGlove.luau",
    ["MEGAROCK Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/MEGAROCKGlove.luau",
    ["Admin Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AdminGlove.luau",
    ["UTG Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/UTGGlove.luau",
    ["[REDACTED] Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/REDACTEDGlove.luau",
    ["Link Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/LinkGlove.luau",
    ["Chain Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/ChainGlove.luau",
    ["Lamp Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/LampGlove.luau",
    ["Bob Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/BobGlove.luau",
    ["IceSkate Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/IceSkateGlove.luau",
    ["Glovel Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/GlovelGlove.luau",
    ["Knockoff Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/KnockoffGlove.luau",
    ["Alchemist Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AlchemistGlove.luau",
    ["Buddies Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/BuddiesGlove.luau",
    ["Angler Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/AnglerGlove.luau",
    ["Spoonful Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/SpoonfulGlove.luau",
    ["Voodoo Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/VoodooGlove.luau",
    ["Fish Glove"] = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Gloves/FishGlove.luau"
}

for name, link in pairs(gloveScripts) do
    GlovesTab:AddButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(link))()
        end
    })
end

local featureScripts ={
["Hide Name (Client)"] = "https://raw.githubusercontent.com/isaberjan420/Roblox/refs/heads/main/Slap%20Battles/NameHider"
}

for name, link in pairs(featureScripts) do
    FeaturesTab:AddButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(link))()
        end
    })
end

local featuresScripts
["Slap Aura"] = "" -- put the slap aura here lmao only the link
}

for name, link in pairs(featuresScripts) do
    FeaturesTab:AddToggle({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(link))()
        end
    })
end

local trollScripts = {
["Fling Gui V1"] = "https://raw.githubusercontent.com/TheWExploiter/FlingGuiV1/refs/heads/main/FlingGUIV1.lua"
}

for name, link in pairs(trollScripts) do
    TrollTab:AddButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(link))()
        end
    })
end

CreditsTab:AddParagraph("Made By : ImCatTrust! (TheEpicGamer16Yt)")
CreditsTab:AddParagraph("Get Glove Scripts By : Nexer1234!")

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

FeaturesTab:AddButton({
    Name = "Server Hop (Random 10-16 Players)",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local cursor = ""
        local servers = {}

        repeat
            local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor
            local data = HttpService:JSONDecode(game:HttpGet(url))
            for _, server in ipairs(data.data) do
                if server.playing >= 10 and server.playing <= 16 and server.id ~= game.JobId then
                    table.insert(servers, server)
                end
            end
            cursor = data.nextPageCursor or ""
        until not cursor or #servers >= 25

        if #servers > 0 then
            local chosen = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(PlaceId, chosen.id)
        else
            OrionLib:MakeNotification({
                Name = "No Servers Found",
                Content = "No 10–16 player servers available!",
                Time = 5
            })
        end
    end
})

FeaturesTab:AddButton({
    Name = "Server Hop (Lowest Ping)",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local cursor = ""
        local bestServer = nil

        repeat
            local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor
            local data = HttpService:JSONDecode(game:HttpGet(url))
            for _, server in ipairs(data.data) do
                if server.ping and server.id ~= game.JobId then
                    if not bestServer or server.ping < bestServer.ping then
                        bestServer = server
                    end
                end
            end
            cursor = data.nextPageCursor or ""
        until not cursor

        if bestServer then
            TeleportService:TeleportToPlaceInstance(PlaceId, bestServer.id)
        else
            OrionLib:MakeNotification({
                Name = "No Server Found",
                Content = "Could not find server with ping data!",
                Time = 5
            })
        end
    end
})

FeaturesTab:AddButton({
    Name = "Server Hop (Under 5 Players)",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local cursor = ""
        local target = nil

        repeat
            local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor
            local data = HttpService:JSONDecode(game:HttpGet(url))
            for _, server in ipairs(data.data) do
                if server.playing < 5 and server.id ~= game.JobId then
                    target = server
                    break
                end
            end
            cursor = data.nextPageCursor or ""
        until not cursor or target

        if target then
            TeleportService:TeleportToPlaceInstance(PlaceId, target.id)
        else
            OrionLib:MakeNotification({
                Name = "No Low Server",
                Content = "No servers under 5 players found!",
                Time = 5
            })
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


OrionLib:Init()
