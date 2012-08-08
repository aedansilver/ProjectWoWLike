
local itemid = 6948
local reset_time = 30 -- in seconds 60 = 1 minute
local r_time
local logondb = "account"
local mg_db = "magic_gold" -- name of the mg table
-----------------------------------------------
local RequiredGameTime = 720 -- in seconds (720s = 12 mins)
local Z = {}
do
	for _, player in pairs(GetPlayersInWorld()) do
		Z[tostring(player)] = GetGameTime()
	end
end
local function LogInOnlineReward(event, player)
	local str = tostring(player)
	if(not Z[str]) then
		Z[str] = GetGameTime()
	end
end
local function LogOutOnlineReward(event, player)
	Z[tostring(player)] = nil
end
local function EnoughPlayed(player)
	local str = tostring(player)
	if(not Z[str]) then
		Z[str] = GetGameTime();
		return 0
	end
	local Time = GetGameTime()-Z[str]
	if(Time < RequiredGameTime) then
		return RequiredGameTime-Time
	end
	return false
end
local function ResetPlayedTime(pPlayer)
	Z[tostring(pPlayer)] = GetGameTime()
end
RegisterServerHook(4, LogInOnlineReward)
RegisterServerHook(13, LogOutOnlineReward)
-------------------------------------------
function Hearthstone_Trigger(item, event, player)

player:FullCastSpell(33208)
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "Global GPS Teleport", 20, 0)
item:GossipMenuAddItem(2, "Hearthstone", 2, 0)
item:GossipMenuAddItem(4, "Protect Bank", 323, 0)
item:GossipMenuAddItem(6, "Auction Center", 17, 0)
item:GossipMenuAddItem(1, "Gear Sale", 15, 0)
item:GossipMenuAddItem(8, "Gear Repair", 14, 0)
item:GossipMenuAddItem(3, "Learn Shop", 3210, 0)
item:GossipMenuAddItem(3, "Learn Skill", 3209, 0)
item:GossipMenuAddItem(4, "|cffFF0000VIP Service", 3208, 0)
item:GossipMenuAddItem(7, "Other Services", 11, 0)
item:GossipSendMenu(player)
end

function HearthstoneOnSelect(item, event, player, id, intid, code)

local accdb = "account"
local CheckMember = WorldDBQuery("SELECT `member_type` FROM "..accdb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
local MemberType = CheckMember:GetColumn(0):GetLong()
local date = os.date()


if(intid == 14) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, " Finish", 75, 0)
item:GossipMenuAddItem(7, "  ", 75, 0)
item:GossipSendMenu(player)
player:RepairAllPlayerItems()
player:DealGoldCost(1)
player:DealGoldMerit(1)
end

if(intid == 15) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353Areturn|r", 75, 0)
item:GossipMenuAddItem(2, " [T6 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [T5 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [T4 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [T3 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [T2 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [T1 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [S4 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [S3 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [S2 Suit]", 16, 0)
item:GossipMenuAddItem(2, " [S1 Suit]", 16, 0)
item:GossipSendMenu(player)
end

if(intid == 20) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " [Teleport World]", 1, 0)
item:GossipMenuAddItem(2, " [Teleport Birthplace]", 3, 0)
item:GossipMenuAddItem(2, " [Teleport Raid Instance]", 7, 0)
item:GossipMenuAddItem(2, " [Teleport Wild Instance]", 4, 0)
item:GossipMenuAddItem(2, " [Teleport Middle Instance]", 6, 0)
item:GossipMenuAddItem(2, " [Teleport Primary Instance]", 31, 0)
item:GossipMenuAddItem(2, " [Teleport Wild BOSS]", 30, 0)
item:GossipMenuAddItem(4, " [|cffFF0000Battle @ Arathi|r ]  Attack for honor", 379, 0)
item:GossipMenuAddItem(4, " [|cffFF0000Battle @ Gadgetzan|r] Occupy Gadgetzan", 380, 0)
item:GossipMenuAddItem(4, " [|cffFF0000Battle @ Durnholde|r]  5v5 Arena", 381, 0)
item:GossipMenuAddItem(4, " [|cff00FF00Instance|r] Island of sun", 382, 0)
item:GossipMenuAddItem(4, " [|cff00FF00Instance|r] The Black Temple", 383, 0)
item:GossipMenuAddItem(4, " [|cff00FF00Instance|r] Fang\'s Peril", 384, 0)
item:GossipMenuAddItem(4, " [|cff00FF00Instance|r] Hyjal", 385, 0)
item:GossipSendMenu(player)
end

