--CREDITS AK47SIGH (aka AlexeWarr)

local itemid = 6948 -- your item ID

-- set up a name for stone
local nameStone = "[|cffFF0000Ak|cff00ff00Mi|r |cffFFFFFFStone|r]" -- you can change it to what ever you want: default akami stone

function akmi_stone_onHello(item, event, player)
--switch case protection status
if player:HasAura(40733) then
protstatus = "|cff0080FFEnabled|r"
protCode = 1
else
protstatus = "|cffFF0000Disabled|r"
protCode = 2
end

item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(7, "Toggle, I\'m Protection (|cff00ff00Status:|r "..protstatus.."|cff00ff00)|r", protCode, 0, "Toggle Protection Status\n Status: "..protstatus.."") -- add spell when enable: 59084, 55912
item:GossipMenuAddItem(7, "Global Message String", 3, 0)
item:GossipMenuAddItem(7, "Appear to player's Leader", 6, 0)
item:GossipMenuAddItem(7, "Appear to player", 8, 0)
item:GossipMenuAddItem(7, "Summon Player\'s Group", 10, 0)
item:GossipMenuAddItem(7, "Kick Player\'s Group", 12, 0)
item:GossipMenuAddItem(7, "Kick Player", 14, 0)
item:GossipMenuAddItem(7, "Mass Summon", 16, 0)
item:GossipSendMenu(player)
end

function akmi_stone_onSelect(item, event, player, id, intid, code)

if(intid == 1) then
player:RemoveAura(40733)
player:RemoveAura(55912) -- remove visual effect, if aura exists (otherwise will remove unexisting aura)
player:GossipComplete()
returnMSG = "Setting protection to |cffFF0000no|r.. done"
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 2) then
player:CastSpell(40733)
player:CastSpell(55912) -- cast visual effect
player:GossipComplete()
returnMSG = "Setting protection to |cff00ff00yes|r.. done"
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 3) then
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Send Global, show name", 4, 1)
item:GossipMenuAddItem(7, " Send Global, hide name", 5, 1)
item:GossipSendMenu(player)
end
if(intid == 4) then 
player:GossipComplete()
SendWorldMessage("[Global Message by |cff00FFFF"..player:GetName().."|r]: "..code.."", 2)
returnMSG = "Sent global message"
player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 5) then 
player:GossipComplete()
SendWorldMessage("[Global Message]: "..code.."", 2)
returnMSG = "Sent global message"
player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 6) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Teleport to player\'s leader name\n -- |cffFF0000CaSe SeNsItIvE|r", 7, 1)
item:GossipSendMenu(player)
end
if(intid == 7) then 
	if(GetPlayer(code) == false) then
		player:SendAreaTriggerMessage("This person does not exist or is either offline.")
		else
		plrGot = GetPlayer(code)
		if(plrGot:IsInGroup()) then
				grpleader = plrGot:GetGroupLeader()
				LeadM = grpleader:GetMapId()
				LeadX = grpleader:GetX()
				LeadY = grpleader:GetY()
				LeadZ = grpleader:GetZ()
				LeadO = grpleader:GetO()
			returnMSG = "Teleported to ["..plrGot:GetName().."]\'s group leader: ["..grpleader:GetName().."]"
		player:Teleport(LeadM, LeadX, LeadY, LeadZ, LeadO)
		print (player:GetName().." teleported to "..plrGot:GetName().."\'s team leader: "..grpleader:GetName().."!")
		else
		player:SendBroadcastMessage("Target player ["..plrGot:GetName().."] is not in party.")
		end -- end of if is not in group
		end
	player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 8) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Teleport to player name\n -- |cffFF0000CaSe SeNsItIvE|r", 9, 1)
item:GossipSendMenu(player)
end
if(intid == 9) then 
	if(GetPlayer(code) == false) then
		player:SendAreaTriggerMessage("This person does not exist or is either offline.")
		else
		plrGot = GetPlayer(code)
			plrM = plrGot:GetMapId()
			plrX = plrGot:GetX()
			plrY = plrGot:GetY()
			plrZ = plrGot:GetZ()
			plrO = plrGot:GetO()
			returnMSG = "Teleported to ["..plrGot:GetName().."]"
		player:Teleport(plrM, plrX, plrY, plrZ, plrO)
	print (player:GetName().." teleported to "..plrGot:GetName().."!")	
	end
	player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 10) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Summon player's group\n -- |cffFF0000CaSe SeNsItIvE|r", 11, 1)
