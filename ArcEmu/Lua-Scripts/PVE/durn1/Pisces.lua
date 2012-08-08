
local npc_id = 130006

local npcnamefunc1 = "Pisces1"
local npcnamefunc2 = "Pisces2"
local npcnamefunc3 = "Pisces3"

local npcspellname1 = "pisc1"
local npcspellname2 = "pisc2"
local npcspellname3 = "pisc3"
local npcspellname4 = "pisc4"

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
function npcspellname2(pUnit, Event) -- FrostShock
pUnit:CastSpellOnTarget(25464, pUnit:GetMainTank())
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