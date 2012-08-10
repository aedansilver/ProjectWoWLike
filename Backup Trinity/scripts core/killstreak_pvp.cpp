#include "ScriptPCH.h"

bool isInArena(Player * player)
{
	//Blade's Edge Arena
	if (player->GetZoneId() == 3702)
		return true;
	//Ruins of Lordaeron
	if (player->GetZoneId() == 153)
		return true;
	//Nagrand Arena
	if (player->GetZoneId() == 3522)
		return true;

	return false;
}

int32 GetKillstreak(Player * player)
{
	QueryResult ks = CharacterDatabase.PQuery("SELECT * FROM killstreak WHERE guid = '%u'", player->GetGUID());
	if (!ks)
		return -1;
	Field * killstreak = ks->Fetch();

	return killstreak[1].GetInt32();
}

void alertServer(Player * killer, Player * victim, int32 killstreak, int code)
{
	char msg[500];

	switch(code)
	{
		case 0:
			sprintf(msg, "|cffff0000[PVP] |cffffffff%s's |cff00ffffkillstreak of %d has been ended by |cffffffff%s", victim->GetName(), killstreak, killer->GetName());
			break;
		case 1:
			sprintf(msg, "|cffff0000[PVP] |cffffffff%s|cff00ffff has a killstreak of %d", killer->GetName(), killstreak);
			break;
		case 2:
			sprintf(msg, "|cffff0000[PVP] |cffffffff%s|cff00ffff has a killstreak of %d. A bounty worth 50 arena points has been placed for their head.", killer->GetName(), killstreak);
			break;
	}

	sWorld->SendServerMessage(SERVER_MSG_STRING, msg, 0);
}

class Killstreak : public PlayerScript
{
	public:
		Killstreak() : PlayerScript("Killstreak"){}

	void OnPVPKill(Player * killer, Player * victim)
	{
		if (killer->GetGUID() == victim->GetGUID())
			return;
		if (isInArena(killer) || isInArena(victim))
			return;
		
		int32 kKillstreak = GetKillstreak(killer);
		int32 vKillstreak = GetKillstreak(victim);

		if (vKillstreak >= 25)
			killer->SetArenaPoints(killer->GetArenaPoints() + 50);

		if (kKillstreak == -1)
			CharacterDatabase.PExecute("REPLACE INTO killstreak(guid, ks) VALUES ('%u', 1)", killer->GetGUID());
		else
		{
			CharacterDatabase.PExecute("UPDATE killstreak SET ks = (ks+1) WHERE guid = '%u'", killer->GetGUID());
			QueryResult ks = CharacterDatabase.PQuery("SELECT * FROM killstreak WHERE guid = '%u'", killer->GetGUID());
			Field * high_ks = ks->Fetch();
			if (kKillstreak > high_ks[2].GetInt32())
				CharacterDatabase.PExecute("UPDATE killstreak SET high_ks = ks WHERE guid = '%u'", killer->GetGUID());

		}

		if (vKillstreak > 0)
		{
			CharacterDatabase.PExecute("UPDATE killstreak SET ks = 0 WHERE guid = '%u'", victim->GetGUID());
			// Only send a server message if their streak is 5 or more
			if (vKillstreak >= 5)
				alertServer(killer, victim, vKillstreak, 0);
		}

		switch(kKillstreak)
		{
			case 5:
				alertServer(killer, victim, kKillstreak, 1);
				killer->AddItem(6657, 5);
				break;
			case 10:
				alertServer(killer, victim, kKillstreak, 1);
				killer->AddItem(20558, 1);
				break;
			case 15:
				alertServer(killer, victim, kKillstreak, 1);
				killer->AddItem(8529, 15);
				break;
			case 20:
				alertServer(killer, victim, kKillstreak, 1);
				killer->AddItem(20558, 2);
				break;
			case 25:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 30:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 3);
				break;
			case 35:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 40:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 4);
				break;
			case 45:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 50:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 5);
				break;
			case 55:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 60:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 6);
				break;
			case 65:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 70:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 7);
				break;
			case 75:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 80:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 8);
				break;
			case 85:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 90:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 9);
				break;
			case 95:
				alertServer(killer, victim, kKillstreak, 2);
				break;
			case 100:
				alertServer(killer, victim, kKillstreak, 2);
				killer->AddItem(20558, 10);
				break;
		}
	}
};

void AddSC_Killstreak()
{
	new Killstreak();
}