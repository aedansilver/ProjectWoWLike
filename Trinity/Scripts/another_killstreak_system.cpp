//credits to Wutloly from ac-web

#include "ScriptPCH.h"
//Change the token id and Kill streak or End of Streak rewards here.
#define TokenID 47241

	enum KillRewards
	{
		Streak0 = 1
		Streak1 = 2
		Streak2 = 3
		Streak3 = 4
		Streak4 = 5
	};
	
	enum TenthKill
	{
		Ten = 2
		Twenty = 4
		Thirty = 6
		Fourty = 8
		Fifty = 10
	};
	
	enum Streak_End_Rewards
	{
		End1 = 2
		End2 = 4
		End3 = 6
		End4 = 8
		EndofEnd = 20
	};

class Killstreak_System : public PlayerScript
{
	public:
		Killstreak_System() : PlayerScript("Killstreak_System") {}

	void OnPVPKill(Player * Killer, Player * Victim)
	{
		uint64 KillerGUID = Killer->GetGUID();
		uint64 VictimGUID = Victim->GetGUID();

		struct KillStreak_Info
		{
			uint32 killstreak;
			uint64 lastkill;
		};

		static std::map<uint64, KillStreak_Info> KillStreakData;

		if( KillerGUID == VictimGUID || KillStreakData[KillerGUID].lastkill == VictimGUID )
			return;

		KillStreakData[KillerGUID].killstreak++;
		KillStreakData[KillerGUID].lastkill = VictimGUID;
		KillStreakData[VictimGUID].killstreak = 0;
		KillStreakData[VictimGUID].lastkill = 0;
	
		switch( KillStreakData[KillerGUID].killstreak )
		{
			char msg[250];
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
				Killer->Additem(TokenID, Streak0);
				break;
			
			case 10:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|CFF20C000[%u Kills]|cFFFF0303%s is on a hot streak!", KillStreakData[KillerGUID].killstreak, Killer->GetName());
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, Ten);
				break;
				
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
				Killer->Additem(TokenID, Streak1);
				break;

			case 20:
				snprintf(msg, 250, "[PvP System]:|CFF20C000[%u Kills]|cFFFF0303%s is on a RAMPAGE!!", KillStreakData[KillerGUID].killstreak, Killer->GetName());
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, Twenty);
				break;
			
			case 21:
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
				Killer->Additem(TokenID, Streak2);
				break;
			
			case 30:
				snprintf(msg, 250, "[PvP System]:|CFF20C000[%u Kills]|cFFFF0303%s is UNSTOPABLE!", KillStreakData[KillerGUID].killstreak, Killer->GetName());
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, Thirty);
				break;

			case 31:
			case 32:
			case 33:
			case 34:
			case 35:
			case 36:
			case 37:
			case 38:
			case 39:
				Killer->Additem(TokenID, Streak3);
				break;
			
			case 40:
				snprintf(msg, 250, "[PvP System]: |CFF20C000[%u Kills]|cFFFF0303%s is Dominating!", KillStreakData[KillerGUID].killstreak, Killer->GetName());
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, Fourty);
				break;

			case 41:
			case 42:
			case 43:
			case 44:
			case 45:
			case 46:
			case 47:
			case 48:
			case 49:
				Killer->Additem(TokenID, Streak4);
				break;
				
			case 50:
				snprintf(msg, 250, "[PvP System]:|CFF20C000[%u Kills]|cFFFF0303%s is GODLIKE!", KillStreakData[KillerGUID].killstreak, Killer->GetName());
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, Fifty);
				break;
				
			case 51:
				KillStreakData[KillerGUID].killstreak = 1;
				Killer->Additem(TokenID, 1);
				break;
				
		}
		
		switch( KillStreakData[VictimGUID].killstreak )
		{
			char msg[250];
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|cFFFF0303%s has ended %s's streak of %u, earning 2 extra badges!", Killer->GetName(), Victim->GetName(), KillStreakData[VictimGUID].killstreak);
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, End1);
				break;

			case 20:
			case 21:
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|cFFFF0303%s has ended %s's rampage of %u, earning 4 extra badges!", Killer->GetName(), Victim->GetName(), KillStreakData[VictimGUID].killstreak);
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, End2);
				break;
			
			case 30:
			case 31:
			case 32:
			case 33:
			case 34:
			case 35:
			case 36:
			case 37:
			case 38:
			case 39:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|cFFFF0303%s has stopped %s's unstopable....ness of %u, earning 6 extra badges!", Killer->GetName(), Victim->GetName(), KillStreakData[VictimGUID].killstreak);
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, End3);
				break;
			
			case 40:
			case 41:
			case 42:
			case 43:
			case 44:
			case 45:
			case 46:
			case 47:
			case 48:
			case 49:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|cFFFF0303%s has dominated %s's domination of %u kills, earning 8 extra badges!", Killer->GetName(), Victim->GetName(), KillStreakData[VictimGUID].killstreak);
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, End4);
				break;
				
			case 50:
				snprintf(msg, 250, "|cFF0042FF[PvP System]:|cFFFF0303%s has slaim %s and is a GOD-SLAYER, earning 20 extra badges!", Killer->GetName(), Victim->GetName(), KillStreakData[VictimGUID].killstreak);
				sWorld->SendServerMessage(SERVER_MSG_STRING, msg);
				Killer->Additem(TokenID, EndofEnd);
				break;
		}
		
	} 
};

void AddSC_Killstreak_System()
{
    new Killstreak_System;
}