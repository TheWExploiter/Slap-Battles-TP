local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

-- Create a wider window (increased size)
local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust", { 800, 600 }) -- Increased window size

-- Create Tabs
local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name

-- Add Welcome Label
HomeTab:addLabel("Welcome, " .. username .. "!", "", 48) -- Larger text
HomeTab:addLabel("Please press the buttons below", "", 24)

-- Test Button - Home Tab
HomeTab:addButton("Test Button", function()
    print("Test Button Clicked")
end)

-- Simple Teleport Button (Normal Arena) - Teleports Tab
TeleportsTab:addButton("Teleport to Normal Arena", function()
    print("Teleporting to Normal Arena")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-14, 66, -1)
    end
end)

-- WalkSpeed adjustment in FeaturesTab
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = num
        print("WalkSpeed set to " .. num)
    end
end)

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
        print("Anti Void Enabled")
    else
        antiVoidPart.Transparency = 1
        antiVoidPart.CanCollide = false
        print("Anti Void Disabled")
    end
end, true)
