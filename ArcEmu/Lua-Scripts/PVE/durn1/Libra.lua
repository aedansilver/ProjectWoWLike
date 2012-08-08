
local npc_id = 130011

local npcnamefunc1 = "Libra1"
local npcnamefunc2 = "Libra2"
local npcnamefunc3 = "Libra3"

local npcspellname1 = "libr1"
local npcspellname2 = "libr2"
local npcspellname3 = "libr3"
local npcspellname4 = "libr4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(27263, pPlayer)
pUnit:RegisterEvent(npcspellname1, 10000, 0)
pUnit:RegisterEvent(npcspellname2, 6000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 6000,0)
end

function npcspellname1(pUnit, Event) -- GustOfWind
pUnit:CastSpell(6982)
end
function npcspellname2(pUnit, Event) -- Shadowburn
pUnit:CastSpellOnTarget(47827, pUnit:GetMainTank())
end
function npcspellname3(pUnit, Event) -- Backstab
pUnit:CastSpellOnTarget(48657, pUnit:GetMainTank())
end
function npcspellname4(pUnit, Event) -- Shadowbolt
pUnit:CastSpellOnTarget(11660, pUnit:GetMainTank())
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