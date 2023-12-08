if _G.TheBOTTERLUA ~= nil then
    for _,a in pairs(game:GetDescendants()) do
        if a.Name == _G.TheBOTTERLUA then
            a:Destroy()
        end
    end
end
  
if game.PlaceId ~= 2356303743 then return end

--- starter vars
local me = game.Players.LocalPlayer
_G.MAP = game.ReplicatedStorage.RoundValues.MapName.Value
if _G.POSA == nil then _G.POSA = 1 end
if _G.infoInstanes == nil then _G.infoInstanes = 0 end
local cash = me.MainStats.Cash.Value
local asset = {maxF = 8,maxO = 2}
local fmaps = {"Crisp Canyon",
                "Dusty Dunes",
                "Jungle",
                "Grasslands",
                "The Archipelagos",
                "Temple",
                "Endless Battlescape",
                "Lost Island",
                "Rubik's Garden",
                "Sakura Gardens",
                "Arctic Pathway",
                "Waterfalls",
                "Lonely Lodge",
                "The Siege",
                "Snow Town",
                "Frozen Palace",
                "Christmas Plaza",
                "Zap Zap",
                "Bucket Shrine",
                "U Park",
                "Gate of Xovuso"
}
local omaps = {
                "Jungle",
                "The Archipelagos",
                "Temple",
                "Endless Battlescape",
                "Lost Island",
                "Rubik's Garden",
                "Sakura Gardens",
                "Arctic Pathway",
                "Waterfalls",
                "Lonely Lodge",
                "The Siege",
                "Frozen Palace",
                "Zap Zap",
                "Bucket Shrine",
                "Gate of Xovuso"
}

-- gui objects

local SCRG = Instance.new("ScreenGui")
 local Body = Instance.new("Frame")
  local POS1 = Instance.new("TextButton")
  local POS2 = Instance.new("TextButton")
  local POS3 = Instance.new("TextButton")
 local Buttons = Instance.new("Frame")
  local UiGLB = Instance.new("UIGridLayout")
   local UPGF = Instance.new("TextButton")
   local UPGO = Instance.new("TextButton")
   local BUYT = Instance.new("TextButton")
   local BUYO = Instance.new("TextButton")

_G.TheBOTTERLUA = tostring(math.random(9999,99999))
 SCRG.Name = _G.TheBOTTERLUA
 SCRG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 SCRG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 SCRG.ResetOnSpawn = false
 
 Body.Name = "Body"
 Body.Parent = SCRG
 Body.AnchorPoint = Vector2.new(0.5, 0.5)
 Body.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
 Body.BackgroundTransparency = 0.800
 Body.BorderSizePixel = 0
 Body.Position = UDim2.new(0.675, 0, 0.858, 0)
 Body.Size = UDim2.new(0, 239, 0, 50)
 Body.Draggable = true
 Body.Active = true
 
 Buttons.Name = "Buttons"
 Buttons.Parent = Body
 Buttons.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
 Buttons.BackgroundTransparency = 1.000
 Buttons.BorderSizePixel = 0
 Buttons.Position = UDim2.new(0.00999999978, 0, 0.0599999987, 0)
 Buttons.Size = UDim2.new(0.980000019, 0, 0.889999986, 0)
 
 UPGF.Name = "UPGF"
 UPGF.Parent = Buttons
 UPGF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 UPGF.BorderSizePixel = 0
 UPGF.Size = UDim2.new(0, 200, 0, 50)
 UPGF.Font = Enum.Font.SourceSans
 UPGF.Text = "Upg Factories"
 UPGF.TextColor3 = Color3.fromRGB(0, 0, 0)
 UPGF.TextScaled = true
 UPGF.TextSize = 14.000
 UPGF.TextWrapped = true
 
 UiGLB.Name = "UiGLB"
 UiGLB.Parent = Buttons
 UiGLB.SortOrder = Enum.SortOrder.LayoutOrder
 UiGLB.CellPadding = UDim2.new(0, 3, 0, 3)
 UiGLB.CellSize = UDim2.new(0, 45, 0, 44)
 UiGLB.FillDirectionMaxCells = 4
 
 UPGO.Name = "UPGO"
 UPGO.Parent = Buttons
 UPGO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 UPGO.BorderSizePixel = 0
 UPGO.Position = UDim2.new(0.294117659, 0, 0.516129017, 0)
 UPGO.Size = UDim2.new(0, 200, 0, 50)
 UPGO.Font = Enum.Font.SourceSans
 UPGO.Text = "Upg Oils"
 UPGO.TextColor3 = Color3.fromRGB(0, 0, 0)
 UPGO.TextScaled = true
 UPGO.TextSize = 14.000
 UPGO.TextWrapped = true
 
 BUYT.Name = "BUYT"
 BUYT.Parent = Buttons
 BUYT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 BUYT.BorderSizePixel = 0
 BUYT.Position = UDim2.new(0.294117659, 0, 0.516129017, 0)
 BUYT.Size = UDim2.new(0, 200, 0, 50)
 BUYT.Font = Enum.Font.SourceSans
 BUYT.Text = "Buy Factories"
 BUYT.TextColor3 = Color3.fromRGB(0, 0, 0)
 BUYT.TextScaled = true
 BUYT.TextSize = 14.000
 BUYT.TextWrapped = true
 
 BUYO.Name = "BUYO"
 BUYO.Parent = Buttons
 BUYO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 BUYO.BorderSizePixel = 0
 BUYO.Position = UDim2.new(0.294117659, 0, 0.516129017, 0)
 BUYO.Size = UDim2.new(0, 200, 0, 50)
 BUYO.Font = Enum.Font.SourceSans
 BUYO.Text = "Buy Oils"
 BUYO.TextColor3 = Color3.fromRGB(0, 0, 0)
 BUYO.TextScaled = true
 BUYO.TextSize = 14.000
 BUYO.TextWrapped = true
 
 POS1.Name = "POS1"
 POS1.Parent = Body
 POS1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 POS1.BorderSizePixel = 0
 POS1.Position = UDim2.new(0.814999878, 0, 0.0599999987, 0)
 POS1.Size = UDim2.new(0.174999997, 0, 0, 12)
 POS1.Font = Enum.Font.SourceSans
 POS1.Text = "  1"
 POS1.TextColor3 = Color3.fromRGB(0, 0, 0)
 POS1.TextSize = 14.000
 POS1.TextXAlignment = Enum.TextXAlignment.Left
 
 POS2.Name = "POS2"
 POS2.Parent = Body
 POS2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 POS2.BorderSizePixel = 0
 POS2.Position = UDim2.new(0.814999998, 0, 0.370000005, 0)
 POS2.Size = UDim2.new(0.174999997, 0, 0, 12)
 POS2.Font = Enum.Font.SourceSans
 POS2.Text = "  2"
 POS2.TextColor3 = Color3.fromRGB(0, 0, 0)
 POS2.TextSize = 14.000
 POS2.TextXAlignment = Enum.TextXAlignment.Left
 
 POS3.Name = "POS3"
 POS3.Parent = Body
 POS3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 POS3.BorderSizePixel = 0
 POS3.Position = UDim2.new(0.814999998, 0, 0.699999988, 0)
 POS3.Size = UDim2.new(0.174999997, 0, 0, 12)
 POS3.Font = Enum.Font.SourceSans
 POS3.Text = "  3"
 POS3.TextColor3 = Color3.fromRGB(0, 0, 0)
 POS3.TextSize = 14.000
 POS3.TextXAlignment = Enum.TextXAlignment.Left

