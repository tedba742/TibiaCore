-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
--worldId = 1 sem
protectionLevel = 0
pzLocked = 60000
removeChargesFromRunes = 1
stairJumpExhaustion = 0
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75

-- Casting System
enableLiveCasting = true
liveCastPort = 7173

-- Player Options
SavePlayersLogs = true
UpLevelRestoreFree = false
UpLevelRestorePremium = true
DropSpearFree = true
DropSpearPremium = true
MakeRuneBackpackFree = false
MakeRuneBackpackPremium = true
-- Every 30 seconds gains 1 regeneration, Default 30
TicksRegenBedGain = 5
-- Duration food ticks in bed 1 = -1000 ticks per seconds, default 1
RateNutritionBed = 1
-- Multiplies regeneration each gain, Default 1
RateLifeBed = 2
RateManaBed = 2

-- Skull System
banLength = 7 * 24 * 60 * 60
whiteSkullTime = 15 * 60
redSkullTime = 15 * 24 * 60 * 60

killsDayRedSkull = 3
killsDayBanishment = 5

killsWeekRedSkull = 6
killsWeekBanishment = 8

killsMonthRedSkull = 12
killsMonthBanishment = 16

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "127.0.01"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 2000
motd = "Welcome to TibiaCore!"
onePlayerOnlinePerAccount = true
allowClones = false
serverName = "TibiaCore"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = -1
autoStackCumulatives = true
moneyRate = 1

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
houseRentPeriod = "monthly"
multiHousePricebyRent = 3

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "map"
mapAuthor = "CipSoft"

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = ""
mysqlDatabase = "tibiacore"
mysqlPort = 3306
mysqlSock = ""
encryptionType = "sha1"

-- Misc.
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
showMonsterLoot = true
queryPlayerContainers = true
exhaustionNPC = true
exhaustionInSecondsNPC = 1

-- Character Rooking
-- Level threshold is the level requirement to teleport players back to newbie town
teleportNewbies = true
newbieTownId = 11
newbieLevelThreshold = 5

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 2
rateSkill = 1
rateLoot = 2
rateMagic = 1
rateSpawn = 0

-- Monsters
deSpawnRange = 2
deSpawnRadius = 0

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = "RcPmG"
ownerEmail = ""
url = "tibiacore.servegame.com"
location = "Brazil"
