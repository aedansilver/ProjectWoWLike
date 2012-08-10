#include "ScriptPCH.h"

class levelnpc_teleporter : public CreatureScript
{
public:
	levelnpc_teleporter()
		: CreatureScript("levelnpc_teleporter")
	{
	}

	struct levelnpc_teleporterAI : public ScriptedAI
	{
		levelnpc_teleporterAI(Creature *c) : ScriptedAI(c)
		{
		}

		void Reset()
		{
			me->RestoreFaction();
		}

		void EnterEvadeMode()
        {
            me->GetMotionMaster()->Clear();
            ScriptedAI::EnterEvadeMode();
        }

				void ReceiveEmote(Player *pPlayer, uint32 uiTextEmote)
		{
			if (me->IsInEvadeMode() || me->isInCombat())
				return;
		
			switch (uiTextEmote)
			{
					break;
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
    {
		return new levelnpc_teleporterAI(pCreature);
    }

	void CreatureWhisperBasedOnBool(const char *text, Creature *pCreature, Player *pPlayer, bool value)
	{
		if (value)
			pCreature->MonsterWhisper(text, pPlayer->GetGUID());
	}

	uint32 PlayerMaxLevel() const
	{
		return sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL);
	}

	void MainMenu(Player *pPlayer, Creature *pCreature)
	{
		pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Go to the Next Chapter", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
pPlayer->SEND_GOSSIP_MENU(907, pCreature->GetGUID());
	}

	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
		MainMenu(pPlayer, pCreature);

        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
		if (pPlayer->isInCombat())
		{
			pCreature->MonsterWhisper("You are in combat, wait until your combat is gone.", pPlayer->GetGUID());
			pPlayer->CLOSE_GOSSIP_MENU();

			return true;
		}

		pPlayer->PlayerTalkClass->ClearMenus();

		switch (uiAction)
		{
			case GOSSIP_ACTION_INFO_DEF + 1:
				{
					if(pPlayer->getLevel() < 170)
						{
							pPlayer->MonsterWhisper("You must be level 170 to pass there", pPlayer->GetGUID());
						}
					else
						{
							pPlayer->TeleportTo(1, 4657.07f, -3759.53f, 944.757f, 1.3311f);
						}
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
				}
				
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
		}

        return true;
	}
};

void AddSC_levelnpc_teleporter()
{
new levelnpc_teleporter();
}