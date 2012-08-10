// old outdated world chat script @ ac-web.org

#include "ScriptPCH.h"
#include "Chat.h"

class cs_world_chat : public CommandScript
{
	public:
		cs_world_chat() : CommandScript("cs_world_chat"){}

	ChatCommand * GetCommands() const
	{
		static ChatCommand WorldChatCommandTable[] = 
		{
			{"world",	SEC_PLAYER,		true,		&HandleWorldChatCommand,	"", NULL},
			{NULL,		0,				false,		NULL,						"", NULL}
		};

		return WorldChatCommandTable;
	}

	static bool HandleWorldChatCommand(ChatHandler * handler, const char * args)
	{
		if (!handler->GetSession()->GetPlayer()->CanSpeak())
			return false;
		std::string temp = args;

		if (!args || temp.find_first_not_of(' ') == std::string::npos)
			return false;

		std::string msg = "";
		Player * player = handler->GetSession()->GetPlayer();
			
		msg += args;
		/*sWorld->SendServerMessage(SERVER_MSG_STRING, msg.c_str(), 0);	*/
		sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->GetTeam() == ALLIANCE ?"|cff00FFFF":"|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
		return true;
	}
};

void AddSC_cs_world_chat()
{
	new cs_world_chat();
}