
local npc_id = 130041

local npcnamefunc1 = "Scorpio1"
local npcnamefunc2 = "Scorpio2"
local npcnamefunc3 = "Scorpio3"

local npcspellname1 = "scorp1"
local npcspellname2 = "scorp2"
local npcspellname3 = "scorp3"
local npcspellname4 = "scorp4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(27263, pPlayer)
pUnit:RegisterEvent(npcspellname1, 10000, 0)
pUnit:RegisterEvent(npcspellname2, 6000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 10000,0)
end

function npcspellname1(pUnit, Event) -- GustOfWind
pUnit:CastSpellOnTarget(6982, pUnit:GetMainTank())
end
function npcspellname2(pUnit, Event) -- shadowburn
pUnit:CastSpellOnTarget(47827, pUnit:GetMainTank())
end
function npcspellname3(pUnit, Event) -- Backstab
pUnit:CastSpellOnTarget(48657, pUnit:GetMainTank())
end
function npcspellname4(pUnit, Event) -- RainOfFire
pUnit:CastSpellOnTarget(47820, pUnit:GetMainTank())
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