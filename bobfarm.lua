local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "BobGui"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 140)
Frame.Position = UDim2.new(0.5, -125, 0.5, -70)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Bob Auto Spammer"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1, 1, 1)

local Button = Instance.new("TextButton", Frame)
Button.Position = UDim2.new(0.1, 0, 0.4, 0)
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Text = "(Get Bob) (10% Chance)"
Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.Gotham
Button.TextSize = 16

local UICornerBtn = Instance.new("UICorner", Button)
UICornerBtn.CornerRadius = UDim.new(0, 6)

-- Glove Check
local function checkReplica()
	local stats = LocalPlayer:FindFirstChild("leaderstats")
	if not stats or stats:FindFirstChild("Glove") == nil then return false end
	return stats.Glove.Value == "Replica"
end

local function notifyMissingGlove()
	local StarterGui = game:GetService("StarterGui")
	StarterGui:SetCore("SendNotification", {
		Title = "Missing Replica",
		Text = "You to equip the Replica glove bruh",
		Duration = 9
	})
end

-- Main Function
local running = false

Button.MouseButton1Click:Connect(function()
	if running then return end
	running = true

	if not checkReplica() then
		notifyMissingGlove()
		running = false
		return
	end

	while running do
		if checkReplica() then
			ReplicatedStorage:FindFirstChild("bob"):FireServer()
			ReplicatedStorage:FindFirstChild("Duplicate"):FireServer()
		end
		task.wait(0.1)
	end
end)

-- Instant Rejoin on Kick
Players.PlayerRemoving:Connect(function(plr)
	if plr == LocalPlayer then
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
end)

local GuiService = game:GetService("GuiService")

GuiService:GetPropertyChangedSignal("ErrorMessage"):Connect(function()
	local errorText = GuiService.ErrorMessage
	if errorText ~= "" then
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
end)
