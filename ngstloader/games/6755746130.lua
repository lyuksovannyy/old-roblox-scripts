-- Fruit Juice Tycoon
local main = ngstloader:AddMenu("FJTycoon")
local page1 = main:AddTab("Main")

local auto_buy = false
local auto_complete_obby = false
local auto_pickup = false
local make_juice_at = 10
local auto_prestige = false

local me = game.Players.LocalPlayer
local array = {}
for i = 1, 10 do
    array[i] = string.char(math.random(32, 126))
end
local Gen_ID = table.concat(array);array = nil
getgenv().ScriptInstanceID = Gen_ID

if getgenv().connections == nil then getgenv().connections = {} end
for i,v in pairs(getgenv().connections) do
    pcall(function() v:Disconnect() end)
    getgenv().connections[i] = nil
end

local isTeleporting = false
local isIdNow = ""
local function tp(cf,promt,id)
    if id ~= nil then
        if isIdNow == tostring(id) then return end
        isIdNow = tostring(id)
    end
    repeat wait() until isTeleporting == false
    isTeleporting = true
    local h = me.Character.Humanoid
    local speed = h.WalkSpeed
    local jump = h.JumpPower
    h.WalkSpeed = 1
    h.JumpPower = 1
    local old = me.Character.HumanoidRootPart.CFrame
    me.Character.HumanoidRootPart.CFrame = cf
    if promt ~= nil then
        wait(0.3)
        fireproximityprompt(promt, 12)
    end
    wait(0.2)
    me.Character.HumanoidRootPart.CFrame = old
    h.WalkSpeed = speed
    h.JumpPower = jump
    isTeleporting = false
    if id ~= nil then isIdNow = "" end
end
if me.OwnedTycoon.Value == nil then
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
        if v.Essentials:FindFirstChild("Entrance") then
            tp(v.Essentials:FindFirstChild("Entrance").CFrame)
            wait(1)
            break
        end
    end
end

local function myTycoon()
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
        if tostring(v.Owner.Value) == me.Name then 
            return v 
        end
    end
end
local function getMoney() return tonumber(me.leaderstats.Money.Value) end
local function split (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end
local function getFruitCount(name)
    for i,v in pairs(me.PlayerGui.FruitGui.HolderFrame:GetChildren()) do
        if v.ClassName == "TextLabel" then
            if string.find(v.Text:lower(),name:lower()) then
                local count = split(v.Text)[1]
                count = count:gsub("%,","")
                return tonumber(count)
            end
        end
    end
end
table.insert(getgenv().connections,myTycoon().Drops.ChildAdded:Connect(function(v)
    if auto_pickup then
        game:GetService("ReplicatedStorage").CollectFruit:FireServer(v)
        if getFruitCount("orange") >= make_juice_at then 
            tp(myTycoon().Essentials.JuiceMaker.StartJuiceMakerButton.CFrame,myTycoon().Essentials.JuiceMaker.StartJuiceMakerButton.PromptAttachment.StartPrompt,"0x001")
        end
    end
end))

spawn(function()
    while getgenv().ScriptInstanceID == Gen_ID do
        repeat wait(0.5) until auto_buy
        for i,v in pairs(myTycoon().Buttons:GetChildren()) do
            local cost = tostring(v.ButtonLabel.CostLabel.Text):gsub("%Money: ","")
            cost = cost:gsub("%,","")
            if getMoney() >= tonumber(cost) then
                tp(v.CFrame) 
                wait(0.5)
            end
        end
        wait()
    end
end)
spawn(function()
    while getgenv().ScriptInstanceID == Gen_ID do
        repeat wait(1) until me.PlayerGui.ObbyInfoBillBoard.BottomText.Text == "(Your tools  will be taken)" and auto_complete_obby
        tp(game:GetService("Workspace").ObbyParts.ObbyStartPart.CFrame,nil,"0x002")
        tp(game:GetService("Workspace").ObbyParts.VictoryPart.CFrame,nil,"0x003")
    end
end)
spawn(function()
    while getgenv().ScriptInstanceID == Gen_ID do
        repeat wait(1) until myTycoon().Purchased:FindFirstChild("Golden Tree Statue") and auto_prestige
        tp(myTycoon().Purchased["Golden Tree Statue"].StatueBottom,myTycoon().Purchased["Golden Tree Statue"].StatueBottom.PrestigePrompt)
    end
end)

local elements = {}
page1:CreateToggle({name="Auto pickup fruits + Make juice"},function(_)
    auto_pickup = _
    for i,v in pairs(myTycoon().Drops:GetChildren()) do game:GetService("ReplicatedStorage").CollectFruit:FireServer(v) end
end)
elements[2] = page1:CreateSlider({name="Make juice when has "..tostring(make_juice_at).." Oranges",min=3,def=make_juice_at,max=100},function(_)
    make_juice_at = _
    elements[2]:Change({name="Make juice when has "..tostring(_).." Oranges"})
end)
page1:CreateToggle({name="Auto buy upgrades"},function(_)
    auto_buy = _
end)
page1:CreateToggle({name="Auto complete obby"},function(_)
    auto_complete_obby = _
end)
page1:CreateToggle({name="Auto prestige"},function(_)
    auto_prestige = _
end)
