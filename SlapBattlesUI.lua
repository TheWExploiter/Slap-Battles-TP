local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by Nugget")

local HomeTab = Window:addPage("Home", 1, true, 6) local FeaturesTab = Window:addPage("Features", 1, true, 6)

HomeTab:addLabel("Teleport UI", "Select a location to teleport")

local function teleportTo(x, y, z) local player = game.Players.LocalPlayer if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z)) end end

HomeTab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)

HomeTab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)

HomeTab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)

HomeTab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)

HomeTab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)

FeaturesTab:addLabel("Features", "Additional functionalities")

FeaturesTab:addTextBox("WalkSpeed", "Enter speed", function(value) local num = tonumber(value) if num then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num end end)

local antiVoidPart = Instance.new("Part") antiVoidPart.Size = Vector3.new(100000, 2, 100000) antiVoidPart.Position = Vector3.new(0, -12, 0) antiVoidPart.Anchored = true antiVoidPart.Color = Color3.fromRGB(255, 255, 255) antiVoidPart.Transparency = 1 antiVoidPart.CanCollide = true antiVoidPart.Parent = game.Workspace

FeaturesTab:addToggle("Anti Void", function(value) if value then antiVoidPart.Transparency = 0.7 else antiVoidPart.Transparency = 1 end end, true)

FeaturesTab:addLabel("Anti Void", "Toggle to enable")

HomeTab:addLabel("Credits", "UI Created by ImCatTrust")

