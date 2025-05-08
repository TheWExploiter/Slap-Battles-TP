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

local payload = {
    ["embeds"] = {{
        ["title"] = "**🚨 Script Execution Log 🚨**",
        ["color"] = tonumber(0xFFA500),
        ["thumbnail"] = {
            ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
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

local success, err = pcall(function()
    local headers = {["Content-Type"] = "application/json"}
    local body = HttpService:JSONEncode(payload)

    if syn and syn.request then
        syn.request({Url = WEBHOOK_URL, Method = "POST", Headers = headers, Body = body})
    elseif http and http.request then
        http.request({Url = WEBHOOK_URL, Method = "POST", Headers = headers, Body = body})
    elseif request then
        request({Url = WEBHOOK_URL, Method = "POST", Headers = headers, Body = body})
    else
        warn("Executor does not support webhook sending.")
    end
end)

if success then
    print("Webhook data successfully sent!")
else
    warn("Failed to send webhook: " .. tostring(err))
end
