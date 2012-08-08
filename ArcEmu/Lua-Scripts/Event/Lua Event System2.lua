
local EventAddBox1 = "#event add1"
local EventAddBox2 = "#event add2"
local EventAddBox3 = "#event add3"

local boxId1 = 97081
local boxId2 = 97082
local boxId3 = 97083

local event_cd_table = "gm_event_cds"

local addCD = 360 -- in minutes

function EventAddCommands(event, player, message)
if (player:CanUseCommand("g") == true) then

if (message == EventAddBox1) then
GetCD = CharDBQuery("SELECT cd_event FROM "..event_cd_table.." WHERE acc_name='"..player:GetAccountName().."';")
if(GetCD == nil) then
CharDBQuery("INSERT INTO `gm_event_cds` (`acc_name`, `gm_name`, `gm_rank`, `cd_event`) VALUES ('"..tostring(player:GetAccountName()).."', '"..tostring(player:GetName()).."', '"..tostring(player:GetGmRank()).."', '"..addCD.."');")
CD = 0
else
CD = GetCD:GetColumn(0):GetLong()
end

target = player:GetSelection()
	if(CD == 0) then
		if(target:IsPlayer()) then
			player:SendBroadcastMessage("|cff00ccff[Event System]|r Added |Hitem:"..tonumber(boxId1).."|h|cffFF8000[Event Box [1]]|h|r to player ["..target:GetName().."] as reward.|h")
				target:AddItem(tonumber(boxId1), 1)
				CharDBQuery("UPDATE "..event_cd_table.." SET `cd_event`='"..addCD.."' WHERE `acc_name`='"..player:GetAccountName().."';");
				else
			player:SendBroadcastMessage(" need target or target is invalid")
		end
	else
		player:SendBroadcastMessage("|cffFF0000[Event]|r |cff00FF00command requires a cooldown of "..(math.ceil(addCD/60)).."h. Cooldown status: "..(math.ceil(CD/60)).."h left.")
	end
return false;
end


if (message == EventAddBox2) then
GetCD = CharDBQuery("SELECT cd_event FROM "..event_cd_table.." WHERE acc_name='"..player:GetAccountName().."';")
if(GetCD == nil) then
CharDBQuery("INSERT INTO `gm_event_cds` (`acc_name`, `gm_name`, `gm_rank`, `cd_event`) VALUES ('"..tostring(player:GetAccountName()).."', '"..tostring(player:GetName()).."', '"..tostring(player:GetGmRank()).."', '"..addCD.."');")
CD = 0
else
CD = GetCD:GetColumn(0):GetLong()
end

target = player:GetSelection()
	if(CD == 0) then
		if(target:IsPlayer()) then
			player:SendBroadcastMessage("|cff00ccff[Event System]|r Added |Hitem:"..tonumber(boxId2).."|h|cffFF8000[Event Box [1]]|h|r to player ["..target:GetName().."] as reward.|h")
				target:AddItem(tonumber(boxId2), 1)
				CharDBQuery("UPDATE "..event_cd_table.." SET `cd_event`='"..addCD.."' WHERE `acc_name`='"..player:GetAccountName().."';");
				else
			player:SendBroadcastMessage(" need target or target is invalid")
		end
	else
		player:SendBroadcastMessage("|cffFF0000[Event]|r |cff00FF00command requires a cooldown of "..(math.ceil(addCD/60)).."h. Cooldown status: "..(math.ceil(CD/60)).."h left.")
	end
return false;
end

if (message == EventAddBox3) then
GetCD = CharDBQuery("SELECT cd_event FROM "..event_cd_table.." WHERE acc_name='"..player:GetAccountName().."';")
if(GetCD == nil) then
CharDBQuery("INSERT INTO `gm_event_cds` (`acc_name`, `gm_name`, `gm_rank`, `cd_event`) VALUES ('"..tostring(player:GetAccountName()).."', '"..tostring(player:GetName()).."', '"..tostring(player:GetGmRank()).."', '"..addCD.."');")
CD = 0
else
CD = GetCD:GetColumn(0):GetLong()
end

target = player:GetSelection()
	if(CD == 0) then
		if(target:IsPlayer()) then
			player:SendBroadcastMessage("|cff00ccff[Event System]|r Added |Hitem:"..tonumber(boxId3).."|h|cffFF8000[Event Box [1]]|h|r to player ["..target:GetName().."] as reward.|h")
				target:AddItem(tonumber(boxId3), 1)
				CharDBQuery("UPDATE "..event_cd_table.." SET `cd_event`='"..addCD.."' WHERE `acc_name`='"..player:GetAccountName().."';");
				else
			player:SendBroadcastMessage(" need target or target is invalid")
		end
	else
		player:SendBroadcastMessage("|cffFF0000[Event]|r |cff00FF00command requires a cooldown of "..(math.ceil(addCD/60)).."h. Cooldown status: "..(math.ceil(CD/60)).."h left.")
	end
return false;
end


end
end

RegisterServerHook(16, "EventAddCommands")