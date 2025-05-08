local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1366093954726101012/7ciBVLgguCpWBwuHUeSYB6L4v3ytPvIpxl11tkEmANA3AExUvCSsaKx_S1tlEkTMX0zJ"

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
        ["title"] = "**Script Execution Log**",
        ["color"] = tonumber(0xFFA500),
        ["thumbnail"] = {
            ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
        },
        ["fields"] = {
            {["name"] = "Username", ["value"] = username, ["inline"] = true},
            {["name"] = "User ID", ["value"] = userId, ["inline"] = true},
            {["name"] = "Executor", ["value"] = executor, ["inline"] = true},
            {["name"] = "Game", ["value"] = gameName, ["inline"] = false},
            {["name"] = "Place ID", ["value"] = tostring(placeId), ["inline"] = true},
            {["name"] = "Job ID", ["value"] = jobId, ["inline"] = false},
            {
                ["name"] = "Join Link",
                ["value"] = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
                ["inline"] = false
            }
        }
    }}
}

pcall(function()
    HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode(payload))
end)
