local rs = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local badges = game:GetService("BadgeService")
local char = player.Character or player.CharacterAdded:Wait()
local stat = player:WaitForChild("leaderstats"):WaitForChild("Glove")
local badgeId = 2125950512

while stat.Value ~= "Replica" do
	game.StarterGui:SetCore("SendNotification", {
		Title = "Wrong Glove!";
		Text = "Equip the Replica glove to summon Bob.";
		Duration = 3;
	})
	task.wait(5)
end

local success, hasBadge = pcall(function()
	return badges:UserHasBadgeAsync(player.UserId, badgeId)
end)
if success and hasBadge then
	player:Kick("u got bob dude!!!1!1!1!")
	return
end

char:PivotTo(CFrame.new(-1010, 329, 6))
task.wait(3)

if not workspace:FindFirstChild("BobPlatform") then
	local platform = Instance.new("Part")
	platform.Size = Vector3.new(100, 1, 100)
	platform.Position = Vector3.new(20592, -135, -5155)
	platform.Anchored = true
	platform.Name = "BobPlatform"
	platform.Parent = workspace
end

char:PivotTo(CFrame.new(20592, -132, -5155))

while true do
	local success, hasBadge = pcall(function()
		return badges:UserHasBadgeAsync(player.UserId, badgeId)
	end)
	if success and hasBadge then
		player:Kick("u got bob dude!!!1!1!1!")
		break
	end

	if stat.Value == "Replica" then
		local dup = rs:FindFirstChild("Duplicate")
		local bob = rs:FindFirstChild("bob")
		if bob and dup then
			bob:FireServer()
			dup:FireServer()
		end
	else
		game.StarterGui:SetCore("SendNotification", {
			Title = "Wrong Glove!";
			Text = "Equip the Replica glove to summon Bob.";
			Duration = 3;
		})
	end

	task.wait(4.6)
end
