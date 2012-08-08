


local update_time = "600000" -- in milliseconds default 10 (600000) mins

local event_cd_table = "gm_event_cds"



function Event_CDS()

CharDBQuery("UPDATE "..event_cd_table.." SET `cd_event`=`cd_event`-'10' WHERE `cd_event` > '0';");


end


RegisterTimedEvent("Event_CDS", update_time, 0)