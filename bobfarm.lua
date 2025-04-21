local Players       = game:GetService("Players")
local Replicated    = game:GetService("ReplicatedStorage")
local TeleportSvc   = game:GetService("TeleportService")
local StarterGui    = game:GetService("StarterGui")

local player    = Players.LocalPlayer
local gui       = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size       = UDim2.new(0, 260, 0, 100)
frame.Position   = UDim2.new(0.5, -130, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active     = true
frame.Draggable  = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", frame)
title.Size     = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.fromRGB(45,45,45)
title.Text     = "Get Bob GUI"
title.TextSize = 20
title.Font     = Enum.Font.SourceSans
title.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", title).CornerRadius = UDim.new(0,12)

local button = Instance.new("TextButton", frame)
button.Size       = UDim2.new(1,-20,0,40)
button.Position   = UDim2.new(0,10,0,40)
button.BackgroundColor3 = Color3.fromRGB(60,60,60)
button.Text       = "(Get Bob) (10% chance)"
button.TextSize   = 18
button.Font       = Enum.Font.SourceSans
button.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", button).CornerRadius = UDim.new(0,8)

local spamming = false

local function hasReplicaTool()
    local bp = player:FindFirstChild("Backpack")
    local char = player.Character
    return (bp and bp:FindFirstChild("Replica")) or (char and char:FindFirstChild("Replica"))
end

local function notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text  = text;
        Duration = 5;
    })
end

player.PlayerGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") and (child:FindFirstChild("Message")
        or string.find(child.Name:lower(), "kick")) then
        TeleportSvc:Teleport(game.PlaceId)
    end
end)

button.MouseButton1Click:Connect(function()
    spamming = not spamming
    button.Text = spamming and "(STOP NOW!)" or "(Get Bob) (10% chance)"

    if spamming then
        local stats = player:FindFirstChild("leaderstats")
        local glove = stats and stats:FindFirstChild("Glove")
        if not glove or glove.Value ~= "Replica" then
            notify("Wrong Glove!", "Your Glove is: "..(glove and glove.Value or "None"))
            spamming = false
            button.Text = "(Get Bob) (10% chance)"
            return
        end

        task.spawn(function()
            while spamming do
                if hasReplicaTool() then
                    Replicated.bob:FireServer()
                    Replicated.Duplicate:FireServer()
                end
                task.wait(0.01)
            end
        end)
    end
end)

-- pro tip : 🍋
