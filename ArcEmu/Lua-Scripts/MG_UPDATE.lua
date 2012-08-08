


local update_time = "300000" 					-- in milliseconds default 5 mins

local acc_db = "account"

local table_name = "magic_gold"

local vip_table = "member_type"

local rateMG = 10

local rateVip1 = 15
local rateVip2 = 25
local rateVip3 = 35
local rateVip4 = 45
local rateVip5 = 55
local rateVip6 = 65



function World_MGUpdate()

SendWorldMessage("|cff00ff00 Congratulations, you have received magic gold for your time spent online, vip gets double.", 2) -- chattbox


WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateMG.."' WHERE `"..vip_table.."`='0' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip1.."' WHERE `"..vip_table.."`='1' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip2.."' WHERE `"..vip_table.."`='2' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip3.."' WHERE `"..vip_table.."`='3' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip4.."' WHERE `"..vip_table.."`='4' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip5.."' WHERE `"..vip_table.."`='5' AND `online`='1' ;");

WorldDBQuery("UPDATE "..acc_db..".accounts SET `"..table_name.."`=`"..table_name.."`+'"..rateVip6.."' WHERE `"..vip_table.."`='6' AND `online`='1' ;");


end


RegisterTimedEvent("World_MGUpdate", update_time, 0)