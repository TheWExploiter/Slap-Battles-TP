local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6) 
local TeleportsTab = Window:addPage("Teleports", 1, true, 6) 
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer

game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Made By Cat",
            Text = "Havd Fun Using My Script",
            Duration = 10
    })

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
local slapReachParts = {}

-- Update Slap Reach position
game:GetService("RunService").Heartbeat:Connect(function()
    if slapReachEnabled then
        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                if targetHumanoid then
                    -- Create or update the slap reach box around the player
                    if not slapReachParts[targetPlayer] then
                        local slapPart = Instance.new("Part")
                        slapPart.Size = Vector3.new(15, 15, 15)  -- Set the desired hitbox size here (15x15x15)
                        slapPart.Anchored = true
                        slapPart.CanCollide = false
                        slapPart.Transparency = 0.8
                        slapPart.Color = Color3.fromRGB(255, 0, 0)
                        slapPart.Parent = targetPlayer.Character
                        slapReachParts[targetPlayer] = slapPart
                    end

                    -- Update the slap part to match the player's position
                    local targetRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRootPart then
                        slapReachParts[targetPlayer].CFrame = targetRootPart.CFrame
                    end
                end
            end
        end
    else
        -- Remove the slap reach box when disabled
        for _, slapPart in pairs(slapReachParts) do
            if slapPart then
                slapPart:Destroy()
            end
        end
        slapReachParts = {}
    end
end)

FeaturesTab:addToggle("Slap Reach", function(value)
    slapReachEnabled = value
end, false)

-- Slap Function (Expands hitbox and makes the player slap others in the hitbox range)
game:GetService("RunService").Heartbeat:Connect(function()
    if slapReachEnabled then
        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart and slapReachParts[targetPlayer] then
                    -- This checks if the slap part is within 15 studs of the player's root part
                    if (slapReachParts[targetPlayer].Position - targetHumanoidRootPart.Position).Magnitude <= 15 then
                        -- You can apply your slap behavior here (e.g., knockback, damage, etc.)
                        -- For now, we simulate it with a simple knockback (apply custom behavior as needed)
                        targetPlayer.Character.HumanoidRootPart.Velocity = targetHumanoidRootPart.CFrame.LookVector * 50
                    end
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
