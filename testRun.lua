local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1368281787347894342/9hd3IIwiiBZtVe27LwgrkxiVAh837qxDvvv7z4nws1Ggu995tn84SXdndYxsKlH88fPA"

local player = Players.LocalPlayer
local username = player.Name
local userId = tostring(player.UserId)
local placeId = game.PlaceId
local jobId = game.JobId
local executor = identifyexecutor and identifyexecutor() or "Unknown"

local gameName = "Unknown Game"
pcall(function()
	gameName = MarketplaceService:GetProductInfo(placeId).Name
end)

-- Try to get dynamic player image (real render)
local userImage = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
pcall(function()
	local thumb, isReady = Players:GetUserThumbnailAsync(tonumber(userId), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	if isReady then
		userImage = thumb
	end
end)

-- Payload for webhook
local payload = {
    ["embeds"] = {{
        ["title"] = "**🚨 Script Execution Log 🚨**",
        ["color"] = tonumber(0xFFA500),
        ["thumbnail"] = {
            ["url"] = userImage
        },
        ["fields"] = {
            {["name"] = "👤 Username", ["value"] = username .. "  |  **" .. executor .. "**", ["inline"] = false},
            {["name"] = "🆔 User ID", ["value"] = userId, ["inline"] = true},
            {["name"] = "🎮 Game", ["value"] = gameName, ["inline"] = false},
            {["name"] = "🔑 Place ID", ["value"] = tostring(placeId), ["inline"] = true},
            {["name"] = "📝 Job ID", ["value"] = jobId, ["inline"] = false},
            {
                ["name"] = "🔗 Join Link",
                ["value"] = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
                ["inline"] = false
            }
        },
        ["footer"] = {["text"] = "Made by Cat :3 🐱"}
    }}
}

-- Send to webhook
local success, message = pcall(function()
	HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

if success then
	print("Webhook data successfully sent!")
else
	warn("Failed to send webhook: " .. tostring(message))
end