if(intid == 16) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "no sell template found.", 75, 0)
item:GossipMenuAddItem(2, "  ", 75, 0)
item:GossipSendMenu(player)
player:SendBroadcastMessage("|cff00ccffno sell template found.|r")
end

if(intid == 17) then
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then -- ally
player:Teleport(0, -4959.230469, -909.199097, 503.836700)
end
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then -- horde
player:Teleport(1, 1681.466309, -4457.147949, 19.143440)
end
end
player:GossipComplete()
end

if(intid == 11) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " Check MG", 3205, 0)
item:GossipMenuAddItem(2, " Get Online Reward", 3206, 0)
item:GossipMenuAddItem(2, " Clear Auras\n      (It remoes all auras N.P)", 3207, 0)
item:GossipMenuAddItem(2, " Bond (Cost 10MG)", 9, 0)
item:GossipSendMenu(player)
end

if(intid == 3) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 20, 0)
item:GossipMenuAddItem(2, " [Draenei Birthplace]", 325, 0)
item:GossipMenuAddItem(2, " [Human Birthplace]", 326, 0)
item:GossipMenuAddItem(2, " [Night Elf Birthplace]", 327, 0)
item:GossipMenuAddItem(2, " [Dwarf&Gnome Birthplace]", 328, 0)
item:GossipMenuAddItem(2, " [Bloodelf Birthplace]", 329, 0)
item:GossipMenuAddItem(2, " [Undead Birthplace]", 330, 0)
item:GossipMenuAddItem(2, " [Tauren Birthplace]", 331, 0)
item:GossipMenuAddItem(2, " [Troll&Orc Birthplace]", 332, 0)
item:GossipSendMenu(player)
end

if(intid == 4) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " Hellfire Citade:The Shattered Halls", 333, 0)
item:GossipMenuAddItem(2, " Hellfire Citade:The Blood Furnance", 334, 0)
item:GossipMenuAddItem(2, " Hellfire Citade:Hellfire Ramparts", 335, 0)
item:GossipMenuAddItem(2, " Coilfang Reservoir:The Slave Pens", 336, 0)
item:GossipMenuAddItem(2, " Coilfang Reservoir:Bog Cave", 337, 0)
item:GossipMenuAddItem(2, " Coilfang Reservoir:The Steamvault", 338, 0)
item:GossipMenuAddItem(2, " Auchindoun:Mana-Tombs", 339, 0)
item:GossipMenuAddItem(2, " Auchindoun:Auchenai Crypts", 340, 0)
item:GossipMenuAddItem(2, " Auchindoun:Sethekk Halls", 341, 0)
item:GossipMenuAddItem(2, " Auchindoun:Shadow Labyrinth", 342, 0)
item:GossipMenuAddItem(2, " Tempest Keep:The Mechanar", 343, 0)
item:GossipMenuAddItem(2, " Tempest Keep:The Botanica", 344, 0)
item:GossipMenuAddItem(2, " Tempest Keep:The Arcatraz", 345, 0)
item:GossipMenuAddItem(2, " >> Next Page", 5, 0)
item:GossipSendMenu(player)
end

if(intid == 5) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " The Black Morass", 346, 0)
item:GossipMenuAddItem(2, " << Prev Page", 4, 0)
item:GossipSendMenu(player)
end

if(intid == 6) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " Zul'Farak", 347, 0)
item:GossipMenuAddItem(2, " Maraudon", 348, 0)
item:GossipMenuAddItem(2, " Lost Temple", 349, 0)
item:GossipMenuAddItem(2, " Blackrock Depths", 350, 0)
item:GossipMenuAddItem(2, " Scholomance", 351, 0)
item:GossipMenuAddItem(0, " Dire Maul( north )", 352, 0)
item:GossipMenuAddItem(0, " Dire Maul( east )", 353, 0)
item:GossipMenuAddItem(0, " Dire Maul( west )", 354, 0)
item:GossipMenuAddItem(2, " Stratholme", 355, 0)
item:GossipSendMenu(player)
end