--- starter funcs
local function UpgradeTower(obj) game:GetService("ReplicatedStorage").Events:FindFirstChild("Upgrade Structure"):InvokeServer(unpack({[1] = obj})) end
local function PlaceTowers(type)
    local function ff(q,w) game:GetService("ReplicatedStorage").Events:FindFirstChild("Place Structure"):FireServer(unpack({[1] = "Factory",[2] = q,[3] = w})) end
    local function oo(q,w) game:GetService("ReplicatedStorage").Events:FindFirstChild("Place Structure"):FireServer(unpack({[1] = "Oil Rig",[2] = q,[3] = w})) end

    if _G.MAP == "Crisp Canyon" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(97.5, 16.509292602539, 42),2)
            ff(Vector3.new(97.5, 16.509292602539, 44),2)
            ff(Vector3.new(97.5, 16.509292602539, 46),2)
            ff(Vector3.new(97.5, 16.509292602539, 48),2)
            ff(Vector3.new(97.5, 16.509292602539, 50),2)
            ff(Vector3.new(97.5, 16.509292602539, 52),2)
            ff(Vector3.new(97.5, 16.509292602539, 54),2)
            ff(Vector3.new(97.5, 16.509292602539, 56),2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(97.5, 16.509292602539, 58),2)
            ff(Vector3.new(97.5, 16.509292602539, 60),2)
            ff(Vector3.new(97.5, 16.509292602539, 62),2)
            ff(Vector3.new(97.5, 16.509292602539, 64),2)
            ff(Vector3.new(97.5, 16.509292602539, 66),2)
            ff(Vector3.new(97.5, 16.509292602539, 68),2)
            ff(Vector3.new(97.5, 16.509292602539, 70),2)
            ff(Vector3.new(97.5, 16.509292602539, 72),2)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(50, 16.509292602539, 63.7),3)
            ff(Vector3.new(48, 16.509292602539, 63.7),3)
            ff(Vector3.new(46, 16.509292602539, 63.7),3)
            ff(Vector3.new(44, 16.509292602539, 63.7),3)
            ff(Vector3.new(42, 16.509292602539, 63.7),3)
            ff(Vector3.new(40, 16.509292602539, 63.7),3)
            ff(Vector3.new(38, 16.509292602539, 63.7),3)
            ff(Vector3.new(38, 16.509292602539, 59.7),3)
        end
    elseif _G.MAP == "Dusty Dunes" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(149, 16.469284057617, 24),2)
            ff(Vector3.new(149, 16.469284057617, 26),2)
            ff(Vector3.new(149, 16.469284057617, 28),2)
            ff(Vector3.new(149, 16.469284057617, 30),2)
            ff(Vector3.new(149, 16.469284057617, 32),2)
            ff(Vector3.new(149, 16.469284057617, 34),2)
            ff(Vector3.new(149, 16.469284057617, 36),2)
            ff(Vector3.new(149, 16.469284057617, 38),2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(146.5, 16.469284057617, 24),2)
            ff(Vector3.new(146.5, 16.469284057617, 26),2)
            ff(Vector3.new(146.5, 16.469284057617, 28),2)
            ff(Vector3.new(146.5, 16.469284057617, 30),2)
            ff(Vector3.new(146.5, 16.469284057617, 32),2)
            ff(Vector3.new(146.5, 16.469284057617, 34),2)
            ff(Vector3.new(146.5, 16.469284057617, 36),2)
            ff(Vector3.new(146.5, 16.469284057617, 38),2)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(144, 16.469284057617, 24),2)
            ff(Vector3.new(144, 16.469284057617, 26),2)
            ff(Vector3.new(144, 16.469284057617, 28),2)
            ff(Vector3.new(144, 16.469284057617, 30),2)
            ff(Vector3.new(144, 16.469284057617, 32),2)
            ff(Vector3.new(144, 16.469284057617, 34),2)
            ff(Vector3.new(144, 16.469284057617, 36),2)
            ff(Vector3.new(144, 16.469284057617, 38),2)
        end
    elseif _G.MAP == "Jungle" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(183, 17.127990722656, 122),0)
            ff(Vector3.new(183, 17.127990722656, 120),0)
            ff(Vector3.new(183, 17.127990722656, 118),0)
            ff(Vector3.new(183, 17.127990722656, 116),0)
            ff(Vector3.new(183, 17.127990722656, 114),0)
            ff(Vector3.new(183, 17.127990722656, 112),0)
            ff(Vector3.new(183, 17.127990722656, 110),0)
            ff(Vector3.new(183, 17.127990722656, 108),0)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(183, 17.127990722656, 106),0)
            ff(Vector3.new(183, 17.127990722656, 104),0)
            ff(Vector3.new(183, 17.127990722656, 102),0)
            ff(Vector3.new(183, 17.127990722656, 100),0)
            ff(Vector3.new(183, 17.127990722656, 98), 0)
            ff(Vector3.new(183, 17.127990722656, 96), 0)
            ff(Vector3.new(183, 17.127990722656, 94), 0)
            ff(Vector3.new(183, 17.127990722656, 92), 0)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(130, 15.974204063416, 124),1)
            oo(Vector3.new(130, 15.974204063416, 119),1)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(120, 15.974204063416, 124),1)
            oo(Vector3.new(120, 15.974204063416, 119),1)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(110, 15.974204063416, 124),1)
            oo(Vector3.new(110, 15.974204063416, 119),1)
        end
    elseif _G.MAP == "Grasslands" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(132.33415222168, 13.869522094727, 25.005702972412),2)
            ff(Vector3.new(132.25158691406, 13.869522094727, 26.901378631592),2)
            ff(Vector3.new(132.30038452148, 13.869522094727, 28.932842254639),2)
            ff(Vector3.new(132.25454711914, 13.869522094727, 30.878967285156),2)
            ff(Vector3.new(132.21629333496, 13.869522094727, 32.783489227295),2)
            ff(Vector3.new(132.20391845703, 13.869522094727, 34.696308135986),2)
            ff(Vector3.new(129.20481872559, 13.869522094727, 26.102886199951),3)
            ff(Vector3.new(129.15512084961, 13.869522094727, 30.035999298096),3)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(137, 13.869522094727, 27),2)
            ff(Vector3.new(137, 13.869522094727, 29),2)
            ff(Vector3.new(137, 13.869522094727, 31),2)
            ff(Vector3.new(137, 13.869522094727, 33),2)
            ff(Vector3.new(137, 13.869522094727, 35),2)
            ff(Vector3.new(135, 13.869522094727, 37),2)
            ff(Vector3.new(135, 13.869522094727, 39),2)
            ff(Vector3.new(135, 13.869522094727, 41),2)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(95, 13.869522094727, 25) ,1)
            ff(Vector3.new(97, 13.869522094727, 25) ,1)
            ff(Vector3.new(99, 13.869522094727, 25) ,1)
            ff(Vector3.new(101, 13.869522094727, 25),1)
            ff(Vector3.new(103, 13.869522094727, 25),1)
            ff(Vector3.new(105, 13.869522094727, 25),1)
            ff(Vector3.new(107, 13.869522094727, 25),1)
            ff(Vector3.new(109, 13.869522094727, 25),1)
        end
    elseif _G.MAP == "The Archipelagos" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(182, 33.632953643799, 168),2)
            ff(Vector3.new(182, 33.631950378418, 166),2)
            ff(Vector3.new(182, 33.632953643799, 164),2)
            ff(Vector3.new(182, 33.631950378418, 162),2)
            ff(Vector3.new(182, 33.632953643799, 160),2)
            ff(Vector3.new(182, 33.631950378418, 158),2)
            ff(Vector3.new(182, 33.632953643799, 156),2)
            ff(Vector3.new(182, 33.631950378418, 154),2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(179.5, 33.632953643799, 168),2)
            ff(Vector3.new(179.5, 33.631950378418, 166),2)
            ff(Vector3.new(179.5, 33.632953643799, 164),2)
            ff(Vector3.new(179.5, 33.631950378418, 162),2)
            ff(Vector3.new(179.5, 33.632953643799, 160),2)
            ff(Vector3.new(179.5, 33.631950378418, 158),2)
            ff(Vector3.new(176.5, 33.636009216309, 167),3)
            ff(Vector3.new(176.5, 33.631595611572, 163),3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(241, 22.363149642944, 212),3)
            oo(Vector3.new(241, 22.363149642944, 206),3)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(241, 22.363149642944, 200),3)
            oo(Vector3.new(241, 22.363149642944, 194),3)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(241, 22.363149642944, 188),3)
            oo(Vector3.new(241, 22.363149642944, 182),3)
        end
    elseif _G.MAP == "Temple" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(26, 15.849548339844, 124),1)
            ff(Vector3.new(28, 15.849548339844, 124),1)
            ff(Vector3.new(30, 15.849548339844, 124),1)
            ff(Vector3.new(32, 15.849548339844, 124),1)
            ff(Vector3.new(34, 15.849548339844, 124),1)
            ff(Vector3.new(36, 15.849548339844, 124),1)
            ff(Vector3.new(38, 15.849548339844, 124),1)
            ff(Vector3.new(40, 15.849548339844, 124),1)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(26, 15.849548339844, 121.4),1)
            ff(Vector3.new(28, 15.849548339844, 121.4),1)
            ff(Vector3.new(30, 15.849548339844, 121.4),1)
            ff(Vector3.new(32, 15.849548339844, 121.4),1)
            ff(Vector3.new(34, 15.849548339844, 121.4),1)
            ff(Vector3.new(36, 15.849548339844, 121.4),1)
            ff(Vector3.new(38, 15.849548339844, 121.4),1)
            ff(Vector3.new(40, 15.849548339844, 121.4),1)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(97, 16.931480407715, 95),   1)
            oo(Vector3.new(97, 16.931480407715, 90),   1)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(102.3, 16.931480407715, 95),1)
            oo(Vector3.new(102.3, 16.931480407715, 90),1)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(107.6, 16.931480407715, 95),1)
            oo(Vector3.new(107.6, 16.931480407715, 90),1)
        end
    elseif _G.MAP == "Endless Battlescape" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(72, 12.71940612793, 82.6),3)
            ff(Vector3.new(74, 12.71940612793, 82.6),3)
            ff(Vector3.new(76, 12.71940612793, 82.6),3)
            ff(Vector3.new(78, 12.71940612793, 82.6),3)
            ff(Vector3.new(72, 12.71940612793, 80)  ,3)
            ff(Vector3.new(74, 12.71940612793, 80)  ,3)
            ff(Vector3.new(76, 12.71940612793, 80)  ,3)
            ff(Vector3.new(78, 12.71940612793, 80)  ,3)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(72, 12.71940612793, 77)  ,3)
            ff(Vector3.new(74, 12.71940612793, 77)  ,3)
            ff(Vector3.new(76, 12.71940612793, 77)  ,3)
            ff(Vector3.new(78, 12.71940612793, 77)  ,3)
            ff(Vector3.new(75, 12.71940612793, 71.6),2)
            ff(Vector3.new(74, 12.71940612793, 74.6),3)
            ff(Vector3.new(76, 12.71940612793, 74.6),3)
            ff(Vector3.new(78, 12.71940612793, 74.6),3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(70.1, 15.201361656189, 116.4),0)
            oo(Vector3.new(74, 15.201361656189, 116.4)  ,0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(70, 15.201361656189, 111.3),0)
            oo(Vector3.new(74, 15.201361656189, 111.3),0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(71, 15.201361656189, 106.1),0)
            oo(Vector3.new(75, 15.201361656189, 106.1),0)
        end
    elseif _G.MAP == "Lost Island" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(166, 18.885604858398, 86),0)
            ff(Vector3.new(166, 18.885604858398, 84),0)
            ff(Vector3.new(166, 18.885604858398, 82),0)
            ff(Vector3.new(166, 18.885604858398, 80),0)
            ff(Vector3.new(166, 18.885604858398, 78),0)
            ff(Vector3.new(166, 18.885604858398, 76),0)
            ff(Vector3.new(166, 18.885604858398, 74),0)
            ff(Vector3.new(166, 18.885604858398, 72),0)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(166, 18.885604858398, 70),0)
            ff(Vector3.new(166, 18.885604858398, 68),0)
            ff(Vector3.new(166, 18.885604858398, 66),0)
            ff(Vector3.new(166, 18.885604858398, 64),0)
            ff(Vector3.new(166, 18.885604858398, 62),0)
            ff(Vector3.new(166, 18.885604858398, 60),0)
            ff(Vector3.new(166, 18.885604858398, 58),0)
            ff(Vector3.new(166, 18.885604858398, 56),0)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(151, 15.044547080994, 23)  ,4)
            oo(Vector3.new(156, 15.044547080994, 23)  ,4)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(156, 15.044547080994, 28.2),4)
            oo(Vector3.new(161, 15.044547080994, 28.2),4)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(161, 15.044547080994, 33.4),4)
            oo(Vector3.new(161, 15.044547080994, 23)  ,4)
        end
    elseif _G.MAP == "Rubik's Garden" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(60, 20.068359375, 81),  3)
            ff(Vector3.new(60, 20.068359375, 78.5),3)
            ff(Vector3.new(60, 20.068359375, 76),  3)
            ff(Vector3.new(60, 20.068359375, 73.5),3)
            ff(Vector3.new(60, 20.068359375, 71),  3)
            ff(Vector3.new(60, 20.068359375, 68.5),3)
            ff(Vector3.new(60, 20.068359375, 66),  3)
            ff(Vector3.new(60, 20.068359375, 63.5),3)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(62, 20.068359375, 73.5),3)
            ff(Vector3.new(62, 20.068359375, 71),  3)
            ff(Vector3.new(62, 20.068359375, 68.5),3)
            ff(Vector3.new(62, 20.068359375, 66),  3)
            ff(Vector3.new(62, 20.068359375, 63.5),3)
            ff(Vector3.new(62, 20.068359375, 61),  3)
            ff(Vector3.new(62, 20.068359375, 58.5),3)
            ff(Vector3.new(62, 20.068359375, 56),  3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(270, 6.4743566513062, 29),3)
            oo(Vector3.new(276, 6.4743566513062, 29),3)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(282, 6.4743566513062, 29),3)
            oo(Vector3.new(288, 6.4743566513062, 29),3)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(294, 6.4743566513062, 29),3)
            oo(Vector3.new(300, 6.4743566513062, 29),3)
        end
    elseif _G.MAP == "Sakura Gardens" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(186.5, 21.311233520508, 92),2)
            ff(Vector3.new(184, 21.311233520508, 92)  ,2)
            ff(Vector3.new(186.5, 21.311233520508, 90),2)
            ff(Vector3.new(184, 21.311233520508, 90)  ,2)
            ff(Vector3.new(186.5, 21.311233520508, 88),2)
            ff(Vector3.new(184, 21.311233520508, 88)  ,2)
            ff(Vector3.new(186.5, 21.311233520508, 86),2)
            ff(Vector3.new(184, 21.311233520508, 86)  ,2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(177, 21.310394287109, 104),3)
            ff(Vector3.new(175, 21.310394287109, 104),3)
            ff(Vector3.new(173, 21.310394287109, 104),3)
            ff(Vector3.new(171, 21.310394287109, 104),3)
            ff(Vector3.new(169, 21.310394287109, 104),3)
            ff(Vector3.new(167, 21.310394287109, 104),3)
            ff(Vector3.new(165, 21.310394287109, 104),3)
            ff(Vector3.new(163, 21.310394287109, 104),3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(177.67343139648, 21.392416000366, 55.510437011719),3)
            oo(Vector3.new(176.67211914062, 21.392416000366, 60.65348815918) ,3)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(175.06153869629, 21.392416000366, 65.755081176758),3)
            oo(Vector3.new(172.62223815918, 21.392416000366, 70.951210021973),3)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(169.68692016602, 21.392416000366, 65.785232543945),3)
            oo(Vector3.new(171.533203125, 21.392416000366, 60.358814239502)  ,3)
        end
    elseif _G.MAP == "Arctic Pathway" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(140, 29.209503173828, 70),  4)
            ff(Vector3.new(140, 29.209503173828, 68),  4)
            ff(Vector3.new(140, 29.209503173828, 66),  4)
            ff(Vector3.new(140, 29.209503173828, 64),  4)
            ff(Vector3.new(142.5, 29.209503173828, 70),4)
            ff(Vector3.new(142.5, 29.209503173828, 68),4)
            ff(Vector3.new(142.5, 29.209503173828, 72),4)
            ff(Vector3.new(142.5, 29.209503173828, 74),4)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(128, 29.205074310303, 72),  1)
            ff(Vector3.new(126, 29.205142974854, 72),  1)
            ff(Vector3.new(124, 29.205074310303, 72),  1)
            ff(Vector3.new(122, 29.205142974854, 72),  1)
            ff(Vector3.new(120, 29.205074310303, 72),  1)
            ff(Vector3.new(118, 29.205142974854, 72),  1)
            ff(Vector3.new(114, 29.204776763916, 72.4),1)
            ff(Vector3.new(112, 29.205142974854, 72),  1)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(81.470481872559, 16.991630554199, 80.29515838623), 0)
            oo(Vector3.new(83.194671630859, 16.991630554199, 85.774871826172),0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(76.196678161621, 16.991630554199, 81.854911804199),0)
            oo(Vector3.new(77.73860168457, 16.991630554199, 87.034156799316), 0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(84.5810546875, 16.991630554199, 90.941780090332),  0)
            oo(Vector3.new(79.146675109863, 16.991630554199, 92.221504211426),0)
        end

    elseif _G.MAP == "Waterfalls" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(173, 94.568084716797, 28),0)
            ff(Vector3.new(173, 94.568084716797, 30),0)
            ff(Vector3.new(173, 94.603149414062, 32),0)
            ff(Vector3.new(173, 94.568084716797, 34),0)
            ff(Vector3.new(173, 94.568084716797, 36),0)
            ff(Vector3.new(173, 94.568084716797, 40),0)
            ff(Vector3.new(173, 94.568084716797, 42),0)
            ff(Vector3.new(173, 94.568084716797, 44),0)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(170, 94.568084716797, 29),3)
            ff(Vector3.new(168, 94.568084716797, 29),3)
            ff(Vector3.new(166, 94.568084716797, 29),3)
            ff(Vector3.new(164, 94.568084716797, 29),3)
            ff(Vector3.new(170, 94.568084716797, 32),3)
            ff(Vector3.new(168, 94.568084716797, 32),3)
            ff(Vector3.new(166, 94.568084716797, 32),3)
            ff(Vector3.new(164, 94.568084716797, 32),3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(175.5447845459, 95.000648498535, 70.529151916504),3)
            oo(Vector3.new(171.82391357422, 94.94945526123, 64.053565979004),3)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(170.25770568848, 94.94945526123, 70.966110229492),3)
            oo(Vector3.new(166.46145629883, 94.94945526123, 64.82292175293) ,3)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(169.20211791992, 94.94945526123, 77.589004516602),3)
            oo(Vector3.new(165.04423522949, 94.94945526123, 70.566520690918),3)
        end
    elseif _G.MAP == "Lonely Lodge" then        -- Cristmas event
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(-53, 1.7194669246674, 123),1)
            ff(Vector3.new(-55, 1.7194669246674, 123),1)
            ff(Vector3.new(-57, 1.7194669246674, 123),1)
            ff(Vector3.new(-59, 1.7194669246674, 123),1)
            ff(Vector3.new(-61, 1.7194669246674, 123),1)
            ff(Vector3.new(-63, 1.7194669246674, 123),1)
            ff(Vector3.new(-65, 1.7194669246674, 123),1)
            ff(Vector3.new(-67, 1.7194669246674, 123),1)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(-53, 1.7194669246674, 120),1)
            ff(Vector3.new(-55, 1.7194669246674, 120),1)
            ff(Vector3.new(-57, 1.7194669246674, 120),1)
            ff(Vector3.new(-59, 1.7194669246674, 120),1)
            ff(Vector3.new(-61, 1.7194669246674, 120),1)
            ff(Vector3.new(-63, 1.7194669246674, 120),1)
            ff(Vector3.new(-65, 1.7194669246674, 120),1)
            ff(Vector3.new(-67, 1.7194669246674, 120),1)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(-67.255210876465, -22.448572158813, -41.631046295166),1)
            oo(Vector3.new(-72.678901672363, -22.448572158813, -43.70556640625) ,1)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(-78.058418273926, -22.448572158813, -44.019630432129),1)
            oo(Vector3.new(-83.655128479004, -22.448572158813, -45.051246643066),1)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(-66.881233215332, -22.448572158813, -46.905433654785),1)
            oo(Vector3.new(-72.985336303711, -22.448572158813, -49.272087097168),1)
        end
    elseif _G.MAP == "The Siege" then           -- Cristmas event
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(271, 20.207427978516, 95),1)
            ff(Vector3.new(269, 20.207427978516, 95),1)
            ff(Vector3.new(267, 20.207427978516, 95),1)
            ff(Vector3.new(265, 20.207427978516, 95),1)
            ff(Vector3.new(263, 20.207427978516, 95),1)
            ff(Vector3.new(261, 20.207427978516, 95),1)
            ff(Vector3.new(259, 20.207427978516, 95),1)
            ff(Vector3.new(257, 20.207427978516, 95),1)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(271, 20.207427978516, 92),1)
            ff(Vector3.new(269, 20.207427978516, 92),1)
            ff(Vector3.new(267, 20.207427978516, 92),1)
            ff(Vector3.new(265, 20.207427978516, 92),1)
            ff(Vector3.new(263, 20.207427978516, 92),1)
            ff(Vector3.new(261, 20.207427978516, 92),1)
            ff(Vector3.new(259, 20.207427978516, 92),1)
            ff(Vector3.new(257, 20.207427978516, 92),1)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(271, 20.207427978516, 98),1)
            ff(Vector3.new(269, 20.207427978516, 98),1)
            ff(Vector3.new(267, 20.207427978516, 98),1)
            ff(Vector3.new(265, 20.207427978516, 98),1)
            ff(Vector3.new(263, 20.207427978516, 98),1)
            ff(Vector3.new(261, 20.207427978516, 98),1)
            ff(Vector3.new(259, 20.207427978516, 98),1)
            ff(Vector3.new(257, 20.207427978516, 98),1)
        end
        --Oils
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(87, 17.413017272949, 135),0)
            oo(Vector3.new(87, 17.413017272949, 125),0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(87, 17.413017272949, 115),0)
            oo(Vector3.new(87, 17.413017272949, 105),0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(87, 17.413017272949, 95),0)
            oo(Vector3.new(87, 17.413017272949, 85),0)
        end
    elseif _G.MAP == "Snow Town" then           -- Cristmas event
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(369, 18.181091308594, 68),0)
            ff(Vector3.new(369, 18.181091308594, 70),0)
            ff(Vector3.new(369, 18.181091308594, 72),0)
            ff(Vector3.new(369, 18.181091308594, 74),0)
            ff(Vector3.new(369, 18.181091308594, 76),0)
            ff(Vector3.new(369, 18.181091308594, 78),0)
            ff(Vector3.new(369, 18.181091308594, 80),0)
            ff(Vector3.new(369, 18.181091308594, 82),0)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(366, 18.181091308594, 68),0)
            ff(Vector3.new(366, 18.181091308594, 70),0)
            ff(Vector3.new(366, 18.181091308594, 72),0)
            ff(Vector3.new(366, 18.181091308594, 74),0)
            ff(Vector3.new(366, 18.181091308594, 76),0)
            ff(Vector3.new(366, 18.181091308594, 78),0)
            ff(Vector3.new(366, 18.181091308594, 80),0)
            ff(Vector3.new(366, 18.181091308594, 82),0)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(363, 18.181091308594, 68),0)
            ff(Vector3.new(363, 18.181091308594, 70),0)
            ff(Vector3.new(363, 18.181091308594, 72),0)
            ff(Vector3.new(363, 18.181091308594, 74),0)
            ff(Vector3.new(363, 18.181091308594, 76),0)
            ff(Vector3.new(363, 18.181091308594, 78),0)
            ff(Vector3.new(363, 18.181091308594, 80),0)
            ff(Vector3.new(363, 18.181091308594, 82),0)
        end
    elseif _G.MAP == "Frozen Palace" then       -- Cristmas event
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(624, 11.876326560974, -96),3)
            ff(Vector3.new(626, 11.876326560974, -96),3)
            ff(Vector3.new(628, 11.876326560974, -96),3)
            ff(Vector3.new(630, 11.876326560974, -96),3)
            ff(Vector3.new(632, 11.876326560974, -96),3)
            ff(Vector3.new(634, 11.876326560974, -96),3)
            ff(Vector3.new(636, 11.876326560974, -96),3)
            ff(Vector3.new(638, 11.876326560974, -96),3)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(624, 11.876326560974, -93),3)
            ff(Vector3.new(626, 11.876326560974, -93),3)
            ff(Vector3.new(628, 11.876326560974, -93),3)
            ff(Vector3.new(630, 11.876326560974, -93),3)
            ff(Vector3.new(632, 11.876326560974, -93),3)
            ff(Vector3.new(634, 11.876326560974, -93),3)
            ff(Vector3.new(636, 11.876326560974, -93),3)
            ff(Vector3.new(638, 11.876326560974, -93),3)
        elseif _G.POSA == 3 and type == 1 then
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
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(460, 18.658330917358, 67),0)
            oo(Vector3.new(460, 18.658330917358, 61),0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(465, 18.658330917358, 67),0)
            oo(Vector3.new(465, 18.658330917358, 61),0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(470, 18.658330917358, 67),0)
            oo(Vector3.new(470, 18.658330917358, 61),0)
        end
    elseif _G.MAP == "Christmas Plaza" then     -- Cristmas event
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(562, 13.703826904297, 412),2)
            ff(Vector3.new(562, 13.703826904297, 410),2)
            ff(Vector3.new(562, 13.703826904297, 408),2)
            ff(Vector3.new(562, 13.703826904297, 406),2)
            ff(Vector3.new(562, 13.703826904297, 404),2)
            ff(Vector3.new(562, 13.703826904297, 402),2)
            ff(Vector3.new(562, 13.703826904297, 400),2)
            ff(Vector3.new(562, 13.703826904297, 398),2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(566, 13.703826904297, 412),2)
            ff(Vector3.new(566, 13.703826904297, 410),2)
            ff(Vector3.new(566, 13.703826904297, 408),2)
            ff(Vector3.new(566, 13.703826904297, 406),2)
            ff(Vector3.new(566, 13.703826904297, 404),2)
            ff(Vector3.new(566, 13.703826904297, 402),2)
            ff(Vector3.new(566, 13.703826904297, 400),2)
            ff(Vector3.new(566, 13.703826904297, 398),2)
            ff(Vector3.new(566, 13.703826904297, 412),2)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(570, 13.703826904297, 410),2)
            ff(Vector3.new(570, 13.703826904297, 408),2)
            ff(Vector3.new(570, 13.703826904297, 406),2)
            ff(Vector3.new(570, 13.703826904297, 404),2)
            ff(Vector3.new(570, 13.703826904297, 402),2)
            ff(Vector3.new(570, 13.703826904297, 400),2)
            ff(Vector3.new(570, 13.703826904297, 398),2)
        end
    elseif _G.MAP == "Zap Zap" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(152, 8.3694152832031, 155),4)
            ff(Vector3.new(152, 8.3694152832031, 153),4)
            ff(Vector3.new(152, 8.3694152832031, 151),4)
            ff(Vector3.new(152, 8.3694152832031, 149),4)
            ff(Vector3.new(152, 8.3694152832031, 147),4)
            ff(Vector3.new(152, 8.3694152832031, 145),4)
            ff(Vector3.new(152, 8.3694152832031, 143),4)
            ff(Vector3.new(152, 8.3694152832031, 141),4)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(155, 8.3694152832031, 155),4)
            ff(Vector3.new(155, 8.3694152832031, 153),4)
            ff(Vector3.new(155, 8.3694152832031, 151),4)
            ff(Vector3.new(155, 8.3694152832031, 149),4)
            ff(Vector3.new(155, 8.3694152832031, 147),4)
            ff(Vector3.new(155, 8.3694152832031, 145),4)
            ff(Vector3.new(155, 8.3694152832031, 143),4)
            ff(Vector3.new(155, 8.3694152832031, 141),4)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(158, 8.3694152832031, 155),4)
            ff(Vector3.new(158, 8.3694152832031, 153),4)
            ff(Vector3.new(158, 8.3694152832031, 151),4)
            ff(Vector3.new(158, 8.3694152832031, 149),4)
            ff(Vector3.new(158, 8.3694152832031, 147),4)
            ff(Vector3.new(158, 8.3694152832031, 145),4)
            ff(Vector3.new(158, 8.3694152832031, 143),4)
            ff(Vector3.new(158, 8.3694152832031, 141),4)
        end
        -- Oils
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(169.21157836914, 9.6262722015381, 135.64462280273),0)
            oo(Vector3.new(164.87225341797, 9.6262722015381, 129.57968139648),0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(174.75988769531, 9.6262722015381, 140.19662475586),0)
            oo(Vector3.new(170.51170349121, 9.6262722015381, 129.43159484863),0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(175.60652160645, 9.6262722015381, 133.82371520996),0)
            oo(Vector3.new(180.23243713379, 9.6262722015381, 142.28225708008),0)
        end
    elseif _G.MAP == "Bucket Shrine" then 
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(Vector3.new(132, 13.869201660156, -22),2)
            ff(Vector3.new(132, 13.869201660156, -20),2)
            ff(Vector3.new(132, 13.869201660156, -18),2)
            ff(Vector3.new(132, 13.869201660156, -16),2)
            ff(Vector3.new(132, 13.869201660156, -14),2)
            ff(Vector3.new(132, 13.869201660156, -12),2)
            ff(Vector3.new(132, 13.869201660156, -10),2)
            ff(Vector3.new(132, 13.869201660156, -8), 2)
        elseif _G.POSA == 2 and type == 1 then
            ff(Vector3.new(115, 13.869201660156, -22),4)
            ff(Vector3.new(115, 13.869201660156, -20),4)
            ff(Vector3.new(115, 13.869201660156, -18),4)
            ff(Vector3.new(115, 13.869201660156, -16),4)
            ff(Vector3.new(115, 13.869201660156, -14),4)
            ff(Vector3.new(115, 13.869201660156, -12),4)
            ff(Vector3.new(115, 13.869201660156, -10),4)
            ff(Vector3.new(115, 13.869201660156, -8), 4)
        elseif _G.POSA == 3 and type == 1 then
            ff(Vector3.new(115, 13.869201660156, 0), 4)
            ff(Vector3.new(115, 13.869201660156, 2), 4)
            ff(Vector3.new(115, 13.869201660156, 4), 4)
            ff(Vector3.new(115, 13.869201660156, 6), 4)
            ff(Vector3.new(115, 13.869201660156, 8), 4)
            ff(Vector3.new(115, 13.869201660156, 10),4)
            ff(Vector3.new(115, 13.869201660156, 12),4)
            ff(Vector3.new(115, 13.869201660156, 14),4)
        end
        -- Oils
        if _G.POSA == 1 and type == 2 then
            oo(Vector3.new(165, 6.0587072372437, 78),0)
            oo(Vector3.new(170, 6.0587072372437, 78),0)
        elseif _G.POSA == 2 and type == 2 then
            oo(Vector3.new(175, 6.0587072372437, 78),0)
            oo(Vector3.new(180, 6.0587072372437, 78),0)
        elseif _G.POSA == 3 and type == 2 then
            oo(Vector3.new(185, 6.0587072372437, 78),0)
            oo(Vector3.new(190, 6.0587072372437, 78),0)
        end
    elseif _G.MAP == "U Park" then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff(ff(Vector3.new(35, 15.861572265625, 18),3))
            ff(ff(Vector3.new(37, 15.861572265625, 18),3))
            ff(ff(Vector3.new(39, 15.861572265625, 18),3))
            ff(ff(Vector3.new(41, 15.861572265625, 18),3))
            ff(ff(Vector3.new(43, 15.861572265625, 18),3))
            ff(ff(Vector3.new(45, 15.861572265625, 18),3))
            ff(ff(Vector3.new(47, 15.861572265625, 18),3))
            ff(ff(Vector3.new(49, 15.861572265625, 18),3))
        elseif _G.POSA == 2 and type == 1 then
            ff(ff(Vector3.new(35, 15.861572265625, 21),3))
            ff(ff(Vector3.new(37, 15.861572265625, 21),3))
            ff(ff(Vector3.new(39, 15.861572265625, 21),3))
            ff(ff(Vector3.new(41, 15.861572265625, 21),3))
            ff(ff(Vector3.new(43, 15.861572265625, 21),3))
            ff(ff(Vector3.new(45, 15.861572265625, 21),3))
            ff(ff(Vector3.new(47, 15.861572265625, 21),3))
            ff(ff(Vector3.new(49, 15.861572265625, 21),3))
        elseif _G.POSA == 3 and type == 1 then
            ff(ff(Vector3.new(35, 15.861572265625, 24),3))
            ff(ff(Vector3.new(37, 15.861572265625, 24),3))
            ff(ff(Vector3.new(39, 15.861572265625, 24),3))
            ff(ff(Vector3.new(41, 15.861572265625, 24),3))
            ff(ff(Vector3.new(43, 15.861572265625, 24),3))
            ff(ff(Vector3.new(45, 15.861572265625, 24),3))
            ff(ff(Vector3.new(47, 15.861572265625, 24),3))
            ff(ff(Vector3.new(49, 15.861572265625, 24),3))
        end
    elseif _G.MAP == "Gate of Xovuso" then 
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        elseif _G.POSA == 2 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        elseif _G.POSA == 3 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        end
        -- Oils
        if _G.POSA == 1 and type == 2 then
            oo()
            oo()
        elseif _G.POSA == 2 and type == 2 then
            oo()
            oo()
        elseif _G.POSA == 3 and type == 2 then
            oo()
            oo()
        end
    elseif _G.MAP == "example_".._G.TheBOTTERLUA then
        -- Factories
        if _G.POSA == 1 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        elseif _G.POSA == 2 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        elseif _G.POSA == 3 and type == 1 then
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
            ff()
        end
        -- Oils
        if _G.POSA == 1 and type == 2 then
            oo()
            oo()
        elseif _G.POSA == 2 and type == 2 then
            oo()
            oo()
        elseif _G.POSA == 3 and type == 2 then
            oo()
            oo()
        end
    end
