#include "ScriptPCH.h"

class Boss_Announcer : public PlayerScript
{
public:
Boss_Announcer() : PlayerScript ("Boss_Announcer") {} 

void OnCreatureKill(Player* player, Creature* boss) 
{
	if (boss->isWorldBoss())
		{
		char msg[250];

		if(player->GetGroup())
		{
		sprintf(msg,"|CFF7BBEF7[Boss Announcer]|r:|cffff0000 [%s]|r and %s group killed world boss |CFF18BE00[%s]|r.", player->GetName(),player->getGender()==GENDER_MALE?"his":"her",boss->GetName());
		}
		else
		{
		sprintf(msg,"|CFF7BBEF7[Boss Announcer]|r:|cffff0000 [%s]|r killed world boss |CFF18BE00[%s]|r alone !!", player->GetName(),boss->GetName());
		}
			sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
		}
	}
};

void AddSC_Boss_Announcer()
{
new Boss_Announcer();
}