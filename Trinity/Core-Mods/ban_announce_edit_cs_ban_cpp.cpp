static bool HandleBanCharacterCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

        char* nameStr = strtok((char*)args, " ");
        if (!nameStr)
            return false;

        std::string name = nameStr;

        char* durationStr = strtok(NULL, " ");
        if (!durationStr || !atoi(durationStr))
            return false;

        char* reasonStr = strtok(NULL, "");
        if (!reasonStr)
            return false;

        if (!normalizePlayerName(name))
        {
            handler->SendSysMessage(LANG_PLAYER_NOT_FOUND);
            handler->SetSentErrorMessage(true);
            return false;
        }

        switch (sWorld->BanCharacter(name, durationStr, reasonStr, handler->GetSession() ? handler->GetSession()->GetPlayerName() : ""))
        {
            case BAN_SUCCESS:
            {
                if (atoi(durationStr) > 0)
				{
                    handler->PSendSysMessage(LANG_BAN_YOUBANNED, name.c_str(), secsToTimeString(TimeStringToSecs(durationStr), true).c_str(), reasonStr);
				
					sWorld->SendWorldText(12100, name.c_str(), handler->GetSession()->GetPlayerName(), secsToTimeString(TimeStringToSecs(durationStr), true).c_str(), reasonStr);
				}
                else
				{
                    handler->PSendSysMessage(LANG_BAN_YOUPERMBANNED, name.c_str(), reasonStr);
				sWorld->SendWorldText(12101, name.c_str(), handler->GetSession()->GetPlayerName(), reasonStr);
				}
                break;
            }
            case BAN_NOTFOUND:
            {
                handler->PSendSysMessage(LANG_BAN_NOTFOUND, "character", name.c_str());
                handler->SetSentErrorMessage(true);
                return false;
            }
            default:
                break;
        }

        return true;
    }