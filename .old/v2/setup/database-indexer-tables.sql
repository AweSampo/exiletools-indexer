-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: indexer
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB-wsrep-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fetch-stats`
--

DROP TABLE IF EXISTS `fetch-stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fetch-stats` (
  `timestamp` int(11) NOT NULL,
  `forum` varchar(128) NOT NULL,
  `TotalRequests` int(20) NOT NULL,
  `TotalTransferKB` bigint(20) NOT NULL,
  `TotalUncompressedKB` bigint(20) NOT NULL,
  `ForumIndexPagesFetched` bigint(20) NOT NULL,
  `ShopPagesFetched` bigint(20) NOT NULL,
  `Errors` int(6) NOT NULL,
  `RunType` varchar(128) NOT NULL,
  `NewThreads` bigint(20) NOT NULL,
  `UnchangedThreads` bigint(20) NOT NULL,
  `UpdatedThreads` bigint(20) NOT NULL,
  `RunTime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fetch-stats`
--

LOCK TABLES `fetch-stats` WRITE;
/*!40000 ALTER TABLE `fetch-stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `fetch-stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `uuid` varchar(48) NOT NULL,
  `threadid` varchar(16) NOT NULL,
  `md5sum` char(32) NOT NULL,
  `added` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `currency` varchar(64) DEFAULT NULL,
  `amount` decimal(10,3) DEFAULT NULL,
  `verified` enum('YES','NO','GONE','OLD') DEFAULT NULL,
  `priceChanges` int(5) DEFAULT NULL,
  `lastUpdateDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chaosEquiv` decimal(10,3) DEFAULT NULL,
  `inES` enum('yes','no') DEFAULT NULL,
  `saleType` varchar(16) DEFAULT NULL,
  UNIQUE KEY `uuid` (`uuid`),
  KEY `md5sum` (`md5sum`),
  KEY `threadid` (`threadid`),
  KEY `amount` (`amount`),
  KEY `verified` (`verified`),
  KEY `modified` (`modified`),
  KEY `currency` (`currency`),
  KEY `added` (`added`),
  KEY `updated` (`updated`),
  KEY `chaosEquiv` (`chaosEquiv`),
  KEY `inES` (`inES`),
  KEY `saleType` (`saleType`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league-list`
--

