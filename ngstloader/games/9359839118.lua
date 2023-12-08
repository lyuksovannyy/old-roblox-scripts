-- GAS STATION
repeat wait(0.1) until getgenv().ngstloader ~= nil

local main = ngstloader:AddMenu("Gas Station")
local page1 = main:AddTab("Main")

-- SETTINGS
local debug = false
local wait_time = 0.5
local wait_item = { -- wait time before start clean next thing
    spots = 0.5;
    cashier = 2;
    fuel_car = 2.5;
}
local minimun_energy = 70 -- minimal energy to start work again
local client_money_limit = 14
local cfg = CFG("GAS STATION","get")
if cfg["fuel_cars"] == nil then cfg["fuel_cars"] = false end
if cfg["clean_spots"] == nil then cfg["clean_spots"] = false end
if cfg["cashier"] == nil then cfg["cashier"] = false end


if cfg["restock_items"] == nil then cfg["restock_items"] = false end -- restock items if don't have | if off will stop farm
if cfg["use_client_money"] == nil then cfg["use_client_money"] = false end -- if not enough money at station bank, use client money?
if cfg["off_lights"] == nil then cfg["off_lights"] = false end -- turn off lights on station close
if cfg["restock_energy"] == nil then cfg["restock_energy"] = true end

-- dont change this pls
getgenv().last_position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
getgenv().last_buy_item = "fuel"
if getgenv().collide_objects == nil then getgenv().collide_objects = {} end
getgenv().is_out_of_energy = false
getgenv().is_already_moving = false
getgenv().is_already_moving_con = false

local is_waiting_for_fuel = false
local is_noclippin = false
-- connections
if getgenv().connection == nil then getgenv().connection = {} end
if getgenv().trash_cons == nil then getgenv().trash_cons = {} end
for i,v in pairs(getgenv().connection) do
   getgenv().connection[i]:Disconnect()
   getgenv().connection[i] = nil
end
for i,v in pairs(getgenv().trash_cons) do
   getgenv().trash_cons[i]:Disconnect()
   getgenv().trash_cons[i] = nil
end

-- SOURCE

-- getting some needed stuff
local power_buttons = {["Shop A/C"] = nil, ["Shop Lights"] = nil}
spawn(function()
    for i,v in pairs(game:GetService("Workspace").Ceilings.This:GetDescendants()) do
        if v.ClassName == "SurfaceGui" then
            if v.TextLabel.Text == "Shop A/C" or v.TextLabel.Text == "Shop Lights" then
                v.Parent.Name = "Title"
                power_buttons[v.TextLabel.Text] = v.Parent.Parent.Part.Power
            end
        end
    end
end)

local elements = {}
local me = game:GetService("Players").LocalPlayer
local Tween = game:GetService("TweenService")
local Controls = require(me.PlayerScripts.PlayerModule):GetControls()

local function cp(text)
    if debug then print(text) end 
end

-- for actions
local function wait_for_energy()
    if getgenv().is_out_of_energy == true then
        while getgenv().is_out_of_energy == true do
            wait(1)
        end
    end
end
local function interact(promt)
    if promt.Parent then
        promt = promt.Parent:FindFirstChild(promt.Name)
        if promt then
            if promt.Enabled then
                cp("Interacted with: "..promt.Name)
                fireproximityprompt(promt, 3)
            end
        else cp("Interaction failed.")
        end
    else cp("Interaction failed.")
    end
end
-- movement
local function Scp(worker,state)
    if worker:lower() ~= "client" then
        game:GetService("ReplicatedStorage").Remote:FireServer(unpack({[1] = "Scping",[2] = state}))
    elseif state == true then me.Character.Humanoid.WalkSpeed = 21
    else me.Character.Humanoid.WalkSpeed = 10 end
