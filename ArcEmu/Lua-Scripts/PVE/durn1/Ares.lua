
local npc_id = 130005

local npcname = "Ares"

local npcsubname = ""..npcname..""

function npcsubname_OnCombat(pUnit, Event, pPlayer)
pUnit:CastSpellOnTarget(27263, pPlayer)
pUnit:RegisterEvent("npcsubname_spell1", 10000, 0)
pUnit:RegisterEvent("npcsubname_spell2", 6000, 0)
pUnit:RegisterEvent("npcsubname_spell3", 5000,0)
end

function npcsubname_spell1(pUnit, Event) -- air burst
pUnit:CastSpellOnTarget(32014, pUnit:GetMainTank())
end
function npcsubname_spell2(pUnit, Event) -- shadowburn
pUnit:CastSpellOnTarget(47827, pUnit:GetMainTank())
end
function npcsubname_spell3(pUnit, Event) -- backstacb
pUnit:CastSpellOnTarget(48657, pUnit:GetMainTank())
end

function npcsubname_OnLeaveCombat(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
pUnit:Despawn(100, 1000)
end

function npcsubname_OnDeath(pUnit, Event, pPlayer)
pUnit:RemoveEvents()
end

RegisterUnitEvent(npc_id, 1, "npcsubname_OnCombat")
RegisterUnitEvent(npc_id, 2, "npcsubname_OnLeaveCombat")
RegisterUnitEvent(npc_id, 4, "npcsubname_OnDeath")