




KILL = {}

KILL.Count = 3 					-- how many times you can kill same target

KILL.killingspree = 5 		--- how many kills need to reach killing spree (minimum: 2)
KILL.rampage = 10 				--- how many kills need to reach rampage
KILL.dominating = 15 		--- how many kills need to reach dominating
KILL.unstoppable = 20 			--- how many kills need to reach unstoppable
KILL.godlike = 25 			--- how many kills need to reach godlike
KILL.legendary = 30 			--- how many kills need to reach legendary

reset_time = 300 				--- time between showing messages (in seconds)
local r_time     
 
function KILL.KillStreak_System(event, player, victim)

if(player:GetMapId() == 560) then
if not (r_time) or (os.time() >= r_time) then
			r_time = os.time();
			r_time = os.time() + reset_time
				SendWorldMessage("|cffFD2C2C [Durnholde]|r is in fighting by |cffC6ACAC["..player:GetName().."].|r", 2)
	else
				-- the next message will show after "..r_time - os.time().."|r seconds
end
end

victim_Msg = "|cff9E8888 You have been killed by [|cffC6ACAC|Hplayer:"..player:GetName().."|h"..player:GetName().."|h|cff9E8888].|r" 

		if (victim:GetName() == player:GetName()) then
						--- Don't kill yourself
						victim:SendBroadcastMessage("  ( Watch it, you hurt yourself ! )")
		else
        if (KILL[player:GetName()] == nil) then
                KILL[player:GetName()] = {}
                KILL[player:GetName()].killstreak = 1
                KILL[victim:GetName()] = {}
                KILL[victim:GetName()].killstreak = 0
				--- first kill
                victim:SendBroadcastMessage(""..victim_Msg.."")
        elseif (KILL[player:GetName()].killstreak == nil) then
                KILL[player:GetName()].killstreak = 1
                KILL[victim:GetName()] = {}
                KILL[victim:GetName()].killstreak = 0
				--- random ?
                victim:SendBroadcastMessage(""..victim_Msg.."")
				else
                if (KILL.PlayerCheck(player, victim) == true) then
                        KILL[player:GetName()].killstreak = KILL[player:GetName()].killstreak + 1
                        KILL[victim:GetName()] = {}
                        KILL[victim:GetName()].killstreak = 0
						--- second kill
                        victim:SendBroadcastMessage(""..victim_Msg.."")   
                        if (KILL[player:GetName()].killstreak == KILL.killingspree) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
										v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is on killing spree !")
                                end     
                        end              
                        if (KILL[player:GetName()].killstreak == KILL.rampage) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
                                        v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is on |cff00ff00rampage|r !")
                                end
                        end              
                        if (KILL[player:GetName()].killstreak == KILL.dominating) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
                                        v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is |cff00ff00dominating|r !")
                                end
                        end            
                        if (KILL[player:GetName()].killstreak == KILL.unstoppable) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
                                        v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is |cff4DA12Funstoppable|r !")
                                end
                        end               
                        if (KILL[player:GetName()].killstreak == KILL.godlike) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
                                        v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is |cff4DA12Fgodlike|r !")
                                end
                        end 
                        if (KILL[player:GetName()].killstreak == KILL.legendary) then
                                local plrs = GetPlayersInWorld()
                                for k, v in pairs(plrs) do
                                        v:SendBroadcastMessage("|cFFFF5A5A [PVP]:|r "..player:GetName().." is |cffFF0000LEGENDARY|r !")
                                end
                        end 
						if (KILL[player:GetName()].killstreak > KILL.legendary) then
								KILL[player:GetName()].killstreak = 1
								KILL[victim:GetName()] = {}
								KILL[victim:GetName()].killstreak = 0	
								--- reset kill streak and go again
						end
							else
                        --- cannot kill the same target
                        -- victim:SendBroadcastMessage(""..victim_Msg.."")
                end
        end
end     
 end
function KILL.PlayerCheck(player, victim)
        if (KILL[player:GetName()].target == victim:GetName()) then
                KILL[player:GetName()].killcount = KILL[player:GetName()].killcount + 1
                if (KILL[player:GetName()].killcount >= KILL.Count) then
                        return false
                else
                        return true
                end     
        else
                KILL[player:GetName()].target = victim:GetName()
                KILL[player:GetName()].killcount = 1
                return true
        end
end     
 
RegisterServerHook(2, "KILL.KillStreak_System")