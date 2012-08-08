
local questno = 70002

local funcname = "missionlvl1"
local funcname2 = "2missionlvl1"

function funcname(pPlayer, QuestId)
	pPlayer:SendBroadcastMessage("|cff00FF00System is helping you.. teleporting to the quest zone.|r")
	RegisterTimedEvent("TeleportToQuest", 2000, 1, pPlayer)

function TeleportToQuest(pPlayer)
	pPlayer:Teleport(530, -249.302, 1026.381, 54.32)
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