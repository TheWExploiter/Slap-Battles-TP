local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

-- Create Tabs
local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name

-- ScrollFrame for sections
HomeTab:addScrollFrame()
TeleportsTab:addScrollFrame()
FeaturesTab:addScrollFrame()

-- Welcome Message
HomeTab:addLabel("Welcome, " .. username .. "!", "", 48) -- Larger text

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

-- Potato Emoji Button (Kicks Player)
FeaturesTab:addButton("🥔 Potato Button", function()
    game.Players.LocalPlayer:Kick("🥔")
end)

-- Teleport Functions
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

TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Features
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num then
        player.Character.Humanoid.WalkSpeed = num
    end
end)

-- Anti Void Teleport if Below Y = -14
game:GetService("RunService").Heartbeat:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local position = player.Character.HumanoidRootPart.Position
        if position.Y < -14 then
            teleportTo(-14, 66, -1) -- Teleport to Normal Arena
        end
    end
end)
