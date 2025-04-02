local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

-- Create Window with expanded width
local Window = Library:CreateWindow("Teleport UI", "Made by ImCatTrust", {700, 450})  -- Increased width (600) and height (400)

-- Create Tabs with expanded size
local HomeTab = Window:addPage("Home", 1, true, 6, {600, 400})  -- Set width and height for tabs
local TeleportsTab = Window:addPage("Teleports", 1, true, 6, {600, 400})
local FeaturesTab = Window:addPage("Features", 1, true, 6, {600, 400})

local player = game.Players.LocalPlayer
local username = player.Name
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

-- Add the welcome label and remove the image (as you requested)
HomeTab:addLabel("Welcome, " .. username .. "!", "", 36)
HomeTab:addLabel("Join my Discord: https://discord.gg/6cVygU3NHU", "")

local function teleportTo(x, y, z)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z))
    end
end

-- Add Teleports
TeleportsTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)
TeleportsTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)
TeleportsTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)
TeleportsTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)
TeleportsTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)
TeleportsTab:addButton("New Fight Arena", function() teleportTo(3419, 260, -18) end)

-- Add the platform for New Fight Arena at Y = 257
local newArenaPlatform = Instance.new("Part")
newArenaPlatform.Size = Vector3.new(50, 1, 50)
newArenaPlatform.Position = Vector3.new(3419, 257, -18)  -- Platform at Y = 257
newArenaPlatform.Anchored = true
newArenaPlatform.Color = Color3.fromRGB(255, 0, 0)  -- Red platform
newArenaPlatform.CanCollide = true
newArenaPlatform.Parent = game.Workspace

-- Add server hop button
TeleportsTab:addButton("Server Hop", function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = 6403373529
    local player = game.Players.LocalPlayer

    local servers = {}
    local success, result = pcall(function()
        servers = TeleportService:GetSortedJoinablePlaces(placeId)
    end)

    if success and #servers > 0 then
        local server = servers[math.random(1, #servers)]  -- Choose a random server
        TeleportService:TeleportToPlaceInstance(placeId, server, player)
    else
        print("Could not find servers.")
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

FeaturesTab:addLabel("Anti Void", "Toggle to enable")

-- WalkSpeed Textbox
FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value)
    local num = tonumber(value)
    if num then
        player.Character.Humanoid.WalkSpeed = num
    end
end)

-- Teleport when player is below Y=-14
game:GetService("RunService").Heartbeat:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if player.Character.HumanoidRootPart.Position.Y < -14 then
            teleportTo(-14, 66, -1)
        end
    end
end)
