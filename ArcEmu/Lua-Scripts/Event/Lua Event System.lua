--[[

      :::::::::: :::     ::: :::::::::: ::::    ::: :::::::::::          ::::::::  :::   :::  :::::::: ::::::::::: ::::::::::   :::   ::: 
     :+:        :+:     :+: :+:        :+:+:   :+:     :+:             :+:    :+: :+:   :+: :+:    :+:    :+:     :+:         :+:+: :+:+: 
    +:+        +:+     +:+ +:+        :+:+:+  +:+     +:+             +:+         +:+ +:+  +:+           +:+     +:+        +:+ +:+:+ +:+ 
   +#++:++#   +#+     +:+ +#++:++#   +#+ +:+ +#+     +#+             +#++:++#++   +#++:   +#++:++#++    +#+     +#++:++#   +#+  +:+  +#+  
  +#+         +#+   +#+  +#+        +#+  +#+#+#     +#+                    +#+    +#+           +#+    +#+     +#+        +#+       +#+   
 #+#          #+#+#+#   #+#        #+#   #+#+#     #+#             #+#    #+#    #+#    #+#    #+#    #+#     #+#        #+#       #+#    
##########     ###     ########## ###    ####     ###              ########     ###     ########     ###     ########## ###       ###    
		
	Made by Grandelf.
	
]]--

EVS = {}

EVS["System"] = {
	["EventNums"] = {},
	["Events"] = {}
}	

local EventListCommand = "#event"
local EventStart = "#event start"
local EventStop = "#event stop"
local EventJoin = "#event join"
local EventList = "#event list"
local EventRevEn = "#event revact"
local EventRevDis = "#event revdeact"
local EventRevive = "#event revive"
local EventLeave = "#event leave"

local tsn_EventAddBox1 = "#event add1"
local tsn_EventAddBox2 = "#event add2"
local tsn_EventAddBox3 = "#event add3"

function EVS.EventChat(event, player, message)

