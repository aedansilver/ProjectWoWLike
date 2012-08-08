--CREDITS TO AK47SIGH

local logon_db = "account" 						-- name of the logon DB

local online_table = "online" 					-- name of the online column


function OnLogOutUpdate(event, player)

WorldDBQuery("UPDATE "..logon_db..".accounts SET `"..online_table.."` = '0' WHERE `login` = '"..player:GetAccountName().."' LIMIT 1; ");



local plrname = player:GetName()

if (player:IsFFAPvPFlagged() == true) then

if (player:GetTeam() == 1) then -- for horde
RegisterTimedEvent("UpdateHorde", 200, 1, player)
else -- for alliance
RegisterTimedEvent("UpdateAlly", 200, 1, player)
end
end

function UpdateAlly(player)
CharDBQuery("UPDATE characters SET `positionX`='-4917.479004', `positionY`='-961.233459', `positionZ` = '501.493652', `orientation`='5.383907', `mapId`='0', `zoneId`='2037' WHERE `name`='"..plrname.."'; ");
end
function UpdateHorde(player)
CharDBQuery("UPDATE characters SET `positionX`='1596.088745', `positionY`='-4397.343750', `positionZ` = '8.043983', `orientation`='0.267035', `mapId`='1', `zoneId`='2037' WHERE `name`='"..plrname.."'; ");
end

end
RegisterServerHook(13, "OnLogOutUpdate") 