From e69d1f7cc4732fdbcaecd8dcd69c810a874999e5 Mon Sep 17 00:00:00 2001
From: Martin Vladimirov <nansin_@abv.bg>
Date: Thu, 9 Aug 2012 12:37:48 +0300
Subject: [PATCH] Add Vip-Account Patch
Credits to Lasoto for updating this script
---
 src/server/authserver/Server/AuthSocket.cpp        |    5 ++++-
 src/server/game/Entities/Player/Player.cpp         |    6 +++++-
 src/server/game/Miscellaneous/Formulas.h           |    4 +++-
 src/server/game/Server/WorldSession.cpp            |    4 ++--
 src/server/game/Server/WorldSession.h              |    4 +++-
 src/server/game/Server/WorldSocket.cpp             |   15 +++++++++++++--
 src/server/game/World/World.cpp                    |   10 +++++++---
 src/server/game/World/World.h                      |    3 +++
 .../Database/Implementation/LoginDatabase.cpp      |    1 +
 .../shared/Database/Implementation/LoginDatabase.h |    1 +
 src/server/worldserver/worldserver.conf.dist       |    8 ++++++++
 11 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/src/server/authserver/Server/AuthSocket.cpp b/src/server/authserver/Server/AuthSocket.cpp
index 0794d9a..a23f984 100755
--- a/src/server/authserver/Server/AuthSocket.cpp
+++ b/src/server/authserver/Server/AuthSocket.cpp
@@ -357,7 +357,10 @@ bool AuthSocket::_HandleLogonChallenge()
 
     // Verify that this IP is not in the ip_banned table
     LoginDatabase.Execute(LoginDatabase.GetPreparedStatement(LOGIN_DEL_EXPIRED_IP_BANS));
-
+	
+    LoginDatabase.Execute(
+        LoginDatabase.GetPreparedStatement(LOGIN_SET_ACCOUNT_PREMIUM)
+            );
     const std::string& ip_address = socket().getRemoteAddress();
     PreparedStatement *stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_IP_BANNED);
     stmt->setString(0, ip_address);
diff --git a/src/server/game/Entities/Player/Player.cpp b/src/server/game/Entities/Player/Player.cpp
index 72c5005..53c5097 100755
--- a/src/server/game/Entities/Player/Player.cpp
+++ b/src/server/game/Entities/Player/Player.cpp
@@ -6845,7 +6845,8 @@ void Player::CheckAreaExploreAndOutdoor()
                 {
                     XP = uint32(sObjectMgr->GetBaseXP(areaEntry->area_level)*sWorld->getRate(RATE_XP_EXPLORE));
                 }
-
+                if(GetSession()->IsPremium())
+                XP *= sWorld->getRate(RATE_XP_EXPLORE_PREMIUM);
                 GiveXP(XP, NULL);
                 SendExplorationExperience(area, XP);
             }
@@ -15093,6 +15094,9 @@ void Player::RewardQuest(Quest const* quest, uint32 reward, Object* questGiver,
     Unit::AuraEffectList const& ModXPPctAuras = GetAuraEffectsByType(SPELL_AURA_MOD_XP_QUEST_PCT);
     for (Unit::AuraEffectList::const_iterator i = ModXPPctAuras.begin(); i != ModXPPctAuras.end(); ++i)
         AddPctN(XP, (*i)->GetAmount());
+		
+    if (GetSession()->IsPremium())
+        XP *= sWorld->getRate(RATE_XP_QUEST_PREMIUM);
 
     int32 moneyRew = 0;
     if (getLevel() < sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL))
diff --git a/src/server/game/Miscellaneous/Formulas.h b/src/server/game/Miscellaneous/Formulas.h
index dac5b1e..00d5cfa 100755
--- a/src/server/game/Miscellaneous/Formulas.h
+++ b/src/server/game/Miscellaneous/Formulas.h
@@ -178,7 +178,9 @@ namespace Trinity
                         gain *= 2;
                 }
 