end
local function moveTo(targetPoint, promt) -- https://developer.roblox.com/en-us/api-reference/function/Humanoid/MoveTo
    if promt == "Force" then getgenv().is_already_moving = false;wait(1.5) end
    repeat wait(1) until getgenv().is_already_moving == false
    if promt == nil then promt = 0 end
	local targetReached = false
	getgenv().is_already_moving = true
    local humanoid = me.Character.Humanoid
    Controls:Disable()
    is_noclippin = true
    if promt ~= "Force" then Scp("Client",false) end
    
    local function TaskEnd()
        targetReached = true
        getgenv().is_already_moving = false
        is_noclippin = false
        Controls:Enable()
    end
    
	-- listen for the humanoid reaching its target
	local con_walk
	con_walk = humanoid.MoveToFinished:Connect(function(reached)
	    cp("Finished.")
	    TaskEnd()
		con_walk:Disconnect()
		con_walk = nil
		if promt and promt ~= 0 then interact(promt) end
	end)
 
	-- start walking
	--Scp("Client",true)
	humanoid:MoveTo(targetPoint)
 
	-- execute on a new thread so as to not yield function
	local attemps = 0
	while not targetReached do
	    if attemps >= 150 then 
	        cp("Timeout.")
	        TaskEnd()
	        --break 
        end
	    attemps = attemps + 1
	    
        if promt and promt ~= 0 and promt ~= "Force" then
            if not promt.Enabled then 
                cp("Promt disabled.")
                TaskEnd()
                --break 
            end
        elseif promt == nil then 
            cp("Promt is nil.")
            TaskEnd()
            --break 
        end
            
		if not (humanoid and humanoid.Parent) then
		    cp("Died.")
            TaskEnd()
			--break
		end
		
		if targetPoint ~= humanoid.WalkToPoint then
		    cp("Target changed.")
            TaskEnd()
            --break
        end
	    
        if (targetPoint - me.Character.HumanoidRootPart.Position).Magnitude <= 5 and promt ~= "Force" then 
		    cp("Finished. (Fast)")
            if promt and promt ~= 0 then interact(promt) end
            TaskEnd()
            --break
        end
        
		if getgenv().is_already_moving == false then
		    cp("Stopped. (Forced)")
            TaskEnd()
		    --break
		end
        
		humanoid:MoveTo(targetPoint)
		wait(0.1)
	end
	cp("Is moving: "..tostring(getgenv().is_already_moving))
    --Scp("Client",false)
    humanoid:MoveTo(me.Character:FindFirstChild('HumanoidRootPart').Position)
    --getgenv().is_already_moving = false
    
	-- disconnect the connection if it is still connected
	if con_walk then
		con_walk:Disconnect()
		con_walk = nil
		TaskEnd()
	end
end
local function RMe(a)
    if a == 1 then
        getgenv().last_position = me.Character.HumanoidRootPart.CFrame
    else
        Tween:Create(me.Character.HumanoidRootPart,TweenInfo.new(.3),{CFrame = getgenv().last_position}):Play()
        wait(.3)
    end
end
-- economy
local function ClientMoney(needed)
    if needed > client_money_limit then return false end
    local money = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Stats.Money.Money.Text:gsub("%$","")
    if tonumber(money) >= needed and cfg["use_client_money"] == true then return true else return false end
end
local function BankMoney(needed)
    local bank = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Stats.Bank.Bank.Text:gsub("%$","")
    local bills = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Stats.Bills.Bills.Text:gsub("%$","")
    local commision = game:GetService("Workspace").CommisionTable.SurfaceGui.Content[me.Name].Amount.Text:gsub("%$","")
    if tonumber(bank)-tonumber(bills) >= needed and tonumber(commision) >= needed then return true else return false end
end
local function Buy(item_name)
    local function item(a,b,c,d)
        if d == nil then return false end
        game:GetService("ReplicatedStorage").Remote:FireServer(unpack({[1] = "BuyItem",[2] = a,[3] = b,[4] = c,[5] = d}))
        return true

    end
    local function cash_source(cash)
        if BankMoney(cash) then return "Station"
        elseif BankMoney(cash) then return "Client"
        else return nil end
    end
    if item_name == "fuel" then
        getgenv().last_buy_item = "fuel"
        local bought = false
        if BankMoney(350) or ClientMoney(350) then
            bought = item("Syntin Petrol Co","Gasoline 87",7, cash_source(350))
        elseif BankMoney(200) or ClientMoney(200) then
            bought = item("Syntin Petrol Co","Gasoline 87",6, cash_source(200))
        elseif BankMoney(100) or ClientMoney(100) then
            bought = item("Syntin Petrol Co","Gasoline 87",5, cash_source(100))
        elseif BankMoney(46) or ClientMoney(46) then
            bought = item("Syntin Petrol Co","Gasoline 87",4, cash_source(46))
        elseif BankMoney(26) or ClientMoney(26) then
            bought = item("Syntin Petrol Co","Gasoline 87",3, cash_source(26))
        elseif BankMoney(14) or ClientMoney(14) then
            bought = item("Syntin Petrol Co","Gasoline 87",2, cash_source(14))
        else repeat wait(1) until (BankMoney(9) or ClientMoney(9)) or cfg["restock_items"] == false
            if cfg["restock_items"] == true then bought = item("Syntin Petrol Co","Gasoline 87",1,cash_source(9))end
        end
        if bought == true then is_waiting_for_fuel = false end
    end
end

