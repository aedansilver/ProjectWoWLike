--CREDITS TO AK47SIGH FOR CODING & ANSAMBLING

local itemid = 100009

--- locals

local reset_time = 5 -- in seconds 60 = 1 minute

local r_time

local logondb = "account"

local mg_db = "magic_gold" -- name of the mg table

local reqVip = 1

-- end of locals

function MMS_Trigger(item, event, player)

local GetMagicGoldBind = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
MagicGoldBind = GetMagicGoldBind:GetColumn(0):GetLong()
local CheckMember = WorldDBQuery("SELECT `member_type` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
local MemberType = CheckMember:GetColumn(0):GetLong()

if(MemberType < tonumber(reqVip)) then
player:GossipComplete()
player:SendBroadcastMessage("you need to become vip")
else
player:FullCastSpell(33208)
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "Teleport world maincity", 1, 0)
item:GossipMenuAddItem(2, "Teleport to Durnholde", 4000, 0)
item:GossipMenuAddItem(2, "Teleport all instance", 2, 0)
item:GossipMenuAddItem(2, "Teleport to runeforge", 319, 0)
item:GossipMenuAddItem(2, "repair Item", 14, 0)
item:GossipMenuAddItem(2, "dressing Room", 2000, 0)
item:GossipMenuAddItem(2, "check integral", 3205, 0)
item:GossipMenuAddItem(2, "Teleport to teamchief", 13, 0)
item:GossipMenuAddItem(2, "VIP resurgence", 12, 0)
item:GossipMenuAddItem(2, "VIP Summon", 15, 0)
item:GossipMenuAddItem(2, "set my home", 9, 0)
item:GossipSendMenu(player)
end
end

function MMS_OnSelect(item, event, player, id, intid, code)

local accdb = "account"
local CheckMember = WorldDBQuery("SELECT `member_type` FROM "..accdb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
local MemberType = CheckMember:GetColumn(0):GetLong()
local GetMagicGold = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..player:GetAccountName().."';");
MagicGold = GetMagicGold:GetColumn(0):GetLong()

local date = os.date()

if(intid == 75) then
return MMS_Trigger(item, event, player)
end

if(intid == 3205) then
item:GossipCreateMenu(57, player, 0)
item:GossipMenuAddItem(0, "Return", 75, 0)
item:GossipMenuAddItem(2, " Left point show on chat window.please check it", 75, 0)
player:SendBroadcastMessage("|cff00ff00Your MG:"..MagicGold.."|r")
item:GossipSendMenu(player)
end

if(intid == 13) then
if(player:IsInGroup()) then
grpleader = player:GetGroupLeader()
LeadM = grpleader:GetMapId()
LeadX = grpleader:GetX()
LeadY = grpleader:GetY()
LeadZ = grpleader:GetZ()

if(MagicGold < 100) then
player:SendBroadcastMessage("not enough mg (100).")
player:GossipComplete()
			return MMS_Trigger(item, event, player)
else
player:Teleport(LeadM, LeadX, LeadY,LeadZ)
player:GossipComplete()
CharDBQuery("UPDATE accounts SET `"..mg_db.."`=`"..mg_db.."`-'100' WHERE `login` = '"..player:GetAccountName().."';");
end
else
player:GossipComplete()
player:SendBroadcastMessage("not in group")
			return MMS_Trigger(item, event, player)
end
end

if(intid == 15) then
if(MagicGold < 100) then
player:GossipComplete()
player:SendBroadcastMessage("not enough MG (100).")
			return MMS_Trigger(item, event, player)
			else
target = player:GetSelection()
plrname = player:GetName()
if(target == nil) then
player:SendBroadcastMessage("(null) target")
player:GossipComplete()
			return MMS_Trigger(item, event, player)
else
if (target:GetName() == plrname) or (target:IsCreature()) then
player:SendBroadcastMessage(" target unbound.")
player:GossipComplete()
return MMS_Trigger(item, event, player)
else
	if target:IsInGroup() == false or target:IsGroupedWith(player) == false then
player:SendBroadcastMessage("Tried to summon "..target:GetName().." which is not a party member.")
target:SendBroadcastMessage("["..player:GetName().."] is trying to recall you but your not a party member with him.")
player:GossipComplete()
	return MMS_Trigger(item, event, player)
	else
