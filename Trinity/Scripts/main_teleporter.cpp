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

#define GOSSIP_INT_AUCTION	 "Int'l Auction Function"
#define GOSSIP_INT_EXPLORE	 "Int'l Explore All Maps"
#define GOSSIP_INT_FORTUNE	 "|cffAE1EBEDarkness Aura of Fortune|r"
#define GOSSIP_INT_MAXSKILL	 "|cffC93325Add Your Skill to Max|r"

#define GOSSIP_ITEM_RETURN   "|cff565656Return|r"
#define GOSSIP_ITEM_MAINMENU "|cff565656[Main Menu]|r"
#define GOSSIP_ITEM_GLOBAL   "Global GPS Teleport"

#define GOSSIP_WORLD_CITY    "|cff288C00 [World Main City]|r"
#define GOSSIP_WORLD_BIRTH   " [World Birthplace]"

class gossip_teleporter : public CreatureScript
{
    public:

        gossip_teleporter()
            : CreatureScript("gossip_teleporter")
        {
        }

        bool OnGossipHello(Player* player, Creature* creature)
        {
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, GOSSIP_ITEM_GLOBAL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
			switch (player->getClass())
			{
				case CLASS_WARRIOR:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Warrior Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_ROGUE:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Rogue Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_PALADIN:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Paladin Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_MAGE:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Mage Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_WARLOCK:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Warlock Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_SHAMAN:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Shaman Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_HUNTER:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Hunter Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_DRUID:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Druid Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_PRIEST:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Priest Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
				case CLASS_DEATH_KNIGHT:
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "|cff832E21Death Knight Train Skill", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7000);
					break;
			}
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_INT_AUCTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7001);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_INT_EXPLORE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7002);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_INT_FORTUNE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7003);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_INT_MAXSKILL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7004);
            player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());

            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
        {
          uint64 guid = creature->GetGUID();

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

					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());

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
					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());
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
					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());
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
			case GOSSIP_ACTION_INFO_DEF + 7000: // Int'l Trainer Function
				{
					player->GetSession()->SendTrainerList(guid);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 7001: // Int'l Auction Function
				{
					player->GetSession()->SendAuctionHello(guid, creature);
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 7002: // Reveal All Maps
				{
					player->MonsterWhisper("|cff951BA3All maps are now OPEN.|r", player->GetGUID());
					for (uint8 i = 0; i < PLAYER_EXPLORED_ZONES_SIZE; ++i)
						player->SetFlag(PLAYER_EXPLORED_ZONES_1+i, 0xFFFFFFFF); // use player->SetFlag(PLAYER_EXPLORED_ZONES_1+i, 0); if unreveal
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "All Maps Open!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());
					break;
				}
			case GOSSIP_ACTION_INFO_DEF + 7003: // Fortune Buffs
				{
					creature->CastSpell(player, 23736, true); // target, spellid, triggered-e
						creature->CastSpell(player, 23767, true);
							creature->CastSpell(player, 23768, true);
								creature->CastSpell(player, 23766, true);
									creature->CastSpell(player, 23769, true);
								creature->CastSpell(player, 23738, true);
							creature->CastSpell(player, 23737, true);
						creature->CastSpell(player, 23735, true);
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Dark Fortune Aura Bless!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());
					break;
				}
				case GOSSIP_ACTION_INFO_DEF + 7004: // All skills to max
				{
					if(player->HasSkill(43))
					{
					player->SetSkill(43, player->GetSkillStep(43), player->GetMaxSkillValue(43), player->GetMaxSkillValue(43));
					}
					if(player->HasSkill(44))
					{
					player->SetSkill(44, player->GetSkillStep(44), player->GetMaxSkillValue(44), player->GetMaxSkillValue(44));
					}
					if(player->HasSkill(45))
					{
					player->SetSkill(45, player->GetSkillStep(45), player->GetMaxSkillValue(45), player->GetMaxSkillValue(45));
					}
					if(player->HasSkill(46))
					{
					player->SetSkill(46, player->GetSkillStep(46), player->GetMaxSkillValue(46), player->GetMaxSkillValue(46));
					}
					if(player->HasSkill(54))
					{
					player->SetSkill(54, player->GetSkillStep(54), player->GetMaxSkillValue(54), player->GetMaxSkillValue(54));
					}
					if(player->HasSkill(55))
					{
					player->SetSkill(55, player->GetSkillStep(55), player->GetMaxSkillValue(55), player->GetMaxSkillValue(55));
					}
					if(player->HasSkill(95))
					{
					player->SetSkill(95, player->GetSkillStep(95), player->GetMaxSkillValue(95), player->GetMaxSkillValue(95));
					}
					if(player->HasSkill(136))
					{
					player->SetSkill(136, player->GetSkillStep(136), player->GetMaxSkillValue(136), player->GetMaxSkillValue(136));
					}
					if(player->HasSkill(160))
					{
					player->SetSkill(160, player->GetSkillStep(160), player->GetMaxSkillValue(160), player->GetMaxSkillValue(160));
					}
					if(player->HasSkill(162))
					{
					player->SetSkill(162, player->GetSkillStep(162), player->GetMaxSkillValue(162), player->GetMaxSkillValue(162));
					}
					if(player->HasSkill(173))
					{
					player->SetSkill(173, player->GetSkillStep(173), player->GetMaxSkillValue(173), player->GetMaxSkillValue(173));
					}
					if(player->HasSkill(176))
					{
					player->SetSkill(176, player->GetSkillStep(176), player->GetMaxSkillValue(176), player->GetMaxSkillValue(176));
					}
					if(player->HasSkill(172))
					{
					player->SetSkill(172, player->GetSkillStep(43), player->GetMaxSkillValue(172), player->GetMaxSkillValue(172));
					}
					if(player->HasSkill(226))
					{
					player->SetSkill(226, player->GetSkillStep(226), player->GetMaxSkillValue(226), player->GetMaxSkillValue(226));
					}
					if(player->HasSkill(229))
					{
					player->SetSkill(229, player->GetSkillStep(229), player->GetMaxSkillValue(229), player->GetMaxSkillValue(229));
					}
					player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "All Skill Max!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
					player->PlayerTalkClass->SendGossipMenu(5695, creature->GetGUID());
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