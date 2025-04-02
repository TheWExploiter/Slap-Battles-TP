local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6) 
local TeleportsTab = Window:addPage("Teleports", 1, true, 6) 
local FeaturesTab = Window:addPage("Features", 1, true, 6)
local CreditsTab = Window:addPage("Credits", 1, true, 6)

local player = game.Players.LocalPlayer 
local username = player.Name 

-- Teleports
local function teleportTo(x, y, z) 
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z)) 
    end 
end

-- Credits lol
CreditsTab:addLabel("Made By Cat")
CreditsTab:addLabel("Tested By Dorinel, TotallyNotAnAlt193")

-- Teleports Section
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)
TeleportsTab:addButton("New Fight Arena", function() teleportTo(3419, 260, -18) end)

-- Anti Void
local antiVoidPart = Instance.new("Part")
antiVoidPart.Size = Vector3.new(100000, 2, 100000)
antiVoidPart.Position = Vector3.new(0, -12, 0)
antiVoidPart.Anchored = true
antiVoidPart.Color = Color3.fromRGB(255, 255, 255)
antiVoidPart.Transparency = 1
antiVoidPart.CanCollide = true
antiVoidPart.Parent = game.Workspace

FeaturesTab:addToggle("Anti Void", function(value) 
    if value then 
        antiVoidPart.Transparency = 0.7 
        antiVoidPart.CanCollide = true
    else
        antiVoidPart.Transparency = 1 
        antiVoidPart.CanCollide = false
    end
end, true)

-- Discord Invite
HomeTab:addButton("Copy Invite to Discord", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
end)

-- Teleport to Player
TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value) 
    local targetPlayer = game.Players:FindFirstChild(value) 
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then 
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame 
    end 
end)

-- New Fight Arena Platform at Y: 257
local platform = Instance.new("Part")
platform.Size = Vector3.new(100, 2, 100)  -- Platform dimensions
platform.Position = Vector3.new(-440, 257, -18)  -- Platform placed at X: -440, Y: 257, Z: -18
platform.Anchored = true
platform.Color = Color3.fromRGB(255, 255, 255)  -- White color for the platform
platform.CanCollide = true
platform.Parent = game.Workspace

-- Welcome message
HomeTab:addLabel("Welcome, " .. username .. "!", "", 36)
HomeTab:addLabel("Join my Discord: https://discord.gg/6cVygU3NHU", "")
