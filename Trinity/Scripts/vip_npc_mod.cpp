#include "ScriptPCH.h"

#define TOKEN 123123 // token entry here

class CUSTOMIZE_NPC : public CreatureScript
{
public:
    CUSTOMIZE_NPC() : CreatureScript("CUSTOMIZE_NPC") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->ADD_GOSSIP_ITEM( GOSSIP_ICON_CHAT, "Rename 1500 tokens", GOSSIP_SENDER_MAIN, RENAME );
        player->ADD_GOSSIP_ITEM( GOSSIP_ICON_CHAT, "Change appearance 1500 tokens", GOSSIP_SENDER_MAIN, APPEARANCE );
        player->ADD_GOSSIP_ITEM( GOSSIP_ICON_CHAT, "Change race 1000 tokens", GOSSIP_SENDER_MAIN, RACE );
        player->ADD_GOSSIP_ITEM( GOSSIP_ICON_CHAT, "Change faction 1000 tokens", GOSSIP_SENDER_MAIN, FACTION );
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if(sender == GOSSIP_SENDER_MAIN)
        {
            switch(action)
            {
            case RACE:
                if(!player->HasItemCount(TOKEN, 1500))
                    player->GetSession()->SendNotification("Not enough tokens");
                else
                {
                    player->DestroyItemCount(TOKEN, 1500, true);
                    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_ADD_AT_LOGIN_FLAG);
                    stmt->setUInt16(0, uint16(AT_LOGIN_CHANGE_RACE));
                    player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
                    stmt->setUInt32(1, player->GetGUIDLow());
                    CharacterDatabase.Execute(stmt);
                    player->GetSession()->SendAreaTriggerMessage("Relog to change race");
                    ChatHandler(player).PSendSysMessage("Relog to change race");
                }
                break;
            case FACTION:
                if(!player->HasItemCount(TOKEN, 1500))
                    player->GetSession()->SendNotification("Not enough tokens");
                else
                {
                    player->DestroyItemCount(TOKEN, 1500, true);
                    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_ADD_AT_LOGIN_FLAG);
                    stmt->setUInt16(0, uint16(AT_LOGIN_CHANGE_FACTION));
                    player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
                    stmt->setUInt32(1, player->GetGUIDLow());
                    CharacterDatabase.Execute(stmt);
                    player->GetSession()->SendAreaTriggerMessage("Relog to change faction");
                    ChatHandler(player).PSendSysMessage("Relog to change faction");
                }
                break;
            case APPEARANCE:
                if(!player->HasItemCount(TOKEN, 1000))
                    player->GetSession()->SendNotification("Not enough tokens");
                else
                {
                    player->DestroyItemCount(TOKEN, 1000, true);
                    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_ADD_AT_LOGIN_FLAG);
                    stmt->setUInt16(0, uint16(AT_LOGIN_CUSTOMIZE));
                    player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
                    stmt->setUInt32(1, player->GetGUIDLow());
                    CharacterDatabase.Execute(stmt);
                    player->GetSession()->SendAreaTriggerMessage("Relog to change appearance");
                    ChatHandler(player).PSendSysMessage("Relog to change appearance");
                }
                break;
            case RENAME:
                if(!player->HasItemCount(TOKEN, 1000))
                    player->GetSession()->SendNotification("Not enough tokens");
                else
                {
                    player->DestroyItemCount(TOKEN, 1000, true);
                    player->SetAtLoginFlag(AT_LOGIN_RENAME);
                    player->GetSession()->SendAreaTriggerMessage("Relog to change name");
                    ChatHandler(player).PSendSysMessage("Relog to change name");
                }
                break;
            }
        }
        OnGossipHello(player, creature);
        return true;
    }

private:

    enum actions
    {
        RENAME,
        APPEARANCE,
        RACE,
        FACTION,
    };
};

void AddSC_CUSTOMIZE_NPC()
{
    new CUSTOMIZE_NPC();
}