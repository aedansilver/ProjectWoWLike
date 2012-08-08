#include "ScriptMgr.h"
#include "Chat.h"

#define MSG_GM_ICON				 "|Tinterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:12:24:1:-1|t"

class cmd_raid_warning : public CommandScript
{
public:
    cmd_raid_warning() : CommandScript("cmd_raid_warning") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand HelloWorldCommandTable[] =
        {
            { "wannounce",    SEC_MODERATOR,         true,   &HandleRaidWarningCommand,        "", NULL },
            { NULL,             0,                  false,  NULL,                            "", NULL }
        };
        return HelloWorldCommandTable;
    }

    static bool HandleRaidWarningCommand(ChatHandler* handler, const char* args)
    {
        // check args
        if (!*args)
            return false;

        const char* text = "[|cffFFA200Server Notice|r] %s [|cff00ff00%s|r]: %s"; // First %s is the player name and second %s is the message. Feel free to edit
		/*handler->PSendSysMessage("test");*/
        // insert the player name and the message to the text
        char msg[256];	
		sprintf(msg, text, MSG_GM_ICON, handler->GetSession()->GetPlayerName(), args); // third option here

        // Get string length for packet
        uint32 textLen = (uint32)strlen(msg) + 1;

        // Create the packet that SendWorldRaidWarning would have created (this is almost a direct copy paste of your original SendWorldRaidWarning function
        WorldPacket data(textLen + 40);

        data.Initialize(SMSG_MESSAGECHAT);
        data << uint8(CHAT_MSG_RAID_WARNING);
        data << uint32(LANG_UNIVERSAL);

        data << (uint64)0;
        data << (uint32)0;
        data << (uint64)0;

        data << textLen;
        data << msg;
        data << uint8(0);

        sWorld->SendGlobalMessage(&data); // send the packet
        return true;
    }
};

void AddSC_cmd_raid_warning()
{
    new cmd_raid_warning();
}