end
local function POSBT()
    if _G.POSA == 1 then
        POS3.Text = "  3"
        POS2.Text = "  2"
        POS1.Text = "  1 <=---"
    elseif _G.POSA == 2 then
        POS3.Text = "  3"
        POS2.Text = "  2 <=---"
        POS1.Text = "  1"
    elseif _G.POSA == 3 then
        POS3.Text = "  3 <=---"
        POS2.Text = "  2"
        POS1.Text = "  1"
    else 
        _G.POSA = 1
        POS3.Text = "  3"
        POS2.Text = "  2"
        POS1.Text = "  1 <=---"
    end
end
POSBT()

-- gui script buttons
local b1,b2,b3,b4,b5,b6 = false,false,false,false,false,false
local a,b,c,d = 0,0,0,0
spawn(function()
    _G.infoInstanes = _G.infoInstanes + 1
    while wait(1) do
        if _G.infoInstanes > 1 then
            _G.infoInstanes = _G.infoInstanes - 1
            break
        end
        pcall(function()
            a,b,c,d = 0,0,0,0
            for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
                if v.Settings.TowerValues.Owner.Value == me.Name then
                    if v.Name == "Big Investment" then
                        a = a + 1
                    elseif v.Name == "Sea Base" then
                        b = b + 1
                    end
                    if table.find({"Factory","Faster Production","More Staff","Rare Crystal Production","Big Investment"},v.Name) and table.find(fmaps, _G.MAP) then
                        c = c + 1
                    elseif table.find({"Oil Rig","Sea Resistant","Sturdy Barrels","BP Investment","Sea Base"},v.Name) and table.find(omaps, _G.MAP) then
                        d = d + 1
                    end
                end
            end
            if a == asset.maxF then UPGF.Text = "MAX" else UPGF.Text = "Upg Factories" end                                                                   -- upgrade
            if b == asset.maxO then UPGO.Text = "MAX" else UPGO.Text = "Upg Oils" end
            if c == asset.maxF and table.find(fmaps, _G.MAP) then BUYT.Text = "MAX" elseif table.find(fmaps, _G.MAP) then BUYT.Text = "Buy Factories" end    -- buy
            if d == asset.maxO and table.find(omaps, _G.MAP) then BUYO.Text = "MAX" elseif table.find(omaps, _G.MAP) then BUYO.Text = "Buy Oils" end
        end)
    end
end)

