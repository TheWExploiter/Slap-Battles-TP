local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

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

-- Teleport Buttons
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)

-- Anti Ragdoll Button
local antiRagdollEnabled = false
local lastAntiRagdollTime = 0
FeaturesTab:addButton("Toggle Anti-Ragdoll", function()
    local currentTime = tick()
    if currentTime - lastAntiRagdollTime >= 2 then
        antiRagdollEnabled = not antiRagdollEnabled
        lastAntiRagdollTime = currentTime
        if antiRagdollEnabled then
            local function disableRagdoll()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                end
            end
            disableRagdoll()
        end
    end
end)

-- Anti Void Platform
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

-- Slap Reach (Hitbox)
local slapReachEnabled = false
local slapReachPart = Instance.new("Part")
slapReachPart.Size = Vector3.new(15, 15, 15)
slapReachPart.Anchored = true
slapReachPart.CanCollide = false
slapReachPart.Transparency = 0.8
slapReachPart.Color = Color3.fromRGB(255, 0, 0)
slapReachPart.Parent = player.Character or game.Workspace

-- Update Slap Reach position
game:GetService("RunService").Heartbeat:Connect(function()
    if slapReachEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        slapReachPart.CFrame = player.Character.HumanoidRootPart.CFrame
    end
end)

FeaturesTab:addToggle("Slap Reach", function(value)
    slapReachEnabled = value
end, false)

-- Slap Function
game:GetService("RunService").Heartbeat:Connect(function()
    if slapReachEnabled then
        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart and slapReachPart and (slapReachPart.Position - targetHumanoidRootPart.Position).Magnitude <= 15 then
                    -- Apply slap to target (simple damage or knockback, adjust as needed)
                    targetPlayer.Character:BreakJoints()  -- Simulates a slap by breaking joints (use with caution)
                end
            end
        end
    end
end)

-- Discord Invite Button
HomeTab:addButton("Join Our Discord", function()
    -- Discord invite link
    local discordInviteLink = "https://discord.gg/6cVygU3NHU"
    
    -- Open the discord link in the browser
    local success, errorMsg = pcall(function()
        setclipboard(discordInviteLink)
    end)
    if success then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Discord Invite",
            Text = "Invite copied to clipboard! Join us now!",
            Duration = 5
        })
    else
        warn("Error copying Discord invite: " .. errorMsg)
    end
end)
