-- online autoexec 

--[[
_G.webhook_url = link
_G.ExScripts = {0,1,2,3,4,5,etc...} -- do not load scripts with this names in this table (only for local scripts)
--]]

-- some funcs

repeat wait() until game:IsLoaded() and game:GetService("CoreGui")

-- checking state
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/main/UiLibs/NotifyLibRewrite.lua"))()

if _G.SAutoExecState == nil or _G.SAutoExecState == false then
	
	-- the loader
	spawn(function()
		pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/GameSTALkER/synapse.luas/main/loader.lua'))() end)
		print("OK")
	end)
	
	-- other scripts
	spawn(function()
        if _G.ExScripts == nil then _G.ExScripts = {} end
		local function loadlocal()
			local num = 1
			while true do
				if table.find(_G.ExScripts, num) then
                    			print('skipping ' .. num .. '.lua')
                		else
                    			loadstring(game:HttpGet('https://raw.githubusercontent.com/GameSTALkER/synapse.luas/scripts/autoexec.scripts/' .. num .. '.lua'))()
                    			print('loading ' .. num .. '.lua')
                		end
				num = num + 1
			end
		end
		pcall(loadlocal)
		print("OK")
	end)
	
	_G.SAutoExecState = true
	print("READY!")
	notif:CreateNotify({name="AutoExecute",text="All scripts executed!",time=3})
else
	print("Already executed.")
	notif:CreateNotify({name="AutoExecute",text="All nedeed scripts already executed.",time=3})
end
