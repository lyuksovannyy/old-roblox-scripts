
local sphere = nil

for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetAccessories()) do
    print(v.Name)
    if v.Handle.Shape == Enum.PartType.Ball then
        sphere = v
        
    end
    
end

if not sphere then print("Ball part not found"); return end
getgenv().Accessory(sphere, game:GetService("Players").LocalPlayer.Character["Right Arm"],{
    debug = false; -- print some info
    bloxify = true; -- remove mesh
    speed = 100; -- Speed
    shakeFix = true; -- prevent part to be under the drugs ( no soft animations :( )
    
    pos = Vector3.new(0,-1,0); -- Position
    rot = Vector3.new(0,0,0); -- Rotation
        
})
getgenv().Accessory("BallerAccessory", game:GetService("Players").LocalPlayer.Character["Head"],{
    debug = false; -- print some info
    bloxify = false; -- remove mesh
    speed = 100; -- Speed
    shakeFix = true; -- prevent part to be under the drugs ( no soft animations :( )
    
    pos = Vector3.new(0,1.2,0); -- Position
    rot = Vector3.new(0,-10,0); -- Rotation
        
})
