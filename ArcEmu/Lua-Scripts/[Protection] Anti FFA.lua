function CheckFFAZone(event, player, ZoneId, OldZoneId)

if (player:GetMapId() == 560) then
-- true already set in dbc
else
player:FlagFFA(false)
end
end

RegisterServerHook(4, "CheckFFAZone")