-- Made By KingSameAlotNOTFAKE

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- GUI Container
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(1, -160, 0.1, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Open Menu"
toggleButton.TextScaled = true
addUICorner(toggleButton, 10)

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.2, -10)  -- Moved up to avoid clipping with the floor
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
scrollFrame.ScrollBarThickness = 10
scrollFrame.BackgroundTransparency = 1

-- Section Title (Removed multiple sections as per the request)
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

-- Anti-Void Button
local antiVoid = Instance.new("TextButton")
antiVoid.Parent = scrollFrame
antiVoid.Size = UDim2.new(0, 350, 0, 40)
antiVoid.Position = UDim2.new(0.5, -175, 0.2, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

-- Teleports
local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 350, 0, 40)
tpButton1.Position = UDim2.new(0.5, -175, 0.4, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Starter Island"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = Instance.new("TextButton")
tpButton2.Parent = scrollFrame
tpButton2.Size = UDim2.new(0, 350, 0, 40)
tpButton2.Position = UDim2.new(0.5, -175, 0.5, -10)
tpButton2.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton2.Text = "Teleport: Guide Place (Outside)"
tpButton2.TextScaled = true
addUICorner(tpButton2, 10)

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 350, 0, 40)
tpButton3.Position = UDim2.new(0.5, -175, 0.6, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport: Guide Place (Inside)"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

-- Anti-Void Function
antiVoid.MouseButton1Click:Connect(function()
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 2, 1000000)
    voidGuard.Position = Vector3.new(-82, -8, 87)
    voidGuard.Anchored = true
    voidGuard.CanCollide = true
    voidGuard.Transparency = 0.7
    voidGuard.Parent = game.Workspace
end)

-- Teleport Functionality
tpButton1.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-0, -4, 0)  -- Starter Island Coordinates
    end
end)

tpButton2.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17934, -130, -3600)
    end
end)

tpButton3.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539)
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

-- Add the small draggable gray ball
local dragBall = Instance.new("Part")
dragBall.Parent = screenGui
dragBall.Size = Vector3.new(1, 1, 1)
dragBall.Position = Vector3.new(0, 10, 0)
dragBall.Shape = Enum.PartType.Ball
dragBall.Color = Color3.fromRGB(169, 169, 169)  -- Gray color
dragBall.Anchored = false
dragBall.CanCollide = false
dragBall.Name = "DragBall"
dragBall.Parent = screenGui

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

dragBall.InputBegan:Connect(function(input)
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

dragBall.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
