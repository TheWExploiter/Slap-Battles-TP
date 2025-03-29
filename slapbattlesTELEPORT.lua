local player = game.Players.LocalPlayer local screenGui = Instance.new("ScreenGui") screenGui.ResetOnSpawn = false -- GUI stays after death screenGui.Parent = player:WaitForChild("PlayerGui")

-- Function for UI corners 
local function addUICorner(uiElement, radius) local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius) corner.Parent = uiElement end

-- Toggle Button (Open GUI) 
local toggleButton = Instance.new("TextButton") toggleButton.Parent = screenGui toggleButton.Size = UDim2.new(0, 100, 0, 50) toggleButton.Position = UDim2.new(1, -120, 0.2, -10) toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) toggleButton.Text = "⚙️ Open Menu" addUICorner(toggleButton, 10)

-- Main GUI Frame 
local mainFrame = Instance.new("Frame") mainFrame.Parent = screenGui mainFrame.Size = UDim2.new(0, 350, 0, 300) mainFrame.Position = UDim2.new(1, -370, 0.2, -10) mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) mainFrame.Visible = false addUICorner(mainFrame, 15)

-- Sections Title 
local sectionTitle = Instance.new("TextLabel") sectionTitle.Parent = mainFrame sectionTitle.Size = UDim2.new(1, 0, 0, 40) sectionTitle.BackgroundTransparency = 1 sectionTitle.Text = "🌟 Player Enhancements" sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255) sectionTitle.TextSize = 20 sectionTitle.Font = Enum.Font.SourceSansBold

-- Close Button (X) 
local closeButton = Instance.new("TextButton") closeButton.Parent = mainFrame closeButton.Size = UDim2.new(0, 30, 0, 30) closeButton.Position = UDim2.new(1, -35, 0, 5) closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) closeButton.Text = "X" addUICorner(closeButton, 10)

-- 🛡️ Anti-Void Button 
local antiVoid = Instance.new("TextButton") antiVoid.Parent = mainFrame antiVoid.Size = UDim2.new(0, 300, 0, 40) antiVoid.Position = UDim2.new(0.5, -150, 0.2, -10) antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255) antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255) antiVoid.Text = "🛡️ Activate Anti-Void" addUICorner(antiVoid, 10)

-- 🌀 Anti-Ragdoll Button 
local antiRagdoll = Instance.new("TextButton") antiRagdoll.Parent = mainFrame antiRagdoll.Size = UDim2.new(0, 300, 0, 40) antiRagdoll.Position = UDim2.new(0.5, -150, 0.35, -10) antiRagdoll.BackgroundColor3 = Color3.fromRGB(255, 100, 100) antiRagdoll.TextColor3 = Color3.fromRGB(255, 255, 255) antiRagdoll.Text = "🌀 Activate Anti-Ragdoll" addUICorner(antiRagdoll, 10)

-- 🌍 Teleport Section Title 
local teleportTitle = sectionTitle:Clone() teleportTitle.Parent = mainFrame teleportTitle.Position = UDim2.new(0, 0, 0.5, -10) teleportTitle.Text = "🌍 Teleports"

-- 🌍 Guide Place Teleport Button 
local tpButton1 = Instance.new("TextButton") tpButton1.Parent = mainFrame tpButton1.Size = UDim2.new(0, 300, 0, 40) tpButton1.Position = UDim2.new(0.5, -150, 0.6, -10) tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180) tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255) tpButton1.Text = "🌍 Teleport: Guide Place" addUICorner(tpButton1, 10)

-- 🏝️ Platform Teleport Button 
tpButton2 = tpButton1:Clone() tpButton2.Parent = mainFrame tpButton2.Position = UDim2.new(0.5, -150, 0.75, -10) tpButton2.Text = "🏝️ Teleport: Platform"

-- Toggle GUI 
toggleButton.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)

-- Close GUI 
closeButton.MouseButton1Click:Connect(function() mainFrame.Visible = false end)

-- Teleport Functions 
tpButton1.MouseButton1Click:Connect(function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539) end end)

tpButton2.MouseButton1Click:Connect(function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(18000, -130, -3700) end end)

-- Anti-Void Function
antiVoid.MouseButton1Click:Connect(function() local voidGuard = Instance.new("Part") voidGuard.Size = Vector3.new(1000, 1, 1000) voidGuard.Position = Vector3.new(0, -20, 0) voidGuard.Anchored = true voidGuard.CanCollide = false voidGuard.Parent = game.Workspace

voidGuard.Touched:Connect(function(hit) if hit.Parent:FindFirstChild("HumanoidRootPart") then hit.Parent.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Teleport back up end end) 

end)

-- Anti-Ragdoll Function 
antiRagdoll.MouseButton1Click:Connect(function() player.CharacterAdded:Connect(function(char) for _, v in pairs(char:GetDescendants()) do if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then v:Destroy() -- Remove ragdoll constraints end end end) end)

