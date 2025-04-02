local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- Tween utility function for button click animation
local function tweenButtonClick(btn)
    local originalSize = btn.Size
    local clickTweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenShrink = TweenService:Create(btn, clickTweenInfo, {Size = originalSize * UDim2.new(0.95,0,0.95,0)})
    local tweenGrow = TweenService:Create(btn, clickTweenInfo, {Size = originalSize})
    tweenShrink:Play()
    tweenShrink.Completed:Connect(function()
        tweenGrow:Play()
    end)
end

-- Create Main GUI Frame with open/close animations
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0, -400)  -- start offscreen for tween
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
addUICorner(mainFrame, 15)

local sections = {"Teleports", "Features"}
local buttons = {}
local activeSection = "Teleports"

-- Section Buttons Frame
local sectionFrame = Instance.new("Frame")
sectionFrame.Parent = mainFrame
sectionFrame.Size = UDim2.new(1, 0, 0, 40)
sectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

for i, section in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Parent = sectionFrame
    btn.Size = UDim2.new(1 / #sections, 0, 1, 0)
    btn.Position = UDim2.new((i - 1) / #sections, 0, 0, 0)
    btn.Text = section
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    addUICorner(btn, 10)
    buttons[section] = btn
    btn.MouseButton1Click:Connect(function()
        tweenButtonClick(btn)
        activeSection = section
        for _, child in pairs(mainFrame:GetChildren()) do
            if child:IsA("Frame") and child ~= sectionFrame then
                child.Visible = false
            end
        end
        local targetFrame = mainFrame:FindFirstChild(section)
        if targetFrame then
            targetFrame.Visible = true
        end
    end)
end

-- Teleports Frame
local teleportsFrame = Instance.new("Frame")
teleportsFrame.Parent = mainFrame
teleportsFrame.Name = "Teleports"
teleportsFrame.Size = UDim2.new(1, 0, 1, -40)
teleportsFrame.Position = UDim2.new(0, 0, 0, 40)
teleportsFrame.BackgroundTransparency = 1
teleportsFrame.Visible = true

local teleports = {
    {"Guide Place", Vector3.new(17892, -130, -3539)},
    {"Guide Place Outside", Vector3.new(17934, -130, -3600)},
    {"Starter Island", Vector3.new(0, -4, 0)},
    {"Slapple Island", Vector3.new(-388, 51, -14)},
    {"Cannon Island", Vector3.new(266, 34, 202)},
    {"Default Only Island", Vector3.new(136, 360, -2)}
}

for i, tp in ipairs(teleports) do
    local tpButton = Instance.new("TextButton")
    tpButton.Parent = teleportsFrame
    tpButton.Size = UDim2.new(0, 300, 0, 40)
    tpButton.Position = UDim2.new(0.5, -150, 0, (i - 1) * 45)
    tpButton.Text = tp[1]
    tpButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    addUICorner(tpButton, 10)

    tpButton.MouseButton1Click:Connect(function()
        tweenButtonClick(tpButton)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(tp[2])
        end
    end)
end

-- Features Frame
local featuresFrame = Instance.new("Frame")
featuresFrame.Parent = mainFrame
featuresFrame.Name = "Features"
featuresFrame.Size = UDim2.new(1, 0, 1, -40)
featuresFrame.Position = UDim2.new(0, 0, 0, 40)
featuresFrame.BackgroundTransparency = 1
featuresFrame.Visible = false

local antiVoid = Instance.new("TextButton")
antiVoid.Parent = featuresFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0, 0)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
addUICorner(antiVoid, 10)

local voidGuard = nil
local antiVoidEnabled = false

antiVoid.MouseButton1Click:Connect(function()
    tweenButtonClick(antiVoid)
    antiVoidEnabled = not antiVoidEnabled
    if antiVoidEnabled then
        antiVoid.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        antiVoid.Text = "Deactivate Anti-Void"
        voidGuard = Instance.new("Part")
        voidGuard.Size = Vector3.new(10000000, 2, 10000000)
        voidGuard.Position = Vector3.new(0, -14, 0)
        voidGuard.Anchored = true
        voidGuard.CanCollide = true
        voidGuard.Parent = game.Workspace
        voidGuard.Transparency = 0.7
    else
        antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        antiVoid.Text = "Activate Anti-Void"
        if voidGuard then
            voidGuard:Destroy()
        end
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if antiVoidEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if player.Character.HumanoidRootPart.Position.Y < -14 then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, -4, 0))
        end
    end
end)

local flyButton = Instance.new("TextButton")
flyButton.Parent = featuresFrame
flyButton.Size = UDim2.new(0, 300, 0, 40)
flyButton.Position = UDim2.new(0.5, -150, 0, 50)
flyButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.Text = "Activate Fly GUI"
addUICorner(flyButton, 10)

flyButton.MouseButton1Click:Connect(function()
    tweenButtonClick(flyButton)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- Open/Close GUI Button (always visible)
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15)
toggleButton.Text = "Open GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(toggleButton, 10)

local guiOpen = false
local guiTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

toggleButton.MouseButton1Click:Connect(function()
    tweenButtonClick(toggleButton)
    guiOpen = not guiOpen
    if guiOpen then
        toggleButton.Text = "Close GUI"
        -- Tween mainFrame from offscreen to center
        local tween = TweenService:Create(mainFrame, guiTweenInfo, {Position = UDim2.new(0.5, -250, 0.5, -150)})
        tween:Play()
    else
        toggleButton.Text = "Open GUI"
        -- Tween mainFrame offscreen (above the view)
        local tween = TweenService:Create(mainFrame, guiTweenInfo, {Position = UDim2.new(0.5, -250, 0, -400)})
        tween:Play()
    end
end)

-- Create Fake Player and Position it at "Guide Place Outside"
local fakePlayer = Instance.new("Model")
fakePlayer.Name = "FakePlayer"
fakePlayer.Parent = game.Players

local humanoidRootPart = Instance.new("Part")
humanoidRootPart.Size = Vector3.new(2, 2, 1)
humanoidRootPart.Position = Vector3.new(17934, -130, -3600)
humanoidRootPart.Anchored = true
humanoidRootPart.CanCollide = false
humanoidRootPart.Name = "HumanoidRootPart"
humanoidRootPart.Parent = fakePlayer

local head = Instance.new("Part")
head.Size = Vector3.new(2, 2, 2)
head.Position = humanoidRootPart.Position + Vector3.new(0, 3, 0)
head.Anchored = true
head.CanCollide = false
head.Name = "Head"
head.Parent = fakePlayer

local torso = Instance.new("Part")
torso.Size = Vector3.new(2, 2, 1)
torso.Position = humanoidRootPart.Position + Vector3.new(0, 1, 0)
torso.Anchored = true
torso.CanCollide = false
torso.Name = "Torso"
torso.Parent = fakePlayer

local humanoid = Instance.new("Humanoid")
humanoid.Health = 100
humanoid.MaxHealth = 100
humanoid.Name = "Humanoid"
humanoid.Parent = fakePlayer

-- Made By Cat
