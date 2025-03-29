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
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.3, -10)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Teleport Gui Made by Cat"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true

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
sectionTitle.Text = "Teleports"
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

local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 300, 0, 40)
tpButton1.Position = UDim2.new(0.5, -150, 0.2, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place (Inside)"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = Instance.new("TextButton")
tpButton2.Parent = scrollFrame
tpButton2.Size = UDim2.new(0, 300, 0, 40)
tpButton2.Position = UDim2.new(0.5, -150, 0.3, -10)
tpButton2.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton2.Text = "Teleport: Guide Place (Outside)"
tpButton2.TextScaled = true
addUICorner(tpButton2, 10)

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 300, 0, 40)
tpButton3.Position = UDim2.new(0.5, -150, 0.4, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport: Starter Island"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

local tpButton4 = Instance.new("TextButton")
tpButton4.Parent = scrollFrame
tpButton4.Size = UDim2.new(0, 300, 0, 40)
tpButton4.Position = UDim2.new(0.5, -150, 0.5, -10)
tpButton4.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton4.Text = "Teleport: Platform"
tpButton4.TextScaled = true
addUICorner(tpButton4, 10)

local antiVoid = Instance.new("TextButton")
antiVoid.Parent = scrollFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0.6, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

local speedInput = Instance.new("TextBox")
speedInput.Parent = scrollFrame
speedInput.Size = UDim2.new(0, 300, 0, 40)
speedInput.Position = UDim2.new(0.5, -150, 0.7, -10)
speedInput.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
speedInput.TextColor3 = Color3.fromRGB(0, 0, 0)
speedInput.PlaceholderText = "Enter Speed"
speedInput.TextScaled = true
addUICorner(speedInput, 10)

local applySpeedButton = Instance.new("TextButton")
applySpeedButton.Parent = scrollFrame
applySpeedButton.Size = UDim2.new(0, 300, 0, 40)
applySpeedButton.Position = UDim2.new(0.5, -150, 0.8, -10)
applySpeedButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
applySpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
applySpeedButton.Text = "Apply Speed"
applySpeedButton.TextScaled = true
addUICorner(applySpeedButton, 10)

-- Toggle Button Functionality
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        mainFrame:TweenSize(UDim2.new(0, 350, 0, 450), "Out", "Quad", 0.5, true)
    else
        mainFrame:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.5, true)
    end
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Teleport Functions
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
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-6, -5, 0)
    end
end)

tpButton4.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(18000, -130, -3700)
    end
end)

-- Anti-Void Functionality
antiVoid.MouseButton1Click:Connect(function()
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 15, 1000000)
    voidGuard.Position = Vector3.new(-82, -8, 87)
    voidGuard.Anchored = true
    voidGuard.CanCollide = false
    voidGuard.Parent = game.Workspace
end)

-- Speed Adjustment Functionality
applySpeedButton.MouseButton1Click:Connect(function()
    local speed = tonumber(speedInput.Text)
    if speed and speed > 0 then
        player.Character.Humanoid.WalkSpeed = speed
    else
        print("Invalid speed input. Please enter a positive number.")
    end
end)

-- Button Hover Effect
local function onHoverIn(button)
    button:TweenSize(UDim2.new(0, button.Size.X.Offset - 5, 0, button.Size.Y.Offset - 5), "Out", "Quad", 0.2, true)
    button.BackgroundColor3 = button.BackgroundColor3:lerp(Color3.fromRGB(50, 50, 50), 0.5)
end

local function onHoverOut(button)
    button:TweenSize(UDim2.new(0, button.Size.X.Offset + 5, 0, button.Size.Y.Offset + 5), "Out", "Quad", 0.2, true)
    button.BackgroundColor3 = button.BackgroundColor3:lerp(Color3.fromRGB(70, 130, 180), 0.5)
end

tpButton1.MouseEnter:Connect(function() onHoverIn(tpButton1) end)
tpButton1.MouseLeave:Connect(function() onHoverOut(tpButton1) end)

tpButton2.MouseEnter:Connect(function() onHoverIn(tpButton2) end)
tpButton2.MouseLeave:Connect(function() onHoverOut(tpButton2) end)

tpButton3.MouseEnter:Connect(function() onHoverIn(tpButton3) end)
tpButton3.MouseLeave:Connect(function() onHoverOut(tpButton3) end)

tpButton4.MouseEnter:Connect(function() onHoverIn(tpButton4) end)
tpButton4.MouseLeave:Connect(function() onHoverOut(tpButton4) end)

antiVoid.MouseEnter:Connect(function() onHoverIn(antiVoid) end)
antiVoid.MouseLeave:Connect(function() onHoverOut(antiVoid) end)

applySpeedButton.MouseEnter:Connect(function() onHoverIn(applySpeedButton) end)
applySpeedButton.MouseLeave:Connect(function() onHoverOut(applySpeedButton) end)

closeButton.MouseEnter:Connect(function() onHoverIn(closeButton) end)
closeButton.MouseLeave:Connect(function() onHoverOut(closeButton) end)
