local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local Window = Library:CreateWindow("Teleport UI", "Made by Nugget")

local Tab = Window:addPage("Home", 1, true, 6)

Tab:addLabel("Teleport UI", "Select a location to teleport")

local function teleportTo(x, y, z) local player = game.Players.LocalPlayer if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z)) end end

Tab:addButton("Normal Arena", function() teleportTo(-14, 66, -1) end)

Tab:addButton("Slapple Island", function() teleportTo(-395, 51, -13) end)

Tab:addButton("Cannon Island", function() teleportTo(263, 33, 197) end)

Tab:addButton("Guide Room (Inside)", function() teleportTo(17894, -130, -3542) end)

Tab:addButton("Guide Room (Outside)", function() teleportTo(17938, -130, -3598) end)

Tab:addSlider("WalkSpeed", 16, 500, function(value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value end)

Tab:addToggle("Toggle", function(value) print("Toggle state: ", value) end)

Tab:addTextBox("TextBox", "Input", function(value) print("TextBox input: ", value) end)

Tab:addLabel("Credits", "UI Created by ImCatTrust")