if not (r_time) or (os.time() >= r_time) then
r_time = os.time();
r_time = os.time() + reset_time
		M = player:GetMapId()
		X = player:GetX()
		Y = player:GetY()
		Z = player:GetZ()
		target:Teleport(M, X, Y, Z)
			player:SendBroadcastMessage("Summoning group member "..target:GetName()..".")
			target:SendBroadcastMessage("[Group] "..player:GetName().." is recalling you.")
			CharDBQuery("UPDATE accounts SET `"..mg_db.."`=`"..mg_db.."`-'100' WHERE `login` = '"..player:GetAccountName().."';");
			player:GossipComplete()
			return MMS_Trigger(item, event, player)
			else
			player:SendBroadcastMessage("The service is temporary used: Wait "..r_time - os.time().." sec. to unlock.")
			player:GossipComplete()
			return MMS_Trigger(item, event, player)
	end
	end
end
end
end
end

if(intid == 4) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
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
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
item:GossipMenuAddItem(2, " The Black Morass", 346, 0)
item:GossipMenuAddItem(2, " << Prev Page", 4, 0)
item:GossipSendMenu(player)
end

if(intid == 6) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
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

if(intid == 12) then
if(MagicGold < 100 or player:IsDead() == false) then
player:SendBroadcastMessage(" you are not dead or not enough MG")
player:GossipComplete()
else
WorldDBQuery("UPDATE "..logondb..".accounts SET `"..mg_db.."`=`"..mg_db.."`-'100' WHERE `login` = '"..player:GetAccountName().."';");
player:SendBroadcastMessage("|cff00ff00revived.")
player:ResurrectPlayer()
player:SetHealthPct(10)
player:GossipComplete()
end
end

if(intid == 14) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "|cff6E353A[Main Menu]|r\n ", 75, 0)
item:GossipMenuAddItem(7, "Items repaired.", 75, 0)
item:GossipSendMenu(player)
player:RepairAllPlayerItems()
player:DealGoldCost(1)
end

if(intid == 16) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "|cff6E353A[VIP Menu]|r\n ", 12, 0)
item:GossipMenuAddItem(7, " Zoom in", 17, 0)
item:GossipMenuAddItem(7, " Zoom out", 300, 0)
item:GossipSendMenu(player)
end

if(intid == 500) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(7, "|cff6E353A[Main Menu]|r\n ", 75, 0)
item:GossipMenuAddItem(2, " Old Hillsbrad Foothills", 324, 0, " ")
item:GossipMenuAddItem(2, " Black Temple", 330, 0, " ")
item:GossipMenuAddItem(2, " Sunwell Plateau", 325, 0, " ")
item:GossipMenuAddItem(2, " Magister's Terrace", 326, 0, " ")
item:GossipMenuAddItem(2, " Blackwing Lair", 327, 0, " ")
item:GossipMenuAddItem(2, " The Deadmines", 328, 0, " ")
item:GossipMenuAddItem(2, " Well of the Forgotten", 329, 0, " ")
item:GossipSendMenu(player)
end

if(intid == 300) then
player:SetScale(0.8)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 301, 0)
item:GossipSendMenu(player)
end

if(intid == 301) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, " Zoom out", 302, 0)
item:GossipMenuAddItem(2, "  ", 302, 0)
item:GossipSendMenu(player)
end

if(intid == 302) then
player:SetScale(0.6)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 303, 0)
item:GossipSendMenu(player)
end

if(intid == 303) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, " Zoom out", 304, 0)
item:GossipMenuAddItem(2, " ", 304, 0)
item:GossipSendMenu(player)
end

if(intid == 304) then
player:SetScale(0.5)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 17) then
player:SetScale(1.4)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 18, 0)
item:GossipSendMenu(player)
end

if(intid == 18) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, " Zoom in", 19, 0)
item:GossipMenuAddItem(2, " ", 19, 0)
item:GossipSendMenu(player)
end

if(intid == 19) then
player:SetScale(1.8)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 20, 0)
item:GossipSendMenu(player)
end

if(intid == 20) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, " Zoom in", 21, 0)
item:GossipMenuAddItem(s, " ", 21, 0)
item:GossipSendMenu(player)
end

if(intid == 21) then
player:SetScale(2.2)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 2000) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "Return(no need gold to dress)", 75, 0)
item:GossipMenuAddItem(2, "Prink to Hero", 10, 0)
item:GossipMenuAddItem(2, "Zoom in/out", 16, 0)
item:GossipSendMenu(player)
end

