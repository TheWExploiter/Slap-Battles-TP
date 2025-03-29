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
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(1, -130, 0.1, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Open Menu"
toggleButton.TextScaled = true
addUICorner(toggleButton, 10)

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 250, 0, 400)
mainFrame.Position = UDim2.new(0.5, -125, 0.3, -10)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

local leftFrame = Instance.new("Frame")
leftFrame.Parent = mainFrame
leftFrame.Size = UDim2.new(0, 100, 1)
leftFrame.Position = UDim2.new(0, 0, 0, 0)
leftFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local rightFrame = Instance.new("Frame")
rightFrame.Parent = mainFrame
rightFrame.Size = UDim2.new(0, 150, 1)
rightFrame.Position = UDim2.new(0, 100, 0, 0)
rightFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = rightFrame
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
scrollFrame.ScrollBarThickness = 10
scrollFrame.BackgroundTransparency = 1

local sectionTitle = Instance.new("TextLabel")
sectionTitle.Parent = scrollFrame
sectionTitle.Size = UDim2.new(1, 0, 0, 40)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "Player Enhancements"
sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
sectionTitle.TextSize = 20
sectionTitle.Font = Enum.Font.SourceSansBold
sectionTitle.TextScaled = true

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
antiVoid.Parent = leftFrame
antiVoid.Size = UDim2.new(0, 100, 0, 40)
antiVoid.Position = UDim2.new(0, 10, 0.2, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

local antiRagdoll = Instance.new("TextButton")
antiRagdoll.Parent = leftFrame
antiRagdoll.Size = UDim2.new(0, 100, 0, 40)
antiRagdoll.Position = UDim2.new(0, 10, 0.35, -10)
antiRagdoll.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
antiRagdoll.TextColor3 = Color3.fromRGB(255, 255, 255)
antiRagdoll.Text = "Toggle Anti-Ragdoll"
antiRagdoll.TextScaled = true
addUICorner(antiRagdoll, 10)

local teleportTitle = sectionTitle:Clone()
teleportTitle.Parent = scrollFrame
teleportTitle.Position = UDim2.new(0, 0, 0.5, -10)
teleportTitle.Text = "Teleports"

local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 300, 0, 40)
tpButton1.Position = UDim2.new(0.5, -150, 0.6, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = tpButton1:Clone()
tpButton2.Parent = scrollFrame
tpButton2.Position = UDim2.new(0.5, -150, 0.75, -10)
tpButton2.Text = "Teleport: Platform"

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 300, 0, 40)
tpButton3.Position = UDim2.new(0.5, -150, 0.85, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport to Player"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

-- New teleport for "Guide Place (Outside)"
local tpButton4 = Instance.new("TextButton")
tpButton4.Parent = scrollFrame
tpButton4.Size = UDim2.new(0, 300, 0, 40)
tpButton4.Position = UDim2.new(0.5, -150, 0.95, -10)
tpButton4.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
tpButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton4.Text = "Teleport: Guide Place (Outside)"
tpButton4.TextScaled = true
addUICorner(tpButton4, 10)

tpButton4.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17934, -130, -3600)
    end
end)

antiVoid.MouseButton1Click:Connect(function()
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 2, 1000000)
    voidGuard.Position = Vector3.new(-6, -1, 0)
    voidGuard.Anchored = true
    voidGuard.CanCollide = false
    voidGuard.Parent = game.Workspace
end)

antiRagdoll.MouseButton1Click:Connect(function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = not humanoid.PlatformStand
    end
end)

-- Credits Tab
local creditsTitle = Instance.new("TextLabel")
creditsTitle.Parent = scrollFrame
creditsTitle.Size = UDim2.new(1, 0, 0, 40)
creditsTitle.Position = UDim2.new(0, 0, 1, 10)
creditsTitle.BackgroundTransparency = 1
creditsTitle.Text = "Credits"
creditsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsTitle.TextSize = 20
creditsTitle.Font = Enum.Font.SourceSansBold
creditsTitle.TextScaled = true

local creditsText = Instance.new("TextLabel")
creditsText.Parent = scrollFrame
creditsText.Size = UDim2.new(1, 0, 0, 80)
creditsText.Position = UDim2.new(0, 0, 1.1, 0)
creditsText.BackgroundTransparency = 1
creditsText.Text = "Special Thanks to:\nImCatTrust"
creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsText.TextSize = 16
creditsText.Font = Enum.Font.SourceSans
creditsText.TextWrapped = true
creditsText.TextScaled = true

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Drag to move the GUI
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if not dragging then
                return
            end
            update(input)
        end)
    end
end)

toggleButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