-- for actions | avoid stucks
table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Humanoid.StateChanged:Connect(function(o,n)
	if n == Enum.HumanoidStateType.Seated and getgenv().is_out_of_energy == false and (cfg["fuel_cars"] or cfg["clean_spots"] or cfg["cashier"]) then
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(3);Scp("Client",false)
    end

end))
table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Head.Touched:connect(function(obj)
	if obj ~= workspace.Terrain then
		if is_noclippin == true then
			if obj.CanCollide then table.insert(getgenv().collide_objects,obj) end
			obj.CanCollide = false
		else
		    for i,v in pairs(getgenv().collide_objects) do
	            v.CanCollide = true
	            getgenv().collide_objects[i] = nil
	        end
		end
	end
end))
table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Torso.Touched:connect(function(obj)
	if obj ~= workspace.Terrain then
		if is_noclippin == true then
			if obj.CanCollide then table.insert(getgenv().collide_objects,obj) end
			obj.CanCollide = false
		else
		    for i,v in pairs(getgenv().collide_objects) do
	            v.CanCollide = true
	            getgenv().collide_objects[i] = nil
	        end
		end
	end
end))
spawn(function()
    wait(2.5)
    getgenv().is_already_moving_con = true
    while getgenv().is_already_moving_con == true do
        local attemps = 0
        repeat wait(0.1);attemps = attemps + 1 until (attemps >= 70 and getgenv().is_already_moving == true) or getgenv().is_already_moving == false
        if attemps >= 70 then cp("Fixed.");Controls:Enable();getgenv().is_already_moving = false end
    end
end)

local function Energy()
    local percent = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Stamina.Bar.Amount.Text:gsub("%\%","")
    if cfg["restock_energy"] == true then Scp("Client",true);moveTo(game:GetService("Workspace").Ceilings.Sofa.Seat.Position,"Force") end
    if tonumber(percent) <= minimun_energy and getgenv().is_out_of_energy == true then
        while tonumber(percent) <= minimun_energy and getgenv().is_out_of_energy == true do
            percent = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Stamina.Bar.Amount.Text:gsub("%\%","")
            wait(1.5)
        end
        if cfg["restock_energy"] == true then 
            me.Character.Humanoid:ChangeState(3) -- jump
        end
        getgenv().is_out_of_energy = false
    end
end

-- notifications hook
table.insert(getgenv().connection,game:GetService("Players").LocalPlayer.PlayerGui.NotificationUI.Notifications.ActiveNotifications.ChildAdded:Connect(function(a)
    local text = a.Primary.BodyText.Text
    local title = a.Primary["1"].HeaderHolder.Header.Text
    cp("Notification Title: "..title.." | text: "..text)
    if text == "Not enough fuel to refill this car. Buy more and try again." then
        if cfg["restock_items"] == true then
            is_waiting_for_fuel = true
            Buy("fuel")
        else
            is_waiting_for_fuel = true
        end
    elseif string.find(text:lower(),"gasoline") then
        is_waiting_for_fuel = false
    elseif text == "Gas Station can not afford this purchase." and cfg["use_client_money"] == true then
        Buy(getgenv().last_buy_item)
    elseif text == "Only the Manager can purchase more stock when one is present." then
        elements[4]:Change({state=false})
    elseif title == "Out of Energy" then
        getgenv().is_out_of_energy = true
        Energy()
    elseif text == "Station is now closed!" and cfg["off_lights"] == true then
        if tostring(power_buttons["Shop Lights"].Parent.BrickColor) == "Sea green" then
            RMe(1)
            Tween:Create(me.Character.HumanoidRootPart,TweenInfo.new(.3),{CFrame = power_buttons["Shop Lights"].Parent.CFrame}):Play();wait(.35)
            interact(power_buttons["Shop Lights"])
            wait(.3)
            RMe(0)
        end
    elseif text == "Station is now open!" and cfg["off_lights"] == true then
        if tostring(power_buttons["Shop Lights"].Parent.BrickColor) == "Persimmon" then
            RMe(1)
            Tween:Create(me.Character.HumanoidRootPart,TweenInfo.new(.3),{CFrame = power_buttons["Shop Lights"].Parent.CFrame}):Play();wait(.35)
            interact(power_buttons["Shop Lights"])
            wait(.3)
            RMe(0)
        end
    end
end))

