--CREDITS TO AK47SIGH FOR CODING & ANSAMBLING

local npcid = 130015 -- "880044" this is your Entry ID, you can change it at any time!
local extcIDlv1 = 3100 -- REQ: (97014) Level 1 Item Show
local extcIDlv2 = 3101 -- REQ: (97008) Level 2 Item Show
local extcIDlv3 = 3102 -- REQ: (97032) Level 3 Item Show
local extcIDlv4 = 3103 -- REQ: (97009) Level 4 Item Show
local extcIDlv5 = 3104 -- REQ: (97010) Level 5 Item Show
local extcIDlv6 = 3105 -- REQ: (97011) Level 6 Item Show

function Armor_OnGossip(pUnit,event,player)
-- player:SendBroadcastMessage(""..player:GetPlayerClass().."")
pUnit:VendorRemoveAllItems()
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 1",10,0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 2",20,0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 3",30,0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 4",40,0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 5",50,0)
pUnit:GossipMenuAddItem(2," Items Set >> VIP 6",60,0)
pUnit:GossipSendMenu(player)
end

function Armor_OnSelect(pUnit,event,player,id,intid,code)
if (intid == 10) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 1 >> Armors",11,0)
pUnit:GossipMenuAddItem(8," Level 1 >> Weapons",12,0)
pUnit:GossipSendMenu(player)
end

if (intid == 20) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 2 >> Armors",21,0)
pUnit:GossipMenuAddItem(8," Level 2 >> Weapons",22,0)
pUnit:GossipSendMenu(player)
end

if (intid == 30) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 3 >> Armors",31,0)
pUnit:GossipMenuAddItem(8," Level 3 >> Weapons",32,0)
pUnit:GossipSendMenu(player)
end

if (intid == 40) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 4 >> Armors",41,0)
pUnit:GossipMenuAddItem(8," Level 4 >> Weapons",42,0)
pUnit:GossipSendMenu(player)
end

if (intid == 50) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 5 >> Armors",51,0)
pUnit:GossipMenuAddItem(8," Level 5 >> Weapons",52,0)
pUnit:GossipSendMenu(player)
end

if (intid == 60) then
pUnit:GossipCreateMenu(100, player, 0)
pUnit:GossipMenuAddItem(7,"Return..",9000,0)
pUnit:GossipMenuAddItem(8," Level 6 >> Armors",61,0)
pUnit:GossipMenuAddItem(8," Level 6 >> Weapons",62,0)
pUnit:GossipSendMenu(player)
end

