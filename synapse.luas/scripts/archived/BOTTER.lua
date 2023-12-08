--[[

BOTTER.lua

For some stuped devs:
getgenv()... - is global var for exploit
_G... - is global var for roblox game

How to:
As default choosen all bots except owner(can select yourself via "!s me" cmd)
Owner doesn't includes in "!s all" cmd


!(command){!aliases} - {desc}
in-game commands:
!money(!cash,!m,!c) - start/stop drop cash
!f - upgrade Factories -- upgrades all towers for 1 lvl
!r - upgrade Oils -- upgrades all towers for 1 lvl
!towers(!t) - place all cash towers (factories and oils)
!s {botname/all/me} - choose bot to execute cmds
!pos {pos} - choose cash towers pos to place it (0(default) - any positions, 1-3)

]]--

getgenv().OWNER = "sashlar777"
getgenv().IS_OWNER_BOT = false

--- START
spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/scripts/autoexec.scripts/1.lua"))() end) -- anti-afk
spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/scripts/autoexec.scripts/2.lua"))() end) -- UNFOCUS
if _G.Instantes == nil then _G.Instantes = 0 end
_G.Instantes = _G.Instantes + 1
local me = game.Players.LocalPlayer

local function Lobby()
    spawn(function()
        while wait(3) do 
            if _G.Instantes ~= 1 then
                _G.Instantes = _G.Instantes - 1
                break
            end
            game:GetService("ReplicatedStorage").Events.SendPartyInviteEvent:FireServer(unpack({[1] = getgenv().OWNER}))
        end
    end)
end

