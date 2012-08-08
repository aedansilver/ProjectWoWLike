




local logon_db = "account" 								-- name of the logon DB
local vip_level = "member_type" 						-- name of the vip level column

local rw_pvp = "100" 									-- how much honor and arena points to give for killing bosses

local Time = {}

local show_vip_level = "off" -- type on / off to disable show vip level in string

function EnterCombatTime(event, pPlayer, pTarget) -- this is when the player enters in combat
	local str = tostring(pPlayer)..tostring(pTarget)
	if(not Time[str]) then
		Time[str] = GetGameTime()
	end
end
RegisterServerHook(9, EnterCombatTime)



function Boss_KillString(event, pPlayer, pUnit)
if pUnit:IsCreature() and pPlayer:IsCreature() then
-- SendWorldMessage("Should worldn now!", 2)
else
							if pUnit:IsPlayer() then
						-- SendWorldMessage("Should worldn now!", 2)
							else
								Rank = WorldDBQuery("SELECT `boss` FROM `creature_proto` WHERE `entry` = '"..pUnit:GetEntry().."';");
								Boss = Rank:GetColumn(0):GetLong()
							if (pPlayer:IsInGroup() == true) then
								group_players = pPlayer:GetGroupPlayers()
								for k, v in pairs(group_players) do
							group_string = "|cffEE7575with his friends |r( Total: "..k.." guys "
							end
							else
							group_string = "|cffEE7575Alone! |r("
							end
								check_vip = WorldDBQuery("SELECT `"..vip_level.."` FROM "..logon_db..".accounts WHERE `login`='"..pPlayer:GetAccountName().."';");
								vip = check_vip:GetColumn(0):GetString()
								
								if(show_vip_level == "on") then
							if (vip == "1") then
								level_string = " Vip 1 "
							elseif (vip == "2") then
								level_string = " Vip 2 "
							elseif (vip == "3") then
								level_string = " Vip 3 "
							elseif (vip == "4") then
								level_string = " Vip 4 "
							elseif (vip == "5") then
								level_string = " Vip 5 "
							elseif (vip == "6") then
								level_string = " Vip 6 "
							else
								level_string = "Player"
							end
							else
							level_string = " "
							end
							end
							
							str = tostring(pPlayer)..tostring(pUnit)
			
							if (Boss == 0) or pUnit:IsPlayer() then
							else
							if(Time[str]) then
								Time2nd = GetGameTime()-Time[str]
								SendWorldMessage("|cffFF0000[PVE]|r"..level_string.."|Hplayer:"..pPlayer:GetName().."|h["..pPlayer:GetName().."]|h |cffEE7575killed|r |cff007EE4["..pUnit:GetName().."]|r "..group_string.." Use: "..Time2nd.." seconds )|r", 2)
								Time[str] = nil
								pPlayer:GiveHonor(tonumber(rw_pvp))
								pPlayer:AddArenaPoints(tonumber(rw_pvp))
				end
		end
end
end
RegisterServerHook(28, "Boss_KillString")

function EraseVariables(event, pPlayer)
	Time[tostring(pPlayer)] = nil
end
RegisterServerHook(4, EraseVariables) -- change map