if (intid == 11) then -- Level 1 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160627,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160628,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160629,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160630,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160631,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160632,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160633,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160634,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160635,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160600,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160601,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160602,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160603,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160604,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160605,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160606,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160607,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160608,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160663,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160664,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160665,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160666,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160667,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160668,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160669,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160670,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160671,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160609,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160610,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160611,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160612,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160613,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160614,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160615,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160616,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160617,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(160645,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160646,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160647,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160648,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160649,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160650,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160651,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160652,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160653,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160654,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160655,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160656,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160657,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160658,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160659,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160660,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160661,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160662,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160591,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160592,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160593,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160594,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160595,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160596,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160597,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160598,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160599,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160636,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160637,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160638,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160639,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160640,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160641,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160642,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160643,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160544,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160618,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160619,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160620,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160621,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160622,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160623,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160624,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160625,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(160626,1,tonumber(extcIDlv1)) -- Ring
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(161350,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161351,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161352,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161353,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161354,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161355,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161356,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161357,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(161358,1,tonumber(extcIDlv1)) -- Ring
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 12) then -- Level 1 WEAPON
pUnit:VendorAddItem(170000,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170001,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170002,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170003,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170004,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170005,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170006,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170007,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170008,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170009,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170010,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170011,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170012,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170013,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170014,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170015,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170016,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170017,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170018,1,tonumber(extcIDlv1))
pUnit:VendorAddItem(170019,1,tonumber(extcIDlv1))
player:SendVendorWindow(pUnit)
end

if (intid == 21) then -- Level 2 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160531,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160532,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160533,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160534,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160535,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160536,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160537,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160538,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160539,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160540,1,tonumber(extcIDlv2))
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160506,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160507,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160508,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160509,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160510,1,tonumber(extcIDlv2))
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160566,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160567,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160568,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160569,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160570,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160571,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160572,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160573,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160574,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160575,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160576,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160577,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160578,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160579,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160580,1,tonumber(extcIDlv2))
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160511,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160512,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160513,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160514,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160515,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160516,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160517,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160518,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160519,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160520,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160521,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160522,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160523,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160524,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160525,1,tonumber(extcIDlv2))
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(160556,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160557,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160558,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160559,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160560,1,tonumber(extcIDlv2))
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160561,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160562,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160563,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160564,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160565,1,tonumber(extcIDlv2))
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160581,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160582,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160583,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160584,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160585,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160586,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160587,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160588,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160589,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160590,1,tonumber(extcIDlv2))
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160541,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160542,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160543,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160544,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160545,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160546,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160547,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160548,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160549,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160550,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160551,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160552,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160553,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160554,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160555,1,tonumber(extcIDlv2))
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160526,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160527,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160528,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160529,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(160530,1,tonumber(extcIDlv2))
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(161340,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(161341,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(161342,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(161343,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(161344,1,tonumber(extcIDlv2))
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 22) then -- Level 2 WEAPON
pUnit:VendorAddItem(170020,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170021,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170022,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170023,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170024,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170025,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170026,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170027,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170028,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170029,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170030,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170031,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170032,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170033,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170034,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170035,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170036,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170037,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170038,1,tonumber(extcIDlv2))
pUnit:VendorAddItem(170039,1,tonumber(extcIDlv2))
player:SendVendorWindow(pUnit)
end

if (intid == 31) then -- Level 3 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160000,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160001,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160002,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160003,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160004,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161005,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161006,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161007,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161008,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161009,1,tonumber(extcIDlv3))
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160010,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160011,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160012,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160013,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160014,1,tonumber(extcIDlv3))
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160025,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160026,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160027,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160028,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160029,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160030,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160031,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160032,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160033,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160034,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161000,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161001,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161002,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161003,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161004,1,tonumber(extcIDlv3))
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160045,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160046,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160047,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160048,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160049,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160050,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160051,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160052,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160053,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160054,1,tonumber(extcIDlv3))
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(160005,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160006,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160007,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160008,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160009,1,tonumber(extcIDlv3))
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160040,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160041,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160042,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160043,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160044,1,tonumber(extcIDlv3))
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160035,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160036,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160037,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160038,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160039,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160040,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161010,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161011,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161012,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161013,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(161014,1,tonumber(extcIDlv3))
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160015,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160016,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160017,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160018,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160019,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160020,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160021,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160022,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160023,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160024,1,tonumber(extcIDlv3))
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160055,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160056,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160057,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160058,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160059,1,tonumber(extcIDlv3))
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(160000,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160001,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160002,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160003,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(160004,1,tonumber(extcIDlv3))
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 32) then -- Level 3 WEAPON
pUnit:VendorAddItem(170056,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170057,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170058,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170059,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170061,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170062,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170063,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170064,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170065,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170066,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170067,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170068,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170069,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170071,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170072,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170073,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170074,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170075,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170076,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(170077,1,tonumber(extcIDlv3))
pUnit:VendorAddItem(171560,1,tonumber(extcIDlv3))
player:SendVendorWindow(pUnit)
end

if (intid == 41) then -- Level 4 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160732,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160733,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160734,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160735,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160736,1,tonumber(extcIDlv4))
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160707,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160708,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160709,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160710,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160711,1,tonumber(extcIDlv4))
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160692,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160693,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160694,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160695,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160696,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160687,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160688,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160689,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160690,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160691,1,tonumber(extcIDlv4))
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160722,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160723,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160724,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160725,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160726,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160717,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160718,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160719,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160720,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160721,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160712,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160713,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160714,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160715,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160716,1,tonumber(extcIDlv4))
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(160677,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160678,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160679,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160680,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160681,1,tonumber(extcIDlv4))
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160682,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160683,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160684,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160685,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160686,1,tonumber(extcIDlv4))
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160702,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160703,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160704,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160705,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160706,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160697,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160698,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160699,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160700,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160701,1,tonumber(extcIDlv4))
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160742,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160743,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160744,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160745,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160746,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160747,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160748,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160749,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160750,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160751,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160772,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160773,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160774,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160775,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160776,1,tonumber(extcIDlv4))
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160727,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160728,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160729,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160730,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160731,1,tonumber(extcIDlv4))
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(160737,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160738,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160739,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160740,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(160741,1,tonumber(extcIDlv4))
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 42) then -- Level 4 WEAPON
pUnit:VendorAddItem(171000,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171001,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171002,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171003,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171004,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171005,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171006,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171007,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171008,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171009,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171010,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171011,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171012,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171013,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171014,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171015,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171016,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171017,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171018,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171019,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171020,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171021,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171022,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171023,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171024,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171025,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171026,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171027,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171028,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171029,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171030,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171031,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171032,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171033,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171034,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171035,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171036,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171037,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171038,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171039,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171040,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171041,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171042,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171043,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171044,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171045,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171046,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171047,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171048,1,tonumber(extcIDlv4))
pUnit:VendorAddItem(171049,1,tonumber(extcIDlv4))
player:SendVendorWindow(pUnit)
end

