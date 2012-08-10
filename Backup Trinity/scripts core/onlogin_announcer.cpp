#include "ScriptPCH.h"

class OnLogin_Announcer : public PlayerScript
{
public:
OnLogin_Announcer() : PlayerScript ("OnLogin_Announcer") {} 

void OnLogin(Player * player)

	   {
		   char msg[250];
		   sprintf(msg,"|cff00FF00 WoW Like|r |cff009EFF[255]|r >> Welcome back online |Hplayer:%s|h|cff18BE00[%s]|h|r.", player->GetName(), player->GetName());
		   sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
	   }
};

void AddSC_OnLogin_Announcer()
{
new OnLogin_Announcer();
}