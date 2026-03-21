local Event = game:GetService("ReplicatedStorage").ByteNetReliable
local LocalPlayer = game:GetService("Players").LocalPlayer
local Player_Data = game:GetService("ReplicatedStorage").Players_Data[LocalPlayer.Name]
local Player_Inventory = Player_Data.Inventory
local Managements = require(game.ReplicatedStorage.Modules.Packets.Managements)
local Packages_Equip = Managements:GetPacket("Inventory", "Equip")
local Packages_UnEquip = Managements:GetPacket("Inventory", "Unequip")
local Ply_Fruit = {}

for i,v in pairs(Player_Inventory.Rerolls:GetChildren()) do
    if v.Name ~= "Yami"then
        table.insert(Ply_Fruit, v.Name)
    end
end
if #Ply_Fruit < 2 then
    return LocalPlayer:Kick("You need at least 2 devil fruits to use this script")
end

getgenv().RoyxLoaded = true
while true do task.wait()
    if Player_Data.Rerolls["Devil Fruits"].Value == "Yami" then 
        for i,v in pairs(Ply_Fruit) do
            task.wait()
                Packages_UnEquip.send({
                type = "Rerolls",
                name = v,
                amount = 1
            })
        end 
    else
    Packages_Equip.send({
        type = "Rerolls",
        name = "Yami",
        amount = 1,
        to = ""
    })
    end 
end
