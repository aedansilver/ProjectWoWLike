Informations about how to install update to the new core.

1)Open player.cpp Code Line: 22041

else
{
 // "At Gold Limit"
 newAmount = MAX_MONEY_AMOUNT;
 if (d)
    SendEquipError(EQUIP_ERR_TOO_MUCH_GOLD, NULL, NULL);
}



else
{
 // "At Gold Limit"
newAmount = uint32(d);
 if(d)
	m_session->SendNotification(m_session->GetTrinityString(LANG_GOLD_MAXIMATINS));
	m_session->GetPlayer()->AddItem(100013, 4);  // item ID x4 (200k gold)
}


2)Open Language.h Code Line: 1102
Add Line:


LANG_GOLD_MAXIMATINS                = 15000,