if (message == EventListCommand) then
player:SendBroadcastMessage("\n")
player:SendBroadcastMessage("|cff00ccff[Event Commands]|r |cff00ff00Avaible commands:|r")
player:SendBroadcastMessage(""..EventListCommand.." - |cffFFFFFFShows the event commands|r")
if (player:CanUseCommand("g") == true) then
player:SendBroadcastMessage(""..EventStart.." - |cffFF0000starts an event (automaticaly generates an event ID")
player:SendBroadcastMessage(""..EventStop.." - |cffFF0000stop an event with ID")
player:SendBroadcastMessage(""..EventRevEn.." - |cffFF0000enables the revive option in the event")
player:SendBroadcastMessage(""..EventRevDis.." - |cffFF0000disables the revive option in the event")
player:SendBroadcastMessage(""..tsn_EventAddBox1.." - |cffFF0000adds the reward box [1]")
player:SendBroadcastMessage(""..tsn_EventAddBox2.." - |cffFF0000adds the reward box [2]")
player:SendBroadcastMessage(""..tsn_EventAddBox3.." - |cffFF0000adds the reward box [3]")
end
player:SendBroadcastMessage(""..EventRevive.." - |cffFFFFFFrevives yourself")
player:SendBroadcastMessage(""..EventJoin.." - |cffFFFFFFJoin the event ID|r")
player:SendBroadcastMessage(""..EventList.." - |cffFFFFFFList the events active|r")
player:SendBroadcastMessage(""..EventLeave.." - |cffFFFFFFLeave the event you are on now|r")
return false;
end
	if (message == EventStart) then
		if (player:CanUseCommand("g") == true) then
			local EventNum = GetEventNum()
			EVS["System"]["EventNums"][EventNum] = 1
			EVS["System"]["Events"][EventNum] = {}
			EVS["System"]["Events"][EventNum]["Map"] = player:GetMapId()
			EVS["System"]["Events"][EventNum]["X"] = player:GetX()
			EVS["System"]["Events"][EventNum]["Y"] = player:GetY()
			EVS["System"]["Events"][EventNum]["Z"] = player:GetZ()
			EVS["System"]["Events"][EventNum]["Zone"] = player:GetZoneId()
			EVS["System"]["Events"][EventNum]["Name"] = tostring(player:GetName())
			EVS["System"]["Events"][EventNum]["Revive"] = true
			EVS["System"]["Events"][EventNum]["Spectate"] = true
			SendEventMessage(player:GetName().." has started an event type #event join "..EventNum.." to join!")
		end
		return false;
	end
	if (message:find(EventStop.." ") == 1) then	
		if (player:CanUseCommand("g") == true) then
			local event = tonumber(GetWords(message)[3])
			EVS["System"]["Events"][event] = nil
			EVS["System"]["EventNums"][event] = nil
			SendEventMessage(player:GetName().." has stopped event "..event..".")
		end
		collectgarbage()
		return false;
	end
	if (message:find(EventJoin.." ") == 1) then	
		local event = tonumber(GetWords(message)[3])
		if (EVS["System"]["Events"][event] ~= nil) then
			local plr = tostring(player)
			if (EVS[plr] == nil) or (player:GetZoneId() ~= EVS["System"]["Events"][event]["Zone"]) then
				if (EVS[plr] == nil) then
					EVS[plr] = {}
				end	
				EVS[plr]["Map"] = player:GetMapId()
				EVS[plr]["X"] = player:GetX()
				EVS[plr]["Y"] = player:GetY()
				EVS[plr]["Z"] = player:GetZ()	
				EVS[plr]["Zone"] = player:GetZoneId()
				player:Teleport(EVS["System"]["Events"][event]["Map"], EVS["System"]["Events"][event]["X"], EVS["System"]["Events"][event]["Y"], EVS["System"]["Events"][event]["Z"])
				player:SendBroadcastMessage("Welcome to event "..event..".")
			else
				player:Teleport(EVS["System"]["Events"][event]["Map"], EVS["System"]["Events"][event]["X"], EVS["System"]["Events"][event]["Y"], EVS["System"]["Events"][event]["Z"])
				player:SendBroadcastMessage("Welcome to event "..event..".")	
			end	
		else
			player:SendBroadcastMessage("This event isn't running at this moment. Use "..EventList.." to see a list of running events.")
		end
		collectgarbage()
		return false;
	end
	if (message == EventLeave) then
		local plr = tostring(player) 
		if (EVS[plr] ~= nil) then 
			local num = 0
			if (table.getn(EVS["System"]["Events"]) > 0) then
				for _, v in pairs(EVS["System"]["Events"]) do
					if (v["Zone"] == player:GetZoneId()) then
						player:Teleport(EVS[plr]["Map"], EVS[plr]["X"], EVS[plr]["Y"], EVS[plr]["Z"])
						break;
					else
						num = num + 1
					end
				end
				if (num == table.getn(EVS["System"]["Events"])) then
					player:SendBroadcastMessage("You are not in an event so you can't leave one either.")
				end	
			else
				player:SendBroadcastMessage("You are not in an event so you can't leave one either.")
			end
		else
			player:SendBroadcastMessage("You are not in an event so you can't leave one either.")
		end	
		return false;
	end		
	if (message:find(EventRevEn.." ") == 1) then	
		if (player:CanUseCommand("g") == true) then	
			local event = tonumber(GetWords(message)[3])
			if (EVS["System"]["Events"][event] ~= nil) then
				if (EVS["System"]["Events"][event]["Revive"] == false) then
					EVS["System"]["Events"][event]["Revive"] = true
					SendEventMessage(player:GetName().." has enabled the revive option in event "..event)
				else
					player:SendBroadcastMessage("The revive option is already enabled in this event.")
				end	
			else
				player:SendBroadcastMessage("This event isn't running at this moment. Use "..EventList.." to see a list of running events.")
			end
		end
		return false;	
	end		
	if (message:find(EventRevDis.." ") == 1) then	
		if (player:CanUseCommand("g") == true) then
			local event = tonumber(GetWords(message)[3])
			if (EVS["System"]["Events"][event] ~= nil) then
				if (EVS["System"]["Events"][event]["Revive"] == true) then
					EVS["System"]["Events"][event]["Revive"] = false
					SendEventMessage(player:GetName().." has disabled the revive option in event "..event)
				else
					player:SendBroadcastMessage("The revive option is already disabled in this event.")
				end	
			else
				player:SendBroadcastMessage("This event isn't running at this moment. Use "..EventList.." to see a list of running events.")
			end
		end	
		return false;	
	end	
	if (message == EventRevive) then
		local num = 0
		if (table.getn(EVS["System"]["Events"]) > 0) then
			for _, v in pairs(EVS["System"]["Events"]) do
				if (v["Revive"] == true) and (v["Zone"] == player:GetZoneId()) then
					player:ResurrectPlayer()
					break;
				else
					num = num + 1
				end
			end
			if (num == table.getn(EVS["System"]["Events"])) then
				player:SendBroadcastMessage("You are not in the event zone or the revive command aint activated.")
			end	
		else
			player:SendBroadcastMessage("You can only use this when you are in an event.")
		end
		return false;	
	end		
	if (message == EventList) then
		player:SendBroadcastMessage("|cffff0000Current active events: |cffffff00"..ListEvents())
		return false;
	end	
end	
		
function GetWords(str)
	local tbl = {}
	local word
	while (true) do
		if (string.find(str, "%s") ~= nil) then
			word = string.sub(str, 1, string.find(str, "%s") - 1)
			table.insert(tbl, word)
			str = str:gsub(word.." ", "")	
		else
			word = string.sub(str, 1, string.len(str))
			table.insert(tbl, word)
			str = nil		
		end
		if (str == nil) then
			return tbl;
		end	
	end
end	

function ListEvents()
	local C, Events = 0, "" 
	for k, v in pairs(EVS["System"]["Events"]) do
		C = C + 1 
		if (C < 7) then 
			p = k.." - Hosted by: "..EVS["System"]["Events"][k]["Name"]
			Events = Events.."\n"..p 
		else 
			Events = Events.."\n|cffff0000Results over 6 wont be shown." 
			break; 
		end
	end
	if (C == 0) then
		Events = "\nNone."
	end	
	return Events;
end	

function GetEventNum()
	local t = 1
	while (EVS["System"]["EventNums"][t] ~= nil) do 
		t = t + 1 
	end	
	return t; 	
end	

function SendEventMessage(msg)
	for _, v in pairs(GetPlayersInWorld()) do
		v:SendBroadcastMessage("|cffff0000[Event System]: |cffffff00"..msg)
	end
end	

RegisterServerHook(16, "EVS.EventChat")