local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- GUI Creation
local screenGui = Instance.new("ScreenGui", gui)
screenGui.Name = "ReplicaBobGUI"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Name = "MainFrame"

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Bob Spam UI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold

local featuresLabel = Instance.new("TextLabel", mainFrame)
featuresLabel.Size = UDim2.new(1, 0, 0, 60)
featuresLabel.Position = UDim2.new(0, 0, 0.15, 0)
featuresLabel.Text = "Features:\n- Spam Bob & Duplicate\n- Auto Rejoin on Kick\n- Replica Glove Check"
featuresLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
featuresLabel.BackgroundTransparency = 1
featuresLabel.TextSize = 14
featuresLabel.Font = Enum.Font.Gotham

local button = Instance.new("TextButton", mainFrame)
button.Size = UDim2.new(1, 0, 0, 50)
button.Position = UDim2.new(0, 0, 0.6, 0)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "(Get Bob) (10% chance)"

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 8)

local draggingFrame = Instance.new("Frame", mainFrame)
draggingFrame.Size = UDim2.new(1, 0, 0, 30)
draggingFrame.BackgroundTransparency = 1
draggingFrame.Position = UDim2.new(0, 0, 0, 0)

local dragCorner = Instance.new("UICorner", draggingFrame)
dragCorner.CornerRadius = UDim.new(0, 8)

-- Glove Check
local function hasReplica()
    local stats = player:FindFirstChild("leaderstats")
    if stats then
        local glove = stats:FindFirstChild("Glove")
        return glove and glove.Value == "Replica"
    end
    return false
end

-- Spam Toggle Logic
local spamming = false

button.MouseButton1Click:Connect(function()
    if not hasReplica() then
        StarterGui:SetCore("SendNotification", {
            Title = "Missing Replica",
            Text = "Your Glove is not 'Replica'",
            Duration = 4
        })
        return
    end

    spamming = not spamming
    button.Text = spamming and "Spamming Bob..." or "(Get Bob) (10% chance)"

    if spamming then
        task.spawn(function()
            while spamming and task.wait(0.1) do
                ReplicatedStorage.bob:FireServer()
                local dup = ReplicatedStorage:FindFirstChild("Duplicate")
                if dup and dup:IsA("RemoteEvent") then
                    dup:FireServer()
                end
            end
        end)
    end
end)
