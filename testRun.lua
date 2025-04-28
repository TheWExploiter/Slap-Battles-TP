local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

local webhookUrl = "https://discord.com/api/webhooks/1366093954726101012/7ciBVLgguCpWBwuHUeSYB6L4v3ytPvIpxl11tkEmANA3AExUvCSsaKx_S1tlEkTMX0zJ"  -- Replace with your webhook URL

local function getGameName()
    local success, result = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (success and result.Name) or "???"
end

local function sendWebhook()
    local playerName = Player.Name
    local playerId = Player.UserId
    local accountAge = Player.AccountAge
    local gameName = getGameName()
    local jobId = game.JobId
    local timeExecuted = os.date("%c")
    
    local data = {
        username = "Execution Alert",
        embeds = {{
            title = "Script Execute!",
            color = tonumber("0x00ff00"),
            fields = {
                {name = "Username", value = playerName, inline = true},
                {name = "UserId", value = tostring(playerId), inline = true},
                {name = "Game", value = gameName, inline = false},
                {name = "JoinServer", value = "[ClickHere](https://www.roblox.com/games/" .. game.PlaceId .. "?jobId=" .. jobId .. ")", inline = false},
                {name = "AccountAge", value = tostring(accountAge) .. " days", inline = true},
                {name = "JobId", value = jobId, inline = true},
                {name = "Time", value = timeExecuted, inline = false}
            }
        }}
    }

    local jsonData = HttpService:JSONEncode(data)
    pcall(function()
        HttpService:PostAsync(webhookUrl, jsonData)
    end)
end

sendWebhook()
