	-- Start function --	
	local npcid = 70000
	
	local npcname = "IllidanStormrage"
	
	local red1 = "|cffED6C6C"
	
	local FlameCrashCD = 10000 -- the cooldown time of Flame Crash

	local ShearCD = 16000 -- the cooldown time of Flame Crash


function npcname_OnEnterCombat(pUnit,Event)
	pUnit:PlaySoundToSet(11466) -- You are not prepared.
	pUnit:SendChatMessage(14, 0, "You are not prepared.")
	pUnit:RegisterEvent("npcname_Phasing", 500, 0)
end
function npcname_Phasing(pUnit,Event)
	if pUnit:GetHealthPct() < 90 then
		pUnit:RemoveEvents()
			return npcname_PhaseOne(pUnit,Event)	
	end
end
   
 function npcname_PhaseOne(pUnit,Event)
			pUnit:CastSpellOnTarget(40265,pUnit:GetTarget())
		pUnit:SendChatMessage(14, 0, "I can feel your hatred.")
		pUnit:PlaySoundToSet(11467) -- I can feel your hatred.
	pUnit:RegisterEvent("npcname_Periodic_FlameCrash", tonumber(FlameCrashCD), 0)
	pUnit:RegisterEvent("npcname_Periodic_Shear", tonumber(ShearCD), 0)
pUnit:RegisterEvent("npcname_Phasing_2nd", 500, 0)
end

function npcname_Periodic_FlameCrash(pUnit,Event)
 pUnit:CastSpellOnTarget(40832,pUnit:GetMainTank())
pUnit:PlaySoundToSet(11469) -- You know nothing of power.
 end
 
 function npcname_Periodic_Shear(pUnit,Event)
 pUnit:FullCastSpellOnTarget(41032,pUnit:GetMainTank())
 end
 
 function npcname_Phasing_2nd(pUnit,Event)
 if pUnit:GetHealthPct() <= 64 then
		pUnit:RemoveEvents()
		pUnit:Emote(254, 0) -- Lift Off
		pUnit:PlaySoundToSet(11470)
		pUnit:SendChatMessage(14, 0, "Feel the hatred of 10,000 years.")
			return npcname_SpawnFlames(pUnit,Event)	
	end
 end
 
 function npcname_SpawnFlames(pUnit,Event)
 pUnit:RegisterEvent("npcname_Enrage", 1000, 0)
 end
 
  function npcname_Enrage(pUnit,Event)
  pUnit:RemoveEvents()
  pUnit:CastSpell(40683)
  pUnit:SetScale(1.4)
  pUnit:RegisterEvent("npcname_Periodic_FlameCrash", tonumber(FlameCrashCD), 0)
	pUnit:RegisterEvent("npcname_Periodic_Shear", tonumber(ShearCD), 0)
    pUnit:RegisterEvent("npcname_unEnrage", 19000, 0)
	pUnit:RegisterEvent("npcname_Phasing_3", 100, 0)
  end
 
 function npcname_unEnrage(pUnit,Event)
  pUnit:SetScale(1)
  end
  
  function npcname_Phasing_3(pUnit,Event)
   if pUnit:GetHealthPct() <= 30 then
   pUnit:RemoveEvents()
   pUnit:PlaySoundToSet(11481)
	pUnit:SendChatMessage(14, 0, "Stare into the eyes of the betrayer.")
	pUnit:RegisterEvent("npcname_Periodic_FlameCrash", tonumber(FlameCrashCD), 0)
	pUnit:RegisterEvent("npcname_Periodic_Shear", tonumber(ShearCD), 0)
		end
  end
  
  function npcname_OnLeaveCombat(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
pUnit:PlaySoundToSet(11472)
	pUnit:SendChatMessage(14, 0, "This is to easy.")
end

function npcname_OnKilledTarget(pUnit, Event, pDied)
pUnit:RemoveEvents()
pUnit:PlaySoundToSet(11473)
	pUnit:SendChatMessage(14, 0, "Who shall be next to taste my blades?")
end

function npcname_OnDeath(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
pUnit:PlaySoundToSet(11478)
pUnit:Emote(407, 0)
pUnit:SendChatMessage(14, 0, "You have won... Maiev. But the huntress... is nothing without the hunt. You... are nothing... without me.")
end

RegisterUnitEvent(npcid, 1, "npcname_OnEnterCombat")
RegisterUnitEvent(npcid, 2, "npcname_OnLeaveCombat")
RegisterUnitEvent(npcid, 3, "npcname_OnKilledTarget")
RegisterUnitEvent(npcid, 4, "npcname_OnDeath")
