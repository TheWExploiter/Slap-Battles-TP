local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function safeTeleport()
	task.spawn(function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end)
end

task.spawn(function()
	while true do
		task.wait(1)
		if not Players:FindFirstChild(LocalPlayer.Name) then
			safeTeleport()
		end
		if not workspace:FindFirstChild(LocalPlayer.Name) then
			safeTeleport()
		end
		if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			safeTeleport()
		end
	end
end)

GuiService:GetPropertyChangedSignal("ErrorMessage"):Connect(function()
	task.wait(1)
	local msg = GuiService.ErrorMessage
	if msg ~= "" and msg ~= "imagine exploiting hahahahaha" then
		safeTeleport()
	end
end)

local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "BobGui"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 140)
Frame.Position = UDim2.new(0.5, -125, 0.5, -70)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Auto Get Bob"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1, 1, 1)

local Button = Instance.new("TextButton", Frame)
Button.Position = UDim2.new(0.1, 0, 0.4, 0)
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Text = "Get Bob (10% chance)"
Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.Gotham
Button.TextSize = 16
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

local function checkReplica()
	local stats = LocalPlayer:FindFirstChild("leaderstats")
	return stats and stats:FindFirstChild("Glove") and stats.Glove.Value == "Replica"
end

local function notifyMissingGlove()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Missing Replica",
		Text = "You need to equip the Replica glove bruh",
		Duration = 9
	})
end

local teleportPosition = Vector3.new(-910, 329, 4)
local running = false

Button.MouseButton1Click:Connect(function()
	if running then return end
	if not checkReplica() then
		notifyMissingGlove()
		return
	end

	running = true

	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")
	root.CFrame = CFrame.new(teleportPosition)

	task.wait(1)

	while running and checkReplica() do
		local bobEvent = ReplicatedStorage:FindFirstChild("bob")
		local dupeEvent = ReplicatedStorage:FindFirstChild("Duplicate")
		if bobEvent and dupeEvent then
			bobEvent:FireServer()
			dupeEvent:FireServer()
		end
		task.wait(0.01)
	end
end)