-                gain = uint32(gain * sWorld->getRate(RATE_XP_KILL));
+	    float premium_rate = player->GetSession()->IsPremium() ? sWorld->getRate(RATE_XP_KILL_PREMIUM) : 1.0f;
+
+            return uint32(gain*sWorld->getRate(RATE_XP_KILL)*premium_rate);
             }
 
             sScriptMgr->OnGainCalculation(gain, player, u);
diff --git a/src/server/game/Server/WorldSession.cpp b/src/server/game/Server/WorldSession.cpp
index 118b0d6..3f68f2c 100755
--- a/src/server/game/Server/WorldSession.cpp
+++ b/src/server/game/Server/WorldSession.cpp
@@ -88,9 +88,9 @@ bool WorldSessionFilter::Process(WorldPacket* packet)
 }
 
 /// WorldSession constructor
-WorldSession::WorldSession(uint32 id, WorldSocket* sock, AccountTypes sec, uint8 expansion, time_t mute_time, LocaleConstant locale, uint32 recruiter, bool isARecruiter):
+WorldSession::WorldSession(uint32 id, WorldSocket* sock, AccountTypes sec, bool ispremium, uint8 expansion, time_t mute_time, LocaleConstant locale, uint32 recruiter, bool isARecruiter):
 m_muteTime(mute_time), m_timeOutTime(0), _player(NULL), m_Socket(sock),
-_security(sec), _accountId(id), m_expansion(expansion), _logoutTime(0),
+_security(sec), _ispremium(ispremium), _accountId(id), m_expansion(expansion), _logoutTime(0),
 m_inQueue(false), m_playerLoading(false), m_playerLogout(false),
 m_playerRecentlyLogout(false), m_playerSave(false),
 m_sessionDbcLocale(sWorld->GetAvailableDbcLocale(locale)),
diff --git a/src/server/game/Server/WorldSession.h b/src/server/game/Server/WorldSession.h
index b8b0953..7018441 100755
--- a/src/server/game/Server/WorldSession.h
+++ b/src/server/game/Server/WorldSession.h
@@ -215,7 +215,7 @@ class CharacterCreateInfo
 class WorldSession
 {
     public:
-        WorldSession(uint32 id, WorldSocket* sock, AccountTypes sec, uint8 expansion, time_t mute_time, LocaleConstant locale, uint32 recruiter, bool isARecruiter);
+        WorldSession(uint32 id, WorldSocket* sock, AccountTypes sec, bool ispremium, uint8 expansion, time_t mute_time, LocaleConstant locale, uint32 recruiter, bool isARecruiter);
         ~WorldSession();
 
         bool PlayerLoading() const { return m_playerLoading; }
@@ -244,6 +244,7 @@ class WorldSession
         void SendClientCacheVersion(uint32 version);
 
         AccountTypes GetSecurity() const { return _security; }
+        bool IsPremium() const { return _ispremium; }		
         uint32 GetAccountId() const { return _accountId; }
         Player* GetPlayer() const { return _player; }
         char const* GetPlayerName() const;
@@ -956,6 +957,7 @@ class WorldSession
         AccountTypes _security;
         uint32 _accountId;
         uint8 m_expansion;
+        bool _ispremium;		
 
         typedef std::list<AddonInfo> AddonsList;
 
diff --git a/src/server/game/Server/WorldSocket.cpp b/src/server/game/Server/WorldSocket.cpp
index 5b04c3d..9856182 100755
--- a/src/server/game/Server/WorldSocket.cpp
+++ b/src/server/game/Server/WorldSocket.cpp
@@ -788,6 +788,7 @@ int WorldSocket::HandleAuthSession(WorldPacket& recvPacket)
     //uint8 expansion = 0;
     LocaleConstant locale;
     std::string account;
+	bool isPremium = false;	
     SHA1Hash sha;
     BigNumber v, s, g, N;
     WorldPacket packet, SendAddonPacked;
@@ -939,7 +940,17 @@ int WorldSocket::HandleAuthSession(WorldPacket& recvPacket)
         sLog->outError(LOG_FILTER_GENERAL, "WorldSocket::HandleAuthSession: Sent Auth Response (Account banned).");
         return -1;
     }
