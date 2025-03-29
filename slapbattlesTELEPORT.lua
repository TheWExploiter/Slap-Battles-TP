local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- GUI Button to open the menu
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 150, 0, 60)
toggleButton.Position = UDim2.new(1, -160, 0.1, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Open Menu"
toggleButton.TextScaled = true
addUICorner(toggleButton, 10)

-- Main Frame for the menu
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 500)  -- Increased the height of the frame
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)  -- Center the GUI
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

-- Scrollable Frame inside the main frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.CanvasSize = UDim2.new(0, 0, 4, 0)  -- Increased canvas size for longer scrolling
scrollFrame.ScrollBarThickness = 10
scrollFrame.BackgroundTransparency = 1

-- Section Title
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Parent = scrollFrame
sectionTitle.Size = UDim2.new(1, 0, 0, 40)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "Teleport GUI Made by Cat"
sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
sectionTitle.TextSize = 20
sectionTitle.Font = Enum.Font.SourceSansBold
sectionTitle.TextScaled = true

-- Close Button for the menu
local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.TextScaled = true
addUICorner(closeButton, 10)

-- Teleport Buttons
local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = scrollFrame
tpButton1.Size = UDim2.new(0, 300, 0, 40)
tpButton1.Position = UDim2.new(0.5, -150, 0.2, -10)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place"
tpButton1.TextScaled = true
addUICorner(tpButton1, 10)

local tpButton2 = tpButton1:Clone()
tpButton2.Parent = scrollFrame
tpButton2.Position = UDim2.new(0.5, -150, 0.35, -10)
tpButton2.Text = "Teleport: Guide Place (Outside)"

local tpButton3 = Instance.new("TextButton")
tpButton3.Parent = scrollFrame
tpButton3.Size = UDim2.new(0, 300, 0, 40)
tpButton3.Position = UDim2.new(0.5, -150, 0.5, -10)
tpButton3.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
tpButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton3.Text = "Teleport: Starter Island"
tpButton3.TextScaled = true
addUICorner(tpButton3, 10)

-- Anti-Void Button
local antiVoid = Instance.new("TextButton")
antiVoid.Parent = scrollFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0.65, -10)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
antiVoid.TextScaled = true
addUICorner(antiVoid, 10)

-- Anti-Ban Button
local antiBan = Instance.new("TextButton")
antiBan.Parent = scrollFrame
antiBan.Size = UDim2.new(0, 300, 0, 40)
antiBan.Position = UDim2.new(0.5, -150, 0.8, -10)
antiBan.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
antiBan.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBan.Text = "Activate Anti-Ban"
antiBan.TextScaled = true
addUICorner(antiBan, 10)

-- Toggle the visibility of the main menu
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Close the menu
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
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-0, -4, -0)
    end
end)

-- Anti-Void Functionality
antiVoid.MouseButton1Click:Connect(function()
    -- Remove any existing void parts to prevent duplicates
    for _, part in pairs(game.Workspace:GetChildren()) do
        if part.Name == "VoidGuard" then
            part:Destroy()
        end
    end

    -- Create the Anti-Void part with collision enabled
    local voidGuard = Instance.new("Part")
    voidGuard.Name = "VoidGuard"  -- Set a name to identify the part
    voidGuard.Size = Vector3.new(1000000, 15, 1000000)  -- Size of the void guard
    voidGuard.Position = Vector3.new(-82, -8, 87)  -- Correct position
    voidGuard.Anchored = true  -- Keep the part anchored
    voidGuard.CanCollide = true  -- Enable collision
    voidGuard.Transparency = 0.8  -- Make it 80% transparent
    voidGuard.BrickColor = BrickColor.new("Institutional white")  -- Make the part white for visibility
    voidGuard.Parent = game.Workspace  -- Place it in the workspace
end)

-- Anti-Ban Functionality
antiBan.MouseButton1Click:Connect(function()
    -- Fire the "Ban" remote event (this would be used server-side to handle banning)
    local remoteEvent = game.ReplicatedStorage:WaitForChild("Ban")
    remoteEvent:FireServer()
end)
