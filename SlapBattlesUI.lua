local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

-- Display user info in HomeTab
HomeTab:addLabel("Welcome, " .. username .. "!", "", 36)
HomeTab:addImage(avatarUrl, {100, 100})
HomeTab:addLabel("Join my Discord: https://discord.gg/6cVygU3NHU", "", 24)

-- Teleport function
local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

-- Teleports in TeleportsTab
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)

-- Teleport to player by username
TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Features Tab
FeaturesTab:addLabel("Features", "Additional functionalities")

-- WalkSpeed functionality
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

-- Anti Ragdoll
local antiRagdollEnabled = false
FeaturesTab:addButton("Toggle Anti-Ragdoll", function()
    antiRagdollEnabled = not antiRagdollEnabled
    if antiRagdollEnabled then
        local function disableRagdoll()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
        player.CharacterAdded:Connect(function()
            task.wait(1)
            disableRagdoll()
        end)
        disableRagdoll()
    end
end)
