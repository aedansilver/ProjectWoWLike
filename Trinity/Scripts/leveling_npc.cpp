/*
*Made by - Ghostcrawler336 From ac-web.org
*/
 

#include "ScriptPCH.h"
#define TOKEN_ID   60007   // Replace 60007 to YOUR_TOKEN_ID

 
class Level_NPC : public CreatureScript
{
public:
Level_NPC() : CreatureScript("Level_NPC") {}
bool OnGossipHello(Player* pPlayer, Creature* _creature)
{
  pPlayer->ADD_GOSSIP_ITEM(7, "Welcome to the level NPC!, GOSSIP_SENDER_MAIN, 111212);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 10", GOSSIP_SENDER_MAIN, 1);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 20(1 Token)", GOSSIP_SENDER_MAIN, 2);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 30(2 Token)", GOSSIP_SENDER_MAIN, 3);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 40(3 Token)", GOSSIP_SENDER_MAIN, 4);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 50(4 Token)", GOSSIP_SENDER_MAIN, 5);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 60(5 Token)", GOSSIP_SENDER_MAIN, 6);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 70(6 Token)", GOSSIP_SENDER_MAIN, 7);
  pPlayer->ADD_GOSSIP_ITEM(10, "Level 80(7 Token)", GOSSIP_SENDER_MAIN, 8);
 
                pPlayer->PlayerTalkClass->SendGossipMenu(907, _creature->GetGUID());
                return true;
}
bool OnGossipSelect(Player* pPlayer, Creature* _creature, uint32 uiSender, uint32 uiAction)
{
                 pPlayer->PlayerTalkClass->ClearMenus();
                       
                                switch(uiAction)
                                {      
                                                           
                         case 1: // Level 10 - required 1 token
                           if (pPlayer->HasItemCount(TOKEN_ID, 1, true))
                           {
                               pPlayer->GiveLevel(10);
                          pPlayer->DestroyItemCount(TOKEN_ID, 1, true);
                                       _creature->MonsterWhisper("Your now Level 10!", pPlayer->GetGUID());
                                        pPlayer->PlayerTalkClass->SendCloseGossip();
                                }
                                else
                                {
                                  pPlayer->PlayerTalkClass->SendCloseGossip();
                                  _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
                                      return false;
                                }
                                break;

                                                               
                                                               
                     case 2: // Level 20 - required t tokens
              if (pPlayer->HasItemCount(TOKEN_ID, 2, true))
                   {
                    pPlayer->GiveLevel(20);
             pPlayer->DestroyItemCount(TOKEN_ID, 2, true);
              _creature->MonsterWhisper("Your now Level 20!", pPlayer->GetGUID());
             pPlayer->PlayerTalkClass->SendCloseGossip();
         }
           else
              {
             pPlayer->PlayerTalkClass->SendCloseGossip();
           _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
                return false;
             }
               break;

                                 
                         case 3: // Level 30 - required  3 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 3, true))
             {
        pPlayer->GiveLevel(30);
        pPlayer->DestroyItemCount(TOKEN_ID, 3, true);
         _creature->MonsterWhisper("Your now Level 30!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
				
 
        case 4: // Level 40 - required 4 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 4, true))
        {
         pPlayer->GiveLevel(40);
         pPlayer->DestroyItemCount(TOKEN_ID, 4, true);
         _creature->MonsterWhisper("Your now Level 40!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
               
               
                   case 5: // Level 50 - required  5 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 5, true))
        {
         pPlayer->GiveLevel(50);
         pPlayer->DestroyItemCount(TOKEN_ID, 5, true);
         _creature->MonsterWhisper("Your now Level 50!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
               
              
                                   case 6: // Level 60 - required  6 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 6, true))
        {
         pPlayer->GiveLevel(60);
         pPlayer->DestroyItemCount(TOKEN_ID, 6, true);
         _creature->MonsterWhisper("Your now Level 60!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
               
               
                case 7: // Level 70 - required  7 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 7, true))
        {
         pPlayer->GiveLevel(70);
         pPlayer->DestroyItemCount(TOKEN_ID, 7, true);
         _creature->MonsterWhisper("Your now Level 70!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
              
                                case 8: // Level 80 - required  8 tokens
        if (pPlayer->HasItemCount(TOKEN_ID, 8, true))
        {
         pPlayer->GiveLevel(80);
         pPlayer->DestroyItemCount(TOKEN_ID, 8, true);
         _creature->MonsterWhisper("Your now Level 80!", pPlayer->GetGUID());
         pPlayer->PlayerTalkClass->SendCloseGossip();
        }
        else
        {
         pPlayer->PlayerTalkClass->SendCloseGossip();
         _creature->MonsterWhisper("You don't have the required token.", pPlayer->GetGUID());
         return false;
        }
        break;
}
}
};
void AddSC_Level_NPC()
{
        new Level_NPC();
}