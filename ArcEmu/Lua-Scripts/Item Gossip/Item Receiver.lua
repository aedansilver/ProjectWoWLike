-- CREDITS TO:
-- ROCHET2 FOR CODING
-- AK47SIGH FOR RE-ANSAMBLING

local itemid = 99999
local donate_table = "donate_show"
local T = {}

function T.Load(pPlayer)
local GetPlrGuid = CharDBQuery("SELECT guid FROM characters WHERE name='"..tostring(pPlayer:GetName()).."';")
local PlrGuid = GetPlrGuid:GetColumn(0):GetLong()
	T[tostring(pPlayer:GetGUID())] = {}
	local Query = CharDBQuery("SELECT itemid, itemcount FROM "..donate_table.." WHERE plrguid='"..tostring(PlrGuid).."';")
	-- pPlayer:SendBroadcastMessage(tostring(PlrGuid))
	if(Query == nil) then
		return
	else
		for i = 1, Query:GetRowCount() do
			T[tostring(pPlayer:GetGUID())][i] = {Query:GetColumn(0):GetLong(), Query:GetColumn(1):GetString()}
			Query:NextRow()
		end
	end
end

function T.ItemReceiver_Trigger(item, event, pPlayer)
pPlayer:FullCastSpell(33208)
	item:GossipCreateMenu(100001, pPlayer, 0)
	item:GossipMenuAddItem(0, "Return", 10000, 0)
	T.Load(pPlayer)
	local GUID = tostring(pPlayer:GetGUID())
	for k,v in ipairs(T[GUID]) do
		item:GossipMenuAddItem(2, v[1], k, 0, '', 0)
		if(k == 29) then
			item:GossipMenuAddItem(7, " >> Next page", #T[GUID]+2, 0, '', 0)
			item:GossipMenuAddItem(7, " ++ Jump to page", #T[GUID]+math.floor(#T[GUID]/30)+2, 1, 'Jump to a page 1-'..math.floor(#T[GUID]/30)+1, 0)
			break
		end
	end
	item:GossipSendMenu(pPlayer)
end

function T.ItemReceiver_OnSelect(item, event, pPlayer, id, intid, code)

	if(intid == 10000) then
	pPlayer:GossipComplete()
	else
	-- print(intid)
	local GUID = tostring(pPlayer:GetGUID())
	if(intid == #T[GUID]+1) then
		T.ItemReceiver_Trigger(item, event, pPlayer)
		return
	elseif(intid == #T[GUID]+math.floor(#T[GUID]/30)+2) then
		local code = tonumber(code)
		local A = false
		if(code == nil or code <= 0) then
			T.ItemReceiver_Trigger(item, event, pPlayer)
			return
		end
		local code = math.ceil(code)
		if(code > math.floor(#T[GUID]/30)+1) then
			T.ItemReceiver_Trigger(item, event, pPlayer)
			return
		end
		T.ItemReceiver_OnSelect(item, event, pPlayer, 0, #T[GUID]+code, 0)
		return
	elseif(intid > #T[GUID]) then
		item:GossipCreateMenu(100001, pPlayer, 0)
		local X = (30*(intid-#T[GUID]-1))
		for i = X, #T[GUID] do
			item:GossipMenuAddItem(0, T[GUID][i][2], i, 0, '', 0)
			if(i-X == 29) then
				if(i < #T[GUID]) then
					item:GossipMenuAddItem(7, " >> Next page", intid+1, 0, '', 0)
				end
				break
			end
		end
		item:GossipMenuAddItem(7, " << Prev page", intid-1, 0, '', 0)
		item:GossipSendMenu(pPlayer)
	else
GetPlrGuid = CharDBQuery("SELECT guid FROM characters WHERE name='"..tostring(pPlayer:GetName()).."';")
PlrGuid = GetPlrGuid:GetColumn(0):GetLong()
Query2 = CharDBQuery("SELECT itemcount FROM "..donate_table.." WHERE plrguid='"..tostring(PlrGuid).."' and itemid='"..T[GUID][intid][1].."';")
itmc = Query2:GetColumn(0):GetLong()
			pPlayer:AddItem(T[GUID][intid][1], tonumber(itmc))
			CharDBQuery("DELETE FROM "..donate_table.." WHERE itemid='"..T[GUID][intid][1].."' and plrguid='"..tostring(PlrGuid).."' LIMIT 1;")

		if(intid < 30) then
			T.ItemReceiver_Trigger(item, event, pPlayer)
		else
			T.ItemReceiver_OnSelect(item, event, pPlayer, 0, math.floor(intid/30)+#T[GUID]+1, 0)
		end
	end
end
end
RegisterItemGossipEvent(itemid, 1, T.ItemReceiver_Trigger)
RegisterItemGossipEvent(itemid, 2, T.ItemReceiver_OnSelect) 