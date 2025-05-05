local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

local CoreGui = game:GetService("CoreGui")
local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "SimpleSpy"

local Main = Instance.new("Frame", Gui)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.2, 0, 0.2, 0)
Main.Size = UDim2.new(0, 500, 0, 400)
Main.Name = "Main"
Main.Active = true
Main.Draggable = true

local Top = Instance.new("TextLabel", Main)
Top.Size = UDim2.new(1, 0, 0, 30)
Top.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.Text = "SimpleSpy - Remote Logs"
Top.Font = Enum.Font.SourceSansBold
Top.TextSize = 18
Top.BorderSizePixel = 0

local Clear = Instance.new("TextButton", Main)
Clear.Size = UDim2.new(0, 60, 0, 30)
Clear.Position = UDim2.new(1, -65, 0, 0)
Clear.Text = "Clear"
Clear.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.Font = Enum.Font.SourceSansBold
Clear.TextSize = 14

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Position = UDim2.new(0, 0, 0, 30)
Scroll.Size = UDim2.new(1, 0, 1, -30)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 6
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 4)
Layout.SortOrder = Enum.SortOrder.LayoutOrder

Clear.MouseButton1Click:Connect(function()
	for _, child in ipairs(Scroll:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
end)

local function logRemote(type, obj, args)
	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(1, -6, 0, 40)
	Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	Btn.TextXAlignment = Enum.TextXAlignment.Left
	Btn.TextSize = 14
	Btn.Font = Enum.Font.SourceSans
	Btn.Text = "[" .. type .. "] " .. obj:GetFullName() .. " | Args: " .. tostring(args[1] or "None")
	Btn.Parent = Scroll

	Btn.MouseButton1Click:Connect(function()
		setclipboard(obj:GetFullName())
	end)
end

local function hook(remote)
	if remote:IsA("RemoteEvent") then
		local old = remote.FireServer
		remote.FireServer = function(self, ...)
			logRemote("FireServer", self, {...})
			return old(self, ...)
		end
	elseif remote:IsA("RemoteFunction") then
		local old = remote.InvokeServer
		remote.InvokeServer = function(self, ...)
			logRemote("InvokeServer", self, {...})
			return old(self, ...)
		end
	end
end

for _, obj in ipairs(RS:GetDescendants()) do
	if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
		hook(obj)
	end
end

RS.DescendantAdded:Connect(function(obj)
	if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
		hook(obj)
	end
end)
