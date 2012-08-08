#include "ScriptPCH.h"
#include "Chat.h"

int accLvl(Player * player)
{
	uint32 accID = player->GetSession()->GetAccountId();
	QueryResult acc = LoginDatabase.PQuery("SELECT * FROM account_access WHERE id = '%u'", accID);
	if (!acc)
		return 0;
	Field * accInfo = acc->Fetch();

	switch(accInfo[1].GetInt32())
	{
		case 1:
			return 1;
		case 2:
			return 2;
		case 3:
			return 3;
			break;
		case 4:
			return 4;
			break;
		case 5:
			return 5;
			break;
		case 6:
			return 6;
			break;
		case 7:
			return 7;
			break;
		case 8:
			return 8;
			break;
		case 9:
			return 9;
			break;
		case 10:
			return 10;
			break;
		default:
			break;
	}

	return 0;
}

class cmd_world_chat : public CommandScript
{
	public:
		cmd_world_chat() : CommandScript("cmd_world_chat"){}

	ChatCommand * GetCommands() const
	{
		static ChatCommand WorldChatCommandTable[] = 
		{
			{"c",	0,				false,		&HandleWorldChatCommand,	"", NULL},
			{NULL,		0,				false,		NULL,						"", NULL}
		};

		return WorldChatCommandTable;
	}

	static bool HandleWorldChatCommand(ChatHandler * handler, const char * args)
	{
		std::string msg = "";
		Player * player = handler->GetSession()->GetPlayer();

		if(int(args) < 2)
			return false;

		switch(accLvl(player))
		{
			case 0: // non vip normal player account
			msg += args;
			sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<G.M>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 1: // vip account
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_VIPCHANNEL, player->HasFlag(150, 8) ? " |r<G.M>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 2: // trial gm
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Trial G.M>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 3: // standard gm
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<G.M>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 4: // supervisor
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Supervisor>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 5: // head gm
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Head G.M>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 6: // admin
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Admin>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 7: // head admin
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Head Admin>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
			case 8: // owner
			msg += args;
				sWorld->SendWorldText(LANG_WORLD_CHANNEL, player->HasFlag(150, 8) ? " |r<Owner>|r " : " ", player->GetTeam() == ALLIANCE ? "|cff00FFFF" : "|cffFF7700", player->GetName(), player->GetName(), msg.c_str());
				break;
		}
		return true;
	}
};

void AddSC_cmd_world_chat()
{
	new cmd_world_chat();
}