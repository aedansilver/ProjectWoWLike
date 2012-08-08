




local db_acc = "account" 					-- name of the account database table
local mg_table = "magic_gold" 				-- name of the magic gold column (check DB)
local vip_table = "member_type" 			-- name of the vip level column (used in DB)


local  MG_plry = "1" 						-- Bonus Magic Gold for player
local  MG_vip1 = "2" 						-- Bonus Magic Gold for vip level 1
local  MG_vip2 = "3" 						-- Bonus Magic Gold for vip level 2
local  MG_vip3 = "4" 						-- Bonus Magic Gold for vip level 3
local  MG_vip4 = "5" 						-- Bonus Magic Gold for vip level 4
local  MG_vip5 = "6" 						-- Bonus Magic Gold for vip level 5
local  MG_vip6 = "7" 						-- Bonus Magic Gold for vip level 6


local  arena_plry = "10" 					-- Bonus Arena Points for player
local  arena_vip1 = "20" 					-- Bonus Arena Points for vip level 1
local  arena_vip2 = "30" 					-- Bonus Arena Points for vip level 2
local  arena_vip3 = "40" 					-- Bonus Arena Points for vip level 3
local  arena_vip4 = "50" 					-- Bonus Arena Points for vip level 4
local  arena_vip5 = "60" 					-- Bonus Arena Points for vip level 5
local  arena_vip6 = "70" 					-- Bonus Arena Points for vip level 6


function KillReward_System(event, pPlayer, pKilled)
MagicGold = WorldDBQuery("SELECT `"..mg_table.."` FROM "..db_acc..".accounts WHERE `login` = '"..pPlayer:GetAccountName().."';");
MG = MagicGold:GetColumn(0):GetLong()
VipLevel = WorldDBQuery("SELECT `"..vip_table.."` FROM "..db_acc..".accounts WHERE `login`='"..pPlayer:GetAccountName().."';");
vip = VipLevel:GetColumn(0):GetLong()
if (pKilled:GetHealth() > 0) then
pPlayer:Kill(pKilled)
-- SendWorldMessage("bug", 2)
-- return false;
end
					if (pKilled:GetName() == pPlayer:GetName()) then
						--- Don't reward yourself
					else
					if (vip == 1) then
							pPlayer:AddArenaPoints(arena_vip1)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip1.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");

					elseif (vip == 2) then
							pPlayer:AddArenaPoints(arena_vip2)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip2.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");

					elseif (vip == 3) then
							pPlayer:AddArenaPoints(arena_vip3)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip3.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");

					elseif (vip == 4) then
							pPlayer:AddArenaPoints(arena_vip4)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip4.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");

					elseif (vip == 5) then
							pPlayer:AddArenaPoints(arena_vip5)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip5.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");

					elseif (vip == 6) then
							pPlayer:AddArenaPoints(arena_vip6)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_vip6.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");
					else
							pPlayer:AddArenaPoints(arena_plry)
								WorldDBQuery("UPDATE "..db_acc..".accounts SET `"..mg_table.."` = '"..MG.."'+'"..MG_plry.."' WHERE `login` = '"..pPlayer:GetAccountName().."' LIMIT 1; ");
				end
		end
end

RegisterServerHook(2, "KillReward_System")