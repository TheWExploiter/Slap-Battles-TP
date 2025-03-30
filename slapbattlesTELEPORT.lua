local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 150, 0, 60)
toggleButton.Position = UDim2.new(1, -160, 0.1, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Open Menu"
toggleButton.TextScaled = true
addUICorner(toggleButton, 10)

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 600)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
scrollFrame.Size = UDim2.new(1, 0, 2, 0)
scrollFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
scrollFrame.ScrollBarThickness = 10
scrollFrame.BackgroundTransparency = 1

-- Add background gradient to scrollFrame
local gradient = Instance.new("UIGradient")
gradient.Parent = scrollFrame
gradient.Color = ColorSequence.new({ 
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
})
gradient.Rotation = 45

local sectionTitle1 = Instance.new("TextLabel")
sectionTitle1.Parent = scrollFrame
sectionTitle1.Size = UDim2.new(1, 0, 0, 40)
sectionTitle1.BackgroundTransparency = 1
sectionTitle1.Text = "ImCatTrust's Gui"
sectionTitle1.TextColor3 = Color3.fromRGB(255, 255, 255)
sectionTitle1.TextSize = 20
sectionTitle1.Font = Enum.Font.SourceSansBold
sectionTitle1.TextScaled = true

local sectionTitle2 = sectionTitle1:Clone()
sectionTitle2.Parent = scrollFrame
sectionTitle2.Position = UDim2.new(0, 0, 0.3, 10)
sectionTitle2.Text = "Teleportations"

local sectionTitle3 = sectionTitle1:Clone()
sectionTitle3.Parent = scrollFrame
sectionTitle3.Position = UDim2.new(0, 0, 0.6, 10)
sectionTitle3.Text = "Other Features"

local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.TextScaled = true
addUICorner(closeButton, 10)

local antiVoid = Instance.new("TextButton")
antiVoid.Parent = scrollFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0.1, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 300, 0, 40)
tpButton1.Position = UDim2.new(0.5, -150, 0.35, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = tpButton1:Clone()
tpButton2.Parent = scrollFrame
tpButton2.Position = UDim2.new(0.5, -150, 0.45, -10)
tpButton2.Text = "Teleport: Guide Place (Outside)"

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 300, 0, 40)
tpButton3.Position = UDim2.new(0.5, -150, 0.55, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport: Starter Island"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

local speedBox = Instance.new("TextBox")
speedBox.Parent = scrollFrame
speedBox.Size = UDim2.new(0, 300, 0, 40)
speedBox.Position = UDim2.new(0.5, -150, 0.65, -10)
speedBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
speedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
speedBox.Text = "Speed"
speedBox.TextScaled = true
addUICorner(speedBox, 10)

local slapAuraToggle = Instance.new("TextButton")
slapAuraToggle.Parent = scrollFrame
slapAuraToggle.Size = UDim2.new(0, 300, 0, 40)
slapAuraToggle.Position = UDim2.new(0.5, -150, 0.75, -10)
slapAuraToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
slapAuraToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
slapAuraToggle.Text = "Toggle Slap Aura (Broken)"
slapAuraToggle.TextScaled = true
addUICorner(slapAuraToggle, 10)

-- Anti Void Function
antiVoid.MouseButton1Click:Connect(function()
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 2, 1000000)
    voidGuard.Position = Vector3.new(-82, -13, 87)
    voidGuard.Anchored = true
    voidGuard.CanCollide = true
    voidGuard.Transparency = 0.8
    voidGuard.Parent = game.Workspace
end)

-- Teleports
tpButton1.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539)
    end
end)

tpButton2.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17934, -130, -3600)
    end
end)

tpButton3.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-0, -4, 0)
    end
end)

-- Speed Control
speedBox.FocusLost:Connect(function()
    local speedValue = tonumber(speedBox.Text)
    if speedValue then
        player.Character.Humanoid.WalkSpeed = speedValue
    else
        player.Character.Humanoid.WalkSpeed = 50 -- Default speed
    end
end)

-- Slap Aura (Hitbox Extender and Auto Slap)
local slapAuraEnabled = false
slapAuraToggle.MouseButton1Click:Connect(function()
    slapAuraEnabled = not slapAuraEnabled
    slapAuraToggle.BackgroundColor3 = slapAuraEnabled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 0)
end)

-- Handle Slap Aura logic (if enabled)
game:GetService("RunService").Heartbeat:Connect(function()
    if slapAuraEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < 20 then -- Slap distance
                    -- Apply slap damage or effects here
                end
            end
        end
    end
end)

-- Toggle GUI Visibility
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Close Button
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)
