local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId 
local url = "https://apis.roblox.com/universes/v1/places/" .. placeId .. "/universe"
local data 
local success, response = pcall(function()
    return request({Url = url})
end)

if success then
    data = HttpService:JSONDecode(response.Body)
    if data and data.universeId then
        print("Universe ID:", data.universeId)
    else
        game.Players.LocalPlayer:Kick("Universe ID not found.")
    end
else
    game.Players.LocalPlayer:Kick("Failed to fetch Universe ID:" ..  response)
end

local Script_Tbl = {
    [7074860883] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Arise%20Crossover",
    [4931927012] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Basketball%20Legends",
    [5682590751] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Lootify.lua"
}
local Script_Url = Script_Tbl[data.universeId]
if Script_Url then 
    loadstring(game:HttpGet(Script_Url))()
end
