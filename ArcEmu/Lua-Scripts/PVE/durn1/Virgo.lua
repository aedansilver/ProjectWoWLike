
local npc_id = 130010

local npcnamefunc1 = "Virgo1"
local npcnamefunc2 = "Virgo2"
local npcnamefunc3 = "Virgo3"

local npcspellname1 = "virg1"
local npcspellname2 = "virg2"
local npcspellname3 = "virg3"
local npcspellname4 = "virg4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(27263, pPlayer)
pUnit:RegisterEvent(npcspellname1, 16000, 0)
pUnit:RegisterEvent(npcspellname2, 6000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 6000,0)
end

function npcspellname1(pUnit, Event) -- Whirlwind
pUnit:CastSpellOnTarget(41058, pUnit:GetMainTank())
end
function npcspellname2(pUnit, Event) -- shadowburn
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