item:GossipSendMenu(player)
end
if(intid == 11) then 
	if(GetPlayer(code) == false) then
		player:SendAreaTriggerMessage("This person does not exist or is either offline.")
		else
		plrGot = GetPlayer(code)
		if(plrGot:IsInGroup() == false) then
		player:SendAreaTriggerMessage("This person is not in group.")
		else
		grpPlayers = plrGot:GetGroupPlayers()
			targetM = player:GetMapId()
			targetX = player:GetX()
			targetY = player:GetY()
			targetZ = player:GetZ()
			targetO = player:GetO()
			player:SendBroadcastMessage(""..nameStone..": Summoning ["..plrGot:GetName().."]\'s group members.")
		for k, v in pairs(plrGot:GetGroupPlayers()) do
		 grp_nom = ""..k..""
		 returnMSG = "You are being summoned by "..player:GetName()..""
		 v:SendBroadcastMessage(""..nameStone..": "..returnMSG..".") -- show string to player
		v:Teleport(targetM, targetX, targetY, targetZ, targetO)
	end
	returnMSG = ""..grp_nom.." players summoned"
	print (player:GetName().." summoned "..plrGot:GetName().."\'s group members!")	
	end
	end
	player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 12) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Write player's name\n -- |cffFF0000CaSe SeNsItIvE|r", 13, 1)
item:GossipSendMenu(player)
end
if(intid == 13) then 
	if(GetPlayer(code) == false) then
		player:SendAreaTriggerMessage("This person does not exist or is either offline.")
		else
		plrGot = GetPlayer(code)
		if(plrGot:IsInGroup() == false) then
		player:SendAreaTriggerMessage("This person is not in group.")
		else
		grpPlayers = plrGot:GetGroupPlayers()
		for k, v in pairs(plrGot:GetGroupPlayers()) do
		SendWorldMessage(""..nameStone..": |cffFF0000"..v:GetName().." has been kicked from the world by "..player:GetName()..".", 2)
		v:SoftDisconnect()
		returnMSG = ""..k.." members kicked."
		end -- end for k,v
	print (player:GetName().." summoned "..plrGot:GetName().."\'s group members!")	
	end
	end
	player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
if(intid == 14) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Write player's name\n -- |cffFF0000CaSe SeNsItIvE|r", 15, 1)
item:GossipSendMenu(player)
end
if(intid == 15) then 
	if(GetPlayer(code) == false) then
		player:SendAreaTriggerMessage("This person does not exist or is either offline.")
		else
		plrGot = GetPlayer(code)
			plrM = plrGot:GetMapId()
			plrX = plrGot:GetX()
			plrY = plrGot:GetY()
			plrZ = plrGot:GetZ()
			plrO = plrGot:GetO()
			returnMSG = "Kicked ["..plrGot:GetName().."]"
			SendWorldMessage(""..nameStone..": |cffFF0000["..plrGot:GetName().."] has been kicked by ["..player:GetName().."].", 2)
		plrGot:SoftDisconnect()
	print (player:GetName().." kicked "..plrGot:GetName().."!")	
	end
	player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end
function DelayedReturn(player)
RemoveTimedEventsWithName("DelayedReturn") -- remove the currently timed event
player:SendBroadcastMessage(""..nameStone..": "..returnMSG..".") -- show string to player
return akmi_stone_onHello(item, event, player) -- return to main menu
end
if(intid == 16) then 
item:GossipCreateMenu(5695, player, 0)
item:GossipMenuAddItem(0, "[Return]", 0, 0)
item:GossipMenuAddItem(7, " Summon all online Players", 17, 0, "Sure you want to do this action?")
item:GossipSendMenu(player)
end
if(intid == 17) then 
	targetM = player:GetMapId()
	targetX = player:GetX()
	targetY = player:GetY()
	targetZ = player:GetZ()
	targetO = player:GetO()
	for k, v in pairs(GetPlayersInWorld()) do
	v:SendBroadcastMessage(""..nameStone..": ["..player:GetName().."] initiated a mass summon. You have been summoned.")
	v:Teleport(targetM, targetX, targetY, targetZ, targetO)
end
returnMSG = "Summoned all online players"
player:GossipComplete()
RegisterTimedEvent("DelayedReturn", 500, 1, player)
end

if(intid == 0) then 
return akmi_stone_onHello(item, event, player) -- return to main menu
end

end

RegisterItemGossipEvent(itemid, 1, "akmi_stone_onHello")
RegisterItemGossipEvent(itemid, 2, "akmi_stone_onSelect") 