-- UI + Actions start
elements[1] = page1:CreateToggle({state=cfg["fuel_cars"],name="Fuel cars",exec=true},function(t)
    cfg["fuel_cars"] = t
    CFG("GAS STATION",cfg)
    if cfg["fuel_cars"] == true then
        spawn(function()
            while wait(wait_time) and cfg["fuel_cars"] == true do
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if cfg["fuel_cars"] == true and v.ClassName == "Model" and string.find(v.Name:lower(),"car_") and is_waiting_for_fuel == false then
                        local lid = v:WaitForChild("Lid")
                        local promt = lid:FindFirstChild("Refuel") or lid:FindFirstChild("FinishFuel");wait_for_energy()
                        if promt ~= nil then
                            if promt.Enabled then moveTo(v.Root.Position,promt) end
                        end
                    end
                end
            end
        end)
    end
end)
elements[7] = page1:CreateToggle({state=cfg["cashier"],name="Cashier",exec=true},function(t)
    cfg["cashier"] = t
    CFG("GAS STATION",cfg)
    if cfg["cashier"] == true then
        spawn(function()
            while wait(wait_time) and cfg["cashier"] == true do
                wait_for_energy()
                for i,v in pairs(game:GetService("Workspace").Checkouts:GetChildren()) do
                    for q,w in pairs(v.Items:GetChildren()) do
                        wait_for_energy()
                        local promt = w.Root:FindFirstChild("Scan")
                        if promt then
                            repeat wait(.1) until promt.Enabled == true
                            moveTo(w.Root.Position,promt)
                        end
                        wait(wait_item["cashier"])
                    end
                    
                end
            
            end
            
        end)
        
    end
end)
elements[2] = page1:CreateToggle({state=cfg["clean_spots"],name="Clean spots",exec=true},function(t)
    cfg["clean_spots"] = t
    CFG("GAS STATION",cfg)
    if cfg["clean_spots"] == true then
        spawn(function()
            while wait(wait_time) and cfg["clean_spots"] == true do
                for i,v in pairs(game:GetService("Workspace").Stains:GetChildren()) do
                    local promt = v:WaitForChild("Clean")
                    if promt.Enabled then 
                        wait_for_energy()
                        moveTo(v.Position,promt) 
                    end
                end
            end
        end)
        spawn(function()
            while wait(wait_time) and cfg["clean_spots"] == true do
                for i,v in pairs(game:GetService("Workspace").Windows:GetChildren()) do
                    local promt = v.Attachment:WaitForChild("Clean")
                    if promt.Enabled then 
                        wait_for_energy()
                        moveTo(v.Position,promt) 
                    end
                end
            end
        end)
        spawn(function()
            while wait(wait_time) and cfg["clean_spots"] == true do
                for i,v in pairs(game:GetService("Workspace").Solar.Panels:GetChildren()) do
                    local promt = v.Stand.CleanPosition:WaitForChild("Clean")
                    if promt.Enabled then
                        wait_for_energy()
                        RMe(1);interact(promt);RMe(0)
                        wait(wait_item["spots"])
                    end
                end
            end
        end)
    end
end)
elements[4] = page1:CreateToggle({state=cfg["restock_items"],name="Restock items",desc="Restock items (fuel)"},function(t)
    cfg["restock_items"] = t
    CFG("GAS STATION",cfg)
end)
elements[9] = page1:CreateToggle({state=cfg["restock_energy"],name="Restock energy"},function(t)
    cfg["restock_energy"] = t
    CFG("GAS STATION",cfg)
end)
elements[5] = page1:CreateToggle({state=cfg["use_client_money"],name="Use client money",desc="If station have not enough money will use your money"},function(t)
    cfg["use_client_money"] = t
    CFG("GAS STATION",cfg)
end)
elements[8] = page1:CreateToggle({state=cfg["off_lights"],name="Off/On lights on station close/open"},function(t)
    cfg["off_lights"] = t
    CFG("GAS STATION",cfg)
end)

table.insert(getgenv().connections,game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for i,v in pairs(getgenv().trash_cons) do
       getgenv().trash_cons[i]:Disconnect()
       getgenv().trash_cons[i] = nil
    end
    table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Humanoid.StateChanged:Connect(function(o,n)
    	if n == Enum.HumanoidStateType.Seated and getgenv().is_out_of_energy == false and (cfg["fuel_cars"] or cfg["clean_spots"] or cfg["cashier"]) then
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(3);Scp("Client",false)
        end
    
    end))
    table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Head.Touched:connect(function(obj)
    	if obj ~= workspace.Terrain then
    		if is_noclippin == true then
    			if obj.CanCollide then table.insert(getgenv().collide_objects,obj) end
    			obj.CanCollide = false
    		else
    		    for i,v in pairs(getgenv().collide_objects) do
    	            v.CanCollide = true
    	            getgenv().collide_objects[i] = nil
    	        end
    		end
    	end
    end))
    table.insert(getgenv().trash_cons,game:GetService("Players").LocalPlayer.Character.Torso.Touched:connect(function(obj)
    	if obj ~= workspace.Terrain then
    		if is_noclippin == true then
    			if obj.CanCollide then table.insert(getgenv().collide_objects,obj) end
    			obj.CanCollide = false
    		else
    		    for i,v in pairs(getgenv().collide_objects) do
    	            v.CanCollide = true
    	            getgenv().collide_objects[i] = nil
    	        end
    		end
    	end
    end))
    
end))

pcall(function()
    local qtp = queue_on_teleport or (syn and syn.queue_on_teleport)
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.Started then
            qtp(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/ngstloader/main/games/9359839118.lua"))
        end
    end) 
end)