if(intid == 7) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " [Team] Tempest Keep", 356, 0)
item:GossipMenuAddItem(2, " [Team] Karazhan", 357, 0)
item:GossipMenuAddItem(2, " [Team] Hyjal", 358, 0)
item:GossipMenuAddItem(2, " [Team] The Black Temple", 359, 0)
item:GossipMenuAddItem(2, " [Team] Fang's Peril", 360, 0)
item:GossipMenuAddItem(2, " [Team] Gruul's Lair", 361, 0)
item:GossipMenuAddItem(2, " [Team] Magtheridon's Lair", 362, 0)
item:GossipMenuAddItem(2, " [Team] Zul'Aman", 363, 0)
item:GossipMenuAddItem(2, " [Team] Naxxramas", 364, 0)
item:GossipMenuAddItem(2, " [Team] Ahn'Qiraj", 365, 0)
item:GossipMenuAddItem(2, " [Team] Blackwing Lair", 366, 0)
item:GossipMenuAddItem(2, " [Team] Molten Core", 367, 0)
item:GossipMenuAddItem(2, " >> Next Page", 8, 0)
item:GossipSendMenu(player)
end

if(intid == 8) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " [Team] Blackrock Spire", 368, 0)
item:GossipMenuAddItem(2, " [Team] Zul'Gurub", 369, 0)
item:GossipMenuAddItem(2, " [Team] Ruins of Ahn'Qiraj", 370, 0)
item:GossipMenuAddItem(2, " [Team] Onyxia's Lair", 371, 0)
item:GossipMenuAddItem(2, " << Prev Page", 7, 0)
item:GossipSendMenu(player)
end

if(intid == 3205) then
local GetMagicGold = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
MagicGold = GetMagicGold:GetColumn(0):GetLong()

item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " You have "..MagicGold.." MG", 75, 0)
item:GossipSendMenu(player)
end

local ChkMG = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
Mgrw = ChkMG:GetColumn(0):GetLong()

if(intid == 3206) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
local ReqTime = EnoughPlayed(player) 
if(not ReqTime) then 
player:GossipComplete()
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(7, " finish", 75, 0)
item:GossipSendMenu(player)
WorldDBQuery("UPDATE "..logondb..".accounts SET `"..mg_db.."`=`"..mg_db.."`+'100' WHERE `login` = '"..player:GetAccountName().."';");
player:SendBroadcastMessage("|cff00ff00Congratulations, Use "..(math.ceil(RequiredGameTime/60)).." mins to get 100 MG.|r")
return ResetPlayedTime(player)
else
item:GossipMenuAddItem(7, "  online time is not enough", 75, 0)
player:SendBroadcastMessage("online time is not enough (need "..(math.ceil(ReqTime/60)).." minutes)")
end
item:GossipSendMenu(player)
end

if(intid == 3210) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " Learn:Racial Spells", 3211, 0)
item:GossipMenuAddItem(2, " Learn:Passive Spells", 3212, 0)
item:GossipMenuAddItem(2, " Learn:Other Spells", 3214, 0)
item:GossipMenuAddItem(2, " Bonus:Talent Points +5", 3215, 0)
item:GossipSendMenu(player)
end

local racialcost = 1660
local passivecost = 1880
local othercost = 600
local talentcost = 1000