UPGF.MouseButton1Down:Connect(function() -- Upg Factories
    if not b1 and UPGF.Text ~= "MAX" then
        b1 = true
        UPGF.Text = "Working..."
        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
            if v.Settings.TowerValues.Owner.Value == me.Name then
                if v.Name == "Factory" then
                    UpgradeTower(v)
                elseif v.Name == "Faster Production" then
                    UpgradeTower(v)
                elseif v.Name == "More Staff" then
                    UpgradeTower(v)
                elseif v.Name == "Rare Crystal Production" then
                    UpgradeTower(v)
                end
            end
        end
    end
    b1 = false
end)
UPGO.MouseButton1Down:Connect(function() -- Upg Oils
    if not b2 and UPGO.Text ~= "MAX" then
        b2 = true
        UPGO.Text = "Working..."
        for i,v in pairs(game.Workspace.Map.Towers:GetChildren()) do
            if v.Settings.TowerValues.Owner.Value == me.Name then
                if v.Name == "Oil Rig" then
                    UpgradeTower(v)
                elseif v.Name == "Sea Resistant" then
                    UpgradeTower(v)
                elseif v.Name == "Sturdy Barrels" then
                    UpgradeTower(v)
                elseif v.Name == "BP Investment" then
                    UpgradeTower(v)
                end
            end
        end
    end
    b2 = false
end)
BUYT.MouseButton1Down:Connect(function() -- Buy Factories
    if not b3 and table.find(fmaps, _G.MAP) and BUYT.Text ~= "MAX" then
        b3 = true
        BUYT.Text = "Working..."
        PlaceTowers(1)
        BUYT.Text = "Buy Factories"
        wait(.2)
    elseif not table.find(fmaps, _G.MAP) then
        BUYT.Text = "Unsupported Map"
    end
    b3 = false
end)
BUYO.MouseButton1Down:Connect(function() -- Buy Oils
    if not b3 and table.find(omaps, _G.MAP) and BUYO.Text ~= "MAX" then
        b3 = true
        BUYO.Text = "Working..."
        PlaceTowers(2)
        BUYO.Text = "Buy Oils"
        wait(.2)
    elseif not table.find(omaps, _G.MAP) then
        BUYO.Text = "Unsupported Map"
    end
    b3 = false
end)

POS1.MouseButton1Down:Connect(function() -- Place Pos 1
    if not b4 then
        b4 = true
        _G.POSA = 1
        POSBT()
    end
    b4 = false
end)
POS2.MouseButton1Down:Connect(function() -- Place Pos 2
    if not b5 then
        b5 = true
        _G.POSA = 2
        POSBT()
    end
    b5 = false
end)
POS3.MouseButton1Down:Connect(function() -- Place Pos 3
    if not b6 then
        b6 = true
        _G.POSA = 3
        POSBT()
    end
    b6 = false
end)