-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 220, 0, 90)
Frame.Position = UDim2.new(0.5, -110, 0.5, -45)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Spam UI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 20

Button.Parent = Frame
Button.Size = UDim2.new(1, -20, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 40)
Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "Get Bob (need replica)"

local spamming = false
local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")

local function hasReplicaTool()
    return player.Backpack:FindFirstChild("Replica") or player.Character:FindFirstChild("Replica")
end

local function toggleSpam()
    spamming = not spamming
    Button.Text = spamming and "Stop Spamming" or "Start Spamming"

    if spamming then
        task.spawn(function()
            while spamming do
                if hasReplicaTool() then
                    rs.bob:FireServer()
                    rs.Duplicate:FireServer()
                end
                task.wait(0.1)
            end
        end)
    end
end

Button.MouseButton1Click:Connect(toggleSpam)
