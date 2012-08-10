#include "ScriptPCH.h"
#include "Chat.h"

class cs_killstreak : public CommandScript
{
	public:
		cs_killstreak() : CommandScript("cs_killstreak"){}

	ChatCommand * GetCommands() const
	{
		static ChatCommand KillstreakCommandTable[] = 
		{
			{"killstreak",	0,				false,		&HandleKillstreakCommand,	"", NULL},
			{NULL,			0,				false,		NULL,						"", NULL}
		};

		return KillstreakCommandTable;
	}

	static bool HandleKillstreakCommand(ChatHandler * handler, const char * /*args*/)
	{
		std::string msg = "|cff00ff00Top 5 Killstreaks\n";
		std::string names[5];
		std::string ks[5];
		Player * player = handler->GetSession()->GetPlayer();

		QueryResult result = CharacterDatabase.PQuery("SELECT * FROM killstreak WHERE high_ks > 0 ORDER BY high_ks DESC LIMIT 5");
		if (!result)
			return false;
		int i = 0;
		do
		{
			Field * top_ks = result->Fetch();
			QueryResult nameResult = CharacterDatabase.PQuery("SELECT name FROM characters WHERE guid = '%u'", top_ks[0].GetInt32());
			Field * field = nameResult->Fetch();
			names[i] = field[0].GetString();
			ks[i] = top_ks[2].GetString();
			i++;
		}
		while(result->NextRow());

		handler->PSendSysMessage(msg.c_str());

		for (i = 0; i < 5; i++)
		{
			if (names[i].empty() || ks[i].empty())
				break;
			handler->PSendSysMessage("|cFF90EE90%s: %s kills", names[i].c_str(), ks[i].c_str());
		}

		return true;
	}
};

void AddSC_cs_killstreak()
{
	new cs_killstreak();
}