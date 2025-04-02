local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

-- Show Loading Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Loading...";
    Text = "Please wait while the script is loading...";
    Duration = 10;
})

wait(10)

-- Show Completion Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Loading Complete!";
    Text = "Made By Cat! Enjoy My Script!";
    Duration = 5;
})

-- Create UI
local Window = Library:CreateWindow("Ultimate Script UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer

-- Teleport Function
local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

-- Home Section
HomeTab:addLabel("Welcome to the Script!")
HomeTab:addLabel("Made by Cat")
HomeTab:addButton("🥔 (Kicks You)", function()
    game:GetService("Players").LocalPlayer:Kick("🥔")
end)

-- Teleport Buttons
TeleportsTab:addLabel("Teleport Locations")
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17894, -90, -3542) end)

-- Features Section
FeaturesTab:addLabel("Features")

-- Speed Changer
local speedValue = 16
FeaturesTab:addTextbox("Speed", "Enter Speed Here", function(value)
    local speedNum = tonumber(value)
    if speedNum then
        speedValue = speedNum
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speedValue
        end
    end
end)

-- Anti-Void
local antiVoidPart = Instance.new("Part")
antiVoidPart.Size = Vector3.new(100000, 2, 100000)
antiVoidPart.Position = Vector3.new(0, -12, 0)
antiVoidPart.Anchored = true
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

-- Anti Ragdoll
local function isRagdolled()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health == 0
end

FeaturesTab:addButton("Toggle Anti-Ragdoll", function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Check if player is ragdolled before toggling
        if isRagdolled() then
            player.Character.HumanoidRootPart.Anchored = true
            wait(2)
            player.Character.HumanoidRootPart.Anchored = false
        else
            player.Character.HumanoidRootPart.Anchored = true
            wait(2)
            player.Character.HumanoidRootPart.Anchored = false
        end
    end
end)

-- Discord Button
FeaturesTab:addButton("Join Discord (Copy Link)", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Discord Link Copied!";
        Text = "Paste it in your browser to join!";
        Duration = 5;
    })
end)