if(intid == 3211) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn(DON\'T forget this service costs "..racialcost.."MG)|r", 3210, 0)
item:GossipMenuAddItem(3, " Troll:Berserkering (26297)", 3400, 0)
item:GossipMenuAddItem(3, " Bloodelf:Arcane Torrent (28730)", 3401, 0)
item:GossipMenuAddItem(3, " Tauren:War Stomp (20549)", 3402, 0)
item:GossipMenuAddItem(3, " Undead:Will of the Forsaken (7744)", 3403, 0)
item:GossipMenuAddItem(3, " Nigthelf:Shadowmeld (58984)", 3404, 0)
item:GossipMenuAddItem(3, " Human:Every man for Himself (59752)", 3405, 0)
item:GossipMenuAddItem(3, " Dwarf:Stoneform (20594)", 3406, 0)
item:GossipMenuAddItem(3, " Gnome:Escape Artist (20589)", 3407, 0)
item:GossipMenuAddItem(3, " Draenei:Gift of the Naaru (28880)", 3408, 0)
item:GossipSendMenu(player)
end

if(intid == 3212) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn(DON\'T forget this service costs "..passivecost.."MG)|r", 3210, 0)
item:GossipMenuAddItem(3, " Troll:Regeneration (20555)", 3410, 0)
item:GossipMenuAddItem(3, " Bloodelf:Magic Resistance (822)", 3411, 0)
item:GossipMenuAddItem(3, " Tauren:Endurance (20550)", 3412, 0)
item:GossipMenuAddItem(3, " Undead:Shadow Resistance (20579)", 3413, 0)
item:GossipMenuAddItem(3, " Nightelf:Nature Resistance (20583)", 3414, 0)
item:GossipMenuAddItem(3, " Nightelf:Quickness (20582)", 3415, 0)
item:GossipMenuAddItem(3, " Nightelf:Wisp Spirit (20585)", 3416, 0)
item:GossipMenuAddItem(3, " Human:Diplomacy (20599)", 3417, 0)
item:GossipMenuAddItem(3, " Human:Perception (58985)", 3418, 0)
item:GossipMenuAddItem(3, " Human:The Human Spirit (20598)", 3419, 0)
item:GossipMenuAddItem(3, " Dwarf:Frost Resistance (20596)", 3420, 0)
item:GossipMenuAddItem(3, " Gnome:Expansive Mind (20591)", 3421, 0)
item:GossipMenuAddItem(3, " Gnome:Arcane Resistance (20592)", 3422, 0)
item:GossipMenuAddItem(2, " >> Next Page", 3213, 0)
item:GossipSendMenu(player)
end

if(intid == 3213) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn(DON\'T forget this service costs "..passivecost.."MG)|r", 3210, 0)
item:GossipMenuAddItem(3, " Draenei:Shadow Resistance (20579)", 3423, 0)
item:GossipMenuAddItem(3, " Draenei:Heroic Presence (28878)", 3424, 0)
item:GossipMenuAddItem(2, " << Prev Page", 3212, 0)
item:GossipSendMenu(player)
end

if(intid == 3214) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn(DON\'T forget this service costs "..othercost.."MG)|r", 3210, 0)
item:GossipMenuAddItem(3, " Speed:Rushing Charge (6268)", 3430, 0)
item:GossipMenuAddItem(3, " Dual wield (674)", 3431, 0)
item:GossipSendMenu(player)
end

if(intid == 3215) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn(DON\'T forget this service costs "..talentcost.."MG)|r", 3210, 0)
item:GossipMenuAddItem(3, " Get 5 more talents", 3440, 0)
item:GossipSendMenu(player)
end

local GetMG = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
MGE = GetMG:GetColumn(0):GetLong()

if(intid == 3400) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(26297)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3401) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(28730)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3402) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20549)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3403) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(7744)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3404) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(58984)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3405) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(59752)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3406) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20594)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3407) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20589)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3408) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(28880)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3408) then
	if(MGE < tonumber(racialcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3211, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..racialcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3211, 0)
	item:GossipMenuAddItem(7, "  ", 3211, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(28880)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..racialcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3410) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20555)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3411) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(822)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3412) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20550)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3413) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20579)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3414) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20583)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3415) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20582)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3416) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20585)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3417) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20599)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3418) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(58985)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3419) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20589)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3420) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20596)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3421) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20591)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3422) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20592)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3423) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(20579)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3424) then
	if(MGE < tonumber(passivecost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3212, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..passivecost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3212, 0)
	item:GossipMenuAddItem(7, "  ", 3212, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(28878)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..passivecost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3430) then
	if(MGE < tonumber(othercost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3214, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..othercost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3214, 0)
	item:GossipMenuAddItem(7, "  ", 3214, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(6268)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..othercost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3431) then
	if(MGE < tonumber(othercost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3214, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..othercost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3214, 0)
	item:GossipMenuAddItem(7, "  ", 3214, 0)
	item:GossipSendMenu(player)
	player:LearnSpell(674)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..othercost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 3440) then
	if(MGE < tonumber(talentcost)) then
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, "null return", 3215, 0)
	item:GossipSendMenu(player)
		player:SendBroadcastMessage("|cffDE5454 need "..talentcost.." MG.")
		else
		player:GossipComplete()
	item:GossipCreateMenu(100001, player, 0)
	item:GossipMenuAddItem(7, " Finish", 3215, 0)
	item:GossipMenuAddItem(7, "  ", 3215, 0)
	item:GossipSendMenu(player)
	talentspec1 = player:GetTalentPoints(0)
	talentspec2 = player:GetTalentPoints(1)
	player:SetTalentPoints(0, 5)
	player:SetTalentPoints(0, 5)
	CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..talentcost..'" WHERE `login`="'..player:GetAccountName()..'"');
	end
end

