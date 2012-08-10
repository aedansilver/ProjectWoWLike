Open up objectmgr.cpp and find this:
Code: line 2104

itemTemplate.ItemStat[i].ItemStatValue = int32(fields[29 + i*2].GetInt16());

Replace!!!

itemTemplate.ItemStat[i].ItemStatValue = int32(fields[29 + i*2].GetInt32());
