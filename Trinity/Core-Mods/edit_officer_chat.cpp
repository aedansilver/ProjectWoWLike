case CHAT_MSG_OFFICER:
        {
            /*if (GetPlayer()->GetGuildId())
            {
                if (Guild* guild = sGuildMgr->GetGuildById(GetPlayer()->GetGuildId()))
                {
                    sScriptMgr->OnPlayerChat(GetPlayer(), type, lang, msg, guild);

                    guild->BroadcastToGuild(this, true, msg, lang == LANG_ADDON ? LANG_ADDON : LANG_UNIVERSAL);
                }
            }*/
			uint32 accID = GetPlayer()->GetSession()->GetAccountId();
				QueryResult acc = LoginDatabase.PQuery("SELECT * FROM vip_access WHERE id = '%u'", accID);

				if (!acc)
				{
					sWorld->SendWorldText(12000, GetPlayer()->GetName(), GetPlayer()->GetName(), msg.c_str()); // if vip not found in table
				break;
				}

				Field * accInfo = acc->Fetch();

				switch(accInfo[1].GetInt32())
					{
					case 1:
					sWorld->SendWorldText(12001, GetPlayer()->GetName(), GetPlayer()->GetName(), msg.c_str()); // do for vip 1
					break;
					case 2:
					sWorld->SendWorldText(12002, GetPlayer()->GetName(), GetPlayer()->GetName(), msg.c_str()); // u know what's next
					break;
					case 3:
					sWorld->SendWorldText(12003, GetPlayer()->GetName(), GetPlayer()->GetName(), msg.c_str());
					break;
					default:
					sWorld->SendWorldText(12000, GetPlayer()->GetName(), GetPlayer()->GetName(), msg.c_str());
					break;
				}
        } break;