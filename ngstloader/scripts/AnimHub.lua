
local _gui = getgenv().ngstloader:AddMenu("AnimHub")

local _R6 = _gui:AddTab("R6")
local _R15 = _gui:AddTab("R15")
local _uni = _gui:AddTab("Universal")
local _nexo = _gui:AddTab("NexoReanims")
local dir = {
    ["r6"] = "https://raw.githubusercontent.com/GameSTALkER/ngstloader/main/scripts/AnimHub.Scripts/R6/", 
    ["r15"] = "https://raw.githubusercontent.com/GameSTALkER/ngstloader/main/scripts/AnimHub.Scripts/R15/", 
    ["uni"] = "https://raw.githubusercontent.com/GameSTALkER/ngstloader/main/scripts/AnimHub.Scripts/Universal/", 
    ["nexo"] = "https://raw.githubusercontent.com/GameSTALkER/ngstloader/main/scripts/AnimHub.Scripts/nexoR/"
}
-- R6
-- hand ~ R6
_R6:CreateButton({name="Execute \"Hand\" script",desc="KeyBinds:\nZ, Q, X, E, C, V, F, R, G, Y, T, B, H, J, U"},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R6 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    elseif neededhats({"Nagamaki","Robloxclassicred",'Pal Hair','Pink Hair','Hat1','Kate Hair','LavanderHair','Bedhead','BlockheadBaseballCap',"MessyHair"},"string") ~= true then
        print("^ for Hand ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return
    end
          
    loadstring(game:HttpGet(dir['uni'].."hatshow.lua"))()
    loadstring(game:HttpGet(dir['uni'].."netless.lua"))()
    loadstring(game:HttpGet(dir['r6'].."Hand.lua"))()
end)

-- Sex Doll ~ R6
_R6:CreateButton({name='Execute "Sex Doll" script',desc='KeyBinds:\nZ, Q, X, E, C, R'},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R6 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    elseif neededhats({"Robloxclassicred","Pal Hair",'LavanderHair','Pink Hair','HairAccessory','International Fedora','MeshPartAccessory','BrownCharmerHair','MessyHair'},"string") ~= true then
        print("^ for Sex Doll ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return
    end
    
    loadstring(game:HttpGet(dir['uni'].."hatshow.lua"))()
    loadstring(game:HttpGet(dir['uni'].."netless.lua"))()
    loadstring(game:HttpGet(dir['r6'].."Doll.lua"))()
end)
-- beba
_R6:CreateButton({name='Execute "Beba" script',desc='KeyBinds:\nQ, F, E, Z, C, R'},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R6 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    elseif neededhats({47963332,81642452,319354652,"HairAccessory","CoolBoyHair"}) ~= true then
        print("^ for Beba ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return
    end
    
    loadstring(game:HttpGet(dir['r6'].."beba.lua"))()
end)

-- spider man
_R6:CreateButton({name='Execute "Spider Man" script',desc='Keybinds:\nQ, E'},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R6 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    end
    
    loadstring(game:HttpGet(dir['r6'].."spiderman.lua"))()
end)

-- amogus
_R6:CreateButton({name='Execute "Amogus" script',desc='Keybinds:\nF, E, C, Q'},function()
    if neededhats({"Robloxclassicred","Pal Hair","Kate Hair","Hat1","Pink Hair","LavanderHair","Necklace"},"string") ~= true then
        print("^ for Amogus ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return
    end
    --if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R6 in roblox avatar editor and reset character',sleep=30,textscale=13}) end

    loadstring(game:HttpGet(dir['uni'].."hatshow.lua"))()
    loadstring(game:HttpGet(dir['r6'].."amogus.lua"))()
end)

-- R15
-- small avatar ~ R15
_R15:CreateButton({name='Execute "Small avatar" script',desc="Needed avatar proportions:\nHeight = 90%\nWidth = 70%\nHead = 100%\nProportions = 0%\nBody Type = 0%"},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R15 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    end
    loadstring(game:HttpGet(dir['r15'].."small-avatar.lua"))()
end)

-- big avatar
_R15:CreateButton({name='Execute "Big avatar" script',desc="Needed avatar proportions:\nHeight = 105%\nWidth = 100%\nHead = 100%\nProportions = 0%\nBody Type = 100%"},function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        --nlib:CreateNotify({title="ERROR",desc='Change your characters RigType to R15 in roblox avatar editor and reset character',sleep=30,textscale=13})
        return
    end
    loadstring(game:HttpGet(dir['r15'].."big-avatar.lua"))()
end)

-- hamster
_uni:CreateButton({name='Execute "Hamster Ball" script'},function()
    loadstring(game:HttpGet(dir['uni'].."hamster-ball.lua"))()
end)

-- Penis
_uni:CreateButton({name='Execute "Penis" script',desc='KeyBinds:\n1, 2, 3, 4, 5, 6, 7, 8, 9, 0, E\nQ - switch modes\nR - Drag penis (via cursor)'},function()
    if neededhats({{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"},{"InternationalFedora","MeshPartAccessory"}},"string") ~= true then
        print("^ for Penis ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return
    end
    --if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        --nlib:CreateNotify({title="ERROR",desc='Recommend you chage RigType to R6',sleep=30,textscale=13}) end
          
    loadstring(game:HttpGet(dir['uni'].."hatshow.lua"))()
    loadstring(game:HttpGet(dir['uni'].."netless.lua"))()
    loadstring(game:HttpGet(dir['uni'].."penis.lua"))()
end)

-- eyes
_uni:CreateButton({name='Execute "Eyes" script',desc="E - hide/show eyes\nMove mouse to move eyes"},function()
    
    if neededhats({"Eyes"},"string") ~= true then
        print("^ for Eyes ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return end
    
    loadstring(game:HttpGet(dir['uni'].."netless.lua"))()
    loadstring(game:HttpGet(dir['uni'].."eyes.lua"))()
end)
_uni:CreateButton({name='Execute "Wings" script',desc="Keybinds - Q, E, R, T"},function()
    
    if neededhats({"black metal wings"},"string") ~= true then
        print("^ for Wings ^")
        --nlib:CreateNotify({title="ERROR",desc='Check console what you forgot to wear (must turn on warns)',sleep=30,textscale=13})
        return end
    
    loadstring(game:HttpGet(dir['uni'].."netless.lua"))()
    loadstring(game:HttpGet(dir['uni'].."wings.lua"))()
end)

-- bang
_uni:CreateInput({name="Write Player Name to bang", ac={game:GetService("Players"):GetChildren(),{"Name","DisplayName"}}},function(_)
    _G.choosenbang = ""
    if _G.notfunny ~= nil then _G.notfunny:Stop();_G.notfunny = nil end
    _G.choosenbang = _
    local resp = 0
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name == _G.choosenbang or v.DisplayName == _G.choosenbang then
            _G.choosenbang = v.Name
            loadstring(game:HttpGet(dir['uni'].."bang-bang.lua"))()
            resp = 1
            break
        end
    end
    --if resp == 0 then nlib:CreateNotify({title="ERROR",desc='Invatid player name',sleep=15,textscale=16}) end
end)
_G.notfunnyspeed = 8
_uni:CreateSlider({desc="Bang animation speed", min=1, def=8, max=100},function(_) _G.notfunnyspeed = tonumber(_) end)
_uni:CreateButton({name='Stop "Bang" script'},function()
    _G.choosenbang = ""
    if _G.notfunny ~= nil then _G.notfunny:Stop();_G.notfunny = nil end
end)

-- nexo
if getgenv().change_mode_key == nil then getgenv().change_mode_key = "q" end
if getgenv().hand_move_key == nil then getgenv().hand_move_key = "e" end
if getgenv().sprint_key == nil then getgenv().sprint_key = "z" end

_nexo:CreateButton({name="Soldier ("..getgenv().change_mode_key..", "..getgenv().sprint_key..")",desc="Hats needed: 6375552967, 6683695162, 6775283114, 63690008(not necessary, for click fling)"},function()
    loadstring(game:HttpGet(dir['nexo'].."cyberpunk.lua"))()
end)
_nexo:CreateButton({name="Death Scythe ("..getgenv().change_mode_key..", "..getgenv().sprint_key..")",desc="Hats needed: 6202459318, 6203659107(not necessary)"},function()
    loadstring(game:HttpGet(dir['nexo'].."death_anim.lua"))()
end)
_nexo:CreateButton({name="BoomBox guy ("..getgenv().change_mode_key..", "..getgenv().sprint_key..", "..getgenv().hand_move_key..")",desc="Hats needed: 5975723552"},function()
    loadstring(game:HttpGet(dir['nexo'].."DJEban_anim.lua"))()
end)
_nexo:CreateButton({name="Angel"},function()
    loadstring(game:HttpGet(dir['nexo'].."angel_anim.lua"))()
end)
_nexo:CreateButton({name="my first anim (ugly)"},function()
    loadstring(game:HttpGet(dir['nexo'].."wreid_anim.lua"))()
end)
