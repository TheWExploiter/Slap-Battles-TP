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
    Name = "Troll",
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

local TrollScripts = {
    
    ["Fling GUI V1"] = "https://raw.githubusercontent.com/TheWExploiter/FlingGuiV1/refs/heads/main/FlingGUIV1.lua"

}

for name, link in pairs(TrollScripts) do
    TrollTab:AddButton({
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

CreditsTab:AddParagraph("Made By : ImCatTrust (TheEpicGamer16Yt)")
CreditsTab:AddParagraph("Get Glove Scripts By : Nexer1234")

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
