local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- Create Main GUI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
addUICorner(mainFrame, 15)
mainFrame.Visible = false  -- Start with the GUI hidden

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
    buttons[section] = btn
    addUICorner(btn, 10)

    btn.MouseButton1Click:Connect(function()
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
        -- Animate button click (simple color transition)
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
        local tween = game:GetService("TweenService"):Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})
        tween:Play()
        tween.Completed:Connect(function()
            local resetTween = game:GetService("TweenService"):Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
            resetTween:Play()
        end)
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
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(tp[2])
        end
        -- Animate teleport button click (simple size change)
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
        local tween = game:GetService("TweenService"):Create(tpButton, tweenInfo, {Size = UDim2.new(0, 320, 0, 50)})
        tween:Play()
        tween.Completed:Connect(function()
            local resetTween = game:GetService("TweenService"):Create(tpButton, tweenInfo, {Size = UDim2.new(0, 300, 0, 40)})
            resetTween:Play()
        end)
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

-- Open/Close GUI Button (always visible)
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15)
toggleButton.Text = "Open GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(toggleButton, 10)

toggleButton.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    if mainFrame.Visible then
        -- Closing animation
        local closeTween = game:GetService("TweenService"):Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -250, 0, -300)})
        closeTween:Play()
        closeTween.Completed:Connect(function()
            mainFrame.Visible = false
        end)
    else
        mainFrame.Visible = true
        -- Opening animation
        local openTween = game:GetService("TweenService"):Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -250, 0, 0)})
        openTween:Play()
    end
end)
