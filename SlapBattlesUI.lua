local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust")

local HomeTab = Window:addPage("Home", 1, true, 6)
local TeleportsTab = Window:addPage("Teleports", 1, true, 6)
local FeaturesTab = Window:addPage("Features", 1, true, 6)

local player = game.Players.LocalPlayer
local username = player.Name

HomeTab:addLabel("Welcome, " .. username .. "!", "", 36)

-- Teleports
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
TeleportsTab:addButton("New Arena (Free Slaps & Null Shards", function() teleportTo(3419, 260, -18) end)

-- Teleport to Player
TeleportsTab:addTextBox("Teleport to Player", "Enter Username", function(value)
    local targetPlayer = game.Players:FindFirstChild(value)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Platform at New Fight Arena
local platform = Instance.new("Part")
platform.Size = Vector3.new(100, 2, 100)
platform.Position = Vector3.new(3419, 257, -18) -- Platform at Fight Arena
platform.Anchored = true
platform.Color = Color3.fromRGB(255, 0, 0) -- Color red for visibility
platform.Parent = game.Workspace

-- Speed control
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num then
        player.Character.Humanoid.WalkSpeed = num
    end
end)

-- Anti Void feature
local antiVoidPart = Instance.new("Part")
antiVoidPart.Size = Vector3.new(100000, 2, 100000)
antiVoidPart.Position = Vector3.new(0, -12, 0)
antiVoidPart.Anchored = true
antiVoidPart.Color = Color3.fromRGB(255, 255, 255)
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

-- Discord Invite Button
HomeTab:addButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/6cVygU3NHU")
end)

-- Slap Reach feature (Expanding other players' hitboxes)
local slapReachEnabled = false
local slapReachBoxes = {}

FeaturesTab:addToggle("Slap Reach (PATCHED!)", function(value)
    slapReachEnabled = value
    if slapReachEnabled then
        -- Expand the hitboxes of all players except the local player by 15 studs
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local character = otherPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    -- Create and move the slap reach box
                    local hitbox = Instance.new("Part")
                    hitbox.Size = Vector3.new(15, 15, 15)  -- Expanding the hitbox size
                    hitbox.Position = character.HumanoidRootPart.Position
                    hitbox.Anchored = false
                    hitbox.Transparency = 0.8
                    hitbox.Color = Color3.fromRGB(0, 255, 0)  -- Green color to distinguish the box
                    hitbox.CanCollide = false
                    hitbox.Parent = game.Workspace
                    
                    -- Make it follow the character
                    local bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(10000, 10000, 10000)
                    bodyPosition.P = 10000
                    bodyPosition.D = 1000
                    bodyPosition.Parent = hitbox
                    bodyPosition.Position = character.HumanoidRootPart.Position
                    
                    slapReachBoxes[otherPlayer.UserId] = hitbox
                end
            end
        end
    else
        -- Remove the expanded hitboxes when disabled
        for _, hitbox in pairs(slapReachBoxes) do
            if hitbox then
                hitbox:Destroy()
            end
        end
        slapReachBoxes = {}
    end
end, false)

-- Anti-Ragdoll Feature
local function freezeCharacterForRagdoll()
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.Anchored = true
        wait(1.5)  -- Freezes the character for 1.5 seconds during ragdoll
        humanoidRootPart.Anchored = false
    end
end

FeaturesTab:addToggle("Anti Ragdoll", function(value)
    if value then
        -- Monitor for ragdoll state
        player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            local ragdollDetector = character:WaitForChild("Ragdolled")
            
            ragdollDetector.Changed:Connect(function()
                if ragdollDetector.Value then
                    freezeCharacterForRagdoll()  -- Freeze if ragdolled
                end
            end)
        end)
    end
end, false)

-- Listen for new players joining and give them the slap reach box
game.Players.PlayerAdded:Connect(function(otherPlayer)
    if slapReachEnabled and otherPlayer ~= player then
        local character = otherPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hitbox = Instance.new("Part")
            hitbox.Size = Vector3.new(15, 15, 15)
            hitbox.Position = character.HumanoidRootPart.Position
            hitbox.Anchored = true
            hitbox.Transparency = 0.8
            hitbox.Color = Color3.fromRGB(0, 255, 0)
            hitbox.CanCollide = false
            hitbox.Parent = game.Workspace
            
            local bodyPosition = Instance.new("BodyPosition")
            bodyPosition.MaxForce = Vector3.new(10000, 10000, 10000)
            bodyPosition.P = 10000
            bodyPosition.D = 1000
            bodyPosition.Parent = hitbox
            bodyPosition.Position = character.HumanoidRootPart.Position
            
            slapReachBoxes[otherPlayer.UserId] = hitbox
        end
    end
end)

-- Listen for players leaving and remove their slap reach box
game.Players.PlayerRemoving:Connect(function(otherPlayer)
    local hitbox = slapReachBoxes[otherPlayer.UserId]
    if hitbox then
        hitbox:Destroy()
        slapReachBoxes[otherPlayer.UserId] = nil
    end
end)
