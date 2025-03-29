local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Function to make UI elements smooth
local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- Toggle Button (Open GUI)
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 20, 0, 100)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Open GUI"
addUICorner(toggleButton, 10)

-- Main GUI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 300, 0, 180)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.Visible = false
addUICorner(mainFrame, 15)

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
addUICorner(closeButton, 10)

-- Guide Place Teleport Button
local tpButton1 = Instance.new("TextButton")
tpButton1.Parent = mainFrame
tpButton1.Size = UDim2.new(0, 250, 0, 50)
tpButton1.Position = UDim2.new(0.5, -125, 0.3, -25)
tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton1.Text = "Teleport: Guide Place"
addUICorner(tpButton1, 10)

-- Platform Teleport Button
local tpButton2 = Instance.new("TextButton")
tpButton2.Parent = mainFrame
tpButton2.Size = UDim2.new(0, 250, 0, 50)
tpButton2.Position = UDim2.new(0.5, -125, 0.65, -25)
tpButton2.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
tpButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton2.Text = "Teleport: Platform"
addUICorner(tpButton2, 10)

-- Toggle GUI
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Close GUI
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
        player.Character.HumanoidRootPart.CFrame = CFrame.new(18000, -130, -3700)
    end
end)

-- Create the platform at (18000, -130, -3700)
local function createPlatform()
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(50, 2, 50) -- Size of the platform
    platform.Position = Vector3.new(18000, -130, -3700)
    platform.Anchored = true -- Stops it from falling
    platform.CanCollide = true -- Enables collision so players can stand on it
    platform.BrickColor = BrickColor.new("Bright blue") -- Color
    platform.Material = Enum.Material.SmoothPlastic -- Makes it look better

    -- Add rounded edges to the platform
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10) -- Smooth edges
    corner.Parent = platform

    platform.Parent = game.Workspace
end

createPlatform()
