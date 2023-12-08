local NotifyLib = {}
function NotifyLib:GenNotify(GameUI, from, UI, font, anim, name, text, duration, callback)
   -- functions
   local function RandomID(count)
      local indificator = ""
      local symbols = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*"}
      for i = 1,count do indificator = indificator .. symbols[math.random(#symbols)] end
      return indificator
   end
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

   if GameUI == nil then
      GameUI = 0
      from = "Error"
      UI = "'GameUI' didn't provided"
   elseif GameUI == 1 then
      if from == nil then from = "BottomRight" end
      if UI == nil then UI = "Dark" end
      if font == nil then font = Enum.Font.Gotham end
      if anim == nil then anim = "Tween" end
      if name == nil then name = "Top Text" end
      if text == nil then text = "Bottom Text" end
      if duration == nil then duration = 5 end
      if callback ~= nil then local callback = callback or function() end end

      local NotifyStarted = false
      local NotifyEnded = false
      local ScriptRunned = false
       
   end

   if GameUI == 1 then

      -- Vars
      local NotificationUi = Instance.new("ScreenGui")
      local Body = Instance.new("Frame")
      local Button = Instance.new('TextButton')
      local Desc = Instance.new("TextLabel")
      local Top = Instance.new("Frame")
      local Title = Instance.new("TextLabel")
      local Shadow = Instance.new("Frame")

      if from == "UpperLeft" then 
         if anim == "Tween" then
            Body.Position = UDim2.new(.01, 0, -.154, 0)
            Shadow.Position = UDim2.new(.004, 0, -.15, 0)
         elseif anim == "Fade" then
            Body.Position = UDim2.new(.01, 0, .025, 0)
            Shadow.Position = UDim2.new(.004, 0, .013, 0)
         end
      elseif from == "UpperRight" then 
         if anim == "Tween" then
            Body.Position = UDim2.new(.75, 0, -.154, 0)
            Shadow.Position = UDim2.new(.754, 0, -.15, 0)
         elseif anim == "Fade" then
            Body.Position = UDim2.new(.75, 0, .025, 0)
            Shadow.Position = UDim2.new(.754, 0, .013, 0)
         end
      elseif from == "BottomLeft" then 
         if anim == "Tween" then
            Body.Position = UDim2.new(.01, 0, 1, 0)
            Shadow.Position = UDim2.new(.004, 0, 1, 0)
         elseif anim == "Fade" then
            Body.Position = UDim2.new(.01, 0, .89, 0)
            Shadow.Position = UDim2.new(.004, 0, .9, 0)
         end
      else
         if anim == "Tween" then
            Body.Position = UDim2.new(.85, 0, 1, 0)
            Shadow.Position = UDim2.new(.854, 0, 1, 0)
         elseif anim == "Fade" then
            Body.Position = UDim2.new(.85, 0, .89, 0)
            Shadow.Position = UDim2.new(.854, 0, .9, 0)
         end
      end

      if UI == "Light" then 
         Body.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
         Body.BorderColor3 = Color3.fromRGB(100, 100, 100)
         Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Desc.BackgroundTransparency = 1
         Desc.BorderSizePixel = 0
         Desc.Font = font
         Desc.TextColor3 = Color3.fromRGB(0, 0, 0)
         Desc.TextSize = 14
         Desc.TextXAlignment = Enum.TextXAlignment.Left
         Desc.TextYAlignment = Enum.TextYAlignment.Top
         Top.BackgroundColor3 = Color3.fromRGB(185, 185, 185)
         Top.BorderColor3 = Color3.fromRGB(100, 100, 100)
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1
         Title.BorderSizePixel = 0
         Title.TextColor3 = Color3.fromRGB(0, 0, 0)
         Title.TextXAlignment = Enum.TextXAlignment.Left
         Shadow.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
         Shadow.BackgroundTransparency = .5
         Shadow.BorderSizePixel = 0
      else
         Body.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
         Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Desc.BackgroundTransparency = 1
         Desc.BorderSizePixel = 0
         Desc.Font = font
         Desc.TextColor3 = Color3.fromRGB(245, 245, 245)
         Desc.TextSize = 14
         Desc.TextXAlignment = Enum.TextXAlignment.Left
         Desc.TextYAlignment = Enum.TextYAlignment.Top
         Top.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
         Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1
         Title.BorderSizePixel = 0
         Title.TextColor3 = Color3.fromRGB(245, 245, 245)
         Title.TextXAlignment = Enum.TextXAlignment.Left
         Shadow.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
         Shadow.BackgroundTransparency = .5
         Shadow.BorderSizePixel = 0

      end

      local function StartNotify()
         if not NotifyStarted then
            NotifyStarted = true
            if anim == "Tween" then
               if from == "UpperLeft" then 
                  Body:TweenPosition(UDim2.new(.01, 0, .025, 0), "Out", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.004, 0, .013, 0), "Out", "Sine", .5)
               elseif from == "UpperRight" then 
                  Body:TweenPosition(UDim2.new(.75, 0, .025, 0), "Out", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.754, 0, .013, 0), "Out", "Sine", .5)
               elseif from == "BottomLeft" then 
                  Body:TweenPosition(UDim2.new(.01, 0, .89, 0), "Out", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.004, 0, .9, 0), "Out", "Sine", .5)
               else
                  Body:TweenPosition(UDim2.new(.85, 0, .89, 0), "Out", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.854, 0, .9, 0), "Out", "Sine", .5)
               end
            elseif anim == "Fade" then
               for i = 1, 0, -.1 do
                  wait(.03)
                  Body.Transparency = i
                  Desc.TextTransparency = i
                  Top.Transparency = i
                  Title.TextTransparency = i
                  if i >= .5 then Shadow.Transparency = i end
               end
            end
            NotifyStarted = false
         end
      end

      local function EndNotify()
         if not NotifyEnded then
            NotifyEnded = true
            if anim == "Tween" then
               if from == "UpperLeft" then 
                  Body:TweenPosition(UDim2.new(.01, 0, -.15, 0), "In", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.004, 0, -.154, 0), "In", "Sine", .5)
                  wait(.7)
               elseif from == "UpperRight" then 
                  Body:TweenPosition(UDim2.new(.75, 0, -.15, 0), "In", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.754, 0, -.154, 0), "In", "Sine", .5)
                  wait(.7)
               elseif from == "BottomLeft" then 
                  Body:TweenPosition(UDim2.new(.01, 0, 1.1, 0), "In", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.004, 0, 1.1, 0), "In", "Sine", .5)
                  wait(.4)
               else
                  Body:TweenPosition(UDim2.new(.85, 0, 1.1, 0), "In", "Sine", .5)
                  Shadow:TweenPosition(UDim2.new(.854, 0, 1.1, 0), "In", "Sine", .5)
                  wait(.4)
               end
            elseif anim == "Fade" then
               for i = 0, 1, .1 do
                  wait(.03)
                  Body.Transparency = i
                  Desc.TextTransparency = i
                  Top.Transparency = i
                  Title.TextTransparency = i
                  if i >= .5 then Shadow.Transparency = i end
               end
            end
            NotificationUi:Destroy()
            NotifyEnded = false
         end
      end
      
      local function start()
         pcall(StartNotify)
         wait(duration)
         pcall(EndNotify)
      end
      
      -- UI
      local SomeID = RandomID(12)
      
      NotificationUi.Name = "NotificationUi_" .. SomeID
      NotificationUi.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      NotificationUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      
      Body.Name = "Body"
      Body.Parent = NotificationUi
      Body.ClipsDescendants = true
      Body.ZIndex = 2
      Body.Size = UDim2.new(0, 265, 0, 89)
      
      Button.Parent = Body
      Button.BackgroundTransparency = 1
      Button.Size = UDim2.new(0, 265, 0, 89)
      Button.TextTransparency = 1
      Button.MouseButton1Down:Connect(function()
         if callback ~= nil and not ScriptRunned then
            ScriptRunned = true
            pcall(EndNotify())
            pcall(callback)
            ScriptRunned = false
         else
            ScriptRunned = true
            pcall(EndNotify())
            ScriptRunned = false
         end
      end)
      
      Desc.Name = "Desc"
      Desc.Parent = Body
      Desc.Text = text
      Desc.TextWrapped = true
      Desc.Position = UDim2.new(.023, 0, .27, 0)
      Desc.Size = UDim2.new(0, 253, 0, 57)
      
      Top.Name = "Top"
      Top.Parent = Body
      Top.ClipsDescendants = true
      Top.Size = UDim2.new(0, 265, 0, 18)
      
      Title.Name = "Title"
      Title.Parent = Top
      Title.Text = name
      Title.Font = font
      Title.TextScaled = true
      Title.Position = UDim2.new(.023, 0, 0, 0)
      Title.Size = UDim2.new(0, 253, 0, 18)
      
      Shadow.Name = "Shadow"
      Shadow.Parent = NotificationUi
      Shadow.ClipsDescendants = true
      Shadow.Size = UDim2.new(0, 267, 0, 89)
      
      if anim == "Fade" then
         Body.Transparency = 1
         Desc.TextTransparency = 1
         Top.Transparency = 1
         Title.TextTransparency = 1
         Shadow.Transparency = 1
      end
   
      pcall(start)
      NotificationUi:Destroy()
   --elseif GameUI == 2 then
   --   print('no')
   else
      -- Vars
      if from == nil then UI = "Top Text" end
      if UI == nil then font = "Bottom Text" end
      if font == nil then anim = 5 end

      game:GetService("StarterGui"):SetCore("SendNotification", {Title = from, Text = UI, Duration = font})

   end
end

return NotifyLib

--[[
local main = loadstring(Link)

main:GenNotify()

]]--
