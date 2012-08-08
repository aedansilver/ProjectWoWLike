local questno = 70008

local funcname = "vipshirtquest"
local funcname2 = "2vipshirtquest"

function funcname(pPlayer, QuestId)
local race=pPlayer:GetPlayerRace()
	pPlayer:SendBroadcastMessage("|cff00FF00System is helping you.. teleporting to the quest zone.|r")
	RegisterTimedEvent("TeleportToQuest", 2000, 1, pPlayer)

function TeleportToQuest(pPlayer)
if race==1 or race==3 or race==4 or race==7 or race==11 then -- ally
pPlayer:Teleport(0, -5048.922, -780.491, 494.418)
end
if race==2 or race==5 or race==6 or race==8 or race==10 then -- horde
pPlayer:Teleport(1, 1285.789, -4410.383, 26.458)
end
	end
end

function funcname2(pPlayer, QuestId)

	pPlayer:SendBroadcastMessage("|cff00FF00System is helping you.. teleporting back to the quest giver.|r")
	RegisterTimedEvent("TeleportBackQuest", 2000, 1, pPlayer)

function TeleportBackQuest(pPlayer)
	pPlayer:Teleport(530, -262.626, 959.106, 84.378)
	end
end

RegisterQuestEvent(questno, 1, funcname)
RegisterQuestEvent(questno, 2, funcname2)