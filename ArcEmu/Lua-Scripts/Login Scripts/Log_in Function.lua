--CREDITS TO AK47SIGH

local logon_db = "accounts" 						-- name of the logon DB

local online_table = "online" 					-- name of the online column

function OnLoginUpdate(event, player)
-- local GetMorph = CharDBQuery("SELECT morph_id FROM `character_morphs` WHERE `player_name` = '"..player:GetName().."';");
-- local MorphID = GetMorph:GetColumn(0):GetLong()

local GetMemberLvl = CharDBQuery("SELECT `member_type` FROM "..logon_db.." WHERE `login` = '"..player:GetAccountName().."';");
local Member = GetMemberLvl:GetColumn(0):GetLong()

if(Member == 0) then
vip = " "
else
vip = " [Vip "..Member.."] "
end

CharDBQuery("UPDATE "..logon_db.." SET `"..online_table.."` = '1' WHERE `login` = '"..player:GetAccountName().."' LIMIT 1; ");

RegisterTimedEvent("GetFullHP", 1000, 1, player)

player:SendBroadcastMessage("Welcome back,"..vip..""..player:GetName()..".")

function GetFullHP(player)
			player:ResurrectPlayer()
				player:RepairAllPlayerItems()
				
		-- if(GetMorph == nil) then
			-- no morph for null idiots
			-- player:SendBroadcastMessage("loading your shits - no morph found to your shit")
		-- else
				-- player:SetModel(MorphID)
			 -- player:SendBroadcastMessage("loading your shits")
		-- end
	end
end

RegisterServerHook(19, "OnLoginUpdate") 