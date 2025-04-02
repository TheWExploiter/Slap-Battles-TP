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

-- Discord Invite Button
HomeTab:addButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
    print("Discord Invite Copied!")
end)

-- Teleport buttons for various locations
TeleportsTab:addButton("Normal Arena", function()
    print("Teleporting to Normal Arena")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-14, 66, -1)
    end
end)

TeleportsTab:addButton("Slapple Island", function()
    print("Teleporting to Slapple Island")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-395, 51, -13)
    end
end)

TeleportsTab:addButton("Cannon Island", function()
    print("Teleporting to Cannon Island")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(263, 33, 197)
    end
end)

TeleportsTab:addButton("Guide Room (Inside)", function()
    print("Teleporting to Guide Room (Inside)")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17894, -130, -3542)
    end
end)

TeleportsTab:addButton("Guide Room (Outside)", function()
    print("Teleporting to Guide Room (Outside)")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17938, -130, -3598)
    end
end)

TeleportsTab:addButton("New Fight Arena", function()
    print("Teleporting to New Fight Arena")
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(3419, 260, -18)
    end
end)

TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
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

-- Anti Void - Adjusted as requested
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

-- Automatic teleport if below -14
game:GetService("RunService").Heartbeat:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if player.Character.HumanoidRootPart.Position.Y < -14 then
            print("Player below -14, teleporting to Normal Arena.")
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-14, 66, -1)
        end
    end
end)
