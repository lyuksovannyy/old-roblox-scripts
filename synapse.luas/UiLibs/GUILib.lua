if _G.LastID ~= nil then
    for i,a in pairs(game:GetDescendants()) do
        if a.Name == _G.LastID then
           a:Destroy()
        end
    end
end

-- creating or reading settings file
local HttpService = game:GetService("HttpService")
if not isfolder("UiLibs") then makefolder("UiLibs") end
if not isfolder("UiLibs/Themes") then makefolder("UiLibs/Themes") end

-- GUI config
if not isfile("UiLibs/nGST_GUiLibConfig.json") then writefile("UiLibs/nGST_GUiLibConfig.json", '{"Hidden": false, "Pos": {"X": 30, "Y": 70}, "Theme": "Default.json", "GameTheme": true}') end
local json = readfile("UiLibs/nGST_GUiLibConfig.json")
local settings = HttpService:JSONDecode(json)

-- GUI Theme
if not isfile("UiLibs/Themes/".. settings.Theme) then writefile("UiLibs/Themes/" .. settings.Theme, '{"Text": {"r":190,"g":190,"b":190}, \n"Top": {"r":30,"g":30,"b":30}, \n"Hide": {"r":95,"g":95,"b":95}, \n"Exit": {"r":95,"g":0,"b":1}, \n"Bottom": {"r":66,"g":66,"b":66}, \n"Button": {"r":49,"g":49,"b":49}, \n"TglON": {"r":0,"g":133,"b":0}, \n"TglOFF": {"r":133,"g":0,"b":0}, \n"MSettings": {"r":45,"g":45,"b":45}}') end
local tjson = readfile("UiLibs/Themes/" .. settings.Theme)
local theme = HttpService:JSONDecode(tjson)

-- vars for GUI
local lib = {}
local hidenState = settings.Hidden --
local awaitinhide = false
local closeMenu = false --
local smState = false --
local smAwaitin = false

