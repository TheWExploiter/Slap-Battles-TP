local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6) 
local TeleportsTab = Window:addPage("Teleports", 1, true, 6) 
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

-- Removed executor checker, added other necessary things

HomeTab:addLabel("Welcome, " .. username .. "!", "", 36) 
HomeTab:addImage(avatarUrl, {100, 100})

-- Teleports Section
local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)
TeleportsTab:addButton("New Fight Arena", function() teleportTo(3419, 260, -18) end)

-- New Fight Arena Platform Creation
local platform = Instance.new("Part")
platform.Size = Vector3.new(20, 1, 20)  -- Size of the platform
platform.Position = Vector3.new(3419, 258, -18)  -- Position of the platform (Y = 258)
platform.Anchored = true  -- Ensures the platform stays in place
platform.Color = Color3.fromRGB(255, 0, 0)  -- Red color for visibility
platform.CanCollide = true  -- Allows players to stand on it
platform.Parent = game.Workspace  -- Adds the platform to the workspace

-- Anti Void Section
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

-- Anti Ragdoll Section
local antiRagdollEnabled = false

local function preventRagdoll()
    -- Check if the player's character is available
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        
        -- When ragdolled, anchor the HumanoidRootPart for 1.5 seconds
        if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character.Ragdolled.Value == true then
            humanoidRootPart.Anchored = true
            wait(1.5)
            humanoidRootPart.Anchored = false
        end
    end
end

FeaturesTab:addToggle("Anti Ragdoll", function(value)
    antiRagdollEnabled = value
end, false)

-- Anti Ragdoll Logic
game:GetService("RunService").Heartbeat:Connect(function()
    if antiRagdollEnabled then
        preventRagdoll()
    end
end)

-- Server Hop Section
FeaturesTab:addButton("Server Hop", function()
    local teleportService = game:GetService("TeleportService")
    local placeId = 6403373529
    teleportService:Teleport(placeId, player)
end)

-- Discord Invite Section
HomeTab:addButton("Copy Invite", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
end)
