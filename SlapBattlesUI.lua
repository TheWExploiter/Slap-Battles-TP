local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

HomeTab:addLabel("Welcome, " .. username .. "!", "", 36)

local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

-- Teleports Section
TeleportsTab:addButton("Normal Arena", function()
    teleportTo(-14, 66, -1)  -- Normal Arena
end)

TeleportsTab:addButton("Slapple Island", function()
    teleportTo(-395, 51, -13)  -- Slapple Island
end)

TeleportsTab:addButton("Cannon Island", function()
    teleportTo(263, 33, 197)  -- Cannon Island
end)

TeleportsTab:addButton("Guide Room (Inside)", function()
    teleportTo(17894, -130, -3542)  -- Guide Room Inside
end)

TeleportsTab:addButton("Guide Room (Outside)", function()
    teleportTo(17938, -130, -3598)  -- Guide Room Outside
end)

-- New Fight Arena Teleport
TeleportsTab:addButton("New Fight Arena", function()
    teleportTo(3419, 260, -18)  -- New Fight Arena location (Y = 260)
end)

-- Platform at New Fight Arena
local platform = Instance.new("Part")
platform.Size = Vector3.new(50, 2, 50)  -- Adjust size if needed
platform.Position = Vector3.new(3419, 258, -18)  -- Platform position at Y = 258
platform.Anchored = true
platform.Color = Color3.fromRGB(255, 0, 0)  -- You can change the color if needed
platform.CanCollide = true
platform.Parent = game.Workspace

-- Anti Void functionality
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

FeaturesTab:addLabel("Anti Void", "Toggle to enable")

-- Teleport to Player
TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Server Hop Button
TeleportsTab:addButton("Server Hop (Broken)", function()
    local id = 6403373529  -- Server ID for the server hop
    game:GetService("TeleportService"):Teleport(id, player)
end)

-- Speed Textbox
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num then
        player.Character.Humanoid.WalkSpeed = num
    end
end)