local function RandomID(count)
    local indificator = ""
    local symbols = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*"}
    for i = 1,count do indificator = indificator .. symbols[math.random(#symbols)] end
    return indificator
 end
 _G.LastID = RandomID(21)
function lib:CreateWindow(name, localguilink) -- str*, (raw table data link)**

    if settings.GameTheme and localguilink ~= nil then theme = loadstring(game:HttpGet(localguilink))() end -- loading theme provided by exploit author only if variable 'settings.GameTheme' == true (check example how to: https://github.com/GameSTALkER/synapse.luas/blob/main/UiLibs/GUILib.Themes/example.lua)

    local ScreenGui = Instance.new("ScreenGui")
    local Body = Instance.new("Frame")
    
    local Top = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local Hide = Instance.new("TextButton")
    local BSettings = Instance.new("ImageButton")

    local MSettings = Instance.new("Frame")
    local MSGameUi = Instance.new("TextButton")

    local Bottom = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")

    local function SSave()
        settings.Hidden = hidenState
        if Body.AbsolutePosition.X > 0 and Body.AbsolutePosition.X < (game.Workspace.Camera.ViewportSize.X - 490) then settings.Pos.X = Body.AbsolutePosition.X else settings.Pos.X = 30 end -- avoid gui stuck out of the screen
        if Body.AbsolutePosition.Y > 0 and Body.AbsolutePosition.Y < (game.Workspace.Camera.ViewportSize.Y - 280) then settings.Pos.Y = Body.AbsolutePosition.Y else settings.Pos.Y = 70 end
        local data = HttpService:JSONEncode(settings)
        writefile("UiLibs/nGST_GUiLibConfig.json", data)
    end

    local function from_hex(hex) -- "#NNNNNN"
        local r, g, b = string.match(hex, "^#?(%w%w)(%w%w)(%w%w)$")
        return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
    end
    local function to_hex(color) -- {R = N, G = N, B = N}
        return string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
    end

    ScreenGui.Name = _G.LastID
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Body.Name = "Body"
    Body.Parent = ScreenGui
    Body.Transparency = 1
    Body.BorderSizePixel = 0
    Body.Position = UDim2.new(0, settings.Pos.X, 0, settings.Pos.Y)
    Body.Size = UDim2.new(0, 505, 0, 295)
    Body.Draggable = not settings.Hidden
    Body.Active = not settings.Hidden

    Top.Name = "Top"
    Top.Parent = Body
    Top.Transparency = 0
    Top.BackgroundColor3 = Color3.fromRGB(theme.Top.r, theme.Top.g, theme.Top.b)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, .062, 0)
    Top.ClipsDescendants = true

    Title.Name = "Title"
    Title.Transparency = 0
    Title.Parent = Top
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.014, 0, 0.06, 0)
    Title.Size = UDim2.new(.3, 0, 1, 0)
    Title.Font = "Ubuntu"
    Title.TextColor3 = Color3.fromRGB(theme.Text.r, theme.Text.g, theme.Text.b)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Text = name

    Hide.Name = "Hide"
    Hide.Parent = Top
    Hide.Transparency = 0
    Hide.BackgroundColor3 = Color3.fromRGB(theme.Hide.r, theme.Hide.g, theme.Hide.b)
    Hide.BorderSizePixel = 0
    Hide.Position = UDim2.new(0.86, 0, 0, 0)
    Hide.Size = UDim2.new(.045, 0, .6, 0)
    Hide.Text = ""

    Exit.Name = "Exit"
    Exit.Transparency = 0
    Exit.Parent = Top
    Exit.BackgroundColor3 = Color3.fromRGB(theme.Exit.r, theme.Exit.g, theme.Exit.b)
    Exit.BorderSizePixel = 0
    Exit.Position = UDim2.new(.91, 0, 0, 0)
    Exit.Size = UDim2.new(.045, 0, .6, 0)
    Exit.Text = ""

    BSettings.Name = "BSettings"
    BSettings.Transparency = 0
    BSettings.BackgroundTransparency = 1
    BSettings.Parent = Top
    BSettings.BorderSizePixel = 0
    BSettings.Position = UDim2.new(.96, 0, 0, 0)
    BSettings.Size = UDim2.new(.04, 0, 1, 0)
    BSettings.Image = "http://www.roblox.com/asset/?id=7104816039"

    Bottom.Name = "Bottom"
    Bottom.Parent = Body
    Bottom.Transparency = .1
    Bottom.BackgroundColor3 = Color3.fromRGB(theme.Bottom.r, theme.Bottom.g, theme.Bottom.b)
    Bottom.BorderSizePixel = 0
    Bottom.Position = UDim2.new(0, 0, 0.06, 0)
    if not settings.Hidden then Bottom.Size = UDim2.new(1, 0, 1, 0)
    else Bottom.Size = UDim2.new(1, 0, 0, 0) end
    Bottom.ClipsDescendants = true

    UIGridLayout.Parent = Bottom
    UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 165, 0, 45)
    UIGridLayout.FillDirectionMaxCells = 5

    MSettings.Name = "MSettings"
    MSettings.Parent = Body
    MSettings.BackgroundColor3 = Color3.fromRGB(theme.MSettings.r, theme.MSettings.g, theme.MSettings.b)
    MSettings.BorderSizePixel = 0
    MSettings.Position = UDim2.new(0, 0, .06, 0)
    MSettings.Size = UDim2.new(1, 0, 0, 0)
    MSettings.ClipsDescendants = true

    MSGameUi.Name = "MSettings"
    MSGameUi.Parent = MSettings
    MSGameUi.BackgroundColor3 = Color3.fromRGB(theme.Button.r, theme.Button.g, theme.Button.b)
    MSGameUi.BorderSizePixel = 0
    MSGameUi.Size = UDim2.new(0, 127, 0, 30)
    MSGameUi.Font = "Ubuntu"
    MSGameUi.TextColor3 = Color3.fromRGB(theme.Text.r, theme.Text.g, theme.Text.b)
    MSGameUi.TextSize = 14.000
    if settings.GameTheme then MSGameUi.Text = "Author's GameUi" else MSGameUi.Text = "Own Ui" end

    local function fade(func, act, to, many, sec)
      if act == "" then
         for i = func.Transparency, to, many do
            wait(sec)
            func.Transparency = i
         end
      elseif act == "txt" then
         for i = func.TextTransparency, 1, .1 do
            wait(many)
            func.TextTransparency = i
         end
         func.Text = to
         for i = func.TextTransparency, 0, -.1 do
            wait(many)
            func.TextTransparency = i
         end
      end
    end

    local function Destroy()
        if not closeMenu then
            closeMenu = true
            SSave()
            smAwaitin = true
            awaitinhide = true
            Body.Draggable = false
            Body.Active = false
            if smState then 
                MSettings:TweenSize(UDim2.new(1, 0, 0, 0), "InOut", "Quint", .8) 
            end
            if not hidenState then 
                Bottom:TweenSize(UDim2.new(1, 0, 0, 0), "InOut", "Quint", .8) 
            end
            if not hidenState or smState then wait(.75) end
            Exit:TweenSize(UDim2.new(.045, 0, 0, 0), "Out", "Quint", .5)
            Hide:TweenSize(UDim2.new(.045, 0, 0, 0), "Out", "Quint", .5)
            wait(.3)
            Top:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Sine", .8)
            fade(Top, "", 1, .1, .03)
            wait(.8)
            ScreenGui:Destroy()
        end
    end
   
    Exit.MouseButton1Down:Connect(function()
        Destroy()
    end)
    BSettings.MouseButton1Down:Connect(function()
        if smState and not smAwaitin then
            smAwaitin = true
            smState = false
            MSettings.Active = false
            Exit:TweenSize(UDim2.new(.045, 0, .6, 0), "Out", "Sine", .5)
            Hide:TweenSize(UDim2.new(.045, 0, .6, 0), "Out", "Sine", .5)
            if not hidenState then Bottom:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Sine", .3) end
            MSettings:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Sine", .25)
            closeMenu = false
            awaitinhide = false
            smState = false
            wait(.5)
            smAwaitin = false
        elseif not smState and not smAwaitin then
            smAwaitin = true
            smState = true
            MSettings.Active = true
            if not hidenState then Bottom:TweenSize(UDim2.new(1, 0, 0, 0), "InOut", "Sine", .3) end
            closeMenu = true
            awaitinhide = true
            Exit:TweenSize(UDim2.new(.045, 0, 0, 0), "Out", "Sine", .5)
            Hide:TweenSize(UDim2.new(.045, 0, 0, 0), "Out", "Sine", .5)
            MSettings:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Sine", .25)
            wait(.5)
            smAwaitin = false
        end
        SSave()
    end)
    Hide.MouseButton1Down:Connect(function()
        if hidenState and not awaitinhide then
            Body.Active = true
            Body.Draggable = true
            awaitinhide = not awaitinhide
            hidenState = false
            Bottom:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Sine", .3)
            wait(.5)
            awaitinhide = not awaitinhide
        elseif not hidenState and not awaitinhide then
            awaitinhide = not awaitinhide
            Body.Active = false
            Body.Draggable = false
            hidenState = true
            Bottom:TweenSize(UDim2.new(1, 0, 0, 0), "InOut", "Sine", .3)
            wait(.5)
            awaitinhide = not awaitinhide
        end
        SSave()
    end)

    MSGameUi.MouseButton1Down:Connect(function()
        settings.GameTheme = not settings.GameTheme
        if settings.GameTheme then fade(MSGameUi, "txt", "Author's GameUi", .03) else fade(MSGameUi, "txt", "Own Ui", .03) end
    end)

   local _w = {}

    function _w:CreateButton(text, callback)

        local callback = callback or function() end

        local Button = Instance.new("TextButton")
        
        Button.Name = "Button"
        Button.Parent = Bottom
        Button.BackgroundColor3 = Color3.fromRGB(theme.Button.r, theme.Button.g, theme.Button.b)
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(0, 127, 0, 30)
        Button.Font = "Ubuntu"
        Button.TextColor3 = Color3.fromRGB(theme.Text.r, theme.Text.g, theme.Text.b)
        Button.TextSize = 14.000
        Button.Text = text

        Button.MouseButton1Down:Connect(function()
            SSave()
            pcall(callback)
        end)
    end
    function _w:CreateToggle(text, callback)

        local callback = callback or function() end

        local switch = false

        local Toggle = Instance.new("TextButton")
        local SCol = Instance.new("Frame")

        Toggle.Name = "Toggle"
        Toggle.Parent = Bottom
        Toggle.BackgroundColor3 = Color3.fromRGB(theme.Button.r, theme.Button.g, theme.Button.b)
        Toggle.BorderSizePixel = 0
        Toggle.Size = UDim2.new(0, 50, 0, 30)
        Toggle.Font = "Ubuntu"
        Toggle.TextColor3 = Color3.fromRGB(theme.Text.r, theme.Text.g, theme.Text.b)
        Toggle.TextSize = 14.000
        Toggle.Text = text

        SCol.Name = "TglCol"
        SCol.Parent = Toggle
        SCol.BackgroundColor3 = Color3.fromRGB(theme.TglOFF.r, theme.TglOFF.g, theme.TglOFF.b)
        SCol.BorderSizePixel = 0
        SCol.Size = UDim2.new(.03, 0, 1, 0)

        Toggle.MouseButton1Down:Connect(function()
            switch = not switch
            SSave()
            local col = nil
            if not switch then col = Color3.fromRGB(theme.TglOFF.r, theme.TglOFF.g, theme.TglOFF.b)
            else col = Color3.fromRGB(theme.TglON.r, theme.TglON.g, theme.TglON.b) end
            local anim = game:GetService("TweenService"):Create(SCol,TweenInfo.new(.45),{BackgroundColor3 = col})
            anim:Play()
            pcall(callback, switch)
        end)
    end
    return _w

end

return lib

--[[

--local main loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/main/UiLibs/GUILib.lua"))():CreateWindow("~ GUI ~") -- for loadstring
local main = lib:CreateWindow("~ GUI ~")
main:CreateToggle('Toggle', function(state)
    if state then
        print('pip')
    else
        print('pop')
    end
end)
main:CreateButton('Button', function()
    print('pik')
end)
]]--
