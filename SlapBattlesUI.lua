local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name

-- Welcome Message
HomeTab:addLabel("Welcome, " .. username .. "!", "", 48)

-- Discord Invite Button
HomeTab:addButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
end)

-- Teleport Function
local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

-- Teleports
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)
TeleportsTab:addButton("New Fight Arena", function() teleportTo(3419, 260, -18) end)

-- Create New Fight Arena Platform
local fightArenaPlatform = Instance.new("Part")
fightArenaPlatform.Size = Vector3.new(100, 1, 100)
fightArenaPlatform.Position = Vector3.new(3419, 257, -18)
fightArenaPlatform.Anchored = true
fightArenaPlatform.CanCollide = true
fightArenaPlatform.Color = Color3.fromRGB(255, 0, 0)
fightArenaPlatform.Parent = game.Workspace

-- Teleport to Player
TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Features Tab
FeaturesTab:addLabel("Features", "Additional functionalities")

-- WalkSpeed Functionality
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num then
        player.Character.Humanoid.WalkSpeed = num
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
    else
        antiVoidPart.Transparency = 1
    end
end, true)

FeaturesTab:addLabel("Anti Void", "Toggle to enable")

-- Anti Ragdoll Patch
local function disableRagdoll()
    local v1 = game:GetService("ReplicatedStorage"):FindFirstChild("BACKEND") and game:GetService("ReplicatedStorage").BACKEND:FindFirstChild("Shared")
    if v1 then
        local ragdollHandler = v1:FindFirstChild("RagdollHandler")
        if ragdollHandler then
            ragdollHandler:Destroy()
        end
    end
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        if player.Character:FindFirstChild("Ragdolled") then
            player.Character.Ragdolled.Value = false
        end
    end
end

FeaturesTab:addButton("Toggle Anti-Ragdoll", function()
    disableRagdoll()
    player.CharacterAdded:Connect(function()
        task.wait(1)
        disableRagdoll()
    end)
end)