DROP TABLE IF EXISTS `league-list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league-list` (
  `league` varchar(128) NOT NULL,
  `prettyName` varchar(128) NOT NULL,
  `apiName` varchar(128) NOT NULL,
  `startTime` int(11) DEFAULT NULL,
  `endTime` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `itemjsonName` varchar(128) NOT NULL,
  `archivedLadder` tinyint(4) NOT NULL,
  `shopForumURL` varchar(256) NOT NULL,
  `shopURL` varchar(256) NOT NULL,
  `shopForumID` varchar(256) NOT NULL,
  UNIQUE KEY `league` (`league`),
  KEY `prettyName` (`prettyName`),
  KEY `apiName` (`apiName`),
  KEY `startTime` (`startTime`),
  KEY `endTime` (`endTime`),
  KEY `active` (`active`),
  KEY `itemjsonName` (`itemjsonName`),
  KEY `archivedLadder` (`archivedLadder`),
  KEY `shopForumURL` (`shopForumURL`(255)),
  KEY `shopURL` (`shopURL`(255)),
  KEY `shopForumID` (`shopForumID`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league-list`
--

LOCK TABLES `league-list` WRITE;
/*!40000 ALTER TABLE `league-list` DISABLE KEYS */;
INSERT INTO `league-list` VALUES ('5dsolo','Five Day Solo','5%20Day%20Solo%20(IV001)',1429990800,1430425200,0,'',0,'','',''),('5dsolohc','Five Day Solo Hardcore','5%20Day%20Solo%20Hardcore%20(IV002)',1429990800,1430425200,0,'',0,'','',''),('ambush','Ambush','Ambush',NULL,946728000,0,'',1,'','',''),('anarchy','Anarchy','anarchy',NULL,946728000,0,'',1,'','',''),('beyond','Beyond','Beyond',NULL,946728000,0,'',1,'','',''),('bloodlines','Bloodlines','Bloodlines',1418385600,1427198400,0,'',0,'','',''),('darkshrine','Darkshrine','Darkshrine (IC003)',1446490800,1449520528,0,'Darkshrine (IC003)',0,'http://www.pathofexile.com/forum/view-forum/597/page','http://www.pathofexile.com/forum/view-thread','597'),('darkshrinehc','Darkshrine Hardcore','Darkshrine HC (IC004)',1446490800,1449501528,0,'Darkshrine HC (IC004)',0,'http://www.pathofexile.com/forum/view-forum/598/page','http://www.pathofexile.com/forum/view-thread','598'),('domination','Domination','domination',NULL,946728000,0,'',1,'','',''),('flashback','One Month Flashback','1%20Month%20Flashback%20(IC006)',1431114000,1433708400,0,'',0,'http://www.pathofexile.com/forum/view-forum/586/page','http://www.pathofexile.com/forum/view-thread','586'),('flashback2','One Month Flashback 2','Flashback Event (IC001)',1443808800,1446408000,0,'Flashback Event (IC001)',0,'http://www.pathofexile.com/forum/view-forum/595/page','http://www.pathofexile.com/forum/view-thread','595'),('flashback2hc','One Month Flashback 2 HC','Flashback Event HC (IC002)',1443808800,1446408000,0,'Flashback Event HC (IC002)',0,'http://www.pathofexile.com/forum/view-forum/594/page','http://www.pathofexile.com/forum/view-thread','594'),('flashbackhc','One Month Flashback Hardcore','1%20Month%20Flashback%20HC%20(IC007)',1431114000,1433708400,0,'',0,'http://www.pathofexile.com/forum/view-forum/587/page','http://www.pathofexile.com/forum/view-thread','587'),('hardcore','Hardcore','Hardcore',NULL,2147483647,1,'Hardcore',0,'http://www.pathofexile.com/forum/view-forum/305/page','http://www.pathofexile.com/forum/view-thread','305'),('invasion','Invasion','invasion',NULL,946728000,0,'',1,'','',''),('nemesis','Nemesis','nemesis',NULL,946728000,0,'',1,'','',''),('omr2014','One Month Race 2014','one%20month%20race',NULL,946728000,0,'',1,'','',''),('omrhc2014','One Month Race 2014 Hardcore','one%20month%20race%20hc',NULL,946728000,0,'',1,'','',''),('omrtb','One Month Race Torment / Bloodlines','Torment%2FBloodlines',1427215200,1429921200,0,'',0,'','',''),('omrtbhc','One Month Race Torment / Bloodlines Hardcore','Torment%2FBloodlines%20HC',1427215200,1429921200,0,'',0,'','',''),('onslaught','Onslaught','onslaught',NULL,946728000,0,'',1,'','',''),('owcutthroat','One-Week Cut-Throat','1%20Week%20Cutthroat%20(IV008)',1433968200,1434576000,0,'',0,'','',''),('owrnemesis','One Week Race Nemesis','nemesis%20one%20week%20race',NULL,946728000,0,'',1,'','',''),('owrrb2014','One Week Race Beyond / Rampage','One%20Week%20Rampage%2FBeyond',NULL,946728000,0,'',1,'','',''),('owrrbhc2014','One Week Race Beyond / Rampage Hardcore','One%20Week%20HC%20Rampage%2FBeyond',NULL,946728000,0,'',1,'','',''),('rampage','Rampage','Rampage',NULL,946728000,0,'',1,'','',''),('standard','Standard','Standard',NULL,2147483647,1,'Standard',0,'http://www.pathofexile.com/forum/view-forum/306/page','http://www.pathofexile.com/forum/view-thread','306'),('talisman','Talisman','Talisman',1449865800,1457127000,1,'',0,'http://www.pathofexile.com/forum/view-forum/600/page','http://www.pathofexile.com/forum/view-thread','600'),('talismanhc','Talisman Hardcore','Talisman Hardcore',1449865800,1457127000,1,'',0,'http://www.pathofexile.com/forum/view-forum/599/page','http://www.pathofexile.com/forum/view-thread','599'),('tempest','Tempest','Tempest',1436553900,1443805200,0,'',0,'http://www.pathofexile.com/forum/view-forum/588/page','http://www.pathofexile.com/forum/view-thread','588'),('torment','Torment','Torment',1418385600,1427198400,0,'',0,'','',''),('warbands','Warbands','Warbands',1436553900,1443805200,0,'',0,'http://www.pathofexile.com/forum/view-forum/591/page','http://www.pathofexile.com/forum/view-thread','591');
/*!40000 ALTER TABLE `league-list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `process` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locked` int(1) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `abort` int(1) DEFAULT NULL,
  `abort-reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `process` (`process`),
  KEY `timestamp` (`timestamp`),
  KEY `locked` (`locked`),
  KEY `abort` (`abort`),
  KEY `abort-reason` (`abort-reason`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log-unknown`
--

DROP TABLE IF EXISTS `log-unknown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log-unknown` (
  `timestamp` int(11) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `md5sum` char(32) NOT NULL,
  `fullName` varchar(196) NOT NULL,
  UNIQUE KEY `md5sum` (`md5sum`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `fullName` (`fullName`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log-unknown`
--

LOCK TABLES `log-unknown` WRITE;
/*!40000 ALTER TABLE `log-unknown` DISABLE KEYS */;
/*!40000 ALTER TABLE `log-unknown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw-json`
--

DROP TABLE IF EXISTS `raw-json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw-json` (
  `md5sum` char(32) NOT NULL,
  `data` text NOT NULL,
  UNIQUE KEY `md5sum` (`md5sum`)
) ENGINE=TokuDB DEFAULT CHARSET=utf8 `compression`=TokuDB_lzma;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw-json`
--

LOCK TABLES `raw-json` WRITE;
/*!40000 ALTER TABLE `raw-json` DISABLE KEYS */;
/*!40000 ALTER TABLE `raw-json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop-queue`
--

DROP TABLE IF EXISTS `shop-queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop-queue` (
  `threadid` int(16) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `processed` int(1) NOT NULL,
  `forumid` varchar(64) CHARACTER SET ascii NOT NULL,
  `nojsonfound` tinyint(4) NOT NULL,
  `origin` varchar(32) CHARACTER SET ascii NOT NULL,
  KEY `processed` (`processed`),
  KEY `timestamp` (`timestamp`),
  KEY `forumid` (`forumid`),
  KEY `threadid` (`threadid`),
  KEY `jsonfound` (`nojsonfound`),
  KEY `origin` (`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 /* `compression`='tokudb_zlib' */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop-queue`
--

LOCK TABLES `shop-queue` WRITE;
/*!40000 ALTER TABLE `shop-queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop-queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread-last-update`
--

DROP TABLE IF EXISTS `thread-last-update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread-last-update` (
  `threadid` varchar(16) NOT NULL,
  `updateTimestamp` int(11) NOT NULL,
  `itemsAdded` int(5) DEFAULT NULL,
  `itemsRemoved` int(5) DEFAULT NULL,
  `itemsModified` int(5) DEFAULT NULL,
  `sellerAccount` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `sellerIGN` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `totalItems` int(5) DEFAULT NULL,
  `buyoutCount` int(5) DEFAULT NULL,
  `generatedWith` varchar(128) DEFAULT NULL,
  `threadTitle` varchar(220) CHARACTER SET utf8 DEFAULT NULL,
  `forumID` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  UNIQUE KEY `threadid` (`threadid`),
  KEY `updateTimestamp` (`updateTimestamp`),
  KEY `sellerAccount` (`sellerAccount`),
  KEY `sellerIGN` (`sellerIGN`),
  KEY `generatedWith` (`generatedWith`),
  KEY `threadTitle` (`threadTitle`),
  KEY `forumID` (`forumID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread-last-update`
--

LOCK TABLES `thread-last-update` WRITE;
/*!40000 ALTER TABLE `thread-last-update` DISABLE KEYS */;
/*!40000 ALTER TABLE `thread-last-update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread-update-history`
--

DROP TABLE IF EXISTS `thread-update-history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread-update-history` (
  `threadid` varchar(16) NOT NULL,
  `updateTimestamp` int(11) NOT NULL,
  `itemsAdded` int(5) DEFAULT NULL,
  `itemsRemoved` int(5) DEFAULT NULL,
  `itemsModified` int(5) DEFAULT NULL,
  `sellerAccount` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `sellerIGN` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `totalItems` int(5) DEFAULT NULL,
  `buyoutCount` int(5) DEFAULT NULL,
  `generatedWith` varchar(128) DEFAULT NULL,
  `threadTitle` varchar(220) CHARACTER SET utf8 DEFAULT NULL,
  KEY `updateTimestamp` (`updateTimestamp`),
  KEY `threadid` (`threadid`),
  KEY `sellerAccount` (`sellerAccount`),
  KEY `sellerIGN` (`sellerIGN`),
  KEY `generatedWith` (`generatedWith`),
  KEY `threadTitle` (`threadTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread-update-history`
--

LOCK TABLES `thread-update-history` WRITE;
/*!40000 ALTER TABLE `thread-update-history` DISABLE KEYS */;
/*!40000 ALTER TABLE `thread-update-history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web-post-track`
--

DROP TABLE IF EXISTS `web-post-track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web-post-track` (
  `threadid` int(12) NOT NULL,
  `lastpost` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `title` varchar(512) NOT NULL,
  `replies` int(15) NOT NULL,
  `lastedit` int(11) NOT NULL,
  `lastpostepoch` int(11) NOT NULL,
  `originalpost` int(11) NOT NULL,
  `views` int(15) NOT NULL,
  UNIQUE KEY `threadid` (`threadid`),
  KEY `lastpost` (`lastpost`),
  KEY `username` (`username`),
  KEY `title` (`title`(255)),
  KEY `bumped` (`replies`),
  KEY `lastedit` (`lastedit`),
  KEY `lastpostepoch` (`lastpostepoch`),
  KEY `originalpost` (`originalpost`),
  KEY `views` (`views`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 /* `compression`=TokuDB_uncompressed */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web-post-track`
--

LOCK TABLES `web-post-track` WRITE;
/*!40000 ALTER TABLE `web-post-track` DISABLE KEYS */;
/*!40000 ALTER TABLE `web-post-track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-11 10:58:51
