local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 400) -- Wider GUI
mainFrame.Position = UDim2.new(0.5, -250, 0.3, -10)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
addUICorner(mainFrame, 15)

local sections = {"Teleports", "Features", "Settings"}
local buttons = {}
local activeSection = "Teleports"

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
    end)
end

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
    {"Starter Island", Vector3.new(-0, -4, -0)},
    {"Slapple Island", Vector3.new(-388, 51, -14)}
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
    end)
end

-- ESP Functionality
local function createESP(player)
    local espLabel = Instance.new("TextLabel")
    espLabel.Parent = screenGui
    espLabel.Size = UDim2.new(0, 200, 0, 50)
    espLabel.BackgroundTransparency = 1
    espLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    espLabel.TextSize = 18
    espLabel.Text = player.Name
    
    -- Update position based on character
    local function updateESP()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = player.Character.HumanoidRootPart
            espLabel.Position = UDim2.new(0, humanoidRootPart.Position.X, 0, humanoidRootPart.Position.Y + 50)
        else
            espLabel:Destroy()
        end
    end

    -- Update ESP for glove
    local function getGlove()
        if player.Backpack:FindFirstChildOfClass("Tool") then
            return player.Backpack:FindFirstChildOfClass("Tool").Name
        end
        return "No Glove"
    end
    
    -- Create label showing glove
    local gloveLabel = Instance.new("TextLabel")
    gloveLabel.Parent = espLabel
    gloveLabel.Size = UDim2.new(1, 0, 0, 20)
    gloveLabel.BackgroundTransparency = 1
    gloveLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    gloveLabel.TextSize = 16
    gloveLabel.Text = "Glove: " .. getGlove()

    -- Update position every frame
    game:GetService("RunService").Heartbeat:Connect(updateESP)
end

-- Create ESP for all players
game.Players.PlayerAdded:Connect(function(otherPlayer)
    if otherPlayer ~= player then
        createESP(otherPlayer)
    end
end)

-- Create ESP for already existing players
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
    if otherPlayer ~= player then
        createESP(otherPlayer)
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            -- Update the glove label
            local espLabel = screenGui:FindFirstChild(otherPlayer.Name)
            if espLabel then
                local gloveLabel = espLabel:FindFirstChild("GloveLabel")
                if gloveLabel then
                    gloveLabel.Text = "Glove: " .. (otherPlayer.Backpack:FindFirstChildOfClass("Tool") and otherPlayer.Backpack:FindFirstChildOfClass("Tool").Name or "No Glove")
                end
            end
        end
    end
end)
