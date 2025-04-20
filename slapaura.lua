local SlapRemotes = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesTable.luau'))()
local SlapNames = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SlapRemotesNamesTable.luau'))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GloveValue()
    return LocalPlayer.leaderstats.Glove.Value
end

local function Slap(args, mode)
    mode = mode or 1
    if mode == 1 then
        if SlapRemotes[GloveValue()] then
            SlapRemotes[GloveValue()]:FireServer(unpack(args))
        else
            ReplicatedStorage:WaitForChild("GeneralHit"):FireServer(unpack(args))
        end
    elseif mode == 2 then
        ReplicatedStorage:WaitForChild("b"):FireServer(unpack(args))
    end
end

local slapEnabled = false
local slapDelay = 1
local slapRange = 35

local function toggleSlapAura()
    slapEnabled = not slapEnabled
    if slapEnabled then
        print("Slap Aura ENABLED.")
    else
        print("Slap Aura DISABLED.")
    end
end

local Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))():MakeWindow({
    Name = "Slap Aura Toggle",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "XScriptsUI_SlapAura"
})

Window:MakeTab({Name = "Aura", Icon = "", PremiumOnly = false})
    :AddButton({
        Name = "Toggle Slap Aura",
        Callback = toggleSlapAura
    })

Window:MakeTab({Name = "Settings", Icon = "", PremiumOnly = false})
    :AddTextbox({
        Name = "Slap Aura Range (Studs)",
        Default = "35",
        TextChangedCallback = function(txt)
            slapRange = tonumber(txt) or 35
            print("Slap Aura Range set to " .. slapRange .. " studs.")
        end,
        ClearTextOnFocus = false
    })

local function slapPlayersInRange(range)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local playerPos = LocalPlayer.Character.HumanoidRootPart.Position

    for _, target in pairs(Players:GetPlayers()) do
        if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = target.Character.HumanoidRootPart.Position
            if (playerPos - targetPos).Magnitude <= range then
                Slap({target.Character.HumanoidRootPart})
            end
        end
    end
end

local function createRangeIndicator(range)
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local rangePart = Instance.new("Part")
    rangePart.Size = Vector3.new(range * 2, 0.1, range * 1.5)
    rangePart.Position = root.Position - Vector3.new(0, 2, 0)
    rangePart.Anchored = true
    rangePart.CanCollide = false
    rangePart.Transparency = 0.5
    rangePart.BrickColor = BrickColor.new("Lime green")
    rangePart.Material = Enum.Material.SmoothPlastic
    rangePart.Shape = Enum.PartType.Cylinder
    rangePart.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(90), 0, 0)
    rangePart.Parent = workspace

    game:GetService("Debris"):AddItem(rangePart, 0.5)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))():Init()

task.spawn(function()
    while task.wait(slapDelay) do
        if slapEnabled then
            slapPlayersInRange(slapRange)
            createRangeIndicator(slapRange)
        end
    end
end)
