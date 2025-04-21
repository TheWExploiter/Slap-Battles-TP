local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- Instant Rejoin if Kick UI Appears
gui.DescendantAdded:Connect(function(desc)
    if desc:IsA("TextLabel") or desc:IsA("TextBox") or desc:IsA("TextButton") then
        if desc.Text:lower():find("imagine exploiting hahahahaha") then
            TeleportService:Teleport(game.PlaceId, player)
        end
    end
end)

-- GUI Creation
local screenGui = Instance.new("ScreenGui", gui)
screenGui.Name = "ReplicaBobGUI"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 60)
mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

local button = Instance.new("TextButton", mainFrame)
button.Size = UDim2.new(1, 0, 1, 0)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "(Get Bob) (10% chance)"

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 8)

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
