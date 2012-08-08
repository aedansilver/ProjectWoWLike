#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include <cstring>

enum eEnums
{
    SPELL_POLYMORPH         = 12826,
    SPELL_MARK_OF_THE_WILD  = 26990,

    SAY_NOT_INTERESTED      = -1999922,
    SAY_WRONG               = -1999923,
    SAY_CORRECT             = -1999924
};

#define MSG_ON_TELEPORT		 "|cff288C00Changing location.. please wait|r"

#define GOSSIP_ITEM_RETURN   "|cff565656Return|r"
#define GOSSIP_ITEM_MAINMENU "|cff565656[Main Menu]|r"
#define GOSSIP_ITEM_1        "[Global GPS Teleport]"
#define GOSSIP_WORLD_CITY    "|cff288C00 [World Main City]|r"
#define GOSSIP_WORLD_BIRTH   " [World Birthplace]"
#define GOSSIP_ITEM_4        "Exit"
#define GOSSIP_ITEM_5        "Exit"
#define GOSSIP_ITEM_6        "Exit"

class gossip_teleporter : public CreatureScript
{
    public:

        gossip_teleporter()
            : CreatureScript("gossip_teleporter")
        {
        }

        bool OnGossipHello(Player* player, Creature* creature)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, GOSSIP_ITEM_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);

            player->PlayerTalkClass->SendGossipMenu(907, creature->GetGUID());

            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
        {
           /* player->PlayerTalkClass->ClearMenus();
            if (action == GOSSIP_ACTION_INFO_DEF+2)
            {
                DoScriptText(SAY_NOT_INTERESTED, creature);
                player->CLOSE_GOSSIP_MENU();
            }*/


		if (player->isInCombat())
		{
			player->MonsterWhisper("|cffFF0000You are in combat sucker, dickpalm!|r", player->GetGUID());
			player->CLOSE_GOSSIP_MENU();

			return true;
		}

		player->PlayerTalkClass->ClearMenus();
		switch (action)
		{
			case GOSSIP_ACTION_INFO_DEF + 1:
				OnGossipHello(player, creature);
				break;

			case GOSSIP_ACTION_INFO_DEF + 2:
				{
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, GOSSIP_ITEM_MAINMENU, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1); // return main list

					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, GOSSIP_WORLD_CITY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, GOSSIP_WORLD_BIRTH, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+20);

					player->PlayerTalkClass->SendGossipMenu(907, creature->GetGUID());

					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 3:
				{
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, GOSSIP_ITEM_RETURN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2); //return global gps
					switch (player->GetTeam())
				{
				case HORDE:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cffFF0000 [Horde] Orgrimmar (Orc & Troll-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cffFF0000 [Horde] Silvermoon (Blood Elven-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cffFF0000 [Horde] Thunder Bluff (Tauren-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cffFF0000 [Horde] Undercity (Undead-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7);
					break;
				case ALLIANCE:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff0084FF [Alliance] Ironforge (Gnome & Dwarf-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff0084FF [Alliance] Stormwind (Human-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff0084FF [Alliance] Darnassus (Night Elven-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff0084FF [Alliance] Exodar (Draenei-City)|r", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
					break;
				}
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Neutral] Ratchet", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+12);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Neutral] Booty Bay", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+13);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [PK Area] Gadgetzan", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+14);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [PK Area] Shattrath City", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+15);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [The Dark Portal] The Stair of Destiny", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+16);
					player->PlayerTalkClass->SendGossipMenu(907, creature->GetGUID());
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 20:
				{
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, GOSSIP_ITEM_RETURN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2); //return global gps

					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Human Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+21);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Draenei Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+22);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Night Elf Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+23);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Dwarf&Gnome Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+24);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Bloodelf Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+25);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Undead Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+26);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Tauren Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+27);
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "|cff000000 [Troll&Orc Birthplace]", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+28);
					player->PlayerTalkClass->SendGossipMenu(907, creature->GetGUID());
					break;
				}

			case GOSSIP_ACTION_INFO_DEF + 4: // Orgrimmar
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, 1572.68f, -4415.24f, 7.08f, 4.027483f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 5: // Silvermoon
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, 9465.65f, -7278.30f, 14.20f, 0.011187f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 6: // Thunder Bluff
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, -1282.86f, 135.35f, 131.04f, 5.195252f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 7: // Undercity
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, 1584.50f, 240.36f, -52.15f, 0.014304f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 8: // Ironforge
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, -4937.92f, -935.16f, 503.10f, 5.380276f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 9: // Stormwind
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, -8931.11f, 540.14f, 94.33f, 0.647518f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 10: // Darnassus
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, 9951.99f, 2280.28f, 1341.39f, 1.614402f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 11: // Exodar
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, -3963.90f, -11672.10f, -137.39f, 3.247616f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 12: // Ratchet
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, -951.85f, -3676.24f, 8.55f, 4.625182f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 13: // Booty Bay
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, -14293.09f, 521.60f, 12.99f, 2.300023f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 14: // Gadgetzan
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, -7167.73f, -3767.03f, 8.36f, 5.638986f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 15: // Shattrath City
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, -1863.46f, 5430.22f, -7.73f, 0.007021f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 16: // The Dark Portal Stairs of Destiny
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, -248.71f, 949.37f, 84.37f, 4.729525f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 21: // Human Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, -8949.95f, -132.49f, 83.53f, 0.00000f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 22: // Draenei Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, -3961.63f, -13931.20f, 100.61f, 2.083640f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 23: // Night Elf Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, 10311.29f, 832.46f, 1326.40f, 5.696320f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 24: // Dwarf&Gnome Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, -6236.38f, 337.69f, 383.10f, 5.901485f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 25: // Blood Elf Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(530, 10349.59f, -6357.29f, 33.40f, 5.403541f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 26: // Undeadf Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(0, 1676.70f, 1678.31f, 121.66f, 3.126234f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 27: // Tauren Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, -2917.58f, -257.98f, 52.99f, 0.00000f);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 28: // Troll&Orc Birthplace
				{
						player->MonsterWhisper(MSG_ON_TELEPORT, player->GetGUID());
					player->TeleportTo(1, -618.51f, -4251.66f, 38.71f, 0.00000f);
					break;
				}
				player->CLOSE_GOSSIP_MENU();
				break;
		}
		return true;
		}
};

void AddSC_gossip_teleporter()
{
    new gossip_teleporter();
}