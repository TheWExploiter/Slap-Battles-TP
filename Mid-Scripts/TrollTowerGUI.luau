--// Load Orion (new version)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "Troll Tower GUI",
    ConfigFolder = "TrollTowerSettings"
})

--// Variables
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local trolling = false
local trollThread

local coords = {
    Vector3.new(-44, 144, -81),
    Vector3.new(-35, 144, -83),
    Vector3.new(-22, 144, -82),
    Vector3.new(-79, 148, -81),
}

local tpSpeed = 0.085 -- Speed for teleporting

--// TP loop function
local function startTP()
    trollThread = task.spawn(function()
        while trolling do
            for _, pos in ipairs(coords) do
                if not trolling then break end
                root.CFrame = CFrame.new(pos)
                task.wait(tpSpeed) -- Control speed
            end
        end
    end)
end

--// Tab + Controls
local TrollTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998"
})

--// Toggle for Troll TP Loop
TrollTab:AddToggle({
    Name = "Troll TP Loop",
    Default = false,
    Callback = function(state)
        trolling = state
        if trolling then
            startTP()
        else
            if trollThread then task.cancel(trollThread) end
        end
    end
})

--// Speed Changer
TrollTab:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = humanoid.WalkSpeed,
    Callback = function(value)
        humanoid.WalkSpeed = value
    end
})

--// Jump Power Changer
TrollTab:AddSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 300,
    Default = humanoid.JumpPower,
    Callback = function(value)
        humanoid.JumpPower = value
    end
})

--// Script Executor Button
TrollTab:AddButton({
    Name = "Execute Custom Script",
    Callback = function()
        -- Execute custom script using HttpGet
        local customScript = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"
        loadstring(game:HttpGet(customScript))()
    end
})