if(intid == 9) then
if (MGE < tonumber(10)) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "cff6E353AReturn", 75, 0)
item:GossipMenuAddItem(7, "need 10 magic gold", 75, 0)
item:GossipSendMenu(player)
else
if not (r_time) or (os.time() >= r_time) then
r_time = os.time();
r_time = os.time() + reset_time
player:FullCastSpell(3286)
player:GossipComplete()
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " succes.location saved", 75, 0)
item:GossipSendMenu(player)
WorldDBQuery("UPDATE "..logondb..".accounts SET `"..mg_db.."`=`"..mg_db.."`-'10' WHERE `login` = '"..player:GetAccountName().."';");
else
player:SendBroadcastMessage("You have to wait |cffFF0000"..r_time - os.time().."|r seconds to do that again.")
player:GossipComplete()
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "", 75, 0)
item:GossipSendMenu(player)
end
end
end

if(intid == 30) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r\n ", 20, 0)
item:GossipMenuAddItem(2, " Azuregos\n ", 372, 0)
item:GossipMenuAddItem(2, " Lethon\n ", 373, 0)
item:GossipMenuAddItem(2, " Emeriss\n ", 374, 0)
item:GossipMenuAddItem(2, " Taerar\n ", 375, 0)
item:GossipMenuAddItem(2, " Ysondre\n ", 376, 0)
item:GossipMenuAddItem(2, " Kazzak\n ", 377, 0)
item:GossipMenuAddItem(2, " Doomwalker\n ", 378, 0)
item:GossipSendMenu(player)
end

if(intid == 31) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 20, 0)
item:GossipMenuAddItem(2, " Ragefire Chasm", 386, 0)
item:GossipMenuAddItem(2, " The Deadmines", 387, 0)
item:GossipMenuAddItem(2, " Wailing Cverns", 388, 0)
item:GossipMenuAddItem(2, " Shadowfang Keep", 389, 0)
item:GossipMenuAddItem(2, " Blackfathom Deeps", 390, 0)
item:GossipMenuAddItem(2, " Razorfen Kraul", 391, 0)
item:GossipMenuAddItem(2, " Gnomeregan", 392, 0)
item:GossipMenuAddItem(2, " Scarlet Monastery", 393, 0)
item:GossipMenuAddItem(2, " Razorfen Downs", 394, 0)
item:GossipMenuAddItem(2, " Uldaman", 395, 0)
item:GossipSendMenu(player)
end

if(intid == 3207) then
player:RemoveAllAuras()
player:GossipComplete()
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(7, " succes", 75, 0)
item:GossipSendMenu(player)
end

if(intid == 3208) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "Back", 75, 0)
item:GossipMenuAddItem(2, " |cffFF0000Use Vip Item Receiver", 75, 0)
item:GossipSendMenu(player)
end

if(intid == 3209) then
	player:AdvanceSkill(43, 1000)
	player:AdvanceSkill(55, 1000)
	player:AdvanceSkill(173, 1000)
	player:AdvanceSkill(229, 1000)
	player:AdvanceSkill(136, 1000)
	player:AdvanceSkill(45, 1000)
	player:AdvanceSkill(226, 1000)
	player:AdvanceSkill(228, 1000)
	player:AdvanceSkill(176, 1000)
	player:AdvanceSkill(54, 1000)
	player:AdvanceSkill(160, 1000)
	player:AdvanceSkill(44, 1000)
	player:AdvanceSkill(172, 1000)
	player:AdvanceSkill(162, 1000)
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " succes.skill up to date", 75, 0)
item:GossipSendMenu(player)
end

if(intid == 1) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "|cff6E353AReturn|r", 20, 0)
item:GossipMenuAddItem(2, "[Hyjal Summith] New guy Area ( Lvl up )", 4002, 0)
if(player:GetTeam() == 1) then -- horde
item:GossipMenuAddItem(2, "[|cffFF0000Attack|r] Ironforge|r", 4003, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff00FFFFGuard|r] |cffFF0000Orgrimmar (Main City)|r", 100, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Silvermoon City (Fresher city)|r", 102, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Thunder Bluff|r", 101, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Undercity|r", 103, 0,"|cffFF0000SYSTEM|r\n ")
end
if(player:GetTeam() == 0) then -- alliance
item:GossipMenuAddItem(2, "[|cffFF0000Attack|r] Orgrimmar|r", 4004, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff00FFFFGuard|r] |cff0040FFIronforge (Main City)|r", 201, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFStormwind (Fresher City)|r", 200, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFDarnassus|r", 202, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFThe Exodar|r", 203, 0,"|cffFF0000SYSTEM|r\n ")
end
item:GossipMenuAddItem(2, "[Dead Graveyard] Well of the Forgotten", 4001, 0)
item:GossipMenuAddItem(2, "[Neutral] Ratchet", 324, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[Neutral] Booty Bay", 106, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[PK Area] Dalaran City", 105, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[PK Area] Shattrath City", 320, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[The Dark Portal] The Stair of Destiny", 321, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipSendMenu(player)
end

if(intid == 2) then
if not (r_time) or (os.time() >= r_time) then
r_time = os.time();
r_time = os.time() + reset_time
player:ClearCooldownForSpell(7355)
player:FullCastSpell(7355)
player:GossipComplete()
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "", 75, 0)
item:GossipSendMenu(player)
else
player:SendBroadcastMessage("You have to wait |cffFF0000"..r_time - os.time().."|r seconds to do that again.")
player:GossipComplete() 
end
end

