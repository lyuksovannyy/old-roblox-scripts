
if not setfflag then error("setfflag is not available for your executor :(") end
    
setfflag("OutlineSelection", "true")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer

if getgenv()["HighlighterV1"] then
    for i,v in pairs(getgenv()["HighlighterV1"]["Markers"]) do
        pcall(function() v:Destroy() end)
    end
    for i,v in pairs(getgenv()["HighlighterV1"]["Cons"]) do
        pcall(function() v:Disconnect() end)
    end
end

getgenv()["HighlighterV1"] = {}
getgenv()["HighlighterV1"]["Markers"] = {}
getgenv()["HighlighterV1"]["Cons"] = {}

local lib = {}
local function hcolor(h)
    local color = h:GetAttribute("Color") or lib.DefaultColor
    local player if h:GetAttribute("Plr") then player = Players:FindFirstChild(h:GetAttribute("Plr")) end
    local Title = h:FindFirstChildOfClass("BillboardGui"):FindFirstChildOfClass("TextLabel")
    local text = h:GetAttribute("Title") or ""
    if text:len() == 0 then
        spawn(function()
            local a = TweenService:Create(Title,lib.TweenSettings,{
                TextTransparency = 1;
                TextStrokeTransparency = 1;
            })
            a:Play()
            a.Completed:Wait()
            Title.Text = text
        end)
    else
        spawn(function()
            Title.Text = text
            local a = TweenService:Create(Title,lib.TweenSettings,{
                TextTransparency = 0;
                TextStrokeTransparency = 0;
            })
            a:Play()
            a.Completed:Wait()
        end)
    end
    
    if lib.TeamCheck and player and h.Parent == player.Character then
        if player.Team ~= nil and lib.TeamAutoColor then
            TweenService:Create(h, lib.TweenSettings, {OutlineColor = player.Team.TeamColor.Color}):Play()
            TweenService:Create(Title, lib.TweenSettings, {TextColor3 = player.Team.TeamColor.Color}):Play()
        elseif player.Team == plr.Team and plr.Team ~= nil then
            TweenService:Create(h, lib.TweenSettings, {OutlineColor = lib.AllyColor}):Play()
            TweenService:Create(Title, lib.TweenSettings, {TextColor3 = lib.AllyColor}):Play()
        elseif player.Team ~= plr.Team and player.Team ~= nil then
            TweenService:Create(h, lib.TweenSettings, {OutlineColor = lib.EnemyColor}):Play()
            TweenService:Create(Title, lib.TweenSettings, {TextColor3 = lib.EnemyColor}):Play()
        else
            TweenService:Create(h, lib.TweenSettings, {OutlineColor = color}):Play()
            TweenService:Create(Title, lib.TweenSettings, {TextColor3 = color}):Play()
        end
    else
        TweenService:Create(h, lib.TweenSettings, {OutlineColor = color}):Play()
            TweenService:Create(Title, lib.TweenSettings, {TextColor3 = color}):Play()
    end
    
    if player and player.Team == plr.Team and plr.Team ~= nil and lib.TeamCheck and not lib.ShowAlly then
        TweenService:Create(h, lib.TweenSettings, {OutlineTransparency = 1}):Play()
        TweenService:Create(Title,lib.TweenSettings,{
            TextTransparency = 1;
            TextStrokeTransparency = 1;
        }):Play()
    else
        TweenService:Create(h, lib.TweenSettings, {OutlineTransparency = 0}):Play()
        TweenService:Create(Title,lib.TweenSettings,{
            TextTransparency = 0;
            TextStrokeTransparency = 0;
        }):Play()
    end
    
end
local function getInst(parent,classname,name)
    for i,v in pairs(parent:GetChildren()) do
        if v.ClassName == classname and v.Name == name then
            return v
        end
    end
end
do
  local protectedTable = {}
  lib = {
    __index = function (t,k)
        return protectedTable[k]
    end;
    __newindex = function (t,k,v)
        protectedTable[k] = v -- update original table
        for i,v in pairs(getgenv()["HighlighterV1"]["Markers"]) do
            hcolor(v)
        end
    end
  }
end
lib = setmetatable({},lib)

local array = {} for i = 1, math.random(10,20) do array[i] = string.char(math.random(32, 126)) end
local mark_name = "Marker."..table.concat(array)

-- settings
lib.DefaultColor = Color3.fromRGB(255,255,255)
lib.TweenSettings = TweenInfo.new(1,Enum.EasingStyle.Sine)

