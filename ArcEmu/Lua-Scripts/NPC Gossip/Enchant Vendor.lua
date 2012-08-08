--CREDITS TO ROCHET2 FOR RE-CODING & AK47SIGH FOR RE-ANSAMBLING

local npcid = 90002

local mgcost = 600

local logondb = "account"

local mg_db = "magic_gold"

local T = {
	["Menu"] = {
		{"Headpiece", 0},
		{"Shoulders", 2},
		{"Chest", 4},
		{"Legs", 6},
		{"Boots", 7},
		{"Bracers", 8},
		{"Gloves", 9},
		{"Cloak", 14};
	},
	
	[0] = { -- Headpiece
		{"Arcanum of Burning Mysteries", 3820, false},
		{"Arcanum of Blissful Mending", 3819, false},
		{"Arcanum of the Stalward Protector", 3818, false},
		{"Arcanum of Torment", 3817, false},
		{"Arcanum of the Savage Gladiator", 3842, false},
		{"Arcanum of Triumph", 3795, false},
		{"Arcanum of Dominance", 3797, false};
	},

	[2] = { -- Shoulders
		{"Inscription of Triumph", 3793, false},
		{"Inscription of Dominance", 3794, false},
		{"Greater Inscription of the Gladiator", 3852, false},
		{"Greater Inscription of the Axe", 3808, false},
		{"Greater Inscription of the Crag", 3809, false},
		{"Greater Inscription of the Pinnacle", 3811, false},
		{"Greater Inscription of the Storm", 3810, false};
	},

	[4] = { -- Chest
		{"Enchant Chest - Powerful Stats", 3832, false},
		{"Enchant Chest - Super Health", 3297, false},
		{"Enchant Chest - Greater Mana Restoration", 2381, false},
		{"Enchant Chest - Exceptional Resilience", 3245, false},
		{"Enchant Chest - Greater Defense", 1953, false};
	},

	[6] = { -- Legs
		{"Earthen Leg Armor", 3853, false},
		{"Frosthide Leg Armor", 3822, false},
		{"Icescale Leg Armor", 3823, false},
		{"Brilliant Spellthread", 3719, false},
		{"Sapphire Spellthread", 3721, false};
	},	

	[7] = { -- Boots
		{"Enchant Boots - Greater Assault", 1597, false},
		{"Enchant Boots - Tuskars Vitality", 3232, false},
		{"Enchant Boots - Superior Agility", 983, false},
		{"Enchant Boots - Greater Spirit", 1147, false},
		{"Enchant Boots - Greater Vitality", 3244, false},
		{"Enchant Boots - Icewalker", 3826, false},
		{"Enchant Boots - Greater Fortitude", 1075, false};
	},

	[8] = { -- Bracers
		{"Enchant Bracers - Major Stamina", 3850, false},
		{"Enchant Bracers - Superior Spellpower", 2332, false},
		{"Enchant Bracers - Greater Assault", 3845, false},
		{"Enchant Bracers - Major Spirit", 1147, false},
		{"Enchant Bracers - Expertise", 3231, false},
		{"Enchant Bracers - Greater Stats", 2661, false},
		{"Enchant Bracers - Exceptional Intellect", 1119, false};
	},

	[9] = { -- Gloves
		{"Enchant Gloves - Greater Blasting", 3249, false},
		{"Enchant Gloves - Armsman", 3253, false},
		{"Enchant Gloves - Crusher", 1603, false},
		{"Enchant Gloves - Agility", 3222, false},
		{"Enchant Gloves - Precision", 3234, false},
		{"Enchant Gloves - Expertise", 3231, false},
		{"Enchant Gloves - Exceptional Spellpower", 3246, false};
	},

	[14] = { -- Cloak
		{"Enchant Cloak - Shadow Armor", 3256, false},
		{"Enchant Cloak - Wisdom", 3296, false},
		{"Enchant Cloak - Titan Weave", 1951, false},
		{"Enchant Cloak - Greater Speed", 3831, false},
		{"Enchant Cloak - Mighty Armor", 3294, false},
		{"Enchant Cloak - Major Agility", 1099, false},
		{"Enchant Cloak - Spell Piercing", 1262, false};
	},
};
local pVar = {};

