
local npc_id = 130008

local npcnamefunc1 = "Pontifex1"
local npcnamefunc2 = "Pontifex2"
local npcnamefunc3 = "Pontifex3"

local npcspellname1 = "ponti1"
local npcspellname2 = "ponti2"
local npcspellname3 = "ponti3"
local npcspellname4 = "ponti4"

function npcnamefunc1(pUnit, Event, pPlayer)
pUnit:EquipWeapons(32837, 32838, 0)
pUnit:CastSpellOnTarget(6789, pPlayer)
pUnit:RegisterEvent(npcspellname1, 10000, 0)
pUnit:RegisterEvent(npcspellname2, 6000, 0)
pUnit:RegisterEvent(npcspellname3, 5000,0)
pUnit:RegisterEvent(npcspellname4, 8000,0)
end

function npcspellname1(pUnit, Event) -- DeathCoil
pUnit:CastSpellOnTarget(6789, pUnit:GetMainTank())
end
function npcspellname2(pUnit, Event) -- ShadowBolt
pUnit:CastSpellOnTarget(11660, pUnit:GetMainTank())
end
function npcspellname3(pUnit, Event) -- Backstab
pUnit:CastSpellOnTarget(48657, pUnit:GetMainTank())
end
function npcspellname4(pUnit, Event) -- Fel Lightning
pUnit:CastSpellOnTarget(67030, pUnit:GetMainTank())
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