if(intid == 100) then -- Orgrimmar
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 1587.23604, -4402.269531, 5.485211)
player:GossipComplete()
end
end

if(intid == 101) then -- Thunderbluff
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -1281, 130, 133)
player:GossipComplete()
end
end

if(intid == 102) then -- Silvermoon
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, 9413, -7277, 17)
player:GossipComplete()
end
end

if(intid == 103) then -- Undercity
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, 1831, 238, 62)
player:GossipComplete()
end
end

if(intid == 104) then -- Shattrath Mall
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -1869.065918, 5428.892090, -9.705385)
player:GossipComplete()
end
end

if(intid == 105) then -- Dalaran City
if(player:GetLevel() < 70) then
player:SendBroadcastMessage("Must be at least lvl 70 to pass through there.")
player:GossipComplete()
elseif player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(571, 5807.725586, 588.349365, 660.937012)
player:GossipComplete()
end
end

if(intid == 106) then -- Booty Bay
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -14406.599609, 419.352997, 22.389851)
player:GossipComplete()
end
end

if(intid == 200) then -- Stormwind
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -8913, 552, 95)
player:GossipComplete()
end
end

if(intid == 201) then -- Ironforge
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -4942.6982871, -928.920532, 501.660431)
player:GossipComplete()
end
end

if(intid == 202) then -- Darnassus
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 9945, 2616, 1317)
player:GossipComplete()
end
end

if(intid == 203) then -- Exodar
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -4014, -11895, 2)
player:GossipComplete()
end
end

if(intid == 319) then -- runeforgin
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else if (player:GetPlayerClass() == "Death Knight" == false) then
player:SendBroadcastMessage("teleport failed. reason: death knight class required")
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 75, 0)
item:GossipSendMenu(player)
else
player:Teleport(0, 2431.866211, -5551.961426, 420.643951)
player:GossipComplete()
end
end
end

if(intid == 320) then -- mall 1
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -1915.571411, 5533.728516, -10.974501)
player:GossipComplete()
end
end

if(intid == 321) then -- mall 2
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -248.295898, 919.763733, 84.378456)
player:GossipComplete()
end
end

if(intid == 322) then -- durn1 
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(560, 2018.243652, 1615.003906, 50.841618)
player:GossipComplete()
end
end

if(intid == 324) then -- ratchet
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -962.580139, -3715.165283, 5.362885)
player:GossipComplete()
end
end

if(intid == 325) then -- draenei birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -3961.909668, -13931.372070, 100.567810)
player:GossipComplete()
end
end

if(intid == 326) then -- human birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -8948.159180, -140.469666, 83.496544)
player:GossipComplete()
end
end

if(intid == 327) then -- nightelf birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 10319.897, 827.653, 1326.374)
player:GossipComplete()
end
end

if(intid == 328) then -- dwarf birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -6225.532, 329.584, 383.201)
player:GossipComplete()
end
end

if(intid == 329) then -- bloodelf birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, 10349.181, -6364.583, 34.795)
player:GossipComplete()
end
end

if(intid == 330) then -- undead birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, 1664.063, 1678.124, 120.530)
player:GossipComplete()
end
end

if(intid == 331) then -- tauren birth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -2918.657, -254.834, 52.956)
player:GossipComplete()
end
end

if(intid == 332) then -- troll org birthf
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -624.436, -4260.070, 38.248)
player:GossipComplete()
end
end

if(intid == 333) then -- hellfire citadel the shattered halls
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(540, -16.125, 1.419, -13.161)
player:GossipComplete()
end
end

if(intid == 334) then -- hellfire the blood furnance
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(542, -4.035, 14.856, -44.798)
player:GossipComplete()
end
end

if(intid == 335) then -- hellfire ramparts
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(543, -1351.615, 1647.694, 68.5766)
player:GossipComplete()
end
end

