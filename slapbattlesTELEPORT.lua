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

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
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

-- Anti-Void button
local antiVoid = Instance.new("TextButton")
antiVoid.Parent = scrollFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0.2, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

-- Teleport buttons
local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 300, 0, 40)
tpButton1.Position = UDim2.new(0.5, -150, 0.4, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = tpButton1:Clone()
tpButton2.Parent = scrollFrame
tpButton2.Position = UDim2.new(0.5, -150, 0.55, -10)
tpButton2.Text = "Teleport: Platform"

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 300, 0, 40)
tpButton3.Position = UDim2.new(0.5, -150, 0.7, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport to Player"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

-- Guide Place teleport button (Updated coordinates)
local tpButton4 = Instance.new("TextButton")
tpButton4.Parent = scrollFrame
tpButton4.Size = UDim2.new(0, 300, 0, 40)
tpButton4.Position = UDim2.new(0.5, -150, 0.85, -10)
tpButton4.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
tpButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton4.Text = "Teleport: Guide Place (Outside)"
tpButton4.TextScaled = true
addUICorner(tpButton4, 10)

-- Anti-Void function (lowered by 15 studs)
antiVoid.MouseButton1Click:Connect(function()
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 2, 1000000)
    voidGuard.Position = Vector3.new(-6, -16, 0)  -- 15 studs lower than before
    voidGuard.Anchored = true
    voidGuard.CanCollide = false
    voidGuard.Parent = game.Workspace
end)

-- Teleport to Guide Place
tpButton1.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539)
    end
end)

-- Teleport to Platform
tpButton2.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(18000, -130, -3700)
    end
end)

-- Teleport to the closest player (by username)
tpButton3.MouseButton1Click:Connect(function()
    local targetPlayer = game.Players:GetPlayers()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, otherPlayer in pairs(targetPlayer) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestPlayer = otherPlayer
                closestDistance = distance
            end
        end
    end

    if closestPlayer then
        player.Character.HumanoidRootPart.CFrame = closestPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Teleport to Guide Place (Updated coordinates)
tpButton4.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17934, -130, -3600)
    end
end)

-- Toggle the menu visibility
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Close button functionality
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
