local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScriptV0_2"

local main = Instance.new("Frame", gui)
main.Position = UDim2.new(0.4, 0, 0.4, 0)
main.Size = UDim2.new(0, 220, 0, 140)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true

local uiCorner = Instance.new("UICorner", main)
uiCorner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Script V0.2"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local spawnBtn = Instance.new("TextButton", main)
spawnBtn.Size = UDim2.new(1, -20, 0, 30)
spawnBtn.Position = UDim2.new(0, 10, 0, 40)
spawnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
spawnBtn.Text = "Spawn Part Above"
spawnBtn.Font = Enum.Font.Gotham
spawnBtn.TextSize = 14
spawnBtn.TextColor3 = Color3.new(1,1,1)

local feCheckBtn = Instance.new("TextButton", main)
feCheckBtn.Size = UDim2.new(1, -20, 0, 30)
feCheckBtn.Position = UDim2.new(0, 10, 0, 75)
feCheckBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
feCheckBtn.Text = "Check FE"
feCheckBtn.Font = Enum.Font.Gotham
feCheckBtn.TextSize = 14
feCheckBtn.TextColor3 = Color3.new(1,1,1)

local yieldBtn = Instance.new("TextButton", main)
yieldBtn.Size = UDim2.new(1, -20, 0, 30)
yieldBtn.Position = UDim2.new(0, 10, 0, 110)
yieldBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
yieldBtn.Text = "Infinite Yield"
yieldBtn.Font = Enum.Font.Gotham
yieldBtn.TextSize = 14
yieldBtn.TextColor3 = Color3.new(1,1,1)

local feChecked = false

spawnBtn.MouseButton1Click:Connect(function()
	local part = Instance.new("Part")
	part.Size = Vector3.new(5, 1, 5)
	part.Anchored = true
	part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
	part.BrickColor = BrickColor.new("Bright red")
	part.Parent = workspace
end)

feCheckBtn.MouseButton1Click:Connect(function()
	if feChecked then return end
	feChecked = true
	local testPart = Instance.new("Part")
	testPart.Anchored = true
	testPart.Size = Vector3.new(1,1,1)
	testPart.Position = Vector3.new(0,100,0)
	testPart.Parent = workspace
	wait(1)
	if not testPart:IsDescendantOf(workspace) then
		feCheckBtn.Text = "FE: ON"
	else
		feCheckBtn.Text = "FE: OFF"
	end
	testPart:Destroy()
end)

yieldBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