if(intid == 336) then -- the slave pens
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(547, 120.601, -135.984, -1.206)
player:GossipComplete()
end
end

if(intid == 337) then -- bog cave
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(546, 52.438, -106.715, -2.763)
player:GossipComplete()
end
end

if(intid == 338) then -- steamvault
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(545, -5.694, -17.452, -5.381)
player:GossipComplete()
end
end

if(intid == 339) then -- mana tombs
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(557, -66.982, -40.976, -0.953)
player:GossipComplete()
end
end

if(intid == 340) then -- auchenai crypts
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(558, 35.635, 0.699, -0.127)
player:GossipComplete()
end
end

if(intid == 341) then -- sethekk halls
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(556, 43.966, 65.525, 0.008)
player:GossipComplete()
end
end
if(intid == 342) then -- shadow labyrinth
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(555, -8.776, -1.632, -1.127)
player:GossipComplete()
end
end

if(intid == 343) then -- the mechanar
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(554, -27.744, 0.720, -1.812)
player:GossipComplete()
end
end

if(intid == 344) then -- the botanica
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(553, 36.037, -24.209, -1.123)
player:GossipComplete()
end
end

if(intid == 345) then -- the arcatraz
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(552, 2.043, 0.065, -0.204)
player:GossipComplete()
end
end

if(intid == 346) then -- the black morass
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(269, -2033.853027, 7122.090, 22.664)
player:GossipComplete()
end
end

if(intid == 347) then -- zul'farak
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(209, 1221.812, 840.745, 8.976)
player:GossipComplete()
end
end

if(intid == 348) then -- maraudon
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(349, 381.493, 0.088, -130.931)
player:GossipComplete()
end
end

if(intid == 349) then -- lost temple
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(109, -321.576, 99.919, -131.848)
player:GossipComplete()
end
end

if(intid == 350) then -- blackrock depths
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(230, 463.554, 13.75, -71.191)
player:GossipComplete()
end
end

if(intid == 351) then -- scholomance
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(289, 201.195, 122.810, 134.911)
player:GossipComplete()
end
end

if(intid == 352) then -- dire maul north
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(429, 270.537, -24.975, -2.55)
player:GossipComplete()
end
end

if(intid == 353) then -- dure maul east
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(429, 53.788, -158.966, -2.713)
player:GossipComplete()
end
end

if(intid == 354) then -- dure maul west
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(429, 41.064, 165.400, -3.471)
player:GossipComplete()
end
end

if(intid == 355) then -- stratholme
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(329, 3596.379, -3651.078, 138.510)
player:GossipComplete()
end
end

if(intid == 356) then -- tempest keep
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530,3088.680176,1388.064575,185.083282)
player:GossipComplete()
end
end

if(intid == 357) then -- karazhan
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(532, -11103.954, -1999.796, 49.892)
player:GossipComplete()
end
end

if(intid == 358) then -- hyjal
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(534, 5458.305, -2725.177, 1484.801)
player:GossipComplete()
end
end

if(intid == 359) then -- black temple
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(564, 100.993, 1002.305, -86.422)
player:GossipComplete()
end
end

if(intid == 360) then -- fang's peril
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(548,21.504107,0.063274,821.727112)
player:GossipComplete()
end
end

if(intid == 361) then -- gruul's lair
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530,3525.033936,5171.226563,-6.959458)
player:GossipComplete()
end
end

if(intid == 362) then -- magtheridon's lair
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530,-315.113800,3091.746582,-116.451370)
player:GossipComplete()
end
end

if(intid == 363) then -- zul'aman
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(568, 121.050, 1770.060, 43.415)
player:GossipComplete()
end
end

if(intid == 364) then -- naxxramas
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(571,3674.050049,-1269.859985,243.509995)
player:GossipComplete()
end
end

if(intid == 365) then -- ahn'qiraj
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(531,-8212.002930,2034.474854,129.141342)
player:GossipComplete()
end
end

if(intid == 366) then -- blackwing lair
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(469,-7663.577148,-1101.440674,399.680359)
player:GossipComplete()
end
end

if(intid == 367) then -- molten core
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(230,1115.349976,-457.350006,-102.699997)
player:GossipComplete()
end
end

if(intid == 368) then -- blackrock spire
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0,-7524.189941,-1230.130005,285.734129)
player:GossipComplete()
end
end

if(intid == 369) then -- zul'gurub
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(309,-11942.633789,-1545.007202,39.595921)
player:GossipComplete()
end
end