-
+	
+    QueryResult premresult =
+        LoginDatabase.PQuery ("SELECT 1 "
+                                "FROM account_premium "
+                                "WHERE id = '%u' "
+                                "AND active = 1",
+                                id);
+    if (premresult) // if account premium
+    {
+        isPremium = true;
+    }
     // Check locked state for server
     AccountTypes allowedAccountType = sWorld->GetPlayerSecurityLimit();
     sLog->outDebug(LOG_FILTER_NETWORKIO, "Allowed Level: %u Player Level %u", allowedAccountType, AccountTypes(security));
@@ -1003,7 +1014,7 @@ int WorldSocket::HandleAuthSession(WorldPacket& recvPacket)
     LoginDatabase.Execute(stmt);
 
     // NOTE ATM the socket is single-threaded, have this in mind ...
-    ACE_NEW_RETURN (m_Session, WorldSession (id, this, AccountTypes(security), expansion, mutetime, locale, recruiter, isRecruiter), -1);
+    ACE_NEW_RETURN (m_Session, WorldSession (id, this, AccountTypes(security), isPremium, expansion, mutetime, locale, recruiter, isRecruiter), -1);
 
     m_Crypt.Init(&k);
 
diff --git a/src/server/game/World/World.cpp b/src/server/game/World/World.cpp
index ab3b715..b7bf0e9 100755
--- a/src/server/game/World/World.cpp
+++ b/src/server/game/World/World.cpp
@@ -456,9 +456,13 @@ void World::LoadConfigSettings(bool reload)
     rate_values[RATE_DROP_ITEM_REFERENCED] = ConfigMgr::GetFloatDefault("Rate.Drop.Item.Referenced", 1.0f);
     rate_values[RATE_DROP_ITEM_REFERENCED_AMOUNT] = ConfigMgr::GetFloatDefault("Rate.Drop.Item.ReferencedAmount", 1.0f);
     rate_values[RATE_DROP_MONEY]  = ConfigMgr::GetFloatDefault("Rate.Drop.Money", 1.0f);
