
local npc_id = 130007

local npcnamefunc1 = "Leo1"
local npcnamefunc2 = "Leo2"
local npcnamefunc3 = "Leo3"

local npcspellname1 = "lio1"
local npcspellname2 = "lio2"
local npcspellname3 = "lio3"
local npcspellname4 = "lio4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(25464, pPlayer)
pUnit:RegisterEvent(npcspellname1, 10000, 0)
pUnit:RegisterEvent(npcspellname2, 6000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 6000,0)
end

function npcspellname1(pUnit, Event) -- GustOfWind
pUnit:CastSpell(6982)
end
function npcspellname2(pUnit, Event) -- FelLightning
pUnit:CastSpellOnTarget(67030, pUnit:GetMainTank())
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