local function Game()
    _G.MAP = game.ReplicatedStorage.RoundValues.MapName.Value
    getgenv().CHOOSEN = "all"
    if _G.myID == nil then 
        if me.Name ~= getgenv().OWNER then _G.myID = math.random(1,999) else _G.myID = "me" end
    end
    if _G.POSA == nil then _G.POSA = 0 end

    local cash = me.MainStats.Cash.Value

    local function sendMsg(_) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1] = _,[2] = "All"})) end
    local function UpgradeTower(_) game:GetService("ReplicatedStorage").Events:FindFirstChild("Upgrade Structure"):InvokeServer(unpack({[1] = workspace.Map.Towers:FindFirstChild(_)})) end
    local function PlaceTowers(id)
        local function ff(q,w)
            repeat wait();cash = me.MainStats.Cash.Value until cash > 299
            game:GetService("ReplicatedStorage").Events:FindFirstChild("Place Structure"):FireServer(unpack({[1] = "Factory",[2] = q,[3] = w}))
        end
        local function oo(q,w)
            repeat wait();cash = me.MainStats.Cash.Value until cash > 1449
            game:GetService("ReplicatedStorage").Events:FindFirstChild("Place Structure"):FireServer(unpack({[1] = "Oil Rig",[2] = q,[3] = w}))
        end

        if id == "Crisp Canyon" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(97.5, 16.509292602539, 42),2)
                ff(Vector3.new(97.5, 16.509292602539, 44),2)
                ff(Vector3.new(97.5, 16.509292602539, 46),2)
                ff(Vector3.new(97.5, 16.509292602539, 48),2)
                ff(Vector3.new(97.5, 16.509292602539, 50),2)
                ff(Vector3.new(97.5, 16.509292602539, 52),2)
                ff(Vector3.new(97.5, 16.509292602539, 54),2)
                ff(Vector3.new(97.5, 16.509292602539, 56),2)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(97.5, 16.509292602539, 58),2)
                ff(Vector3.new(97.5, 16.509292602539, 60),2)
                ff(Vector3.new(97.5, 16.509292602539, 62),2)
                ff(Vector3.new(97.5, 16.509292602539, 64),2)
                ff(Vector3.new(97.5, 16.509292602539, 66),2)
                ff(Vector3.new(97.5, 16.509292602539, 68),2)
                ff(Vector3.new(97.5, 16.509292602539, 70),2)
                ff(Vector3.new(97.5, 16.509292602539, 72),2)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(50, 16.509292602539, 63.7),3)
                ff(Vector3.new(48, 16.509292602539, 63.7),3)
                ff(Vector3.new(46, 16.509292602539, 63.7),3)
                ff(Vector3.new(44, 16.509292602539, 63.7),3)
                ff(Vector3.new(42, 16.509292602539, 63.7),3)
                ff(Vector3.new(40, 16.509292602539, 63.7),3)
                ff(Vector3.new(38, 16.509292602539, 63.7),3)
                ff(Vector3.new(38, 16.509292602539, 59.7),3)
            end
        elseif id == "Dusty Dunes" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(149, 16.469284057617, 24),2)
                ff(Vector3.new(149, 16.469284057617, 26),2)
                ff(Vector3.new(149, 16.469284057617, 28),2)
                ff(Vector3.new(149, 16.469284057617, 30),2)
                ff(Vector3.new(149, 16.469284057617, 32),2)
                ff(Vector3.new(149, 16.469284057617, 34),2)
                ff(Vector3.new(149, 16.469284057617, 36),2)
                ff(Vector3.new(149, 16.469284057617, 38),2)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(146.5, 16.469284057617, 24),2)
                ff(Vector3.new(146.5, 16.469284057617, 26),2)
                ff(Vector3.new(146.5, 16.469284057617, 28),2)
                ff(Vector3.new(146.5, 16.469284057617, 30),2)
                ff(Vector3.new(146.5, 16.469284057617, 32),2)
                ff(Vector3.new(146.5, 16.469284057617, 34),2)
                ff(Vector3.new(146.5, 16.469284057617, 36),2)
                ff(Vector3.new(146.5, 16.469284057617, 38),2)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(144, 16.469284057617, 24),2)
                ff(Vector3.new(144, 16.469284057617, 26),2)
                ff(Vector3.new(144, 16.469284057617, 28),2)
                ff(Vector3.new(144, 16.469284057617, 30),2)
                ff(Vector3.new(144, 16.469284057617, 32),2)
                ff(Vector3.new(144, 16.469284057617, 34),2)
                ff(Vector3.new(144, 16.469284057617, 36),2)
                ff(Vector3.new(144, 16.469284057617, 38),2)
            end
        elseif id == "Jungle" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(183, 17.127990722656, 122),0)
                ff(Vector3.new(183, 17.127990722656, 120),0)
                ff(Vector3.new(183, 17.127990722656, 118),0)
                ff(Vector3.new(183, 17.127990722656, 116),0)
                ff(Vector3.new(183, 17.127990722656, 114),0)
                ff(Vector3.new(183, 17.127990722656, 112),0)
                ff(Vector3.new(183, 17.127990722656, 110),0)
                ff(Vector3.new(183, 17.127990722656, 108),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(183, 17.127990722656, 106),0)
                ff(Vector3.new(183, 17.127990722656, 104),0)
                ff(Vector3.new(183, 17.127990722656, 102),0)
                ff(Vector3.new(183, 17.127990722656, 100),0)
                ff(Vector3.new(183, 17.127990722656, 98), 0)
                ff(Vector3.new(183, 17.127990722656, 96), 0)
                ff(Vector3.new(183, 17.127990722656, 94), 0)
                ff(Vector3.new(183, 17.127990722656, 92), 0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(180, 17.127990722656, 120),  1)
                ff(Vector3.new(180, 17.127990722656, 117.5),1)
                ff(Vector3.new(180, 17.127990722656, 115),  1)
                ff(Vector3.new(180, 17.127990722656, 112.5),1)
                ff(Vector3.new(180, 17.127990722656, 110),  1)
                ff(Vector3.new(180, 17.127990722656, 107.5),1)
                ff(Vector3.new(180, 17.127990722656, 105),  1)
                ff(Vector3.new(180, 17.127990722656, 102.5),1)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(130, 15.974204063416, 124),1)
                oo(Vector3.new(130, 15.974204063416, 119),1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(120, 15.974204063416, 124),1)
                oo(Vector3.new(120, 15.974204063416, 119),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(110, 15.974204063416, 124),1)
                oo(Vector3.new(110, 15.974204063416, 119),1)
            end
        elseif id == "Grasslands" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(132.33415222168, 13.869522094727, 25.005702972412),2)
                ff(Vector3.new(132.25158691406, 13.869522094727, 26.901378631592),2)
                ff(Vector3.new(132.30038452148, 13.869522094727, 28.932842254639),2)
                ff(Vector3.new(132.25454711914, 13.869522094727, 30.878967285156),2)
                ff(Vector3.new(132.21629333496, 13.869522094727, 32.783489227295),2)
                ff(Vector3.new(132.20391845703, 13.869522094727, 34.696308135986),2)
                ff(Vector3.new(129.20481872559, 13.869522094727, 26.102886199951),3)
                ff(Vector3.new(129.15512084961, 13.869522094727, 30.035999298096),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(135, 13.869522094727, 27),4)
                ff(Vector3.new(135, 13.869522094727, 29),4)
                ff(Vector3.new(135, 13.869522094727, 31),4)
                ff(Vector3.new(135, 13.869522094727, 33),4)
                ff(Vector3.new(135, 13.869522094727, 35),4)
                ff(Vector3.new(135, 13.869522094727, 37),4)
                ff(Vector3.new(135, 13.869522094727, 39),4)
                ff(Vector3.new(135, 13.869522094727, 41),4)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(95, 13.869522094727, 25) ,1)
                ff(Vector3.new(97, 13.869522094727, 25) ,1)
                ff(Vector3.new(99, 13.869522094727, 25) ,1)
                ff(Vector3.new(101, 13.869522094727, 25),1)
                ff(Vector3.new(103, 13.869522094727, 25),1)
                ff(Vector3.new(105, 13.869522094727, 25),1)
                ff(Vector3.new(107, 13.869522094727, 25),1)
                ff(Vector3.new(109, 13.869522094727, 25),1)
            end
        elseif id == "The Archipelagos" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(182, 33.632953643799, 168),2)
                ff(Vector3.new(182, 33.631950378418, 166),2)
                ff(Vector3.new(182, 33.632953643799, 164),2)
                ff(Vector3.new(182, 33.631950378418, 162),2)
                ff(Vector3.new(182, 33.632953643799, 160),2)
                ff(Vector3.new(182, 33.631950378418, 158),2)
                ff(Vector3.new(182, 33.632953643799, 156),2)
                ff(Vector3.new(182, 33.631950378418, 154),2)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(179.5, 33.632953643799, 168),2)
                ff(Vector3.new(179.5, 33.631950378418, 166),2)
                ff(Vector3.new(179.5, 33.632953643799, 164),2)
                ff(Vector3.new(179.5, 33.631950378418, 162),2)
                ff(Vector3.new(179.5, 33.632953643799, 160),2)
                ff(Vector3.new(179.5, 33.631950378418, 158),2)
                ff(Vector3.new(176.5, 33.636009216309, 167),3)
                ff(Vector3.new(176.5, 33.631595611572, 163),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(185, 33.627616882324, 164)  ,3)
                ff(Vector3.new(185, 33.627616882324, 161.5),3)
                ff(Vector3.new(185, 33.627616882324, 159)  ,3)
                ff(Vector3.new(185, 33.627616882324, 156.5),3)
                ff(Vector3.new(176.5, 33.627616882324, 159),3)
                ff(Vector3.new(187, 33.627616882324, 162)  ,3)
                ff(Vector3.new(187, 33.627616882324, 159.5),3)
                ff(Vector3.new(187, 33.627616882324, 157)  ,3)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(241, 22.363149642944, 212),3)
                oo(Vector3.new(241, 22.363149642944, 206),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(241, 22.363149642944, 200),3)
                oo(Vector3.new(241, 22.363149642944, 194),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(241, 22.363149642944, 188),3)
                oo(Vector3.new(241, 22.363149642944, 182),3)
            end
        elseif id == "Temple" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(26, 15.849548339844, 124),1)
                ff(Vector3.new(28, 15.849548339844, 124),1)
                ff(Vector3.new(30, 15.849548339844, 124),1)
                ff(Vector3.new(32, 15.849548339844, 124),1)
                ff(Vector3.new(34, 15.849548339844, 124),1)
                ff(Vector3.new(36, 15.849548339844, 124),1)
                ff(Vector3.new(38, 15.849548339844, 124),1)
                ff(Vector3.new(40, 15.849548339844, 124),1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(26, 15.849548339844, 121.4),1)
                ff(Vector3.new(28, 15.849548339844, 121.4),1)
                ff(Vector3.new(30, 15.849548339844, 121.4),1)
                ff(Vector3.new(32, 15.849548339844, 121.4),1)
                ff(Vector3.new(34, 15.849548339844, 121.4),1)
                ff(Vector3.new(36, 15.849548339844, 121.4),1)
                ff(Vector3.new(38, 15.849548339844, 121.4),1)
                ff(Vector3.new(40, 15.849548339844, 121.4),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(26, 15.849548339844, 119),1)
                ff(Vector3.new(28, 15.849548339844, 119),1)
                ff(Vector3.new(30, 15.849548339844, 119),1)
                ff(Vector3.new(32, 15.849548339844, 119),1)
                ff(Vector3.new(34, 15.849548339844, 119),1)
                ff(Vector3.new(36, 15.849548339844, 119),1)
                ff(Vector3.new(38, 15.849548339844, 119),1)
                ff(Vector3.new(40, 15.849548339844, 119),1)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(97, 16.931480407715, 95),   1)
                oo(Vector3.new(97, 16.931480407715, 90),   1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(102.3, 16.931480407715, 95),1)
                oo(Vector3.new(102.3, 16.931480407715, 90),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(107.6, 16.931480407715, 95),1)
                oo(Vector3.new(107.6, 16.931480407715, 90),1)
            end
        elseif id == "Endless Battlescape" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(72, 12.71940612793, 82.6),3)
                ff(Vector3.new(74, 12.71940612793, 82.6),3)
                ff(Vector3.new(76, 12.71940612793, 82.6),3)
                ff(Vector3.new(78, 12.71940612793, 82.6),3)
                ff(Vector3.new(72, 12.71940612793, 80)  ,3)
                ff(Vector3.new(74, 12.71940612793, 80)  ,3)
                ff(Vector3.new(76, 12.71940612793, 80)  ,3)
                ff(Vector3.new(78, 12.71940612793, 80)  ,3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(72, 12.71940612793, 77)  ,3)
                ff(Vector3.new(74, 12.71940612793, 77)  ,3)
                ff(Vector3.new(76, 12.71940612793, 77)  ,3)
                ff(Vector3.new(78, 12.71940612793, 77)  ,3)
                ff(Vector3.new(75, 12.71940612793, 71.6),2)
                ff(Vector3.new(74, 12.71940612793, 74.6),3)
                ff(Vector3.new(76, 12.71940612793, 74.6),3)
                ff(Vector3.new(78, 12.71940612793, 74.6),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(80, 12.71940612793, 82.6),3)
                ff(Vector3.new(82, 12.71940612793, 82.6),3)
                ff(Vector3.new(80, 12.71940612793, 80)  ,3)
                ff(Vector3.new(82, 12.71940612793, 80)  ,3)
                ff(Vector3.new(80, 12.71940612793, 77)  ,3)
                ff(Vector3.new(82, 12.71940612793, 77)  ,3)
                ff(Vector3.new(80, 12.71940612793, 74.6),3)
                ff(Vector3.new(82, 12.71940612793, 74.6),3)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(70.1, 15.201361656189, 116.4),0)
                oo(Vector3.new(74, 15.201361656189, 116.4)  ,0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(70, 15.201361656189, 111.3),0)
                oo(Vector3.new(74, 15.201361656189, 111.3),0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(71, 15.201361656189, 106.1),0)
                oo(Vector3.new(75, 15.201361656189, 106.1),0)
            end
        elseif id == "Lost Island" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(166, 18.885604858398, 86),0)
                ff(Vector3.new(166, 18.885604858398, 84),0)
                ff(Vector3.new(166, 18.885604858398, 82),0)
                ff(Vector3.new(166, 18.885604858398, 80),0)
                ff(Vector3.new(166, 18.885604858398, 78),0)
                ff(Vector3.new(166, 18.885604858398, 76),0)
                ff(Vector3.new(166, 18.885604858398, 74),0)
                ff(Vector3.new(166, 18.885604858398, 72),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(166, 18.885604858398, 70),0)
                ff(Vector3.new(166, 18.885604858398, 68),0)
                ff(Vector3.new(166, 18.885604858398, 66),0)
                ff(Vector3.new(166, 18.885604858398, 64),0)
                ff(Vector3.new(166, 18.885604858398, 62),0)
                ff(Vector3.new(166, 18.885604858398, 60),0)
                ff(Vector3.new(166, 18.885604858398, 58),0)
                ff(Vector3.new(166, 18.885604858398, 56),0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(163, 18.885604858398, 86)  ,1)
                ff(Vector3.new(163, 18.885604858398, 83.9),1)
                ff(Vector3.new(163, 18.885604858398, 81.6),1)
                ff(Vector3.new(163, 18.885604858398, 79.3),1)
                ff(Vector3.new(163, 18.885604858398, 77)  ,1)
                ff(Vector3.new(163, 18.885604858398, 74.9),1)
                ff(Vector3.new(163, 18.885604858398, 72.6),1)
                ff(Vector3.new(163, 18.885604858398, 70.3),1)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(151, 15.044547080994, 23)  ,4)
                oo(Vector3.new(156, 15.044547080994, 23)  ,4)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(156, 15.044547080994, 28.2),4)
                oo(Vector3.new(161, 15.044547080994, 28.2),4)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(161, 15.044547080994, 33.4),4)
                oo(Vector3.new(161, 15.044547080994, 23)  ,4)
            end
        elseif id == "Rubik's Garden" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(60, 20.068359375, 81),  3)
                ff(Vector3.new(60, 20.068359375, 78.5),3)
                ff(Vector3.new(60, 20.068359375, 76),  3)
                ff(Vector3.new(60, 20.068359375, 73.5),3)
                ff(Vector3.new(60, 20.068359375, 71),  3)
                ff(Vector3.new(60, 20.068359375, 68.5),3)
                ff(Vector3.new(60, 20.068359375, 66),  3)
                ff(Vector3.new(60, 20.068359375, 63.5),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(62, 20.068359375, 73.5),3)
                ff(Vector3.new(62, 20.068359375, 71),  3)
                ff(Vector3.new(62, 20.068359375, 68.5),3)
                ff(Vector3.new(62, 20.068359375, 66),  3)
                ff(Vector3.new(62, 20.068359375, 63.5),3)
                ff(Vector3.new(62, 20.068359375, 61),  3)
                ff(Vector3.new(62, 20.068359375, 58.5),3)
                ff(Vector3.new(62, 20.068359375, 56),  3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(64, 20.068359375, 68.5),3)
                ff(Vector3.new(64, 20.068359375, 66),  3)
                ff(Vector3.new(64, 20.068359375, 63.5),3)
                ff(Vector3.new(60, 20.068359375, 61),  3)
                ff(Vector3.new(60, 20.068359375, 58.5),3)
                ff(Vector3.new(64, 20.068359375, 56),  3)
                ff(Vector3.new(64, 20.068359375, 53.5),3)
                ff(Vector3.new(64, 20.068359375, 51),  3)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(270, 6.4743566513062, 29),3)
                oo(Vector3.new(276, 6.4743566513062, 29),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(282, 6.4743566513062, 29),3)
                oo(Vector3.new(288, 6.4743566513062, 29),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(294, 6.4743566513062, 29),3)
                oo(Vector3.new(300, 6.4743566513062, 29),3)
            end
        elseif id == "Sakura Gardens" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(186.5, 21.311233520508, 92),2)
                ff(Vector3.new(184, 21.311233520508, 92)  ,2)
                ff(Vector3.new(186.5, 21.311233520508, 90),2)
                ff(Vector3.new(184, 21.311233520508, 90)  ,2)
                ff(Vector3.new(186.5, 21.311233520508, 88),2)
                ff(Vector3.new(184, 21.311233520508, 88)  ,2)
                ff(Vector3.new(186.5, 21.311233520508, 86),2)
                ff(Vector3.new(184, 21.311233520508, 86)  ,2)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(177, 21.310394287109, 104),3)
                ff(Vector3.new(175, 21.310394287109, 104),3)
                ff(Vector3.new(173, 21.310394287109, 104),3)
                ff(Vector3.new(171, 21.310394287109, 104),3)
                ff(Vector3.new(169, 21.310394287109, 104),3)
                ff(Vector3.new(167, 21.310394287109, 104),3)
                ff(Vector3.new(165, 21.310394287109, 104),3)
                ff(Vector3.new(163, 21.310394287109, 104),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(177, 21.310394287109, 101.5),3)
                ff(Vector3.new(175, 21.310394287109, 101.5),3)
                ff(Vector3.new(173, 21.310394287109, 101.5),3)
                ff(Vector3.new(171, 21.310394287109, 101.5),3)
                ff(Vector3.new(161, 21.310394287109, 104)  ,3)
                ff(Vector3.new(159, 21.310394287109, 104)  ,3)
                ff(Vector3.new(157, 21.310394287109, 104)  ,3)
                ff(Vector3.new(163, 21.310394287109, 101.5),3)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(177.67343139648, 21.392416000366, 55.510437011719),3)
                oo(Vector3.new(176.67211914062, 21.392416000366, 60.65348815918) ,3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(175.06153869629, 21.392416000366, 65.755081176758),3)
                oo(Vector3.new(172.62223815918, 21.392416000366, 70.951210021973),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(169.68692016602, 21.392416000366, 65.785232543945),3)
                oo(Vector3.new(171.533203125, 21.392416000366, 60.358814239502)  ,3)
            end
        elseif id == "Arctic Pathway" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(140, 29.209503173828, 70),  4)
                ff(Vector3.new(140, 29.209503173828, 68),  4)
                ff(Vector3.new(140, 29.209503173828, 66),  4)
                ff(Vector3.new(140, 29.209503173828, 64),  4)
                ff(Vector3.new(142.5, 29.209503173828, 70),4)
                ff(Vector3.new(142.5, 29.209503173828, 68),4)
                ff(Vector3.new(142.5, 29.209503173828, 72),4)
                ff(Vector3.new(142.5, 29.209503173828, 74),4)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(128, 29.205074310303, 72),  1)
                ff(Vector3.new(126, 29.205142974854, 72),  1)
                ff(Vector3.new(124, 29.205074310303, 72),  1)
                ff(Vector3.new(122, 29.205142974854, 72),  1)
                ff(Vector3.new(120, 29.205074310303, 72),  1)
                ff(Vector3.new(118, 29.205142974854, 72),  1)
                ff(Vector3.new(114, 29.204776763916, 72.4),1)
                ff(Vector3.new(112, 29.205142974854, 72),  1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(110, 29.209503173828, 70.7),1)
                ff(Vector3.new(108, 29.209503173828, 70.7),1)
                ff(Vector3.new(106, 29.209503173828, 70.7),1)
                ff(Vector3.new(104, 29.209503173828, 70.7),1)
                ff(Vector3.new(102, 29.209503173828, 70.7),1)
                ff(Vector3.new(100, 29.209503173828, 70.7),1)
                ff(Vector3.new(98, 29.209503173828, 70.7), 1)
                ff(Vector3.new(96, 29.209503173828, 70.7), 1)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(81.470481872559, 16.991630554199, 80.29515838623), 0)
                oo(Vector3.new(83.194671630859, 16.991630554199, 85.774871826172),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(76.196678161621, 16.991630554199, 81.854911804199),0)
                oo(Vector3.new(77.73860168457, 16.991630554199, 87.034156799316), 0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(84.5810546875, 16.991630554199, 90.941780090332),  0)
                oo(Vector3.new(79.146675109863, 16.991630554199, 92.221504211426),0)
            end

        elseif id == "Waterfalls" then
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(173, 94.568084716797, 28),0)
                ff(Vector3.new(173, 94.568084716797, 30),0)
                ff(Vector3.new(173, 94.603149414062, 32),0)
                ff(Vector3.new(173, 94.568084716797, 34),0)
                ff(Vector3.new(173, 94.568084716797, 36),0)
                ff(Vector3.new(173, 94.568084716797, 40),0)
                ff(Vector3.new(173, 94.568084716797, 42),0)
                ff(Vector3.new(173, 94.568084716797, 44),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(170, 94.568084716797, 29),3)
                ff(Vector3.new(168, 94.568084716797, 29),3)
                ff(Vector3.new(166, 94.568084716797, 29),3)
                ff(Vector3.new(164, 94.568084716797, 29),3)
                ff(Vector3.new(170, 94.568084716797, 32),3)
                ff(Vector3.new(168, 94.568084716797, 32),3)
                ff(Vector3.new(166, 94.568084716797, 32),3)
                ff(Vector3.new(164, 94.568084716797, 32),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(162, 94.568084716797, 29),3)
                ff(Vector3.new(160, 94.568084716797, 29),3)
                ff(Vector3.new(162, 94.568084716797, 32),3)
                ff(Vector3.new(160, 94.568084716797, 32),3)
                ff(Vector3.new(173, 94.568084716797, 46),0)
                ff(Vector3.new(173, 94.568084716797, 48),0)
                ff(Vector3.new(173, 94.568084716797, 50),0)
                ff(Vector3.new(173, 94.568084716797, 52),0)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(175.5447845459, 95.000648498535, 70.529151916504),3)
                oo(Vector3.new(171.82391357422, 94.94945526123, 64.053565979004),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(170.25770568848, 94.94945526123, 70.966110229492),3)
                oo(Vector3.new(166.46145629883, 94.94945526123, 64.82292175293) ,3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(169.20211791992, 94.94945526123, 77.589004516602),3)
                oo(Vector3.new(165.04423522949, 94.94945526123, 70.566520690918),3)
            end
        elseif id == "Lonely Lodge" then        -- Cristmas event
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(-53, 1.7194669246674, 123),1)
                ff(Vector3.new(-55, 1.7194669246674, 123),1)
                ff(Vector3.new(-57, 1.7194669246674, 123),1)
                ff(Vector3.new(-59, 1.7194669246674, 123),1)
                ff(Vector3.new(-61, 1.7194669246674, 123),1)
                ff(Vector3.new(-63, 1.7194669246674, 123),1)
                ff(Vector3.new(-65, 1.7194669246674, 123),1)
                ff(Vector3.new(-67, 1.7194669246674, 123),1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(-53, 1.7194669246674, 120),1)
                ff(Vector3.new(-55, 1.7194669246674, 120),1)
                ff(Vector3.new(-57, 1.7194669246674, 120),1)
                ff(Vector3.new(-59, 1.7194669246674, 120),1)
                ff(Vector3.new(-61, 1.7194669246674, 120),1)
                ff(Vector3.new(-63, 1.7194669246674, 120),1)
                ff(Vector3.new(-65, 1.7194669246674, 120),1)
                ff(Vector3.new(-67, 1.7194669246674, 120),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(-53, 1.7194669246674, 117),1)
                ff(Vector3.new(-55, 1.7194669246674, 117),1)
                ff(Vector3.new(-57, 1.7194669246674, 117),1)
                ff(Vector3.new(-59, 1.7194669246674, 117),1)
                ff(Vector3.new(-61, 1.7194669246674, 117),1)
                ff(Vector3.new(-63, 1.7194669246674, 117),1)
                ff(Vector3.new(-65, 1.7194669246674, 117),1)
                ff(Vector3.new(-67, 1.7194669246674, 117),1)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(-67.255210876465, -22.448572158813, -41.631046295166),1)
                oo(Vector3.new(-72.678901672363, -22.448572158813, -43.70556640625) ,1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(-78.058418273926, -22.448572158813, -44.019630432129),1)
                oo(Vector3.new(-83.655128479004, -22.448572158813, -45.051246643066),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(-66.881233215332, -22.448572158813, -46.905433654785),1)
                oo(Vector3.new(-72.985336303711, -22.448572158813, -49.272087097168),1)
            end
        elseif id == "The Siege" then           -- Cristmas event
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(271, 20.207427978516, 95),1)
                ff(Vector3.new(269, 20.207427978516, 95),1)
                ff(Vector3.new(267, 20.207427978516, 95),1)
                ff(Vector3.new(265, 20.207427978516, 95),1)
                ff(Vector3.new(263, 20.207427978516, 95),1)
                ff(Vector3.new(261, 20.207427978516, 95),1)
                ff(Vector3.new(259, 20.207427978516, 95),1)
                ff(Vector3.new(257, 20.207427978516, 95),1)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(271, 20.207427978516, 92),1)
                ff(Vector3.new(269, 20.207427978516, 92),1)
                ff(Vector3.new(267, 20.207427978516, 92),1)
                ff(Vector3.new(265, 20.207427978516, 92),1)
                ff(Vector3.new(263, 20.207427978516, 92),1)
                ff(Vector3.new(261, 20.207427978516, 92),1)
                ff(Vector3.new(259, 20.207427978516, 92),1)
                ff(Vector3.new(257, 20.207427978516, 92),1)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(271, 20.207427978516, 97),1)
                ff(Vector3.new(269, 20.207427978516, 97),1)
                ff(Vector3.new(267, 20.207427978516, 97),1)
                ff(Vector3.new(265, 20.207427978516, 97),1)
                ff(Vector3.new(263, 20.207427978516, 97),1)
                ff(Vector3.new(261, 20.207427978516, 97),1)
                ff(Vector3.new(259, 20.207427978516, 97),1)
                ff(Vector3.new(257, 20.207427978516, 97),1)
            end
            --Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(87, 17.413017272949, 135),0)
                oo(Vector3.new(87, 17.413017272949, 130),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(87, 17.413017272949, 125),0)
                oo(Vector3.new(87, 17.413017272949, 120),0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(87, 17.413017272949, 115),0)
                oo(Vector3.new(87, 17.413017272949, 110),0)
            end
        elseif id == "Snow Town" then           -- Cristmas event
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(369, 18.181091308594, 68),0)
                ff(Vector3.new(369, 18.181091308594, 70),0)
                ff(Vector3.new(369, 18.181091308594, 72),0)
                ff(Vector3.new(369, 18.181091308594, 74),0)
                ff(Vector3.new(369, 18.181091308594, 76),0)
                ff(Vector3.new(369, 18.181091308594, 78),0)
                ff(Vector3.new(369, 18.181091308594, 80),0)
                ff(Vector3.new(369, 18.181091308594, 82),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(367, 18.181091308594, 68),0)
                ff(Vector3.new(367, 18.181091308594, 70),0)
                ff(Vector3.new(367, 18.181091308594, 72),0)
                ff(Vector3.new(367, 18.181091308594, 74),0)
                ff(Vector3.new(367, 18.181091308594, 76),0)
                ff(Vector3.new(367, 18.181091308594, 78),0)
                ff(Vector3.new(367, 18.181091308594, 80),0)
                ff(Vector3.new(367, 18.181091308594, 82),0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(365, 18.181091308594, 68),0)
                ff(Vector3.new(365, 18.181091308594, 70),0)
                ff(Vector3.new(365, 18.181091308594, 72),0)
                ff(Vector3.new(365, 18.181091308594, 74),0)
                ff(Vector3.new(365, 18.181091308594, 76),0)
                ff(Vector3.new(365, 18.181091308594, 78),0)
                ff(Vector3.new(365, 18.181091308594, 80),0)
                ff(Vector3.new(365, 18.181091308594, 82),0)
            end
        elseif id == "Frozen Palace" then       -- Cristmas event
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(624, 11.876326560974, -96),3)
                ff(Vector3.new(626, 11.876326560974, -96),3)
                ff(Vector3.new(628, 11.876326560974, -96),3)
                ff(Vector3.new(630, 11.876326560974, -96),3)
                ff(Vector3.new(632, 11.876326560974, -96),3)
                ff(Vector3.new(634, 11.876326560974, -96),3)
                ff(Vector3.new(636, 11.876326560974, -96),3)
                ff(Vector3.new(638, 11.876326560974, -96),3)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(624, 11.876326560974, -93),3)
                ff(Vector3.new(626, 11.876326560974, -93),3)
                ff(Vector3.new(628, 11.876326560974, -93),3)
                ff(Vector3.new(630, 11.876326560974, -93),3)
                ff(Vector3.new(632, 11.876326560974, -93),3)
                ff(Vector3.new(634, 11.876326560974, -93),3)
                ff(Vector3.new(636, 11.876326560974, -93),3)
                ff(Vector3.new(638, 11.876326560974, -93),3)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(624, 11.876326560974, -99),3)
                ff(Vector3.new(626, 11.876326560974, -99),3)
                ff(Vector3.new(628, 11.876326560974, -99),3)
                ff(Vector3.new(630, 11.876326560974, -99),3)
                ff(Vector3.new(632, 11.876326560974, -99),3)
                ff(Vector3.new(634, 11.876326560974, -99),3)
                ff(Vector3.new(636, 11.876326560974, -99),3)
                ff(Vector3.new(638, 11.876326560974, -99),3)
            end
            -- Oils
            if _G.POSA == 0 or _G.POSA == 1 then
                oo(Vector3.new(456, 18.658330917358, 67),0)
                oo(Vector3.new(456, 18.658330917358, 62),0)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                oo(Vector3.new(456, 18.658330917358, 57),0)
                oo(Vector3.new(456, 18.658330917358, 52),0)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                oo(Vector3.new(456, 18.658330917358, 47),0)
                oo(Vector3.new(456, 18.658330917358, 42),0)
            end
        elseif id == "Christmas Plaza" then     -- Cristmas event
            -- Factories
            if _G.POSA == 0 or _G.POSA == 1 then
                ff(Vector3.new(562, 13.703826904297, 412),4)
                ff(Vector3.new(562, 13.703826904297, 410),4)
                ff(Vector3.new(562, 13.703826904297, 408),4)
                ff(Vector3.new(562, 13.703826904297, 406),4)
                ff(Vector3.new(562, 13.703826904297, 404),4)
                ff(Vector3.new(562, 13.703826904297, 402),4)
                ff(Vector3.new(562, 13.703826904297, 400),4)
                ff(Vector3.new(562, 13.703826904297, 398),4)
            end
            if _G.POSA == 0 or _G.POSA == 2 then
                ff(Vector3.new(564, 13.703826904297, 412),4)
                ff(Vector3.new(564, 13.703826904297, 410),4)
                ff(Vector3.new(564, 13.703826904297, 408),4)
                ff(Vector3.new(564, 13.703826904297, 406),4)
                ff(Vector3.new(564, 13.703826904297, 404),4)
                ff(Vector3.new(564, 13.703826904297, 402),4)
                ff(Vector3.new(564, 13.703826904297, 400),4)
                ff(Vector3.new(564, 13.703826904297, 398),4)
                ff(Vector3.new(564, 13.703826904297, 412),4)
            end
            if _G.POSA == 0 or _G.POSA == 3 then
                ff(Vector3.new(569, 13.703826904297, 410),4)
                ff(Vector3.new(569, 13.703826904297, 408),4)
                ff(Vector3.new(569, 13.703826904297, 406),4)
                ff(Vector3.new(569, 13.703826904297, 404),4)
                ff(Vector3.new(569, 13.703826904297, 402),4)
                ff(Vector3.new(569, 13.703826904297, 400),4)
                ff(Vector3.new(569, 13.703826904297, 398),4)
            end
        end
    end
    local function chicen()
        if me.Name == getgenv().OWNER and getgenv().CHOOSEN ~= getgenv().OWNER then
            if getgenv().IS_OWNER_BOT then
                return true
            else
                return false
            end
        elseif getgenv().CHOOSEN == "all" or getgenv().CHOOSEN == me.Name then
            return true
        end
    end

    spawn(function()
        _G.moni = false
    	for i,g in pairs(game.Players:GetChildren()) do
    		if g.Name == getgenv().OWNER then
                if _G.Instantes ~= 1 then -- remove old instance
                    _G.somegyminst:Disconnect()
                    _G.Instantes = _G.Instantes - 1
                end
    			_G.somegyminst = g.Chatted:Connect(function(msg)

                                --- auto drop cash
    				if (tostring(msg) == "!money" or tostring(msg) == "!cash" or tostring(msg) == "!m" or tostring(msg) == "!c") and chicen() and me.Name ~= getgenv().OWNER then
                        spawn(function()
                            _G.moni = not _G.moni
                            if _G.moni then sendMsg("~ Starting drop cash.") elseif not _G.moni then sendMsg("~ Finishing drop cash.") end
                            while wait() do
                                if _G.moni then
                                    game:GetService("ReplicatedStorage").Events.CashDropEvent:FireServer()
                                elseif not _G.moni then
                                    break
                                end
                            end
                        end)

                                --- upgrading Factories
    				elseif tostring(msg) == "!f" and chicen() then
                        -- Factories
                        local lvl = ""
                        local IiI = 0
                        local maxIiI = 0
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Factory" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "Faster Production" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "More Staff" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "Rare Crystal Production" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            end
                        end
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Factory" or v.Name == "Faster Production" or v.Name == "More Staff" or v.Name == "Rare Crystal Production" or v.Name == "Big Investment" then maxIiI = maxIiI + 1 end
                        end
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Factory" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "1" else lvl = lvl .. "1," end
                            elseif v.Name == "Faster Production" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "2" else lvl = lvl .. "2," end
                            elseif v.Name == "More Staff" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "3" else lvl = lvl .. "3," end
                            elseif v.Name == "Rare Crystal Production" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "4" else lvl = lvl .. "4," end
                            elseif v.Name == "Big Investment" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "5" else lvl = lvl .. "5," end
                            end
                        end
                        sendMsg('~ Factories upgraded. ('..lvl..')')

                                --- upgrading Oils
    				elseif tostring(msg) == "!r" and chicen() then
                        -- Oil States
                        local lvl = ""
                        local IiI = 0
                        local maxIiI = 0
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Oil Rig" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "Sea Resistant" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "Sturdy Barrels" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            elseif v.Name == "BP Investment" and v.Settings.TowerValues.Owner.Value == me.Name then
                                UpgradeTower(v.Name)
                            end
                        end
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Oil Rig" or v.Name == "Sea Resistant" or v.Name == "Sturdy Barrels" or v.Name == "BP Investment" or v.Name == "Sea Base" then maxIiI = maxIiI + 1 end
                        end
                        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                            if v.Name == "Oil Rig" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "1" else lvl = lvl .. "1," end
                            elseif v.Name == "Sea Resistant" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "2" else lvl = lvl .. "2," end
                            elseif v.Name == "Sturdy Barrels" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "3" else lvl = lvl .. "3," end
                            elseif v.Name == "BP Investment" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "4" else lvl = lvl .. "4," end
                            elseif v.Name == "Sea Base" and v.Settings.TowerValues.Owner.Value == me.Name then
                                IiI = IiI + 1
                                if IiI == maxIiI then lvl = lvl .. "5" else lvl = lvl .. "5," end
                            end
                        end
                        sendMsg('~ Oils upgraded. ('..lvl..')')

                                --- build factories
    				elseif (tostring(msg) == "!towers" or tostring(msg) == "!t") and chicen() then
                        spawn(function()
                            PlaceTowers(_G.MAP)
                            local placed = 0
                            for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                                if v.Settings.TowerValues.Owner.Value == me.Name then
                                    placed = placed + 1
                                end
                            end
                            sendMsg('~ placed '..placed..' towers.')
                        end)

                                --- bot selector
                    elseif string.find(tostring(msg), "!s") or string.find(tostring(msg), "!select") then 
                        if tostring(msg) == "!s all" or tostring(msg) == "!select all" then
                            getgenv().CHOOSEN = "all"
                        elseif (tostring(msg) == "!s "..me.Name or tostring(msg) == "!select "..me.Name) or (tostring(msg) == "!s ".._G.myID or tostring(msg) == "!select ".._G.myID) then
                            getgenv().CHOOSEN = me.Name
                            sendMsg("~ Listening.")
                        elseif tostring(msg) == "!s" or tostring(msg) == "!select" then
                            sendMsg('~ My id: '.._G.myID)
                        end

                                --- position selector
                    elseif string.find(tostring(msg), "!pos") and chicen() then
                        if tostring(msg) == "!pos 0" then
                            _G.POSA = 0
                        elseif tostring(msg) == "!pos 1" then
                            _G.POSA = 1
                        elseif tostring(msg) == "!pos 2" then
                            _G.POSA = 2
                        elseif tostring(msg) == "!pos 3" then
                            _G.POSA = 3
                        end
                        sendMsg("Selected position: ".._G.POSA)

    				end
    			end)
    		end
    	end
    end)
end

if game.PlaceId == 2356303743 then Game()
elseif game.PlaceId == 2286901071 and me.Name ~= getgenv().OWNER then Lobby()
end