-    rate_values[RATE_XP_KILL]     = ConfigMgr::GetFloatDefault("Rate.XP.Kill", 1.0f);
-    rate_values[RATE_XP_QUEST]    = ConfigMgr::GetFloatDefault("Rate.XP.Quest", 1.0f);
-    rate_values[RATE_XP_EXPLORE]  = ConfigMgr::GetFloatDefault("Rate.XP.Explore", 1.0f);
+    rate_values[RATE_XP_KILL]            = ConfigMgr::GetFloatDefault("Rate.XP.Kill", 1.0f);
+    rate_values[RATE_XP_KILL_PREMIUM]    = ConfigMgr::GetFloatDefault("Rate.XP.Kill.Premium", 1.0f);
+    rate_values[RATE_XP_QUEST]           = ConfigMgr::GetFloatDefault("Rate.XP.Quest", 1.0f);
+    rate_values[RATE_XP_QUEST_PREMIUM]   = ConfigMgr::GetFloatDefault("Rate.XP.Quest.Premium", 1.0f);
+    rate_values[RATE_XP_EXPLORE]         = ConfigMgr::GetFloatDefault("Rate.XP.Explore", 1.0f);
+    rate_values[RATE_XP_EXPLORE_PREMIUM] = ConfigMgr::GetFloatDefault("Rate.XP.Explore.Premium", 1.0f);
+
     rate_values[RATE_REPAIRCOST]  = ConfigMgr::GetFloatDefault("Rate.RepairCost", 1.0f);
     if (rate_values[RATE_REPAIRCOST] < 0.0f)
     {
diff --git a/src/server/game/World/World.h b/src/server/game/World/World.h
index f0dbc3c..09c2c1a 100755
--- a/src/server/game/World/World.h
+++ b/src/server/game/World/World.h
@@ -344,8 +344,11 @@ enum Rates
     RATE_DROP_ITEM_REFERENCED_AMOUNT,
     RATE_DROP_MONEY,
     RATE_XP_KILL,
+    RATE_XP_KILL_PREMIUM,	
     RATE_XP_QUEST,
+    RATE_XP_QUEST_PREMIUM,	
     RATE_XP_EXPLORE,
+    RATE_XP_EXPLORE_PREMIUM,	
     RATE_REPAIRCOST,
     RATE_REPUTATION_GAIN,
     RATE_REPUTATION_LOWLEVEL_KILL,
diff --git a/src/server/shared/Database/Implementation/LoginDatabase.cpp b/src/server/shared/Database/Implementation/LoginDatabase.cpp
index 31d9f5e..2f6067d 100755
--- a/src/server/shared/Database/Implementation/LoginDatabase.cpp
+++ b/src/server/shared/Database/Implementation/LoginDatabase.cpp
@@ -51,6 +51,7 @@ void LoginDatabaseConnection::DoPrepareStatements()
     PREPARE_STATEMENT(LOGIN_DEL_IP_NOT_BANNED, "DELETE FROM ip_banned WHERE ip = ?", CONNECTION_ASYNC)
     PREPARE_STATEMENT(LOGIN_INS_ACCOUNT_BANNED, "INSERT INTO account_banned VALUES (?, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+?, ?, ?, 1)", CONNECTION_ASYNC)
     PREPARE_STATEMENT(LOGIN_UPD_ACCOUNT_NOT_BANNED, "UPDATE account_banned SET active = 0 WHERE id = ? AND active != 0", CONNECTION_ASYNC)
+	PREPARE_STATEMENT(LOGIN_SET_ACCOUNT_PREMIUM, "UPDATE account_premium SET active = 0 WHERE unsetdate<=UNIX_TIMESTAMP() AND unsetdate<>setdate", CONNECTION_ASYNC)	
     PREPARE_STATEMENT(LOGIN_DEL_REALM_CHARACTERS_BY_REALM, "DELETE FROM realmcharacters WHERE acctid = ? AND realmid = ?", CONNECTION_ASYNC)
     PREPARE_STATEMENT(LOGIN_DEL_REALM_CHARACTERS, "DELETE FROM realmcharacters WHERE acctid = ?", CONNECTION_ASYNC);
     PREPARE_STATEMENT(LOGIN_INS_REALM_CHARACTERS, "INSERT INTO realmcharacters (numchars, acctid, realmid) VALUES (?, ?, ?)", CONNECTION_ASYNC)
diff --git a/src/server/shared/Database/Implementation/LoginDatabase.h b/src/server/shared/Database/Implementation/LoginDatabase.h
index 7c2a94e..e206740 100755
--- a/src/server/shared/Database/Implementation/LoginDatabase.h
+++ b/src/server/shared/Database/Implementation/LoginDatabase.h
@@ -71,6 +71,7 @@ enum LoginDatabaseStatements
     LOGIN_SEL_ACCOUNT_BY_ID,
     LOGIN_INS_ACCOUNT_BANNED,
     LOGIN_UPD_ACCOUNT_NOT_BANNED,
+	LOGIN_SET_ACCOUNT_PREMIUM,	
     LOGIN_DEL_REALM_CHARACTERS_BY_REALM,
     LOGIN_DEL_REALM_CHARACTERS,
     LOGIN_INS_REALM_CHARACTERS,
diff --git a/src/server/worldserver/worldserver.conf.dist b/src/server/worldserver/worldserver.conf.dist
index be5a452..1ae60e0 100644
--- a/src/server/worldserver/worldserver.conf.dist
+++ b/src/server/worldserver/worldserver.conf.dist
@@ -1820,10 +1820,18 @@ Rate.Drop.Item.ReferencedAmount = 1
 #        Default:     1 - (Rate.XP.Kill)
 #                     1 - (Rate.XP.Quest)
 #                     1 - (Rate.XP.Explore)
+#    Rate.XP.Kill.Premium
+#    Rate.XP.Quest.Premium
+#    Rate.XP.Explore.Premium
+#        XP rates Premium modifier
+#        Default: 1
 
 Rate.XP.Kill    = 1
 Rate.XP.Quest   = 1
 Rate.XP.Explore = 1
+Rate.XP.Kill.Premium    = 1
+Rate.XP.Quest.Premium   = 1
+Rate.XP.Explore.Premium = 1
 
 #
 #    Rate.RepairCost
-- 
1.7.8.msysgit.0