if(intid == 22) then -- tyrande
player:SetModel(7274)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 23) then -- tydormu
player:SetModel(21445)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 24) then -- medivh
player:SetModel(18718)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 25) then -- varian
player:SetModel(28127)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 26) then -- lk
player:SetModel(30721)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 27) then -- rexxar
player:SetModel(20918)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 28) then -- thrall
player:SetModel(4527)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 29) then -- sylvanas
player:SetModel(11657)
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 4444) then -- demorph
player:DeMorph()
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "", 2000, 0)
item:GossipSendMenu(player)
end

if(intid == 30) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r\n ", 75, 0)
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
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
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

if(intid == 10) then
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(2, "|cff6E353A[VIP Menu]|r\n ", 12, 0)
item:GossipMenuAddItem(0, "[-]:Demorph", 30, 0)
item:GossipMenuAddItem(7, " Tyrande", 22, 0)
item:GossipMenuAddItem(7, " Tydormu", 23, 0)
item:GossipMenuAddItem(7, " Medivh", 24, 0)
item:GossipMenuAddItem(7, " Varian", 25, 0)
item:GossipMenuAddItem(7, " Lich King", 26, 0)
item:GossipMenuAddItem(7, " Rexxar", 27, 0)
item:GossipMenuAddItem(7, " Thrall", 28, 0)
item:GossipMenuAddItem(7, " Sylvanas", 29, 0)
item:GossipSendMenu(player)
end

if(intid == 1) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "|cff6E353AReturn|r", 75, 0)
if(player:GetTeam() == 1) then
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Orgrimmar (Main City)|r", 100, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Silvermoon City (Fresher city)|r", 102, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Thunder Bluff|r", 101, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cffFF0000Horde|r] |cffFF0000Undercity|r", 103, 0,"|cffFF0000SYSTEM|r\n ")
else
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFIronforge (Main City)|r", 201, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFStormwind (Fresher City)|r", 200, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFDarnassus|r", 202, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[|cff0040FFAlliance|r] |cff0040FFThe Exodar|r", 203, 0,"|cffFF0000SYSTEM|r\n ")
end
item:GossipMenuAddItem(2, "[Neutral] Ratchet", 324, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[Neutral] Booty Bay", 106, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[PK Area] Dalaran City", 105, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[PK Area] Shattrath City", 320, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipMenuAddItem(2, "[The Dark Portal] The Stair of Destiny", 321, 0,"|cffFF0000SYSTEM|r\n ")
item:GossipSendMenu(player)
end

if(intid == 2) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(2, " Raid-Instance", 7, 0)
item:GossipMenuAddItem(2, " Senior Instance", 4, 0)
item:GossipMenuAddItem(2, " Medium Instance", 6, 0)
item:GossipMenuAddItem(2, " Junior Instance", 31, 0)
item:GossipMenuAddItem(2, " Open-Wild BOSS", 30, 0)
item:GossipSendMenu(player)
end

if(intid == 9) then
player:GossipComplete()
item:GossipCreateMenu(55, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn|r", 75, 0)
item:GossipMenuAddItem(7, " ", 75, 0)
item:GossipSendMenu(player)
player:FullCastSpell(3286)
end


if(intid == 7) then
item:GossipCreateMenu(100001, player, 0)
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
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
item:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:pls make a team and teleport)|r", 75, 0)
item:GossipMenuAddItem(2, " [Team] Blackrock Spire", 368, 0)
item:GossipMenuAddItem(2, " [Team] Zul'Gurub", 369, 0)
item:GossipMenuAddItem(2, " [Team] Ruins of Ahn'Qiraj", 370, 0)
item:GossipMenuAddItem(2, " [Team] Onyxia's Lair", 371, 0)
item:GossipMenuAddItem(2, " << Prev Page", 7, 0)
item:GossipSendMenu(player)
end

if(intid == 9999) then
player:GossipComplete()
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


if(intid == 4000) then -- durnholde
if player:IsInCombat() then -- no teleport when in combat
player:SendBroadcastMessage("teleport failed. reason: combat")
player:GossipComplete()
else
player:Teleport(529, 1313.079956, 1310.710205, -9.010490)
player:GossipComplete()
end
end

end

RegisterItemGossipEvent(itemid, 1, "MMS_Trigger")
RegisterItemGossipEvent(itemid, 2, "MMS_OnSelect") 