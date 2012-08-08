local npc_id = 130042

local npcname = "Maladeus"

local npcsubname = ""..npcname..""

function npcsubname_OnCombat(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(25464, pPlayer)
pUnit:RegisterEvent("npcsubname_GustOfWind", 14000, 0)
pUnit:RegisterEvent("npcsubname_FrostShock", 7000, 0)
pUnit:RegisterEvent("npcsubname_ArcaneBarrage", 5000,0)
end

function npcsubname_GustOfWind(pUnit, Event)
pUnit:CastSpell(6982)
end
function npcsubname_FrostShock(pUnit, Event)
pUnit:CastSpellOnTarget(25464, pUnit:GetMainTank())
end
function npcsubname_ArcaneBarrage(pUnit, Event)
pUnit:CastSpellOnTarget(65799, pUnit:GetMainTank())
end

function npcsubname_OnLeaveCombat(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
pUnit:Despawn(100, 2000)
end

function npcsubname_OnKilledTarget(pUnit, Event, pDied)
pUnit:CastSpell(15716) -- Enrage
end

function npcsubname_OnDeath(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
end

RegisterUnitEvent(npc_id, 1, "npcsubname_OnCombat")
RegisterUnitEvent(npc_id, 2, "npcsubname_OnLeaveCombat")
RegisterUnitEvent(npc_id, 3, "npcsubname_OnKilledTarget")
RegisterUnitEvent(npc_id, 4, "npcsubname_OnDeath")



local npc_id = 130042

local npcnamefunc1 = "Cancer1"
local npcnamefunc2 = "Cancer2"
local npcnamefunc3 = "Cancer3"

local npcspellname1 = "cance1"
local npcspellname2 = "cance2"
local npcspellname3 = "cance3"
local npcspellname4 = "cance4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(25464, pPlayer)
pUnit:RegisterEvent(npcspellname1, 10000, 0)
pUnit:RegisterEvent(npcspellname2, 8000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 16000,0)
end

function npcspellname1(pUnit, Event) -- GustOfWind
pUnit:CastSpell(6982)
end
function npcspellname2(pUnit, Event) -- Frostshock
pUnit:CastSpellOnTarget(25464, pUnit:GetMainTank())
end
function npcspellname3(pUnit, Event) -- Backstab
pUnit:CastSpellOnTarget(48657, pUnit:GetMainTank())
end
function npcspellname4(pUnit, Event) -- Expose Armor
pUnit:CastSpellOnTarget(60842, pUnit:GetMainTank())
end

function npcnamefunc2(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
pUnit:Despawn(100, 1000)
end

function npcnamefunc3(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
end

RegisterUnitEvent(npc_id, 1, npcnamefunc1)
RegisterUnitEvent(npc_id, 2, npcnamefunc2)
RegisterUnitEvent(npc_id, 4, npcnamefunc3)
