local keyUrl = "https://raw.githubusercontent.com/thewexploiter/roblox-key-system/main/key.txt"

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KeyCheckUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 140)
frame.Position = UDim2.new(0.5, -140, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1, -20, 0, 30)
box.Position = UDim2.new(0, 10, 0, 10)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)

local submit = Instance.new("TextButton", frame)
submit.Size = UDim2.new(1, -20, 0, 30)
submit.Position = UDim2.new(0, 10, 0, 50)
submit.Text = "Submit"
submit.BackgroundColor3 = Color3.fromRGB(60, 100, 60)
submit.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 4)

local copy = Instance.new("TextButton", frame)
copy.Size = UDim2.new(1, -20, 0, 30)
copy.Position = UDim2.new(0, 10, 0, 90)
copy.Text = "Copy Key Link"
copy.BackgroundColor3 = Color3.fromRGB(60, 60, 120)
copy.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", copy).CornerRadius = UDim.new(0, 4)

local validKey = nil
local isChecked = false

copy.MouseButton1Click:Connect(function()
    setclipboard(keyUrl)
end)

submit.MouseButton1Click:Connect(function()
    pcall(function()
        local response = game:HttpGet(keyUrl)
        validKey = string.gsub(response, "\n", "")
        isChecked = true
    end)
end)

task.spawn(function()
    while task.wait(1) do
        if isChecked and validKey and box.Text == validKey then
            gui:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheWExploiter/Slap-Battles-TP/refs/heads/main/SlapBattlesUI.lua"))()
            break
        end
    end
end)