lib.TeamCheck = true
lib.TeamAutoColor = true
lib.ShowAlly = false
lib.AllyColor = Color3.fromRGB(100,255,100)
lib.EnemyColor = Color3.fromRGB(255,100,100)

-- functions
function lib:Mark(player,CustomName,CustomCol)
    if not player then return end
    
    local tohighlight
    local isPlayer = player.ClassName == "Player"
    if isPlayer then
        tohighlight = player.Character or player.CharacterAdded:Wait()
    
    else -- models, parts
        tohighlight = player
    
    end
    
    local cons = {}
    
    local highlight = tohighlight:FindFirstChildOfClass("Highlight") and tohighlight:FindFirstChildOfClass("Highlight").Name == mark_name or Instance.new("Highlight",tohighlight)
    if highlight ~= true then
        table.insert(getgenv()["HighlighterV1"]["Markers"],highlight)
        highlight.Name = mark_name
        highlight.FillTransparency = 1
        highlight.OutlineTransparency = 1
        
        highlight:SetAttribute("Plr", nil)
        if isPlayer and player ~= plr then
            highlight:SetAttribute("Plr", player.Name)
            cons["team"] = player:GetPropertyChangedSignal("Team"):Connect(function()
                hcolor(highlight)
            end)
        end
        cons["col"] = highlight:GetAttributeChangedSignal("Color"):Connect(function()
            hcolor(highlight)
        end)
        cons["del"] = highlight.Destroying:Connect(function()
            for i,v in pairs(cons) do
                pcall(function() cons[i]:Disconnect() end)
            end
            
        end)
    end
    highlight = getInst(tohighlight, "Highlight", mark_name)
    
    local bg = highlight:FindFirstChildOfClass("BillboardGui") and highlight:FindFirstChildOfClass("BillboardGui").Name == "Ready" or Instance.new("BillboardGui",highlight)
    if bg ~= true then
        bg.Name = "Ready"
        bg.Adornee = highlight.Parent
        bg.AlwaysOnTop = true
        bg.Size = UDim2.new(4, 0, 0.5, 0)
        bg.StudsOffset = Vector3.new(0, 3, 0)
        
    end
    bg = getInst(highlight, "BillboardGui", "Ready")
    
    local Title = bg:FindFirstChildOfClass("TextLabel") and bg:FindFirstChildOfClass("TextLabel").Name == "Title" or Instance.new("TextLabel",bg)
    if Title ~= true then
        Title.Name = "Title"
        Title.BackgroundTransparency = 1
        Title.Size = UDim2.new(1, 0, 1, 0)
        Title.Font = Enum.Font.GothamBold
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextScaled = true
        Title.TextTransparency = 1
        Title.TextStrokeTransparency = 1
        Title.Text = ""
        cons["title"] = Title:GetAttributeChangedSignal("Title"):Connect(function()
            hcolor(highlight)
        end)
    end
    --Title = getInst(bg, "TextLabel", "Title")
    
    highlight:SetAttribute("Color", CustomCol)
    highlight:SetAttribute("Title", CustomName)
    hcolor(highlight)
    
    return highlight
    
end
getgenv()["HighlighterV1"]["Cons"]["myTeam"] = plr:GetPropertyChangedSignal("Team"):Connect(function()
    for i,v in pairs(getgenv()["HighlighterV1"]["Markers"]) do
        hcolor(v)
    end
end)

function lib:DestroyAll()
    for i,v in pairs(getgenv()["HighlighterV1"]["Markers"]) do
        pcall(function() v:Destroy() end)
    end
    pcall(function() getgenv()["HighlighterV1"]["Cons"]["PlrAdded"]:Disconnect() end)
    pcall(function() getgenv()["HighlighterV1"]["Cons"]["PlrRemoved"]:Disconnect() end)
end

function lib:LoadDefault()
    local cons = {}
    getgenv()["HighlighterV1"]["Cons"]["PlrAdded"] = Players.PlayerAdded:Connect(function(v)
        cons[v.UserId] = v.CharacterAdded:Connect(function()
            lib:Mark(v)
        end)
    end)
    getgenv()["HighlighterV1"]["Cons"]["PlrRemoved"] = Players.PlayerRemoving:Connect(function(v)
        if cons[v.UserId] then
            cons[v.UserId]:Disconnect()
        end
    end)
    for i,v in pairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer then
            if v.Character then
                lib:Mark(v,"@"..v.DisplayName)
            end
            cons[v.UserId] = v.CharacterAdded:Connect(function()
                lib:Mark(v,"@"..v.DisplayName)
            end)
        end
    end
end

return lib