if (intid == 51) then -- Level 5 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160060,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160061,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160062,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160063,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160064,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160065,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160066,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160067,1,tonumber(extcIDlv5))
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160076,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160077,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160078,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160079,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160080,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160081,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160082,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160083,1,tonumber(extcIDlv5))
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160092,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160093,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160094,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160095,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160096,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160097,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160098,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160099,1,tonumber(extcIDlv5))
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160116,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160117,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160118,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160119,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160120,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160121,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160122,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160123,1,tonumber(extcIDlv5))
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(16068,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16069,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16070,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16071,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16072,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16073,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16074,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(16075,1,tonumber(extcIDlv5))
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160108,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160109,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160110,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160111,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160112,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160113,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160114,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160115,1,tonumber(extcIDlv5))
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160100,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160101,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160102,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160103,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160104,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160105,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160106,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160107,1,tonumber(extcIDlv5))
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160084,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160085,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160086,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160087,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160088,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160089,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160090,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160091,1,tonumber(extcIDlv5))
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160124,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160125,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160126,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160127,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160128,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160129,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160130,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160131,1,tonumber(extcIDlv5))
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(160060,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160061,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160062,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160063,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160064,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160065,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160066,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(160067,1,tonumber(extcIDlv5))
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 52) then -- Level 5 WEAPON
pUnit:VendorAddItem(171300,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171301,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171302,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171303,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171304,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171305,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171306,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171307,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171308,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171309,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171310,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171311,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171312,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171313,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171314,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171315,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171316,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171317,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171318,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171319,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171320,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171321,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171322,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171323,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171324,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171325,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171326,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171327,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171328,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171329,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171330,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171331,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171332,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171333,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171334,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171335,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171336,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171337,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171338,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171339,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171340,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171341,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171342,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171343,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171344,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171345,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171346,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171347,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171348,1,tonumber(extcIDlv5))
pUnit:VendorAddItem(171349,1,tonumber(extcIDlv5))
player:SendVendorWindow(pUnit)
end

if (intid == 61) then -- Level 6 ARMOR
	playerClass = player:GetPlayerClass()
if(playerClass == "Warrior") then -- Warrior Armor
pUnit:VendorAddItem(160132,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160133,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160134,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160135,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160136,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160137,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160138,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160139,1,tonumber(extcIDlv6))
end
if(playerClass == "Rogue") then -- Rogue Armor
pUnit:VendorAddItem(160148,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160149,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160150,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160151,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160152,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160153,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160154,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160155,1,tonumber(extcIDlv6))
end
if(playerClass == "Paladin") then -- Paladin Armor
pUnit:VendorAddItem(160166,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160167,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160168,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160169,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160170,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160171,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160172,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160173,1,tonumber(extcIDlv6))
end
if(playerClass == "Shaman") then -- Shaman Armor
pUnit:VendorAddItem(160190,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160191,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160192,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160193,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160194,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160195,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160196,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160197,1,tonumber(extcIDlv6))
end
if(playerClass == "Hunter") then -- Hunter Armor
pUnit:VendorAddItem(160140,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160141,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160142,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160143,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160144,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160145,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160146,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160147,1,tonumber(extcIDlv6))
end
if(playerClass == "Mage") then -- Mage Armor
pUnit:VendorAddItem(160182,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160183,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160184,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160185,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160186,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160187,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160188,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160189,1,tonumber(extcIDlv6))
end
if(playerClass == "Priest") then -- Priest Armor
pUnit:VendorAddItem(160174,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160175,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160176,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160177,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160178,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160179,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160180,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160181,1,tonumber(extcIDlv6))
end
if(playerClass == "Druid") then -- Druid Armor
pUnit:VendorAddItem(160157,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160158,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160159,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160160,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160162,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160163,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160164,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160165,1,tonumber(extcIDlv6))
end
if(playerClass == "Warlock") then -- Warlock Armor
pUnit:VendorAddItem(160198,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160199,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160200,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160201,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160202,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160203,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160204,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160205,1,tonumber(extcIDlv6))
end
if(playerClass == "Death Knight") then -- DeathKnight Armor
pUnit:VendorAddItem(160132,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160133,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160134,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160135,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160136,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160137,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160138,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(160139,1,tonumber(extcIDlv6))
end
player:SendVendorWindow(pUnit) -- Add the list done
end

if (intid == 62) then -- Level 6 WEAPON
pUnit:VendorAddItem(171400,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171401,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171402,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171403,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171404,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171405,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171406,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171407,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171408,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171409,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171410,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171411,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171412,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171413,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171414,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171415,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171416,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171417,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171418,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171419,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171420,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171421,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171422,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171423,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171424,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171425,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171426,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171427,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171428,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171429,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171430,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171431,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171432,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171433,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171434,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171435,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171436,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171437,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171438,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171439,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171440,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171441,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171442,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171443,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171444,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171445,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171446,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171447,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171448,1,tonumber(extcIDlv6))
pUnit:VendorAddItem(171449,1,tonumber(extcIDlv6))
player:SendVendorWindow(pUnit)
end

if (intid == 9000) then
return Armor_OnGossip(pUnit,event,player)
end
end

RegisterUnitGossipEvent(npcid, 1, "Armor_OnGossip")
RegisterUnitGossipEvent(npcid, 2, "Armor_OnSelect")