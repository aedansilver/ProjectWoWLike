#include "ScriptPCH.h"
#include "Chat.h"


uint32 auras[] = { 15366, 16609, 48162, 48074, 48170, 43223, 36880, 467, 69994, 33081, 24705, 26035, 48469 };

class buff_commandscript : public CommandScript
{
public:
    buff_commandscript() : CommandScript("buff_commandscript") { }

	ChatCommand* GetCommands() const
    {
        static ChatCommand IngameCommandTable[] =
        {
			{ "buff",            SEC_PLAYER,  false, &HandleBuffCommand,             "", NULL },
			{ "mall",            SEC_PLAYER,  false, &HandleMallCommand,             "", NULL },
			{ "heal",            SEC_PLAYER,  false, &HandleHealCommand,             "", NULL },
            { NULL,             0,                  false, NULL,                              "", NULL }
        };
		 return IngameCommandTable;
    }

	static bool HandleBuffCommand(ChatHandler * handler, const char * args)
    {
        Player * me = handler->GetSession()->GetPlayer();
	
		me->RemoveAurasByType(SPELL_AURA_MOUNTED);
		for(int i = 0; i < 11; i++)
		    me->AddAura(auras[i], me);
		handler->PSendSysMessage("You're buffed now!");
		return true;
    }
	
	static bool HandleMallCommand(ChatHandler * handler, const char * args)
    {
        Player * me = handler->GetSession()->GetPlayer();
	
		 me-> TeleportTo(530, -1850.209961f, 5435.821777f, -10.961435f, 3.403913f);
		 handler->PSendSysMessage("You Have Been Teleported!");
		return true;
    }
	
	static bool HandleHealCommand(ChatHandler * handler, const char * args)
    {
        Player * me = handler->GetSession()->GetPlayer();
	
		 me-> SetHealth(me->GetMaxHealth());
		 handler->PSendSysMessage("You Have Been Healed!");
		return true;
    }
};

void AddSC_Ingame_commandscript()
{
    new buff_commandscript();
}