if(intid == 370) then -- ruins of ahn'qiraj
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(509,-8443.475586,1518.648560,31.906958)
player:GossipComplete()
end
end

if(intid == 371) then -- onyxia's lair
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(249,29.454800,-68.960899,6.984033)
player:GossipComplete()
end
end

if(intid == 372) then -- azuregos
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 2625.724, -5983.649, 101.904)
player:GossipComplete()
end
end

if(intid == 373) then -- lethon
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, 674.965, -4067.0268, 99.526)
player:GossipComplete()
end
end

if(intid == 374) then -- emeriss
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 3141.445, -3793.006, 121.728)
player:GossipComplete()
end
end

if(intid == 375) then -- taerar
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -10533.517, -439.536, 52.020)
player:GossipComplete()
end
end

if(intid == 376) then -- ysondre
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -3054.946, 1966.427, 30.030)
player:GossipComplete()
end
end

if(intid == 377) then -- kazzak
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, 879.645, 2282.737, 295.831)
player:GossipComplete()
end
end

if(intid == 378) then -- doomWalker
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -3589.578, 326.891, 38.104)
player:GossipComplete()
end
end

if(intid == 379) then -- arathi attack for honor
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then -- ally
player:Teleport(529, 1312.813, 1310.458, -9.009)
end
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then -- horde
player:Teleport(529, 685.668, 683.114, -12.915)
end
player:GossipComplete()
end
end

if(intid == 380) then -- gadgetzan
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, -7154.280, -3816.079, 8.457)
player:GossipComplete()
end
end

if(intid == 381) then -- durnholde arena 5v5
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(560, 1352.312, -246.679, 63.373)
player:GossipComplete()
end
end

if(intid == 382) then -- island of sun
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, 13003.292, -6908.870, 9.583)
player:GossipComplete()
end
end

if(intid == 383) then -- blacktemple outdoor
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, -3642.808, 316.011, 35.100)
player:GossipComplete()
end
end

if(intid == 384) then -- fang's peril
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(530, 788.845, 6866.813, -65.202)
player:GossipComplete()
end
end

if(intid == 385) then -- hyjal summith
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(534, 5463.154, -2734.901, 1486.418)
player:GossipComplete()
end
end

if(intid == 386) then -- Ragefire chasm
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(389,2.000000,-10.000000,-16.180000)
player:GossipComplete()
end
end

if(intid == 387) then -- The Deadmines
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(36,-13.670000,-380.000000,61.046883)
player:GossipComplete()
end
end

if(intid == 388) then -- Wailing Caverns
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(43,-161.8000003,133.270004,-73.870941)
player:GossipComplete()
end
end

if(intid == 389) then -- Shadowfang keep
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(33,-228.000000,2110.30049,76.890633)
player:GossipComplete()
end
end

if(intid == 390) then -- blackfathom deeps
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(48,-150.369995,103.000000,-40.599998)
player:GossipComplete()
end
end

if(intid == 391) then -- razorfen kraul
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(47,1943.000000,1544.000000,81.957619)
player:GossipComplete()
end
end

if(intid == 392) then -- gnomeregan
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(90,-332.600006,-3.445000,-152.846008)
player:GossipComplete()
end
end

if(intid == 393) then -- scarlet monastery
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(189,855.000000,1320.000000,18.672758)
player:GossipComplete()
end
end

if(intid == 394) then -- razorfen downs
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(129,2593.209961,1109.459961,51.093300)
player:GossipComplete()
end
end

if(intid == 395) then -- uldaman
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(70,-227.529007,45.009800,-46.019600)
player:GossipComplete()
end
end

if(intid == 4001) then -- wotf
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -11077.099609, -1795.300049, 52.741199)
player:GossipComplete()
end
end

if(intid == 4002) then -- hyjal
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(534, 5466.310059, -2722.593018, 1483.264771)
player:GossipComplete()
end
end

if(intid == 4003) then -- if
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(0, -5048.210, -785.605, 495.123)
player:GossipComplete()
end
end

if(intid == 4004) then -- org
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(1, 1299.643, -4389.439, 26.267)
player:GossipComplete()
end
end

if(intid == 323) then
player:SendBankWindow(player)
end
if(intid == 75) then
return Hearthstone_Trigger(item, event, player)
end
if(intid == 9999) then
player:GossipComplete()
end
end

RegisterItemGossipEvent(itemid, 1, "Hearthstone_Trigger")
RegisterItemGossipEvent(itemid, 2, "HearthstoneOnSelect") 