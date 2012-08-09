#include "ScriptMgr.h"
#include "Chat.h"

#define MSG_GM_ICON				 "|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:12:24:1:-1|t"

class cmd_go_delete : public CommandScript
{
public:
    cmd_go_delete() : CommandScript("cmd_go_delete") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand HelloWorldCommandTable[] =
        {
            { "gobdelete",    SEC_ADMINISTRATOR,         true,   &HandleGobjDeleteCustom,        "", NULL },
            { NULL,             0,                  false,  NULL,                            "", NULL }
        };
        return HelloWorldCommandTable;
    }
	
static bool HandleGobjDeleteCustom(ChatHandler* handler, char const* args)
    {

		if (!handler->GetNearbyGameObject())
        {
            handler->PSendSysMessage("[%s] Gameobject not found.", MSG_GM_ICON);
            handler->SetSentErrorMessage(true);
            return false;
        }
	 Object* obj = handler->GetNearbyGameObject(;
		handler->PSendSysMessage("[%s] Deleted Gameobject (Entry:%d, GUID:%d).", MSG_GM_ICON, obj->GetEntry(), obj->GetGUID());
		WorldDatabase.PQuery("DELETE FROM `gameobject` WHERE `guid`=%d", obj->GetGUID());
		obj->SetRespawnTime(0);
		obj->Delete();
		obj->DeleteFromDB(); // strange it still appear back ingame after restart

        return true;
    }
};
void AddSC_cmd_go_delete()
{
    new cmd_go_delete();
}