function Enchanter(unit, _, plr)
	pVar[plr:GetName()] = nil;
	-- pVar[plr:GetName()] = {};

	unit:GossipCreateMenu(100001, plr, 0)
	unit:GossipMenuAddItem(8,"Weapon Enchant Vendor",7000,0)
	for _, v in ipairs(T["Menu"]) do
		unit:GossipMenuAddItem(2, "Enchant >> "..v[1].."|r", v[2], 0)
	end
	unit:GossipSendMenu(plr)
end

function EnchanterSelect(unit, _, plr, id, intid, code)
local GetMGc = WorldDBQuery("SELECT `"..mg_db.."` FROM "..logondb..".accounts WHERE `login` = '"..plr:GetAccountName().."';");
MGc = GetMGc:GetColumn(0):GetLong()

	if (intid == 7000) then
	plr:SendVendorWindow(unit)
	return
	end
	if (intid < 500) then
		unit:GossipCreateMenu(100001, plr, 0)
		unit:GossipMenuAddItem(7, "|cff6E353AReturn (Notice:this service costs "..mgcost.." MG points)|r", 500, 0)
		local ID = intid
		local f
		if(intid == 161 or intid == 151) then
			ID = math.floor(intid/10)
			f = true
		end
		pVar[plr:GetName()] = intid;
		if(T[ID]) then
			for i, v in ipairs(T[ID]) do
				if((not f and not v[3]) or (f and v[3])) then
					unit:GossipMenuAddItem(2, ""..v[1].."|r", v[2], 0)
				end
			end
		end
		-- unit:GossipMenuAddItem(3, "[Back]", 500, 0)
		unit:GossipSendMenu(plr)
	elseif (intid == 500) then
		Enchanter(unit, _, plr)
	elseif (intid >= 900) then
		local ID = pVar[plr:GetName()]
		if(ID == 161 or ID == 151) then
			ID = math.floor(ID/10)
		end
		for k, v in pairs(T[ID]) do
			if v[2] == intid then
				local item = plr:GetEquippedItemBySlot(ID)
				if item then
					if v[3] then
						local sql = "SELECT * FROM items WHERE entry = "..item:GetEntryId()
						local result = WorldDBQuery(sql)
						local WType = result:GetColumn(2):GetUShort()
						if pVar[plr:GetName()] == 151 then
							if(WType == 1 or WType == 5 or WType == 6 or WType == 8 or WType == 10) then
								item:RemoveEnchantment(0,0)
								item:AddEnchantment(intid, 0, 0)
							else
								plr:SendAreaTriggerMessage("You do not have a Two-Handed Weapon equipped!")
							end	
						elseif pVar[plr:GetName()] == 161 then
							if(WType == 6) then
								item:RemoveEnchantment(0,0)
								item:AddEnchantment(intid, 0, 0)
							else
								plr:SendAreaTriggerMessage("You do not have a Shield equipped!")
							end
						end
					else
					if(MGc > mgcost) then
						item:RemoveEnchantment(0,0)
						item:AddEnchantment(intid, 0, 0)
						plr:SendAreaTriggerMessage("|cff00ff00Item Succesfuly Enchanted.|r")
						CharDBQuery('UPDATE accounts SET `'..mg_db..'`=`'..mg_db..'`-"'..mgcost..'" WHERE `login`="'..plr:GetAccountName()..'"');
						return Enchanter(unit, _, plr)
						else
						plr:SendAreaTriggerMessage("|cffFF0000Not enough Magic Gold|r. need: "..mgcost.."!")
						return Enchanter(unit, _, plr)
						end
					end
				else
					plr:SendAreaTriggerMessage("You have no item to enchant in the selected slot!")
				end
			end
		end
		EnchanterSelect(unit, nil, plr, id, pVar[plr:GetName()], nil)
		-- plr:GossipComplete()
		-- pVar[plr:GetName()] = nil;
	end
end

RegisterUnitGossipEvent(npcid, 1, Enchanter)
RegisterUnitGossipEvent(npcid, 2, EnchanterSelect)