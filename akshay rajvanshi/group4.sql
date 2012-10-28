-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: equipme
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `admin`
--
use equipme;
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `a_id` int(10) unsigned NOT NULL,
  `A_name` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'Ajay Kumar','AM(Sales and Purchase)'),(3,'Amit Shankdher','AM(Finance and Accounts)'),(4,'Pankaj Jalote','Dean(R &D)'),(5,'Vinod Kumar','AM(Research and Projects)');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_form_with`
--

DROP TABLE IF EXISTS `admin_form_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_form_with` (
  `a_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `A_status` varchar(20) DEFAULT NULL,
  `A_reason` varchar(100) DEFAULT NULL,
  `A_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `A_present` tinyint(4) DEFAULT NULL,
  `Deleted_Ad` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`a_id`,`form_id`),
  KEY `fk1` (`form_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`a_id`) REFERENCES `admin` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `admin_form_with`
--
LOCK TABLES `admin_form_with` WRITE;
/*!40000 ALTER TABLE `admin_form_with` DISABLE KEYS */;
INSERT INTO `admin_form_with` VALUES (2,1,'Ongoiauthenticationauthenticationauthenticationng',NULL,'2012-10-12 06:49:23',1,0),(3,3,'Rejected','Funds not sufficient','2012-10-24 07:13:41',1,0),(5,2,'Approved',NULL,'2012-10-17 07:12:57',1,0);
/*!40000 ALTER TABLE `admin_form_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication`
--

DROP TABLE IF EXISTS `authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication` (
  `u_id` int(10) unsigned NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `Function` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication`
--

LOCK TABLES `authentication` WRITE;
/*!40000 ALTER TABLE `authentication` DISABLE KEYS */;
INSERT INTO `authentication` VALUES (1,'ashish@iiitd.ac.in','Faculty'),(2,'ajay@iiitd.ac.in','Admin'),(3,'amit@iiitd.ac.in','Admin\r\n'),(4,'jalote@iiitd.ac.in','Admin'),(5,'vinod@iiitd.ac.in','Admin'),(6,'amarjeet@iiitd.ac.in','Faculty'),(7,'mayank@iiitd.ac.in','Faculty'),(8,'astrid@iiitd.ac.in','Faculty'),(9,'naik@iiitd.ac.in','Faculty'),(10,'vikram@iiitd.ac.in','Faculty'),(11,'subhasis@iiitd.ac.in','Faculty'),(12,'sdeb@iiitd.ac.in','Faculty'),(13,'bedathur@iiitd.ac.in','Faculty'),(14,'sriramk@iiitd.ac.in','Faculty'),(15,'bali@iiitd.ac.in','Faculty'),(16,'shreemoy@iiitd.ac.in','Faculty'),(17,'somitra@iiitd.ac.in','Faculty'),(18,'nagaraja@iiitd.ac.in','Faculty'),(19,'skkaul@iiitd.ac.in','Faculty'),(20,'saket@iiitd.ac.in','Faculty'),(21,'rsingh@iiitd.ac.in','Faculty'),(22,'psingh@iiitd.ac.in','Faculty'),(23,'rsengupta@iiitd.ac.in','Faculty'),(24,'pk@iiitd.ac.in','Faculty'),(25,'mshashmi@iiitd.ac.in','Faculty'),(26,'gauravg@iiitd.ac.in','Faculty'),(27,' donghoon@iiitd.ac.in','Faculty'),(28,'dbera@iiitd.ac.in','Faculty'),(29,'ashwin@iiitd.ac.in','Faculty'),(30,'anirban@iiitd.ac.in','Faculty'),(31,'angshul@iiitd.ac.in','Faculty');
/*!40000 ALTER TABLE `authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee` (
  `C_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`C_id`),
  KEY `z1` (`form_id`),
  CONSTRAINT `z1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee`
--

LOCK TABLES `committee` WRITE;
/*!40000 ALTER TABLE `committee` DISABLE KEYS */;
/*!40000 ALTER TABLE `committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_fills_form`
--

DROP TABLE IF EXISTS `fac_fills_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_fills_form` (
  `F_id` int(10) unsigned NOT NULL,
  `C_id` int(10) unsigned DEFAULT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Deleted_Fac` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`F_id`,`form_id`),
  KEY `a2` (`C_id`),
  KEY `a3` (`form_id`),
  CONSTRAINT `a2` FOREIGN KEY (`C_id`) REFERENCES `committee` (`C_id`),
  CONSTRAINT `a3` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_fills_form`
--

LOCK TABLES `fac_fills_form` WRITE;
/*!40000 ALTER TABLE `fac_fills_form` DISABLE KEYS */;
INSERT INTO `fac_fills_form` VALUES (1,NULL,1,'2012-10-23 05:22:37',0),(1,NULL,2,'2012-10-15 07:18:27',0),(1,NULL,3,'2012-10-23 07:18:38',0);
/*!40000 ALTER TABLE `fac_fills_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `F_id` int(10) unsigned NOT NULL,
  `F_name` varchar(45) NOT NULL,
  PRIMARY KEY (`F_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Ashish Sureka'),(6,'Amarjeet Singh'),(7,'Mayank Vatsa'),(8,'Astrid Kiehn'),(9,'Vinayak Naik'),(10,'Vikram Goyal'),(11,'Subhasis Banerjee'),(12,'Sujay Deb'),(13,'Srikanta Bedathur'),(14,'Sriram K'),(15,'Soshant Bali'),(16,'Shreemoy Mishra'),(17,'Somitra Kr. Sanadhya'),(18,'Shishir Nagaraja'),(19,'Sanjit Krishnan Kaul'),(20,'Saket Srivastava'),(21,'Richa Singh'),(22,'Pushpendra Singh'),(23,'Raja Sengupta'),(24,'Ponnurangam Kumaraguru'),(25,'Mohammad S.Hashmi'),(26,'Gaurav Gupta'),(27,'Doonghoon Chang'),(28,'Debajyoti Bera'),(29,'Ashwin Srinivasan'),(30,'Anirban Mondal'),(31,'Angshul Majumdar');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_status` varchar(45) NOT NULL,
  `source_funds` varchar(20) NOT NULL,
  `specifications` blob,
  PRIMARY KEY (`form_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Ongoing','PDA','%PDF-1.4\n%ÐÔÅØ\n3 0 obj <<\n/Length 1535      \n/Filter /FlateDecode\n>>\nstream\nxÚ¥WKoÛ8¾ûWè(5/bEfÅv\0=´=(²µ%WR6Í¿ßeK1í¦X©áÇ7ßÞÞ,~ú-OsFäæ.Ö0©tb¹eBfÉÍ:ù¾éûú¾ÙUÍRæé°\\)¥S½ü|ó>Y	ÅÌ]²9¾`Ë2ýÄ3^À?±\\e§U¾´¸ºY|]ÃHË:1³Ü¤Ü->~æÉ\Z6ß\')\'^udÌ8\r«mr½øgñMbbûá¨<c[²å^9÷Ñ18Çï¯«¦*ð)é°Y4¬oë½}¬û (ÛÝ~[A(ºmh£½Ã_ôØ]ÝÜÓ­3ó$wÌJ5^1ltÐïCµ3éß]þÿfE_jÉÔ~²õîê\ZS¤Òì?q¡«r6l*ÚÙwí~¹Â;ïå_G¬v)mçù½\nz<1ÌY£e\nX	¦Á¯õåÔAÍÉD¹T±Ü±;=\'glâ3\0`Òæé/£à8ËGÝ2hèeÜºQáUìÉì!mW§VZ3¡\\b2ø5ù%S\0æFñp¶Ì)ñ@*¦¹òe¬e`8)Ü%ËÆ+®ãQ.¦&?gÆÙåò%¶¸dÛxÒÄ´òÔ4À°èIX(ðå¸Û#Gýá«í6yZ\r.,ÔÛzx@FÀíaS÷$Ô»jýPVA¶	oñýÔïq«¯®\\Jnèù®íhõ.r&M6¯ö_	fâ¾àîHÛò<\r~ÇÝ])AèXò¼!Ó+aL,ë`±fvÀrzKQ¡¢ñ5Iª¦ìöJáÙS)ü¤·«ú¾¸¯b%iË´¹@P´Â8â¡YWâ9TËF]ðsvdg\"` Gà¥Úû½&¶öN)rF¦e½ß\0<ªoCäê\\3{´¶¼òHR><Å0%ÞD.un:±ùÜÞDÂ%col>tBXßµÛ-Uö5ri{ßvõ°Ùksc¯iÖa0ÐÐõ3°ÄÑbIx\r=Þ»Å]Ñ¬ÛÝÖ·#è¸xé¦õj{jbÔfaó|\ZÑäÑNX6óÀ´WÓÈXfÍ¬WmdÁ¦@Õwô¨>WK\0k¾c4Ç\'ÀÓM-òõh£èWþìtÈ9o:	ÏÊfr§\r	©ö=>BÂ\Zw2£E0	@lÝ\0°îIåDJë\Z £ªî0a|\nçùè£¸ZºÃ¦*Üâ©qÇçFm³®¿p\"_+O&£5YÊ¤p¦éV¹\'÷Ûâ¶ÞÖQÉïú=éåý=I=v-ÍÏ\ráëç²3°+?Á±P3Üd0å\0£ ?µÌiùxIeÂ¼óÃ,ú±0c­eÌéxËýó.b¶÷ô%ÞÂÏ|Æ[\'\\êÞ·û¢îÂÞ(ÈRÏ:É´8i2zAqÚHmÑóûûÔz¨aðÃWÂdïÚrHþ\0ÛÄ=Ò±ó^èPªàVèÕ¸J}«Jë\re¡ÐÁ %¨Hþç¦@ÖÁ¯õå+äX¾ ¸ñs¦=\räõv;ïS¢1EÐú&BÃ§cQ,\0Ï[6£CÂ5P0ÇQI©±QêùÀ.u¨´¨oDqô_{TªMQ9|p,ª¯0Û\0ë[HZÒ÷¯JßUGºø£-j y®3G[E7¹b÷dþßhÞ¢/±Y\0±nÒ8/ÚaÜ¾õH9R6jµMÔá¾ÆnNûAÚ¸¤ZÃÌ·ái6¥­ÅN6;d]wUnöt6Ë}ßdÃY»bKC¢®*ë¾\n~Ã§¡G#PáKÇLh¿©þÇé>\nendstream\nendobj\n2 0 obj <<\n/Type /Page\n/Contents 3 0 R\n/Resources 1 0 R\n/MediaBox [0 0 595.276 841.89]\n/Parent 10 0 R\n>> endobj\n1 0 obj <<\n/Font << /F8 4 0 R /F11 5 0 R /F10 6 0 R /F14 7 0 R /F7 8 0 R /F13 9 0 R >>\n/ProcSet [ /PDF /Text ]\n>> endobj\n11 0 obj\n[329.4]\nendobj\n12 0 obj\n[569.5 569.5]\nendobj\n13 0 obj\n[1000 1000 1000 777.8 275 1000 666.7 666.7 888.9 888.9 0 0 555.6 555.6 666.7 500 722.2 722.2 777.8 777.8 611.1 798.5]\nendobj\n14 0 obj\n[607.3]\nendobj\n15 0 obj\n[277.8 777.8 500 777.8 500 530.9 750 758.5 714.7 827.9 738.2 643.1 786.3 831.3 439.6 554.5 849.3 680.6 970.1 803.5 762.8 642 790.6 759.3 613.2 584.4 682.8 583.3 944.4 828.5 580.6 682.6 388.9 388.9 388.9 1000 1000 416.7 528.6 429.2 432.8 520.5 465.6 489.6 477 576.2 344.5 411.8 520.6 298.4 878 600.2 484.7 503.1 446.4 451.2 468.8 361.1 572.5 484.7 715.9 571.5]\nendobj\n16 0 obj\n[583.3 555.6 555.6 833.3 833.3 277.8 305.6 500 500 500 500 500 750 444.4 500 722.2 777.8 500 902.8 1013.9 777.8 277.8 277.8 500 833.3 500 833.3 777.8 277.8 388.9 388.9 500 777.8 277.8 333.3 277.8 500 500 500 500 500 500 500 500 500 500 500 277.8 277.8 277.8 777.8 472.2 472.2 777.8 750 708.3 722.2 763.9 680.6 652.8 784.7 750 361.1 513.9 777.8 625 916.7 750 777.8 680.6 777.8 736.1 555.6 722.2 750 750 1027.8 750 750 611.1 277.8 500 277.8 500 277.8 277.8 500 555.6 444.4 555.6 444.4 305.6 500 555.6 277.8 305.6 527.8 277.8 833.3 555.6 500 555.6 527.8 391.7 394.4 388.9 555.6 527.8 722.2 527.8 527.8]\nendobj\n17 0 obj <<\n/Length1 1492\n/Length2 7140\n/Length3 0\n/Length 8143      \n/Filter /FlateDecode\n>>\nstream\nxÚ·Të. H*½D6Þ{ï½!	JHééHi¢  ¤)U@\"()Ò¥Ýå}þ­{WÖ\"ßÌ<3ó>ï<ó­ÀuÛÈTPti XAP ª¯¯\r@Q! PËuýí\'å²¡1p$Bæ¿ªhó©±8 >Ðyè\0@2 I  Jÿ\rD¢e\0j`O8 /ÐA\"`R.U$Ê\rwrÆâúüýàð@ÒÒ¿ÓÊî04F\0ôÁXg;®#ì0EBà0¬Ï¿JðÈ9c±(aa///!°;FvRà\0xÁ±Î\0öA¿(Àî°¿¨	rÌá?¦HG¬\rànpÁ¥<D@ah\0®;ÀT[`!þëý	\0üu9\0èreÿ*GüNC HwáG8án0¡Ö+\0\0# ¿`7öÃÝÀ8Àï£\ZÊÆ\00á_ü04Åaàn¿8\nÿ*»fuTéîC`1¤¿Î§GÃ ¸{÷þk¸®¤ÂïoË:þ¢}6GÀ=Â´ÕþÂà\\¤ÿñ9Á°\0q ¤¨8\0æyC50óAÁ~A¿Ü8~($\nà£;Âp_¤~°\'E?øýwàß)Â!XÌ	 ýOuæø§?\Zî\r°âä\0}þy²Å)D¸ùüþ{ÄÂ:Öj¦ÚjüQþ\'¨¢ôø	\0EÄ\0PL\n {øwnàoö¿½F`ø_§û¯ÚG$àW_,p×÷7Ï¿¤Áó×ÞðþÝÂ\04Àóýß!¸? ÿç-øòÿ\'þ_Uþ¯úÿßi<tsûçùðÿÝán>!p~Å->·\"ÿZÂþÜh}þÐý£ÚX0nIN8¡Äbúá\r¸7jÇBÿÓßÓÀõp#`FHü×þO·{WÜËÙ!0·ØßãýeÃp«öïs¨# Hè¯\0Ñh°)N8KàÂ-/æý[ó\0a!Kà8\0hÒ_«ÿrý¶¤qäKüÛIð?P ìú_&áþSöþmþëh4Äoqáümÿ~À`Þ0éçI$D6Ì¥&¬õ¤ZÅKpuXp7ãÄJDp¸ø1¶G}Ìn)Ù47gZ÷ÆçnÆ¼ù©}¿Z:±#Au\'ÄÉ«£k)~Ç¬w&)ðZ¦«°Ë<C÷à±ÅRu(BzL¹(ýÿ¨éúâÅMW¦!©ÞjÐÞY]£GÏ*m±ýÅÛìÐo¶*~ÀøGþ÷Ðå¸ûÑO²îèÊµ&{UQ-ö\rôÏRw³½\rÖñYýÎ¥VígU»Qe1[xógþ3Ï­,\Z?MZ¥-hOùoúIÁóÊÞímÔNIgûTÇ8Ð¶ï)5jN%]P´Éä hìSH9ÆXteÂµÞÎ¿üÂæª®ë3=Ñ5ºøó¡îmÞ0ýdùËíz®¶xOÇü?ªÓ©WÔùésx7C{9ÝrgxÂ\',El¤2[ÍJg¥ÃZ¬¨EE)<áæ7ë¿öÝ(±>òó»,ÜooWáö¨EÄÓÄù.ÖÎúg?=Û	¿«d¾Sõõr_:ò¯ò^²ÕësG¼ômuÿ¶8Eý8)àÈ{¾ÙÏ(Ô}çåÌrwÔ!{~\"¯Ì  üì þ}/²OÔ³,8îlË÷b?`@ªó%|atKÖb¬ÃI¢¯°_á³ÀÕ\'A:bîÊÀ¡ÑÉf>º~¿vþBú\Ziê¥pøÃÕýÔC%Jç\0AÚÇ!tÆý¡É	q­ÊÍù±¼ã¯X&¾·ÉI?ÿ³u êÄÂ¼#Ã¦ÝãÊá\niwë»\n«EñÂYoÈà=Ë;ßðW\Zr³ß.÷6÷40I¼a©Å\\»P½f¯8×/ÇµÕ¿Ïä&õX§ÝlýV÷\när¯2Ô©ì&QÈ¡½9GçØß¾Ý9þÃ#Þ7^Ö¡»n Kê÷\Z+<I\'RÚg&ÓÆðBnÂG4¨KÁ±MÇÉ\0ðù¤i¯ÅÆþ:Âd±Í.¦TUËïëf	jâ}Ü­aúx#:àZ ð Î!9ë»ï`31l0\\ÌNhyfö¼wø´Ë?:M=~rÛ²¾Fd\0ÌQ;Ï)&h÷VpÒª=³á°5S?zãeÒ(ÌN¶²B¿	ÈÊ sZñµMFÕägçjÝ¶8\r6ÜnP~X>ó¤»ÑMàå÷¹uÃ*®ÆÂÀPl<¾àÕ£\0öèuXÅk5ëRq+Â>|<NÚtlnûî¢ûóñ8§kÛÑ<Ý;§-U¦ô²`whÁ*+XoðóìiÙÈïC0-3¢ úñÇ<i?³¶¡VG¢/ß\n^úEëmqGuvXåJ/.ïÔ/((ÓN¯Ô|êGîxe/ÉF²gÃwI÷H¢[ÖÙXß0ÒûkºV]¶*m¹#´ç\r[t<è¤YMå­ºnj2næÃ@#©qI3|ÐºÚBÅÕI`Û¾è§0/\\PQõ\\Õ¹°\næªxa~õs¦S¡¹ñÀK­ô»Ìø\0z³`Z>XTê¨W$FÃEeYkUzÙ`ççì}ä£w^êB6ÖìHI~¾ûi/æc¥mz7xæSôù.3Ó|\\\ZT+n,rOT1·¥_ÎZsÔtr±Ðfª&à±Cëß9ÆCBç^lEØBàà¥#±ý+ù]¶÷èÌ×>3UÎøÞhé~~åÿàu´m=³þV¨\0_}w§xÐéRêü;àÖ:ê0ë¬Dç\"º¡À;júá×q7fItF÷\\U£z/Ýv¼ç­6å¾hYÇW÷^÷ö¤i£\rZÑäÌ¾í@w§Þ×UÍØÄ+[ÛwsÃ¥¸©;×lÅéHìå8ØiæÁBíì2_¶½ÓX¤ñW5$<¥_e«)Ì9ÂTQëïdOºTñ¤aÜ\Z6<±¤?ÃOOKãÑx1ß2Z[ì*ÃoP9\Z[ÎÀ_.Ë/{x\n;NwN®ä®?$7VvZÿñIð+Á=k{/¶Å¬òl\\èÔ\'\\kjn[õtê%¶7<íK2R}½Ðt;3ÓbíG]údwÃÌ{{¯~bÂ¯ÏæÄ ÃE9ým9\0U¶+k,¾ÍÁsÜiÌ©ÍAJõBÂÒø²}£Ú×6G4|S9KÛÌ?	ëâ¸M9Jx{,°øÖx¼\nÑÒ®åã:qHsM©úiýÊéý¡Á¥rçwQi[Á}z^bKÅzNû)?G?+8¼ÀÞwvÈ1ãUÍ)Gm¾9G&y|}\ZzÑq^®ÖÏ+©R<^T6òvÜ¼w;=oK§Tm|XÏf,~TôÈÑA/@XaXÜfñXÞØ«ÐðR^ügÔ]´)Bs;z=#Å¤ú¾ÕÊ5Sý£ðÝÓ\ni7©{G£VÉWòM¹ÜµìÊUÛZåÜ÷ßË»Ý¨³00ÓtÉ¼1­\"k÷j®£ÍÙÐÞeÝÏóÞÝÄcö¸HÇ19Ðq@Z ½\\¢öè¬h<Ð@özë9«©\0¡\"(A1lRy¢gÁÇ\'dYïZóöuÁ®y\"ÍÎö:I\'S¹»Òýy¢tâz3~¥¡àtúä8Êj­\rÔ\ZãM°ûâû¾Åo©ÇÆÙÃÔ],ýrAÑû ¡P³Wizcâ>ºþ¾AcûËO¾ûO7`o»¨@7Â-ä+}?NwMê¶®ÙÔ´×_~µ¿ð,¸D!Ð¡æäú/²¾ÒZb×336ª_Öøæ~üVI*g*Õ»uÏÙ¿vÈZÁËoÁÓÞ¢e³ãÍ½¹?a£R¿i¥(1o¿W]R\rAöSõyë©½ïPÎixtÑcPÊöÁ û-Ç±×{MD\'=dQP3=312ú<CÑõ¹5>ôËz¸}_Ýæ¹ AÅEãöáÍõÐ²`ß¶ôÕt%!åæâgÊ2=|áÄ¯2M*ôÉù)î M¼±aÐC	 -Æ>4ù Í?«%ç½XþÂ3ï*5Ô®­¯ózÓ]KÎ_ë²WºÇÎ)ÍÛ+ÿ±6Õy¯e¼XÓFâ>¡fCð2¾38ø½ò{4Õlò»²ïçÃ¯9×¡í²wV2FËÚQ­GOn51©jÞJ1ø_ý¸{Á_ {cGªSyáx¢ÏÞ~¥ÝEFï^mBÐÕ¥y)ßËýOû\r*kK)ÓIr«Fq(A½^]Øp~xÙ<¼²XçÅD^ãÏ	@yIÏàwÌºuK®Kx@!éý·X-ÕÍ»§ìÂ¤jK«×$~pX÷2y&AÜÓ*öÍÿ·B~O Õn\'ÀÇEQ<Ïè§©gðï¼gmbý|¯éÅ	àþA~FYÇ©þ\"YC+Þwa¾X°»`²\nÏvãry»Þ¾PÍ	Þøj7,ø:À5PoTéë··òÝÊ?mòºVe7ÃI¤ÆN0N¼5¯\")·\r#²îÅî¸T-kÐÍ¶~ àï2ÌTaSë?Ýw¸¯ø×G­-\\z£¾é°+ Zé±ßÅqaE»¥]Ý;qÝv¦ámÈ»«/ç&0¤½gòR\ZÊRÜ¨¬Êqü¨:|èÕóÉfKÂ#TÄÄ¾+Qaèp¿rÏg[ý¦)jJ*º£ÙÄÁ/G?\Z¦½rùà#ÏzPöÀW\\=.Éó2dòm8èj\ZJhSþïü!o²\'Ôyré\ZÛÚ<¤©î<Á½®x+4PD»XÉb»¬${;y_I/löÄÖK¶MéÛQõ3ßcsÙAõQæÕðäk3/sâ+U?ÛDRÛÊ·u½=D»JßÙa±½ÌÞHüà?j9Å,\Z_SORªjIÚy°®-ÉçaÓR¨­O\rÍÕNÈVêz\Zàn³!ø£^IyØcqHÌû|ÑiR¢³KÁ´\nã?É[Öê£4LV[þÄm\'vÞù¾¦½Ãµ#0»TqV#\'Ïü^ÿsQÚ*¬ºÃÝå}UÂ;åW±M.Ôxñùg³ÊlãkâBevÛ>Y-Êð¶\ZE·º\ZÍÊ%QÉñÁmqÑÌ¦ ôø0³p_\\DZÊìë¹ðªßÑÆh*2{¸6,á}/Áòv&u4j¸õÝVo£þñ´3ÄÅ[NiÐøíÉy-À´/ÓJá·ÓWÔHÆïJÉ?zºWwµ¹Îÿ`³ZÞIõ{aR]ðâéúÖï\rÙx;ÛVt îÿF­ªhaìO²®ýu	ÕçN3Nß±ÈPªÈKsÞøÑ·ÅÈÍ×(txÖï¦<¼JÂ«]¼4fÙ#T\r<Ö¼ªg,\ràÏ+V\ZJâ½áÕ1/<ÈªÊS_RM¢¾:\\óò±]¼3ñpß¹TÌúT¢Ûpv$ëwxhÖ,BÑÿ6áAáîÕ\"Q»ëÖb7tÑû¶³º|_è³¨Ûd[4À,¹3¢eG;äü[¶ÈSå]Èë=6$ÕOH?&C^ø4».$â~ÔD³¿îóoµ2(°hëáÙðÝt÷ól{ÜeåËú¡ÂSË|5ÄLf\'uÌÎÝcãzö¬P£ìt7üdî[\ró5eÃ|ÊÌ;ÇW\\<³ç¨aµ­;\"Ü¨2ÝÝÀêhåÑÛòÕ÷7Ról©ÉÉÖºTw4-|Ö^=ÁÐ±6,+×9Eh¦¼70íôLülBÓEÌ-K~T}ü@U¥`)v½N~8j¾GãæñGÄv®#Ó\0Æ«»\n¬eÛV|6¥ÿ {±wîµ½Q é¼îÜ¢úé.Kv6w-ÿ~tú>§	§ÍT°÷$J´oëµùÓ\nPÂz>|û4àù±2ÙËs©Þ¾d\"\nCÎzJ¡^räæúÌA	aÌ¿?$kÈKñ¨¢ûÜÀþz]wã®YèÝr)æ¥¸¼4ºL»×@nÞ(½:,%¿«¢K^ûp#úNý÷w©V¼&Þ»óÉÝÞ$â£BÓÎew[Ô´6ó?ûñ!õoéuJÈ#vKd<®Ó÷ö;ûèÎÕ]jÈÊY_åÿØå¿WÞ¸@2AM{`&î¸(å¨ÚUîvØlí+ª;_q«àró=\0f1_SÔT\rÄtï7Ìí­)ªßýa;N»³¹äzw.ÿ YÉ´àÌ_÷ê@ëþu\"º\0Ô1OsE59Þ Áô]Ûâìâ´×ß+¾Ìoh~è£~B×eÆ¹®­´ä%E/&¬Ïæ_ÝØq7_Þ^¹0	KA;,å:À/\\\'s8MËÉo¾FºÏÅÏ.+O}]sæÑ#_)*IS4;¢3Úõpå½Ò2q}iF,X?(êm:ÝÝ\ZÿyÆCÕöL2r¬^¤Ôè+à(ÿñÍvCvÞ«T\ZiXtÃ|ü\"yïÂØiO¥vk=òW)TüOªÆ¥W#Þ\'[òy@) ïm÷¦ÜðuBçÂS	CâHée)ÅpÅ°¯«j¯ãñXmø¨¥~î¸ánYjw7Ù!|îïÅK­m¿Hù²û{1mB:¹f¨;¢ýÊJÜk>Jmßè¿ãw¦#°£ÌdÞdiûüCô|\r»Z#v\'Ær OaPs¨ÙµÚ×âO V³t­Ç¯B¡®(ÉU1¹>ö%o2ùÁÏ¨ë?5Gèª­w|!U#¼püî<zYéËN±Ï¯]¢å_Qvp4ÌÔm´>]xfÊÅÊ­ßä_d­ZJâpºÜT\ZÏO¢ìuK·ô¸\rÀú2)¤H]bÍÍ)G$vy¢?`ÇlkøGgÛ¹¢±©Ëbø¼â¥ÔGoÈ2ü«!zT×ÃêÌ®SçïøöSSãç\\±è1GHN¼Ôä¿×9¯÷j!¦cS¾{(ØL²\\*ðQdâÝ±ÅÞ·´·R·\Z8jzÚuÎKß°ò¸Ä_9¬òÑËûcãX c)@ [ãnuÝ{E^Eh,õø)GSèÞÁ²®ÚSêG¾HñÐþÙòZhú£óî.ºOD½ÏOé5)ëæ?.OÚ«ãHzÀÌ²éÉ9¡PØÆù±j¬¥¡}ëØw1!CoNïdï¯Ô?X51T:IéjÒÙí\0koO\"|K-C¿\rÂeú,[ù÷®?Ñ­míø9ivÝëësG¤YE»szzsO/[ÆÒ:¦»53	°ìô¢¸^ª¯{#Bé\\ôãýS©§Eô8]ß(] 6Wç]0qà\Z=FÆ5e¬+ÄHP,w÷òf&?ï³ò/|gpÉß5³ÆÄ)Ì8¯SÞ®IÖ´ÂÞwø&¨¼ë\Z5ÛàêÞ[½&hRÀ£PÂ7|F2V¶Ý/\"åÜº¾Ûâ¯-$þð½±QÑñd¯ýçOû\Z6x~Þ8KgL«}ð,t>,N¡\nÅF,®Ég¯øÞDC¿b±+èòãÓòãMT§ãô>à¯]¼D	­(nNú¦Û½Ec£GêÓäAR§ÒÙÀÙ¥ôSÔÄÆmË­EÒáÄ3õ[\r½ÚÍ»\'çÚfo8#ã/}²?Gî¤\\ÓJGÁ×®, Îy¶nÜ3O5ºædßRopÞí!¾­&SKÎÅÌ¸­ïrÑßwÇNïÉ\"ë[(\rßLä$pWÄVÒg»EEVi$ÕÊÇ*tÝS-3è wø¸ÖVÏ8¸ËwÒ û-m¿QI&$8|1°~©ÊTÉDy=ýioÛ\0Õnïèý@&þ[]ÈtµÌi§âKàÓÍu0GùW5zowè¨Ò· Òù$ôóM0wiwdçÕÚÄO¡ÊØ¶¹%ÝÃ%[}n©Þ¢f¹/È¸ô|L}Çëä2MÛap/#!ýç±·TÁ/³¹ßÃë§Æj\"=oøùmqMÚÄ-ç	fðç7Ó!X¾Øu\0ý³óÃ¢#Ó£ ,ytÛbi7ÔõsnS«ß-Âs»ÕûÈ@~NHux°Ü!±:¸K(äKØ Eâ­.#ËDÁÐ²ýÍ½KG^·[p¾¼Æò¥t¶º.åáþhÆç81?2þªO7¡ó,}æ¼w°­Fz#ß½Ë¦¼W\'êãÞ{OÄs{`%-O(i±cÇ»~HF}¿P{®ðò=±ðüÀÌøZ=¹Ã-o*X´[@qE¥Ýøþ{g\0»å§eìrÅÊ¼Z¥OÈã=jÓxýÝ¦FïuÂµ©²Î Ýå--å¯}%èª1]&¥Ô¶k%\rPD	ïF§*·Â¥ÆãÎ?æ	Pó°T¼H¥U8À{Á£t%½¹~ªmOï° EjÊ;-Z¼arß¥¹!Pà§æ2Lñ\\»:Ñ>Í«)ò¼Ä¥ÜP+©õ¥E<ùûºÙN\rW¶çúÅoçÉ±§È5£ÜyöÚ\'ÔTÚµpB¿ãºêu¦É|rÄ\"VCýÙºÁß±EÖ&¥ÎUxÜõ¥~z¼ûÖnÂ&\0^ê)_Có£é&?É¨­É£rÅÎçð\0%ó:sÚ¸%ã¾¼öºGjG{Ýµ~%ÝØÆ¦ADaOShæ¾ø+Ú:®áÖÜÍ^:µ¼ò´Üz-)Ò94»ºkÛ\'ÔÓÆÙ8_?/jJy?y59ã{:zs¼\r0rãKìCÝÅ¡Õ`K=n}H¶åû¤ëA_è6¾Ïë;ù%hÙøÔ*9ÔCcªXÙ)ëwM\Z­*cØÈbË¼7v¼^;¯~T\'{;­)$©ÊîaXà|È(ìºÏö¸Gß/ÈOÝQ¼EXìDñE@&¹å¹÷Wysl\n?I!Ï÷ÞÐ7<::!ß|ÍÆùxH¢·lµäÆ¹ýiiÆî9Ä?wëÆÃd»¬/{ÂÏmDuÈL>o\'Õ>d\'åÕw¢°=¹÷X¯Ü¾NP/~BIm2É¢¶Âèr\nÈ1íPò^#ýf£ëù¡Å×yUÆ4üÆ»cì«f<lTÖL]ÈÉ>1ºjxtdrÑ;uÔXC]xÛlñÌ7ýAxÄKf¶ÖZßè*T^>4Ñ.åVA­(v<¢úÅ®¹¶a3»×äÍ¯á×7Mí3Ë¤Ä©æÉéBBª¸	4Ðl&5ñ³/}êx­8P¼³µ2ÝJ·Tra1ûéæM{D¨(aHÞWÊ{ÎÁ±è¸/ùpäô\"~CpäâÖcFVà|Hf%¢á~Ò²Ô.<Ëû±nÎP;Ë~°òÔöZØ-U­_¥üü¡Ñï½à7Ï¥@a]Ï\rJyyiså¼Öä_ÅyCç¿\ZÞéqÂª§qÐ¨<3êú\ZîÜÚÃªr·æWÕPÄdÊáÍ¨öQª#\n®)=ÂÌÖ?\\|<7B$_6È+Äi-µ¤úgnª`|ªÒÉGÚ/NµÁï8áÇ6¼s\"/\r°GÁÔH©Ê<ÇÙ=ýýþíerµ*÷:ókqùã{;»·=èsÃÒ~ ,Û»Ë¹càl¶Ê¾»]-~fjVGHÙ->ÃÄ«Rº±ÕÜúZMÍ®)[i@âûåQH^ù¡´dT¡ãrôXë«ºm¾{?wåÃ:/Þð&\"h2\0Ðþð1Ä¡ÞØª\"ÏÈ·ir|ÞÉªÎØ#{ï\\-Ý	YÛ9\"^)ïJ±Ìôý§¾ íMkÂçÔ´Ë¯­äðá\'ÿÊÈ#\nendstream\nendobj\n18 0 obj <<\n/Type /FontDescriptor\n/FontName /JYDSID+CMMI10\n/Flags 4\n/FontBBox [-32 -250 1048 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 72\n/XHeight 431\n/CharSet (/E/c/comma/k/m/x)\n/FontFile 17 0 R\n>> endobj\n19 0 obj <<\n/Length1 1407\n/Length2 6093\n/Length3 0\n/Length 7053      \n/Filter /FlateDecode\n>>\nstream\nxÚtTkÛ.)8Ò5ÈCÇ]Ò t\"01C\r\"H#-% t§4\"­(R\"Í?êÞßþ÷wÎZç¬Yë÷îçzîëzÁ¬z¶h\Z\Z\nB¤AÊÚÚê DDÁFH3â/7\0lp÷@¢QÒÿ+AÙÃ`}*06Oix: \" ¨¸4TB\Z	C R\'¢Ý¥A*0/¤-H[¤F!<\0`e´«¯;ÒÞó÷+ÎJIIðÿ.)º Üp\n¤\rÃ8 \\°á0g!\ZD`|ÿÕ[Öqòöö¹x¢ÝíåxøAÞHÈ\0áp÷BØ~éÀ\\	À #¤Ç¿!Úã\rsG°g$òÀVx¢lî ìp¡ºH×ú¬õ\'ô×Ý Ðÿ´û«úW#$êw1G»¸ÂP¾H=Èé\0éªi	b|0ü ÊöW\"ÌÙ­yÁÎ0lÂïÃ@jú à_ð<àîHW ÒùD¡_m°·¬²UF»¸ PÀ¯ó© Ýpìµû\nýÙ¬\níòÿË°C¢lí~°õt2F!Ý<ê*¥`]|öH\")!\")B¸>p¡_í|]¿Ð_n,@W´+È´C`ÿ\0þ0/ãîôÿß[\0(dc@6{$\nðOw¬a÷ÇÆ.ßéºÁr\nüúýçí^¶h³ï?é¿÷+¤£xÏHÓïâÿÄÐ> (H@XB%  	ìKà¿»üÿßØ{õ`È¿Îù§¡:Ê\rBþ`À^Þß8¼þ¢÷_áý{\ZËeûê[@Ä pìúÿ-ß%ÿ7Þÿêòÿ¢þHÍÓÙùwûwüÿÃ\\Î¾%`©ìÁÊBê¿SM¤¬°EzºüwTÃÊCe¥¸\0TT\"úÇôPCú lõ¸Ã\"ý½ìg$\n¡ö@þúâ`« ÿaUwÂ~U<°ûy`%ù½Ü_6+²CGÛþR£°8æîó`	µÄ@þP¬lm>¿ùD¡1Øs Èíøµf(D$äôËøW_¸§»;vðo:`þmÿ<áf§ÐpPÇÚÐÖãjE&oQYÂôc3aÑ|KbL¯êÕ$Ãì¬9ÍRµÙ¨¥cÛñóOÓþËu,õ¾¢G,jßìYl¦®p\'ýÙ¦ÈprMSnI¹÷âè1ÇÜ|s]ÞÖ¾×LÀUÛ=ìÍI]¬&¡ÖªÓþ¦º8K(e²µdi¶é7Z;¤çÊYrüõETÎ36MÙö@wÕÍÏ}ý=Ì1Á\Z^!+»á\nU~ (QÉBÙyN×æ3J;TJwyîOð$\'¬dönET\rº¬Æ®z¾ézä¸Yz¥ø1´YÜ5ËZøíÊ÷ºàC«Azüàk­ñ\"»\nÏomåïßm\0«{ÊÈ@ÆKÀÛ§(¨ôá³ëÓ,~ÆÂq¬åÓUáfæ>Ü-\nñÎm3VÛ§÷KÆtÛ\'¬8)N³ß¼widK\'_ÈK¥tîô¾¸,÷h\\y6,©§­=Ó/yÍ*ºYHJJ0Û åóÝË\ZCÛ!d×Ë/+T{.z¬ÆéÚ}dÉÞä=uüI]qHú\"ê¡u·S¢Â7nâg	æw_}+il÷_/{ã19S#U÷éçX>×SpW¾åc%\rQ\\+ønÏh®OjýPJUE\"÷LivÚdøßækÉöèYh\'oGßª\n9yBFô|ë4`Ñ3ÈæzßCµE#»Øt;µLÍfìK¹hq¦N¿údrvð»(ùJõ¾\Zê\0ÒE7T)Fß]Þ\Zd[^jñ¸aÑ_¥ÉÃû2ô<ï:É»6¼ýVîüCRÄ«øç<6¦~lç÷¤ªú%8ê½¢aäÄ»\\óY%ãùEæl}l\n§äê¶NBKF>Þî¸²àÝûBP*²¯B -ºdrVÝíÍ1ï­ãoìZ_Ï(Ê«Ùu¾û	»dÖZ~¯Ô\r?µO¸ý<éAá«e½%èj¨*zsG~UøÙî\"«âû¹£zz*1®·pÏØZgñ¬d/AöÿÌòÛGûEqÁÛB©@J\ZPêÍ³MÉßÁ¶¹·Æ¹×ù2ûRæ¤+ÚBòîSËãSd¸ÈÈ.jÍMÙÃ·vHÑYiS¯áú¶«òZrÇôÜ	ýÖõØóIïg¹¬æ¨:¢5=jñ»µÚD±.wî]Ié{áÙº]®I(ß/íÏznú-Ï&\Z×9V¿|\\Ä9#«kÎä:zÕÚu$ù_«è¿Þ|dà\rk¹`;êUòó~wø:Û»«s8Yërg»éy7mÄæÅátoe	/c¥À½»N.\"µ»mÇ8«½íÐîÕYùd¼ÒÍkx|müô³~N-ÛÞ\ZNeø®o×ÛqLPÓÀüÉs\ZvÏðï)Í]_¦¡F?L=ìÑB¼òÙìø°sI{Ó©MX§ëÆBíÈé±¹°ûÆ°«á*»\"¼yÜdEUÅb6¢a2Â-{@:ú.\n\0¾2-å{k&õ>V!i®½sW±q§aïvíÄû?85¿W­5ý2·WÔõÙ:D 2öðÍú^:FQÈWÃæË¿¼HÿÑ²O¿+ªãGßúE#*àóTW3@±Kãn\Zx$C\\ÐñgØ]$AéÅn®³ýwÎËYïêÂÈ°Ép1eS&¼\'i!Á§û#Óâ^Ô¢ÂJrdx½ÅÃnåà½_e+*|FD­ÑÝ£¹ÎU)3:×¦³é¾5tß½à£í&§½>2Ép\')É5åµ%@`²>T|Ye¤Wq~fÆÏlÛt¿¤/¾\"­©È@½¤(ÑniÅ%N©âÓ0Ì(IÐqÈûr^EúÖv¶ï^ÚQ¿2U<Ë®}ÉØhIqåÍçOAE-\'k\\ÉVr¿E`®nðMÆÅE=ì8 ûj)Jú.}-=ÅÚÐö£`ÈÈM½]·FLâÂýe¨±V>Ì$_¡)PûÜ\"»É¼¡ÒD¬p!+cv5EôtSu+ i²ßnÚ¸]ñù|Äó5¦õS¤^ÔÄ³yÕ¥Äj«MÓÝ¦©9ËZo0ubwSàHj6S9¬·O@îÝ©v¬ýb?áaäOî*èÝ,¼3<)ªùD%¢~/Ã\nÿÃ±üÖ[:/ü9î7@I÷Gµ§õ±TÑRÇMí-HöËÏñ]Ëû|e.«Ò¥«¡xgÆÆtøm}a@Áæ¤èyEËm®ª.q¨Ç#ô.lÑümÀ².K0¦?Ö»Å©¢\Z²j¼¨.[n¥aîj¼½ÝãÂ¢3kXA$ÝdJ(Û=)M.>M^ÒNqäRú!Ò&yóÞúsã¹¯¼¥¡Íí&¼$Ú¼¥oL¯/øy$ó(YÞ÷\rN¬Õ{[)72èÄKO¬?Ûp¸ÈnÏ­dQAëïTK\rT¿ÏÚúàåæy:@±qºÙ¯¥OgU¥ZÉºøìhD½9ïÎgkszâîúÏ­S«¦ÓÇè³ß\"¯¢C¤ÛæýÄñ£Å:®>)!)}×({çD3m@Þ¿+½ý:ùLÃñvcØhö2Ë8mæð]=âÉW.ðÇ&?/ô¿îÈ qKü=î71Y­ó²F<ë#©e¸UGr/F;Â1Ë{[3ì¯m2bN]kÜìEBoé¤Ýâ\n¦íI5Ê[êIfzü\\`Ü¬s4¥Æú$¬g }(ï¾0ËÛ@>½,g?Ö·´æ¥ÔVo½Å_²3ù÷3¿]ôíÀ¾(È,¨#¡§îÝ½\0ÁÐ,ýÐl\roË@î$c²kícæ=Ær\0¾7\Z·ÔléÇÀíuÑeÌÃkÒ·û¿Ù«jÇ,ãÔx^é\'¹ÓºrJÜr§ÐG«¿8o0I%×~\0ë?urã°TytPc7+´¤ï^zBüÜÀÄë<Ñòð`·ò:îÑp@OÀS×;Û;øeä±ÙDAò\\Dk1ö~3´ÎµÅÉÇ»ü/VFëØ\n5+¾RV«ÈH5wyfycKá UáÇTKÂëàÌ´Å÷Ê7ï\\T{Ò·¬Ð§ðUo­4õ¥ýJÚ]½ÄU¬nÄD¡6òHc»1t@þ-S ÁaòbÌ	LW{½gv;ÕËýK|/óFLäqréÝÅvÅÌªÓ\"sâ9¡áåH!_»»\r¹c\\7Ëë¤ýàÓÚ.Õ\\uÙøÖ\"ëûÜ«ËÐ²©y]ë~ÞÇ0IvÎ`µ[îá8YQH>ÇMÜO)©\ru³ÞéÒäm($VtÄ4¼fZö¥`ön«õ\r¥v?æ¶TÓ~¨!xüNyPÔ|qÚþô«0d·¦3³A6%I[Æ}R&»ê}ÔwoPîBgôÏ8=pSzÈÂYð:²òâùSF=#S@®1²·7A}sÊ9~ÙñÙîæ4oNyùßÐ{DõR¬¡Ç3òÔ>¡ãiKª\rOnVÜïÀí^Jz~Ô¤!Çù-J)dï:½!üÙtô!Ã­ÁÀ 1àãÔVÉuÍ ¨6ÓÛÝb½#b°3E\0f°)ýÞvFüÅÄÊáÍ¢C\rî^¬Ó~ZDGëB\"ó«å\ZgÐágÓÒ¶Þ¶E¿Síevâ9ª£®1ët?	Z ¾åU¥ÃKÅaæJ8ßg{ÍZÀÃôk}¢õ:ÅD×ÛËõ¡í6Ö%µúãv5JMSv³a=EÜ<8uUlú±Á6ã\nô½n|Izâï=YJ{?êIßá& t|<wW#Æfm07iÓ!èm¹sÌ*$Þô×^dQá­5à?^]VRL}\n²\ZËÓóëÕvZY$p»6©Ícµ[®Ñnü$­µpÖÏÅ«ÁH°?XÞÌ+¥ôÑIQ4QÑsÄDè7(VÇSÍJNÂv#*Ñ«N5­XÁ+	\rânf\n{éP¾uVûiÌÂÕ´ì°:¨óòjVé¹Æ\\\rýÂºë« 4*Üz8°â7¯BÚ.ÿ¾| }ëóÓ{xo,ük[6U\\udãÆ[ÂÂ>f¼Ó^õës\Zä/÷÷Ó^\"iþ ãòò¢gÁè§¦î~z¸öDkçÄ¾Rg.ûuÝ °Mþ}£½ìäpÊªC*ìe\rá!¥dëà=özE\rYÆJ)ºUIs©^-G`&Í4ýè%.ÐêË \Z¢FQ©X¶±4wU æ¾<Ük2{÷eRÓ«ÇÏ\')Ö|ùU?ï|þ`rÖû®_#(lägïÑé²®ÀÓù\ZæÏ1S;zv>v?2pu¯Vöóéý±e_æ¾¹¾î$B7æåàõñé6LEÔLfrBa+ÛM!L¨vprÅå÷ë¹\'\0Ä\0³-ÐåaÞnñ±¾HùY¸Õ¨cÞ)àÁ|ÉÛy!ÜçV}¥OX¤­ýGä¯:Ï¦8s[p¯­,M^^ºÛãf,¼\"°M>jµÝUyu#AyåÁ±æªê)ÒäëiÓÚIs}[\nyÒ-râULÂ¹.XÂÔ/ù mÛñaM×±½¹[kèÊöZ|a\'0µ~q×tZÖîÃ\ZR·ux[®ÀL3NkG­WNª#*YúãnÌ× k ë\'ª©Zu\'.^ÉÑ9\"@%xúT¶Ô³¾]siaíö9®¤$ ÝÅëË\nÁMÑw?é¬³V*û%=ZºÆ=y\\>/ÒïÏ1@eÜòð¬8¹òAP}$|§oôçmFëcFµ?çù	×vßé*.{F©Mk·äHz¶úYmÉ¾v¯Éß|ðÄ¹1å%ä½èÚîÿcwtÓzìuàëÌtQµÎÚnîI~øA2:Ûh|ÎËÛ°]ðzÛ·ªÀÀÌX½(}^^éIxùyçÜ,)EzÄ@BOæ£í½ña6B[§ìtNF³oÊÚ[AKítÀõ|Õá¤Bü\'>¤M~£Ûë;\'_VåY\ry.$Ì*ÿ.Í^?_Ü­zâFò>0VÌ§Ó[nÎÞ9áW2´ûüàw9´ÎLlúh`þú£7¬ååß_âdÍ_§ ¹¸û,n¨ù@_úåÀsfjo©ï* KKÒ½D|·Ï¹g\"7BÍ~Þ$-«¯ù:#`cs.¬îM<ArùiweÊo8õZ@<´)QÞ1³CªòòÇ\rþñ¼Ãº£ÍHk³©Ó®2BCø5ºöK\"uO\rêËbZË!ï¤÷dôûÒdí/@Öùë×qMD¾æ¾2wÙc÷doÖ²^hÔÅ-R,;DHG®tEé¶_èÐîÒ·8ÁuÝ°EH2qò¨Ïm$)$¿xR\0pá¾]|_TÔ­1ÈíÞ-ÏÁPâlÑ¦ügróvØ«¶|\'õ ªÑ3«9Ñ©Ql6âÜ:qW¶&È#¦/`^°XõK~Áµ â!$´ÝQ\\P&¿óÝ÷¦è@ØPL+¸-È¹øÅÕüu^O6zíañtþåóB¦(jñÞOúrvE?:¿k­m÷ÍÕSMú{±ôâ9Æãpw®%Ó½¯ï@zC­Ñuþ:!<G]O{ªWßhã¸èNmXCydSC#Xúy¥@§ù³üi\0r±SY¢*ÿP?÷7)kVô¡Üý¸¼G ²_ì¾÷UÌK¾¶2H.§Dðn°îýÔÛu­°¸lõ$Øg¨¾ýZ2$r=ÓbÿNåðT±²p]l­2¤GxöNáz©\nªòøåÏY«y?ÆHx£ÇR|DÊ³K¶ìñÂ\Z#ªä\0ËR½PAÇGõ«?¡þßÏÕ(â\\ÙÉäp9¤Þ¼.¹V*¥k-¢2¿üÚÏD½/¿è(;/o«¹ðõÒ¥ìÊþG£G¾Kö3FreÇÇ÷+R)ÍýU ë]yÍJ¯PÍÿeÞtËã§¬Ëu¶Q°¿ò¦?Þ}o©}3rJÒ(WÍJOð®±ZúLrÄÞXdOOdÊD\'COÈ¹ò«þÐV[»õ4 v\'Óûp|ÄÒtÓ»ç|·T_å}f÷CÉÜOÙ.ïM\\gÓu>ÓdÃS1º<\0 ÓÒ=ÝYÃÕøwe«Ìèõí|¿¶¦Iß8È¿w~2ðÚm¨iör|{3À´ÑÞÔÛµíè±Ûrã b oir`¸ß.@|CÛ6Ïû6ûèKÁ¦/Éîyß#*¼Ñý2èö,þ©Àg{A7Âh\'Ë©*^´ÜÊ!@ùÉk¥éËÜ{ùÆP{}©öýøD²ØËæa¯¬5x?sÆV<ü\"þÖ35{ÖFm²Ò#mÇ6³à7A\"sÕýG(U k£Mâû\r¯¨FærÞkuª?¤!U¾\rQzÞÖÕ1ä:Â\rÓmÙëOÐ÷l³uîn&5w\'JoíðnÓR7øBH7;¿§on_»,QyÀ­lýú9ÍRUz[ÛÅÌPØcÌY	¤ZyT¿%Þà°|Üe÷8!ê¤QÁ¥·Îq¿º,\n\Z$hVe¿©°ûbí[±þÝ	*Ö-ýÓ\'0£AIÜí¦\n@Wf× ¾¯7ùøtÈuÃåCÇS©©öÔói\Z§;rStÏäðÂï\rÁTÒwfj\Z&ãüf2Ý&ßÍÔ<IíLò7ùéÔ)l-p4XçÚ1íÿdó9ÊNuunXãÐãºÑhmÇÆø±«Ü|m¼\\{û¼þr!º +özWèçÔ9+7Ã¢I¨A·ÚØX7>Í\"±:5i¤$nNÆÏKè>}2~N5uÇ½ # §n°}¢¥ubØòkì÷ô\Z²\Z=m$>%p×¥w`ÙáGÌÙéaÉüðÏÇto*?ÐÙIà0+Á6Ðöò[[Ó+:&?N¯DQë=ÆaüUÀÚ\"\nh²U$}\'P:o~]Mæö*Qß¤§Ï;È}åXÙ®9ÙQÉp¿X7åN@{¥Ijúãp$Oy½pìzÑñ\nÕø°/+oMøöXavÀ~LcüV,ÅJ¯`r\ZÔ¨Éè\'\"@¹ÄãP|Áàæ,áÜ:nØÁr&^_×m/,,Ä·ûp¸e³á¤;wåNêa%ÉJx7Qì½p£wìóËdpvYiûéòCÝÊÜ¶mAï<7ÊÅðò?UsQ/ÍòäSÏPã ò=:\0kAgõ@$QpnÊ±­÷´Æ2¤¬³Bÿ¢f%ÿ-M4XßÉZr¿j`çÙÂZ÷£ñ\Z©áQY!Þ÷\n}I­!·Enbð)÷Ë8¸~j¿y@_·/búÜò\0c¥ï\nendstream\nendobj\n20 0 obj <<\n/Type /FontDescriptor\n/FontName /NAZTKW+CMMI7\n/Flags 4\n/FontBBox [-1 -250 1171 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 81\n/XHeight 431\n/CharSet (/k)\n/FontFile 19 0 R\n>> endobj\n21 0 obj <<\n/Length1 2167\n/Length2 17839\n/Length3 0\n/Length 19135     \n/Filter /FlateDecode\n>>\nstream\nxÚ÷P\\ÛÖ\nãîî4îîÜÝ%¸4î®ÁÁÝ!¸wîîÁ;s®äÜïÿ«Þ«®êÞcÚcÊÚÕ$JªÂ¦öÆ@	{;Ff^¨¼\n3BÍÒÅøo1ÐÉÙÒÞ÷¢N@#Ë¼½@ÆÕÀÂ`áäeáâef°23óüÇÐÞ fäfi\ngÈØÛá(Dí<,Í-\\>ùÏ#ÚÀÂÃÃEÿ·;@Øèdibd7r±\0Ú~hbdPµ7±ºxþOj~^&&wwwF#[gF{\'s\Zz»¥@ètrþ\"P0²þ#@ÍÂÒù_rU{3w#\' àC`ci´sþðpµ3:>¨JËvÿ2û=àßµ°0²ü7Ü¿½ÿ\ndi÷·³½­§¥9ÀÌÒPctñp¡ÙþehdãlÿáoäfdicdüaðwæF\0	aeÑÁÓs6q²tpqft¶´ù\"Ó_a>ª,ng*jok´sqû+?1K\' ÉGÙ=þÕYk;{w;ï3K;S³¿Hº:0©ÛY:º¥Åþmò!û#3º\08¹xØ\0@G\0ÐÃÄé¯ðjÀ¿,?øz;Ø;\0Ì>H\0}-Í?pÞÎFn@+Ð×ûÿEp,,\0SK1ÐÜÒîOô1Ðì_ø£ùN\0æÙc0ÿõùïÞÇxÚÛÙxþ1ÿ»¿LbÂ*j\"òtÿbü_½ÀÀÀÊÁ`ùkÈ¸>|ÿ7ÌðòK,ÿÜ?\"JÛÙxþÅá£xÿááöï± þ÷ÊÐ\0þ÷ûY¨ÿ¾.3³ÉÇËÿçøÛåÿßÜÿåÿmôÿoB®66«©ÿÖÿÿ¨l-m<ÿmð1Ê®.k!oÿ±vÿ×Tø¯UZºÚþ_­´ÑÇzÛÛü·Î@S%KÍÐºðÞÆÒ¨dïlù×e`øhØÿÑ},õÇâüÑ«¿UÀ}úß#ÅíLìMÿZ<VN\'ÜGë?ÀåcCM6ÑÎÞåÃðAÏ`fï÷WG99\0LÂþ8L\"÷Ç¤ýA<\0&ñÿ\".\0äÄ\n`úØ\0LÒÐGL¹ÿ\"nf\0Òôa©ú±Ôþ .\0æÏ2ú>23þ>23ù/âøÐØÛ|ô?vö¿$¶¶üÿª4é?ààÿ«ÍÿåþÞÑõc:ÿ¸|P6û?ÌþÿRZþ	ø´wuú÷qóÀ-þ?bùøÁÝúðà?ù`oûD>ý¡Îñáj÷1HÿÐdjÿ§4Îöÿ£þHÕáú#ÃÇ[ÃÎhö§\Zì,ÿ:ýOØ?Êæð±Ñöÿ(ìÇ;ÉñOÿB®@ç¿ÇýÍùå¼ó?àGÔ?g|\\ L.NÀ4ë#Ewû8|Pvýü¨Û?àa÷ôéÃÛãð#¼çßðÌÄÕé­Ëß×àÇþÿýª=&pËö&|ÁVµÁíÕÂøî{f)ö4Si¼:\\ hª27î{PÖvÄ©oV_½OZê¡C[Û}^âT¦÷Úà¦°&Nëú	a	Ôö}^}4¬Á[@ÊPä8ºr#)å¡?¸÷IzÔõ­}]ØSÞ¯â)aRÔ\r(£È5ÎÇ!ra ¡E»ô@»½Eû>ùN,Gç{\ZÅVèýy5úqÞk½\\Õ¹÷3!ø-ÚØ4¥·Èa²ö¢wIáÚÀG!ñwDú5ÆCÖ*K»¦Þ\Z·±åNÝ$@0þ\0únBMi©\"fUAºK\r5ð°ÓLd½ýN£ÛÌ*`g¦î0¨mqâßÜíý\\ï¸><2Àpÿ5¥õa¸id§ÛW³X°_ÀÜVÜB\'|m70²Ìe¬K(B¿âÄýiÂïø[ä	e»ù37d/èÁ9GÏïhßKÎ­9ÔEw4½ ÷ Nwã)¸lâ_©s3Ä»¿ånÄP)óÕæÊ.·*°ÅJ=åâ·9~²KKöî-VëzZ=òä3kT¨·Årä+ìF06ôñÜnßýø!¢yd¯ñxYá&2ýK+8÷[§ÿ÷.gÅ4Iá°¢ûù^Xc²357Û¦dMµOO;ã]E/îôeÒbTËòý²Gü¡>ËzKb½¸ÕþBXßnüYk;¨A2QÖ£)2÷WÁÉ:4~¿áà«ª=äymô.ÎïNï{ÛTè³÷5ø8\"ÓÀmâ(IwüÓ¯7?QG¿7o¨»×¯ÔdÌ\r\07OÆ DÈ ;Ø1&N¥\0¥Trtï	ÙVÛ^YBOÄ1Í*uk70nùC~|ÒíÒ%ßS?ÚáLú>ã!«l7ø?=w×²b!1dq\ZN»F\';õf§Ð$Ò,D+Æä5d\nc¨6&ù·\nºx.I0o\r*êÖÛ0r#är_­¨ÌKe¯7T,g\rYÆTïT×ÉüÔ<~ÂuSéÄ¢¹;©GbûoÕ0rª÷\0{eþxøiÃ/üYD,Ì¥>0iïümG¶õMKÃ9ÁGþ0\r\rÕÕÃ¸×\\É\'Xðc9:I×ÜJüì,ó×\\&¤@Vù8ÓZ}d]YØÓÕEA -Ó±ê¥\\*j§g}ï<qÞ¾Qèn:^øë¶¶î³+²»èdÜK·æU_ÔU½`ìDà1oþ¸yÿ®Í\\>ãæÍ¹¸ ûÐ\0súî8NÊûé<1KmF[qMçx¦[rDÖÛ(Lô³dv¡ç*5R¸,Õ×^VEæYJNi%rrç£§òfì-.9àøpÄÃ ®ìØ\"%+y¢qWè½Ìn\Z½«ýùrÖ>¯\r×ø´Ð9NÚô6Ú\"ÄþÄÓï<?\'J6ûòe±LhpF\'ïé^w© ,Ýì»y¶R;qïHØo\'Ï1UÐmÎ(XQ¼[*Ôdõ >äv$3©ÜÁ·?ù²Ë¢Á9$òI¨ææé9¾[;×Þëüìqê~Ð¢¯âçô0¦û¯_¬zöe½JWAiQd×Ã\\Ûs	(lÞ$¥dSÒ!OÎûÀ®\r\0¡bI0ê;e)ÃÉluU¶¤×C	Ï1Î§!ªø]ê±×vé§úï]E4\0R*¸É¼-&¤eCQå©üé±mPæü×\n\nÛ5c\næåTHÚ\'Ãôè¾ÜÍ&³ÛÞ,\n%qÖ\\^\"\ra\ZU9¦}þ2¬sô2ÑláüÍû,¾JïÑ.xj²Ö%-H;	¨xRT`no%ûxÔî>5lê]ÍK0cá7?Y{yxôÙMÔÍ7¸DÏ]ùÃwNÿ95ú÷F.ÙÄ0B,\'¹LY ¿Ù<ÈÒvLåå§$û?¿®ëÛ¿·zMFJøAÁ¢Ù=þ í¨B,iÄhøhÐÄB¬©­ZâÒç^l_¨ a5cv´ID\ru(e1vÈALû{<@áèLhi¡b^ß(çT!ª)½ßºå<ÂGèãÞVðü,\\±~ÇG\ZÒÙxãÁÜïb\rÌ°9Ùð¤6Ü¦½pÕÇ1\rª¿c|þÁBD[¶;V#O7hìàÿÏ{½l6 B\rëPCo)·}<l	­RQ1{Ë¾ûÇQÐiï×óït?m	Jl=ÉJ<¨å\Z?§ÆujDÛPÛWvg­ÏTD­4Í\'Ïêþz}4bWfÁ®ûøÁ³í¨QØ\\<VwÖ·>Ës6Î°Còë®È?(à] ËöÂÕF½,s/Ì+rSëäâ!³|£L^2ÇÿegÃé	\Z*#¡ØpÅ/»w¢4^ -,3âö5ÁocÆ&ò áA{o±jyDsej/²+9@ðÎd	k¹<ã\nk×#\nÇ=Øç%,U8ÿ\rÎñJ\'Ç£e{ÝEØµ¢,ÁAxQ=_uÕØ=ÎàRZp®\0ÄÃ± «]ï\'M#!ú²ûËA·ÀÝM{[NC¼r|í0à»ÁZK²dÃý¯Ë#j\"a&ôésÃ5nWÆkWºóeÒ§k¾Kz?¯áúi\n8û¶ªÍð!æTç@Ô!\\4M	Éó¹ÃMùm\\TçmÃ\nêt©×b·«nÄ,Â¯qiwKý%N\"<ßÈ1íµE+DYú\\ÊLÈîK¸A¦¬Bç\"d«Asfùò»çl$¨¡à\"®Ã@ù¶~¾÷<ÆW ¼lÒ¶óå&íô££;wñð7HÆ håYlu÷Q`*\'LHÚ+uômO£ùÅvN³±µß+ñ,ò~ræ	¥2Ü© B<uZÑ|äUH,<r½Ll\"2BÈÔ\'Ô\\¡dewG+µñß\'cÕ¼@¯u_8Uä1~Ïß#U,ú>2®ÙK+¦·ÎTdèY©\\6¨«Ô/A[¶f©õ;êP_pgj/oTðUB­N¡U+¦\nN%máTÇ©0ãeHû¶ýLÛèÛ^³DPq¿¤ªôt7!ª.wzýy9+Ô5,IUÛ \0úYYhYzyË\"÷=9³K§«²ó%ÇbÂ.¡÷HjnÕ¨§Q­÷7ßÜf\Z]¸\\.<u²\\íAÎèT:\\E¡·¬DÃæê¥¾uñFÝñ¬3C¹ª|=U£õ\\Ð~ï04·í¹ÍµÖý<öTr?t\'[á÷sç$ë+»Ïà´imJïGo/í30¼ã<àaHDE#¼±M`5ý>7^í3cÛÁo;;+¥3LëÞUMÌePÊñ;ü@kF¶AGðiùQÏ}øÄ8ÜÜHg61èåYâDüË VÄ«r$ôû×VA·¹v(°ãëöÛÅÐ^-P£|nÜù[¸äÕPs÷eh8®=	Xm!OU½/¿C¾¥U<ÚØ,\'À\'g¹0?6K$\"¬o>o\Zé=(y°ûKä`úCk¾Ôó­J-` h£²Üp,_¿ì?üÒ%ý¡õÀ<vfÂ¡ðÀSæ ÀÊ%Ó&òzÝàÌ~ÞhN}Sê©Lä\" S¹Í= éÜßÀK¬BÎ£ÇAödëYIcÙî6|dÕs§Y!×§\"¢O¨\"bdóóÄ£Î gQ;·C¾¸\nbsÿ|ã\"\Z=º­¹ß¯äÉª d«9ÄwÃ0ñüDRÀ¨lwAY«Jj³ø\0yÌEº ¢ÖohqYà·Ðæ§dS»µÄNÅaH9D»äAH\r,}Usø/ÙX1|QDÕSg%²\"¡À¾Æî5âª¸f8ÄCÊq_ñ~äùÍÒt}mÌzl(¼bâVÅ¥BÐo¹åÝu©±:ÆðøQ$NÍ,9Â7Ñ¹ªì]:h­FÕrÂÍëo·´ë\Zàb#\'Ê ÕàÇKs[ìs)ÜòbU¥ë\"ÈWbéýBSegû!,¿2dCý{¶¨8¬¼Çdë À!Ëªù\n÷¡é]]Ú0\nJ®ØúÜ2[Åî\Z¥îû³¿ï ÷¦\nC0M2¬tzòH2*\r3§½W2ûWâÐ¤P¼ªùè9ãÈò´¾¿*Ë=ìz¶ÕiLGù«E6Ã^àU§7O#¼¶déüDDé4¶6VDüúæ45ÜCf\0|VoPÓ°UhÊ3¦f ÇZ2Ü>cÀÊÔBUUî¤uJåMerÿÁJzõ0ÆlzWÂ+Ã°i°I0oGÚDHU2ÿ²=þèfÂ%H »£QSÆÖmT!LâéÙ¾Ãû{#Û$ßã29ÐxRþmáÛ/&3_¶ÍäÑ¢ÁRÉÒdÔ*3yçiè9b-MõWß»¦fí¾(}xÿ¹E\n«ñA©ÎE©wáñhbÇÆ¾ÃÐÚ+¿¸mf·\\¤Ú\0½528òeè2äU*QÁ\04þ`UWÂ¶³ÑêîßB	8Y°éFåõþiÂ~&á_lì5Aëå©¯b @ÉV\r§ì´½­V\rÙ|lÀÜ+\r[©¤mr^ý¶jHöê_rogzFN½ó Ä«R/>M8êÃ,Y(Zf5gì8<<!Tp»z®;]%¯_\'¹Âù8öÒqt{~!y]×ÏzÂè:ER§¯\0ítÉ¡Ù·äºÊéTé[¥®4\0*Jht¾9NAa	»nõ1HòýúÝç!õY\"FýÌm©qÊkGgkT$ÊÂ_Am»¹íN¥ÖÉ`»-LüÃ,[ð=¡åÎ¢ÐZlÙdÐ«u³\nãIÆí«ÿ -#\ZÕ¸êNXÛØ²ç1WVöíh]E¿íQ~c¤+dôCÃ2KÑ3²SäüÛVÔØö%Üû·\Z\n»0g1_(º}³2srÂ§~P=¡ùGÃ%ýIÙ;>Pî\'m»ÒNÂ%lfÂÚ¨®åþ=ë»½WÓ§3hÚN(Gb·w¼1Q+¦DÐ*àëaT²XzíV£²áVíI¹b×wÕÙxÜ`Ô>5ÙR#-ò]wóáFÅ m0|ÇÁ |Oiêä÷v+¹â2é._¢.ò8/±mtõÉX÷6í(º×òÏ¼}ý,?¯\Zlü]ø ®B`x>å§Äkaõéú+øçLÙÓÏF¹hECá:Uá(3câÙù=îxÝ§FDø¹^ûWrFÁØh¾V#ÕÃBÏùá{¾ý~ÈûÐi{v¡ÎÑ©Ìv´HÞHU6K½®#FÐ\"¸Ïä¦)òÁ/d\r\0õ%=Éyçë?Ë[ÝFÛôu_¾ÑÆc.¼*ü*Q06¡[mïÜÎ¶\'Z.Vm÷¾6?67Úu­ÈNãïE×zò\\o.+{¢m2¿{gÔbÕëe/JÏËX¼J×ïrÚ×f¦ª]A¸/â8¥(¸N²Ík-©æ\"=òûªÂÏÄêò*ß?xóè¼WäÿlÍ#­uo_9\r¾ý>ùúL¾\\¤%~Z2Äxü¤kªVfU©kE¨\nàòÂjrfYøPîÇ~ØÏ6´´O·É\n¹{änµªxjÚ¨ßÈVq*åRÞÙ\'Ï3@&©îNï{ý$°M5$åèé°1Ë%ß\n¶ôKë{!ï@-\"ûË?{º!°ÝÑÒ3¾Ê/		XÑðkZîÊ·	¼/æ\r¿ùÜ:Ó÷IimÕBö.u\nÂP:7ÃyKÍOTòå\'m½%SËiB¸Ò=À{½×K\0\'ÄçKíò9Véö\"J¹Îq¾+÷¿N¥Re)³\róy5G³]«ñY£­R4»ÈÄA3	ä*¾g:ilôàzèU·@µÐl_|ïnÐó·Ézç°ïDÑ9ÈàC¡W ,¡B·,\r×­QPî¾¿\"îTã=Z¸À>PxVÕê^g®á/§i³ØÒ\\\nè`7kk²Ye\\ªS£ÑWf \n±s÷}¥û¬Ð,9%\nzSu¯\r¥	lðê»»dkÑk\\r9{{ÓþÅa-ñÅ Ã£;*\\=Û\'J+¾a04XRY}S\Z^8-ø`íNàwXÃàlX`¾VÙk¶AÔ{	æM}Åkà÷°ë®D¦øØrAÈ­ÒfÉxl7ràzaæ;Må¥9zø(¦ãï©YaKÕ\Zf´ã |af»³=\"CP<,¸$WÌiòT(Ø~ÙÓàó³OH o~Ü|½*zx!¯¿YÙ¼m{q0ÛEÌÂ¥*<kß\'Ü¸:Ó¦¥LÝµ:,¢\n+,ÓÿGd¨QN+éá§·pÌÊ®éÊ7Ü1·zYbPØ«úÉ$ØØL¸Ôåàzµ\r~õn-^ÀUAº;­\ZØ3¶5U¯AÝu QeÙ¤½}uæjGíë»úÆ¥ý0P«Ôµ´äHw¨òC\ZÌðÈ}§^m¯BþÂ¯ØN)|Â¦Ò¢øLa¾pV\0PN/ÝQ+ä±×ðLYv<Úñ\0YÜÅuÍBÕ=¥ñJá2Iª >¬¾µ\'ìº©1ñÖ¥))%®nì*¢3í]ÍaZa4qù¸E½ô!oÛßÉÑ@ô~³Rð+·ìoÙ·ÐÿE´s4vZí?H¶2èmZäà>LbùdyLlÃã0®îmç5êË©ªwýIÉ`ç+à[\Z ]YÍA¹PAE§8ü^Ñ¾àUS³ÑtàWÉÁbÊ¡°>^%ö,|åhËÚØBHä¾*]³f7¢N3z.\0ñÁzBJÌxøä#¼8_tÑP\ZBÊD;f×Í®©ýÃ£E¿Ø\'¨h²ÝöÜÿ.ý(%\"lcÿwËï>oo×À£zçOx¢}åÎ|-t¦°,¡C·ÚyÚh|LE3Rús&MC¶`|êànH%+~uäL+v=~3yÑ°:©TºhÃAÒ Zíc#ºÑw{ºNVr*à}H\0}TÂ_Nn^G{\"Ü1ú\Z0ReòJ 3PÆQ\'.uÌ\'ÒÖOæiïVÍ]åpgpUK{Ö I}äh®ã\r\nRÃ\Z>3}³ÆT#3ÂIª\0á	¯¼qðNðQJLMZp\rt`î<ã6z·Ýax§Êâò±×ç¶\'\"UyÐ~ZþÉ]¯Xaq.~¼Þ\\¹Él3IE5ÒË\'3ÂÍeÀú[Ë´vyÓÎø¦c[£çdW¹¡·!³`0ïU,v±è>\Z|³ó\no§Gp¤IxK¯¥wÛ!{}8ø­´ÝÏD	!ÜYï\Z«(pOH+m¸xî¹\\ï×EgªÝãw#ALoÛ~¶ìÓ/Ð\'ÕåÏØp ZÂ aH¡Åe/®Z·áBÒ­È¼>åõ7Ó@ ¬ãg*ô«)çÒgÌ³ßs\nÖüzë»%Étðïý¸X¢rõ ®cÏ¨V.%+1\\)ûo\rVõìT¥»³iÁIÎòÐ%å¼õov©ibëÁP®ñêõ0yXF´±6ôúo6.L8v¦É^Í¦1GÖê$ª~sZ|ò§¯^¨²CöMë	ÞeH]üYõÀ^%´kï¨åÝ3ð2§Êî\r*§·$+}¦{«¯)¯ª$Ç-CìP^ºU2Ø^)ÁÑÁ.ØìÖÊnCz2ÛGàv×$ò ?ÆV×P=öèÄRWâ¾BN%8#fÿÛw§}\nèãAZ7þP]ðxÆ½\"DÐZï²Òã\r}ãfçì.Dk¨äN\n£,úÔëN_T*C|Àf}¸öîõÉHÎ!¦o`I=¬ûÙÓ¹<©¬ÃäêP°Ú¾ezK#^É\rTæïÊ1äé:fuª^1Õ ¢S`Æl±,uDîoá~a×ôÈºNDh9Ë5g­ÂBò\"j V·(y{Ñkªªæpãló^8µøð¶2ÑZKÈ\0@m>bÑÁíÎoZS£&ê 6\"o`9/	ºõZ§¤8$Ûar¸Ä ¼¯/S\0ÿ³æGÔ±.þ§ã¡;\'xë·Ú\Z38Gálª)2`©\rüÄbKÀl72V:¥#¶¯,ÊÅ@X(¸ßnövÞ=!\'¶\\_±õCõUå¨Ôª[Ýñ!+N+ñPG¡±££%6Ý¥8[A÷¾þ³)]%bµ×KcÏ ëçÃµº]ÌzTà¼ë\'ßÐÎ\0z×åè§(>Ð]\'­¡&Gxg$v<\nJî]¹_å\r]Ò2ð½ßHì2Ái}ñ/ãúF.à7Sé0|IS85X°*Ï¼¬r©wð/wÛw¯ÌÆ56ßa5ëC<°4HNÃkÔ4)Ô{~[Å\nO$ZðéçeG Eº±ñ¾ÑÌ÷Åoâ6a>Do7bÃLË7¨dkH©Ý (ÎR#à8,o¿ìËu.­PÍE$Þ;o°Yõ%egÆÿãJÝ(ÔUÃ\n4ôáX:Þµ1L76åP&Nm3#÷ÇäîæK\Zz­Uì³é+ö¢ëÅak?é§û´Ç\rÅø°nXÊý;_D6ìÅÛ9b¡x3 Çãs§kæ[¶èRô-÷§å½ô<Óìí^DÏ¨Úý<íé»ØùÈèjÆn	ÏDUþÞd°¥û|Å®r\'F ¾«	}B14d·ÊA(M¾Ã¥CXëd]ÊçÉ	ôÕ¦ìÙkY7Xu7Îí¬Jæ ACÞbIXGM&0Ðã-Üð £e5¶Y­j÷®3Rô ¦eªl%Mã«]Ã-ßíCòKwo(	ÕBÇ¹%R£èÌplSÄÒ)bKÞ\\ÃòûÖÎ_µ|C`}×è£ÒÝÚß{Ï´Jä5N_î¡«Ë3ð1íÌ­VIÖß;CÝß5/´FRQê¥¥ýV%÷åÈ­QYÛ­³=½Æ4\'¥NË\r|·æ6¼î.¨Ðà0ïE¡¨z3@ItÍX÷ã0áï¦.^I,)Ú¨Ý¾Z>}ízÊÇbSþ\\UWMÍ£0ÁÈÁ»uÂþ;Å*Oª.ÌÌ¯ \\±ÁwÖÑOÞlôYâ(ðë¡·×B_¶ÁÀ1ö,CÂ5W³!¶»ªA{%ò\"ôÑ2*{CËOà°9ßZyió½½åpÚ¯y +m»4Ú¦L+LòLZjËÁé>[PÑâ9ïáù@qUxºiVp\r58>\"0È±õ×úTÖôe·Ê!µ]råÌÓFË²mW¸s×ËÇw[ÇG%=Bä¾SØ¥àÎërÎô«ÛÊ×Ó3ãÕ]05#Ñ}6¡MÂH#³gÆ3Éôçø½ë\\ñ= ýÀÜîÈÎáAg;s)eb,¼à·Ëm}±W+g^õ÷bEV*$ªÒ_0X8\\\nèË&YÆ<-Yn0c7Ý/#$Æ¤ >}*Þtÿ^DÊ¶ó,ty÷fîû# aL\0<CiolEÚtMQOå|1¿FÄÖ÷`÷§ËÁåJ>ÙÒâÇ`6/ðªÖ_¦¨&0>:XeöÓàÔÅû¹é\nU³A·$\'kë6¿Ñ\Z×ð 0Æqù¬ÓìP?l*}F%©íÊTyËy`\"êÞúzBÜx>ÇeÑÂÑ®Ôà¸W¾&­ÈÑ¢\0±uÞOY·t@có8Ú4ß¹ä3º\0MÉÓIð÷¶T±-(4ï>ÑñÄúÐãáÒÈãhÈµ8Yõ\"=@±²Ò|éº+èX,°cµ$J}\n5  ¹ÈlÆ?ä-ðÞîµèUÁÕ÷Y@E@AC½v®}ãI¿áÄªBÙëÁ>¬øÈ,@³ÑûÝ\rÌfkTù­<y©çx6âü¯l5(!¾GñÓ²ä{7º>[ý½ÌkJÈN7È)^(Ä|ðw+£¡bèr8ö¤Ñ-¾áªrªÊ÷íå[bg­IÙ¸¦/=¨F×;±ôZòã§²=«¿2÷]ºåëYÒÐ«^¹wX¾ÑÃj\ZËs9ræÁ§iÁø|?8ðJ1òP9²]T¿Z6|¢_õú±q¹ZLbAó`	}þØ\'Íìã¼þz=ßvù*DR¯Lã¹ØP\0gChI}vx\n+\'%S>ûpWæ½¬T^.\ZEÒYx¬iÂ-Siß½¹´8ù½Öí`$Ü\\Z¸·¶îIÉuÃ_eÉñõ4ÂÿXâùc#d;µÂñN]üÌ8v7·B-4cèóÂï7ç¹Ùs~ú0åA#¾O5Ä#k%bÂ¨µöfùO8ÇBWÁÉ%	ZøâÝÜÌ6êì0¥J=0Üìí¦N£ø¥ýêl v£Y|3Y$	ek#kÔÈ\n`6+ÇÓÓº³[½3Í«XËÃòl-n£l¯£[M:¯h?t{IÃGàÄ9¾Ã¢¦!YDOU@ÂÝ}À.IÀÂØ]Dw¦Tm3E2s9ÆÞ\ZvA,&ÍyP@Çô\rÅzÒ](¤4KUMöôÚU&}ûqÈW¸!q¿ø\\ah¢ Vá^*¾ÑªüR»oSÜ»<ÃÄs¥>ðC¡ÃÖJ³8mx.&xOGÖÖÇön6a@Íö\Z¿.ë*¶ôj\\`¹H¥Ý+\Z¿Öëh¹Äè§Í@Y¬ÕÓCgûãH<Rý¬µKCØ\"ôÞuXI¨4$gÏ:ÿp&·yãë7Ò±DÏiûx·¼Ãx[Óx³6ÜáÂØ$âÏzªV1Fú{!à¦¦ó\"´Ç\03:Lô}+	\0´¸Yïx*^ ÛkjG¼7.ª¸vÒ$¬\"cáÈBD¦ð:l»ÁKøí¨ey¸,å»ç$UXÏë(ÌÂNNyÄP³ü V7Lô\"ÒfP3Wa y­M©ñJrÈeýH	ÏÁpa5öÊë+ä¾fhHS»ÏA>²Þ÷Ùn2 æYÀÖ![·le=,ØÌgUý\ZÛ§Qdã	\"ïÓaîâ³ýÉè°Mùô¡pÈ6±7£u`´`JñÅ(¢Iù(4õnËÙø§kê­dRr«J M)9c$ji<vqjóµ»¦³ýXnã CÒº\nzï$tGRÛC\'êÎ7²ªHéÃ~X>¡tÙE¨	fóèh·Êá¶RÍ±\nÔN®$BÁô~PéÇ½\n\0ì3;®=Ìºiù·K×$øZíe|ñ}¦Z¦ÏI$Â³Z6a¥\n­?ýÐÆn¯õý%3åãUiÕôÄ¿½9¶´§N}Í®ó4èOdç®Jønüâ¬±|ú\\Qp7[JPFÙ»DªÓÒýñG`ÉgnÈÜ%©5iÜoKæÖÇâ¢&\rÎÎ½ë§¤^ó¹ñXÔà¡d`nËq{¹)°.U\'ûÂÿRFãµÂ{¾iì[Ô\rüuþn®/ù¸³aU_ú| éÎLÜúºMqlÿÌÞþovÜ¹¸NÇùHO>´¶/´AÚùÀ,7íbÛ£o(l²p6,eBÞç* wl?8Ö~æbT î¯pkJ)¼ÝmàWÈâBRy^rh\0é½·o,.m¨$ßpö@\'äC§è}Ç?ÀÂà[§f6¦ô¸=Í§W_QE·ïVÑt§Bîî2÷ìè±zF[Uv@}±Á~¶$ØµJNÚÐ+£w¸à|Kõ#ñë^ó$ÛjLPë¼. ¾\\ßE$94úYc¯6Ãí¬î=²qB Ùê\r)Ëh¸£¢ÍTxubp<ý¤(=Þ)W.å¼{Þñ6úr0:é2í;£8î$D½0ø½1õ~ ñmh?æMhmë¡AwHF±Ð²´©BÚ>]±ëÛâ¹]ghÚ,Æ$ìØ\"-lÊ9N+K$/*SO¬(^Á«¢iè9D¹Ù\r®ÅAn	ëª\"\\DaxÕÉçv÷pý¢ YÞÂ0q\n¤i$:RúÛ+¯ö~±{j³÷Ê÷oÃõUJ:^u+)Fz³8\'`ãEôµA*åsKQ=¤-sm²adåP©íRüµ±´!3òÊWyöq¦Iï-Öß×õ[\"Y,7&ä~Ðvo´¶§pmõygALòÞ¸h¢j?ëÒP mV¸¶6P¶íoîÓCH«G\'¦ÎKa3q7?ü\r¸&^Øè-/§xú¦¼4ò¶Âj.¡«êAsØºöHÿc\"eÉÿWÚO¥D3Yºa%93\Z<«$­$ÕÜòyùB­éä}qó\Z#åµßðÍXsN8©Dxe\0Qn*Ip\'Ý¤ÛçñA\"{,\n5[\r»Ü·1·6¶Ñç/AÖKÞ^ëë±µÙ±,Õý§æª)Tý5»ËÆÑk!ZÎý3Àk=ê#VAC*S°ë Î5]4±Ø¹èLgjÑY>9$`~ëÁ69À1ûPiWï*äkQ¨\\[¡ÿS¤²\"R\n.1·S÷\nñ3;~ÃÃÝ¤,µglÂzÌêAJm\0¹º1%côV¼ù@TÉ\'õ\\nòöè1äÒu6orÄpd¡jPjÈÁlôÉRÔXÒ´!÷L\0Á^&³a:j×C ¹0KÓPZk $ ve½ø+C´c0ú¥úat¯p%ÇÜª	í;KBÌÏ¹	{:àír»Ó­-å5®¤Re\\Ùök¯·x2Æ*¯Hó«ìq$Áö½ßP\0¢4TFd]þÇgÄnJßÙ\ZKÍI¦Õrèß½_Öäl¬7 õë\rÓq÷m©Ô\r4Jæ}~-æ>µF>Í/{¨\\ß-(Wt¤º¡¹j¿ípoÔ¦ßö8\n -Z²p¶\\°TÛÚhó±ÎIU\'F*ì«)ãè?£¢²VïgTCCó7ÐÙ{ÑÜ*¢E¥(Á8æYø-¸Ä¸CÌsÓ0e\"¯ÝVãíLr0Ð\Zr	=¢H0YbDÏy6èßF0ÁMå^ólø ezjÕáô¥ÉEÅùIE¢ôÞöÚù\rÿBÄní4OÑÆFÔÁo5ðU_IVwcõBs¥}rnÄíðg-£ÅµOMgòxYxÄDìû¤Cm¼ïésÏvùìWB±°Çb­æ5øÅ­ß4ò¿d\"¨7êgK-4^Úª\ZK¡Îý-q´uOØÑýµÆ×g<+´Ý]Íò7­ÞN¸¾ÔhÁüænL|É±A×UËìí¦_ÓbJÃch¼>mù²þ8R·Ý¾¹ôì¤ì7LgûàíÁüèÆ¯EëHÁ¦ZáüµOMý¦à<;Þ\\ìÍ<CcCùã\Zcß\Z]çÑpw³Ð5Ö_´\Z:°Ç¯©»X¦½_13Ä§Ä9õ,P\0xÒ­V]:uU\n^$ýMQKSÕdÊN³(?	ö¾Emãî$`ô\'Y7´¶X7KÿD2¦4üïÏ~\rn®¶Ai«¦¡,7ñÒ]f½GÓR¼,Kèl¸·%sgR,ÖiN¿ýÌÄÌÏvðWói¢®÷à êçé4]oÖ$!£ôÐ/.¹¸ß}ÄÃÄ·µªÝ0 2Lcºù<\"RüòwÄTÜÒÞ¾îãt¥à/Ú/ kït\'äa¸Q¦Í_ÔÍðä«!ñnRKÒsÁXz¾`¹÷RÕr{EÅ\nÀhÀWÂÓÍÝd²ÆMÆÎ¸ÇÛ??^u49ýZ?çúÙåÝB5ÈX\Zq,ùó0yÁDÙäN¨C?á6ù6ÞÏ\'_¼+ºc±AÈ¹A¾­´MÛ×¨4§A\rb<¿Òz¨ÖwDÝZX<ô2pªè63\n1\"<`Ûkðî÷B\'è.µJü©\Z~R®á»xº:5Ângâé¨ïó}M9\\BÜ\0{}¼Jòº]T `p_6\Z¡Q¾¹=i¬Ãê«ª~êf]¦ Qz-­dÌ×ÔòUa±­ì%\nH7]¾ aá±ç¨»g;üêé{{Muãvîw£©\\äbr+Az\"*ÈFÔú6©oÀþ\rf%¾éûlAÓÎø\Z.>DÀ[ÜÀ£¦¤Gjéô¡Ê\nNÍo»þw uÕK?z&:Ær/æ÷b:Ñåé¤5ó¿TøJ+gWWlÄÉîXWR¶9Iµd×ü_!9É»cnö.Þ²álË¶£jËìÜÓ1Z}ªU·õÊW |ÞiûMÒZV]Y¥ÏAÀ6óÃV¿ABLÀ$\r3>²|=E°HêàÁDnlqAÝ^¿\rTç×ópeèqrYµ|$vñ¸yñTú]ü¾kd-³v\ZßrÉ~øXiysý¦ÐQ:iÜìpÙóÂÔè@Ð¾ZÎßÈ¨ï0ñ5K4ûËQdN!JÆÄd*Y;âUðR`Syôl¯Úã8LT5oQñs)ÇëØ%g¼êÊ®£3_E>éw=ÎsXÜ	Nftâ«Qò)d^ïAùµm.>¿p«ÊÆÌÅe4ÞL^¡`üv-ó`wÓ}2#©0[e¦ÌÀhâîGÌgûµdC´5¯ïá GÀ\n-¾9zô³wÜ3u¯BÅS6Ú[H>0ðOñ¨à¿íF¯ÎcÚJ¯0wq=+Õ<ó`\"\"ii(zàËýZoëZ¹ãs7{d$ö1E´x¶ÉßfqÿÙ®$tjISÍÄ6ÂSRn\nPÏ?FÞÄ}¬ÿí\r{B·ª¿ÿ¦§ÑþýáÐÂE¨NtÂôRí\\Ü8¥ó12\0µ\n»OcàUði¸HB%Ü%ðÛãç,ýÞ4M_Ç×¼½ò<ÅÆ|=ñjïGµß/G3Iò:ëÒë°ùöÖZ%ÐWÀ+i¹:¸|G)GÂ¯H^áÛ>ª	B(;ÃBTõ¿QañKJi÷2`//¥×@qNa¹±Ioqù¨\n5^ë¼NÍ(æw +\r(ZS¶Df0<0/iøpV\0x #¬ëáâ©àHõådõo?\'¥7Ñ_fkazé]qß	!¬÷®¯{¥Òû½KK=èf·fÙ%à¬x¬Æm|»\r·#Ü»#\ræè^?Ï!LèùbéÈr`yò²­q·ÌÇ°T¢l84rdhßPf:ýÝLÏùô³¾HËûZ)9üE£§ÖÝK8^Áï+ryúLñ	^²Zi6¿®ÅãK¼éàUÜ×¸Öh½gì)ówø>¹û®_EÝUUøt¬YLÖwì\r¾û! ±áÜD¬=&äìÛ.&*(f_+ÞççÞ©ÌºRÙ6dpZ+»¶,åRv¢5?î¦\"ÕÅ8x¯&ã¨ÔÞc?Ø×îÐ5îØÁGÎHã8G³`ns)PÖñ¸Ï}Èjg<oâÄ¿>¡Á#D?ÏsCÐâ*¦äCÏßW)io¢§T-bÁDØÅ¸Un&lH Ø`¿¨ä\nSëÅ?³ ~ÍiÈ|3SÒã6QÞÙïø	Ú?4ÍWAÛWÙÌ5td´} ±è[B)¶xØrü2(äºÝ=+Ù°¿gf,¾\\¶CK?ìY]HÞ8HwÇÔz\\W@ëVx!2$r¸trúíé\'$]Ç¯ÁÞ8==;¤dÙ`\"J!w_3È?ªáJgUÙnK7xv;ÛÐ`ñ»C]+P&µ[bÛöRhB5êå·xô$9)øNó@Ê~dÝ]åôXRý°xAÎÝ·ÒòÁ6ñj+ÊÉ®;>óªû¬N¨~ã¤,fÆªÄû:õ¯=ÐSÖÂnR\"\nâ6{¼ÂÍÍë(p^:³ãtµ/+|	ùÐf;ûóügô~Æà©R»#*u ,y@®I¼÷u¬ðQ_)ù\\ËÁ0({#úÈògT¿¡\n9~Ð`P·CZ#`jZÞîÏøâSü(ýMñ)wtÉ/ï|=ìJ\0}ü°²&#&¯ZR÷³ÖÜ·Ç3q»ñ=NbùòiôOÝ%/ÂMÕ¯0ÂËpÂ¬É!^;-ÁvñFbF0½×ù-\Zãº­½Zèë_À»}ý¬ú.øÂà 2?t°ÌuR8ÉdåñÏ×oðÌlç%f¨þJì;NFGVkqþÅ4¶üìäûU5&Lñw\'zóÂ¸^¡Íì\"CLz¬U´t²0gºî_»(]g\"þy>7Ù¿-Ó:ÄÊÆÔX^08$¡ËDã¦dl=Í­a­«Eîåú²\"ÝIÖ[æjôSüã+zY^ÕnDûç6DÛ!5]?qè#wåíôFfgbCz«P¾8·ë²ö<ÆBËz*XûU½ùô0ÉnY_&ij~p;½µÛ\Z¤éªé!@÷Ù>ýp¤Øtd\\ÎTbÿÎbçæH·ýf/Ìv5ÃæÝ?èl,ß´WQÞÅ`aÔd6e´Â¿\'ÕîÓÀz¬FÑ´÷¹OlG§#>[w:(¥µ|:ÆZ=ñ¸h½a*H9ú)Y¶kêL{Ò!üýéû¨Óo]|FýX.¿¤Ô¼ºoÒd§e?³¯Þ×\Z#Á[Ie9\"EÈi)ïj_Üì¼cÉÀ{|/xoÓ÷91·2Ã®ôG3Þx¾\\ÊÙkB~PSòËûjR°Ý²ißyÞmÈ)ß?ü³ïn¥!Ñlä$ÍÐºËó:x f/ÑÕÈó\r{_¡ªE@÷ïcQ­.öHõ:ÛÆïc¦Æ\n[Ke-K°ïÙD¬®$bæ/[E¿|ä	¿)sy_ôláTãÁ)÷°z«!nÃ{ù¥H¼¦*«\rz³=FçÖßC>4¾£Ò}ü~\"µ\r´9ÒìÈIV±5:â	?ù¢e°óRQ¯\Z|êÑêÕxúµu¸é@+¼Ñ½EMÕ=uÆ»q«Ö~$ÝrG(ñþQ\në«¨v+\nÆ1n²8^v#)X­¤:ü²ù9&©VÔÓ@Dá\0UÆÛê³?Xe[M¦3+{d)Úßy²¶ià%`ó\ZêÜæîú¡ØvÓ9JUKè#<&=¿³¬ïu*t¼Ï«½Qðþ7\\¿S¿ä³âwoÖçßN¥á]Ü>yYç\ZX\ZíËîLô-%V­^,ÂÚ;{ò¬×<J²×N­þ0åIíCl&¥þÉ=,¢5\0Ó)<pgÑ_ÙCIÛnkl\'ÇqÝ«ûv½|uSyá £cÇÖi¾ME,eQ\\ÖF¯Rë¢8HÈ=g<#¥ý¶k\'ëÝ$+LâØv%¤ôÓKÿx\'[©¼)UÇñ·¤ùÆþlHzTDíK]W=;¬Fy}¹	ÎÉÛWv´8L\Z;íOêÃØ·µàç^@°Õvör\"IAÊA0¥<	6Ôª.Ý»/;R-J\ZÑCxõ02 ¨èâÖÂê0äçE6ë4g¤´ Ax§µÉçD¾Jt;i8äEËÔïDù8l¶iÎyÁZ¿Í\rCÌö²ªRm³ÛÈºË¬RÝëÏL\nÕ¢Â$«í®\rýôü!àÖ¥E¬ÃK1H\'¹¸²»L\r1Ä¾í4:fiE§P8lÛ2Ó5ûy	$\\2wçZ,­sRéÚ×\rÉ,ù?×s¥9½N9çýæ²xy¯ñæéa\\ÛËåv±íÌO«ÆèyæWJ)¸ñ1OSÑl)²ã´5ëqÌ8på3¢P¿Lù)~]¹±¨iYð\'âuaÞ©}­*1ë1uÝ|ò9Ñâõ_­ÌÄ9ÑöµG¦H¦¹®|ÿ-w×>â¥c¸µ\nI+Ô·rq<Ý(ªUCoËÛ\\­	¹¼\Zo¥.v	¡ºõÙÒ·¿_àgä%}ûj,±ÒØeù2îd¿£T¬E2é[ó!o)FµH¥bªRìzòsÞOÁ5ÔoÄâ\'áry½-öñ=PÕ_ÓÝÌßîMÖbã­äHw~¸ãf­p3ÚwacÛ(Bùk3î/|a¸Yï\0e\röÖ	PÌ9ûé^\\X²ZÞO/5¿¦¾ÿ«=Føù6«÷Þ%Íã{ç3ÚüºÒ)Ì§\nªéýõ·Î*¨Y»XÆXáÞó2k=qyºbÎ`CLp÷3£CõSaoÆ2\riJº.Ð¨¼Þ¤\Z9ÔÒàà°.æPþj8èt,1#Íð^³­ÓEî\'ó[M6òÚLö3´Lw5ûaª\\´XºA}=åõØÕw9ÛaD*Øüf©.½bcÏ;øè¸Âh«¼WðéÊØZ o:Ì\ZÀvRö[§¦ìjó÷êAEÃÊËQ±»*\"ÉÉ¤ûZCR<a¯Ì½ê@x \" &»êñiªu×ïDEGãÁM*÷EÏbÄýR&ï\r¸-QTßw?å<£ýtK]ä\'ÓñáSä`äÃ½ìÏÐ^	ì[i¨ÂjåL>Sª}5#çmÙí(±Tøüÿ5	Êö\r¶ßÕ@\r7ßÙl¤,¬[BÌ¶\'DÓÏËH&CS²qs×Ì\'Õ[ÃÏ,Zð¨£Ã´Ìå\'ßcÌÓñeu%,r¢-°Aïk8TF?¿!¿i»H;nç)8Æ$ùê8²<¸þ-´xv*»uÞÞçY¢»ÊìKè¢vêî£j?2% ·®W6X\\·ÉÛ>çVþ)ùì)¾ßF$?¼zÙNå÷î`ÖÅh¿1á\Z©j¡p$£m1½s¤sz8zhÆë0Û¶[(\0+8j\"ñ (»ÜÝÏø÷,Õ¾æÂít8sýåKákù¨±Ùfç/!ð>9\r@_@9b-üöÉÜÃPØ<ù*K^%b\0ëÄcÊ^Á¦)APí,ç§Þ@¤ÈYÒ1&)&PØl(@ÿ_0¿¸À}ÁÞ/µ8¦Ê\Zè<#ÒÈl«8LÛ øSg¢Üa+³®F{Wjµ*_H;ýÂ¥-Í;§UæÂ	ØàUyj$èÜä8§Yþ~±êãàå\r;Îg.ß:myÜFÊ(Hö,¬hÁS\"-õ`ä$}\"dfAj:J8îö  ÌZç³ôÔ@mæÖ?P_ÏtøçXVÁlÒÞÓ¢a¨ÄWBòÐÞK&RÃÅq5uÒÞxBá û;jÛº?ô¹hå!¦7	UPD®vUµù{­¡k³ríëË¢çq<½=Sp®Øíä¥nÞ\"Â×^:øyïùD$mø»í/¦w\"ÿ(¬î¶EPx\Z5ò®!Øs×hÿ*â3\rºdáJÃrmwåh!Eº	@ùå§¦l3¼;E8Þ\\¡É3)Ã`¸EÉv;Pf{N=Á½n£áNdU3mÂQÁÞAB³Õ3bçRà5!¹×q,7²Ð_/Ó±ªé00h³;ätzñ=Î©¿YlÒÅ½¦$7e$±Rô¶Ük¿¬¨OzG®Üõ8¾8ÆÞÈ<¼X¬FäY¯ þPüã«§À<É@<A[#RÁ/Yz(KJÈYþø÷5ª­ÆzÍiÀÂHÃ\'£Rø=Ü|N,¤ê.èZÍÝ1\\N#IQg»2¼G«æ%ûÏgUA¤\"5Ûc6çYk¯ÊÚÐUlo«ó/Z<8ðA¨«>\r-ì\'21m^¾øÆ_!óé%ºÇòõ²}\r@msj¨C%WQÍôË¬\\ O}ªv^`.°üÊ¡ÖÈ^B&{¡fÈ~\r0ÂÅLÃ|¤ô%BWCÝÞ%£@Û§óü\r]`\r£K\nW·=,}lq¡[FâàÌAC={Úr&wÔyáh\"ûà\nÝï\0ºüe4ñ¹@Wÿß|xyrÿ\r%\0fÊ Pzzsd=PÙ~Òÿr:;¡2¤´×¥åÇ\n¯n¤ðlx$¡Q¤/,iRV{õìé£øÂÎ7!ùrbø_\"S··×êÂè®7%Tí^RKâ°ò?3¨Ø|ÎA´I§TOj$½Çþtô+4mýÇ\r>ôUe_õ3ÁIñ¹é¸Hÿ²ÍäòYÛX`öD¡-\\xü^P]%7ÇÎE!k«¯éR¼¬bdEªÐÖí Øv ª>ÈQe05QMu?ï»	ÔÜ³Å|9\Z0W\nuâ%öwL2£s\r»Ì×±­¸\"Ð¨&¹5NÈæ#¤Øæîâ¼ÿäEÛ\'àvµgVÆ*1t0f6ûmN`QÒçÞp_þ4)è¯eLM;deþLÆúK_bßGCO¯ðGF&0übsÏ?WXÞVÂ¹ìÒ3gLN­TÏ2ÌÒ_Úë¶SæópþëÛçl£\ZVtn_ÀdT\"3ÞàgFÝ U½\"Anì¡Cg{X>4`É\Z¢plOñ³#§)ZÅ]àC¾ » <µú»Ñ31TÎØr?%+Ã#hjWLjPÕ³{»aö¡Aö=<*­Z@n\0}5HÇñ­¤1¬|$Ç÷+WK«ù\\8QUk!=w>_eË§ÀÉ¥>÷àìDû\0¡²_+Á!ÏRµsìOÌ<a¤J¼\0\"ô&®û@áóâÍ4¸Vµãû¾Àðá\"[=d§ïý$Ï£ÁÈYNRæ¶Ü\\à%:_@ÆsrÂ:Y½¨V@Å¬;øCæ®é×]ª?twX  &ã_,zPKôjYÏ¢f£[§®ë°@%öy¦óì4þ	ù<ÄRºw&Àþð]Q)¼d¡ºñ9QO<0Ì¸«ÊVJ\n+öbk2#ãìúaâmã2l9=ù-{ìj\0a.ëj7Psls,Â3µKTÿw»\0/¼EõÐ\0½`qëîø¿0ÓÚ-íé.FV\\Ò]Ô[Ë±°óåé$¹·!ÐVNõölôJ?­qI#MÈ»àü3]§DÂ¥4ºã]qpY*ß¯NÔëdìåÞ¢MkYÓ«P`rí\\d $¡\"ººËåû$mÆ·/,þ­18t?¿÷\"÷GºÈÑÿ<CØñ¦¼8¿Ët^³M@2-Tn{ægÅwwê6zèF9-ýXZèÍ·ë.[ZXÚÀ»5ó´\ZÁÿhýZ§tLLA\0Ä7^0¤éï2×ßÙ¼½×W}fÎ¨õ»¤Ivýïè¦À	½~ÕàFPÝqçÝij°nß7Í>þ\'¹]¨¶1×Âr½rZ´\0Æ¡¶\"4»¯>rÈ¹î¦q}ÅÏwA\nO£¹UÆtHêë¾14³w\'ç{ZõÁ¿Pø¿i~òÔ³|iÚbÐîÝÄ!ÒK-wº],ÝÞR$¬ªî°rt\\\\ñòôûc\nendstream\nendobj\n22 0 obj <<\n/Type /FontDescriptor\n/FontName /DARTBM+CMR10\n/Flags 4\n/FontBBox [-40 -250 1009 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 69\n/XHeight 431\n/CharSet (/A/B/D/E/G/H/I/L/P/S/T/W/a/b/c/colon/comma/d/e/eight/equal/f/ff/fi/four/g/h/i/k/l/m/n/nine/o/one/p/parenleft/parenright/period/q/question/r/s/t/three/two/u/v/w/x/y)\n/FontFile 21 0 R\n>> endobj\n23 0 obj <<\n/Length1 1395\n/Length2 6090\n/Length3 0\n/Length 7032      \n/Filter /FlateDecode\n>>\nstream\nxÚVTì»§$F42	¥·t·¤Ôl1r4J	\nÒ(ÒÒ  RJJ()ÒÜéW÷ûß{Î½gçlïÓÏï}~Ï{ÆÕÈTTÅ	í×D£°¢1°PÍÀDKÁâ\0~~3ÖþÀñF QrÿÍ®C±x:w3@£º>@\"-â`°ì_hPêp\ZuÑ(¸7_\ríA¸¸bñUþ:`@¬¬Èïp \nAÀ ( ë\nGâ+Â @S4Çü+¼+ë)ùùùAÞbh¢ ÐuÀ½á_¸ð\\ !	ÿ\rLÀ4sExÿ¡6E;cý 8¯ð@Àà(o|Ê	âkMuô·<á¨?õÿpþy5@äïtFÿJ@ýÂ`h¤\'@¹\0pà-M}1¬?VE9ýrzx£ññP_(ÂêwøÝ8¨©bâñýÎAxb½Å¼¿~¥Á_²ÊI\rDÂQXoÀ¯þÔ8ë ßcuG¡ýP¸?ÎÎó/N> sÂË®£þ§^øGçÇ¥À`°,÷Âýa® _ÉÍ<á¿_j|ÿÁ8O´\'Ðpã\08o¨/ÅøÀqÿÝðo	\0\00,Ðî@þÉWÃÿñÇ üwÀxâAà_¿O¶xn9¡Qÿ¸ÿ.HÓJKÃÈ\\ø7à¿Mªªh NT\\(*.B ââ@ü!øßYþÆÿößZ#(âÏÞÀÿdÔA9£²@ÀßÝ_0|ÿäÀë\"üwC4Çp À?´·Kaø/Èÿü¿Cþ7ÎÿÊòÐþ?ûÑôñðømøeþV(áð§Ïb,~#Ðø½@ý§«ü%6;!|ÿiÕÁBñ¡rñøûÞ¸sý@Í\0Þ¡½¿ (þ~×`îø§Ä?©ß&8~þ]RC;ýÚ9q)i \0ðÇKR@¿Npÿß¼ÄPh,>tFc\0¿æ))á«_Êß2¾ëþ-ÿ«ÌÁ/ßo\"à»øKþ½ép¸?@ÃnÞu{u÷Ía\nèò Â(ÿ²E¦ (n\nÓìsLC&ø\";bs Ö×A÷iIC`_yû·Þð,º1Å¸é$èÔ>Ùdd¹	09ÌüvèéºJu7§¨òJÐWÐípwâÂV]þ</4F~]ZþÕÝå3ï£&W^HëQM0·	/ãÏw|2ÎÊCå\"bØñ§Û?eÈºàÖMo$Há¬çÅÆ??3÷ncãc³få\"Þgx?r\r§º®ËòWZ4[8fãS+ñ©ÀV+dbBF>\0|ã¥R/ñÕ­õý(­Êéô§+g\"¡DR+«§àýÜÞPº-ÜW9Cí+ÖÓ§2j¯]^\rÓå½Ê® °={sÚ[q[k-½òjÛZÆàuH·3yC(q_ ç*¢¬= &Å¨HÕ]xJá\"¢kWQsDdgÈ6Â®\0¸ÊÂÂþAb·F8ÆÝµlÈíßZó\'¯\r\"÷k\")+öJaÞ÷ÅÀ®ð¤ Ç-bRsRÒÇïs3¶±rS$¸w¦¯Ä¥9l&X?¯Kíí=0e ¦L\ZPJ«!\r}I]¶èvA·$o%³¿«|åØ¸á\n÷>l©2¦EßíkÔÌO>bô­wð8ÌêöÖr)ódR\'Â=¹ÞÁm{|çC[VM»F¹ |ë[Å¥ª¡óýö¶úH£>³øIÒÆâP{¾í¯tÏ©û|Ô¢&%É2TÙ¬M|$©ÖrJý;ææFäÏsã!ó-ÜÓdXFu²\Zù9N×GC×gÍ]\\æÓá¼ðh¤Ã[-jÀ2´vÛß}¦Ã¿{CyöÍØL6£õ®´kØöóÅiWéª¹Á÷¤rt­¼IhÇ	ßÆY&0¼Åæ{6°#¿Ò·vifôB5×Í^àL 0wXëûöYëñu\\\'äc²Ó zH%¦%M½òuR©FØPÒ\'õ~»Òføí¶zÁúö\'ß>t÷|ÛÙDn7²97²]bà4I³:ÌÆÖé#÷@_õ¾ã Ô4àB¾ä(zY½s:I!l÷µ~ÂW¥ú\r\0­Ñ®åÏ]îË¹±iY§ã¯BÔ÷ÃâuîS²ÞãqEÿiµòÖu©ÈÔ½í«~ù£v_S¨&»&}S÷F$ED#àßß6+Lb62Õ«½à^íéôO*8É«EóóJÉý56·|û2\n$Ðo*3#¬ÆÁ8aC±ã³°nÅ¡ë\nyáu=:º\'\0gÛ÷Ñj<Þ¨ª<ñNâXAãtÚ­rHrÌÚð8àÅ¾^_x£Ò9áóÓµ-Þô×yQ$²åì7÷\0¯IT.	>6\n ¡	þdWôáÐÜÊì?ËO}Våî ¿m§çAÌ=xûAÀÏÊ§<\ZE7hµèóWº¿tÕuµ¨Æ¸5Ó¬¾ë4ÍtH²±£e¿x|\"\\dÃí¶¼n¤æ:­E¦ÈZñ±9×~NËÜ¦¡Íý¸Î©½âòÑù¶SX¡>`û\"»Üÿ>Û6Eâë9å#óàaôI¾r<Å;4Zmý{¥d_=®\rFx@÷ÈNòCxÞµ§º)èímsFài¸³4ûçANvûÁäbékm¢ìÛ¥Øi_*h¹%¯ku+al¤³JiõêÂý:Y?ufª\ncÆT`«39y÷Ú}YóW_?ã|ØôW:U®Í¸ã¼$,ìT	Ê®?ù,pÆÈjUDÐëOXt¬=0]P\"ða8\"î¢:#ÚÈ°îæ®ªMyHF½^\Z§0Õ\\?×)¸«ñ~¡°´Hkõ¡÷°Ór5ìå$U>YàÌHò¦ö\'i:¾2ÅùÄñØ :ü:Ð7òÚëÄåÅÝÒËJ_×Q­*y\r¸ìªGÜ\"M 1¸,\r±	¤¡$[£ûÜ\0cVØà®¸5wfeÁF ­\Z¸X#z=Gþhßóls\0»ð}½I«x ÄCí3^Ô´µî¨?ªKßÂèÐg²j6oöSÆÚ\'8w¯ÞþV9R1ë&sjíkû±Ï#ãÝÝdY)á\r?¾8[åt¼1sç» ýöó7dc*DÓ\ZëM©]%?Í]råÝk¼JôÙ:«U+V&Þ	¹=m¤w¥Ð¿NÅw©EyZ)&òÊà/÷ô\0ª8¨m¿.ûèÂ®d4Óèå.ï<vMMðõ·E¥JQm®\nñ`¶ÓëZãoÚÜØò	ÙZ¾#Ç-¬¥&·÷JSÇ0<ÊºmdËPÁ*må\"gªÊow1jZä\rÏKìåy\"yZÌdVk?¶°õÞ¹m³&Vm~¡ù®%3^Ð`WøÕyº¦yxÿroäa ÷þ=-yã1D£þmõ!/{úôf=Vo=u¨Øbìa³ÆOä¶æÜR¾.ÎÉ+ròbéÖúm¤äd-ÍGnqD&Ys.¼¶ÛD^5ÙÛÖõ¥ÉKMaÛûQ££yjÄOÖ¶xrbÉ×_¹ñ\n÷,öôÚ<À¥¤¤­§Ù7ÓÞ:,fñÓ?ô$¿}òã$ø\"èTÇÖÚéÙj6¸¦Ý²ât[O¹2hûþæ(xJ¡o¥ì-Y~;ÌgtôTz¹´CWwÆiÀkëÄ^¾$bö\\*éùÁ÷¥,Tìèã-ÇFÅo¥y­zUEÆsðä\0ïctúBú>qó(z¯Ínî^WY)5öJ­ÑÕát\'ß\\ZxV{ýy#[E\\¡MõHi«ðM;I} ÝÅ¾O$¤öä§F~?a&}¡dçø^2òó^0ö\'<§íhlú¢N²~-EßÉz xO<ÊâG½ØºdIb¤ØVÿPÑ0W5s¿úTÐ¶µRõæ]»ÂçTBÔêòFK~7Û£ØyÊ@ÝÆÃ´¼Ï¤ß*r}gRgÏU2²¿ØÆ£ó~èÅ¥%éÇ]Çí×qìÏR|âÎ»de2%Udj}?ÉHu3tpñ	xyºà~Ã FY];:tåÜy#6Ö}{â³¦p¿ãçÜ/&´¼\\õÅG²EÞß-cy^ñ:.Òúëãr`QaÏ	ÜÈ¯g½Ï3KÆ6ps|4FlmVDï¶ös¤Ûw_aÜaKª?wx®y nårZHñ¹|0U|vu cwÀ{öÆ\náÁ¥ÏQÔéiÌú©¯ê2\r}Ìê§MG?x_ìÏ´¡5NÀ£`Ï2Tùûû\Z6á]S\'Â\\2éïì)FtÅR±\"ÔÑª³òòP|ÄâowfµXpïm×0ìøì<¶Ûh°}-#Îõ¼5zçÀ_i¹ÎT¹Iªª0íVÎäð¶ù;9%ôs/ªj:Úów¿/sçzÅ³°Í¼ÃÊï_v%\\ªéèX0ñ}!sVÃ ¢{¥ÑZI}_±3ë(ìÑN÷D6Óa!ïå&WSê\rEñ®YÒHò[ãJ´<^³´#êßnEEïû¸ïKÚsÏôäðQ9¶Æ\r+È\"èìÕM©Ê/*T¸¬ëÝ¢¡ÍW7¯F¥8èö?ÿÈ&+ÝcRØ_\Z\0!s#+þîÊÐ¯þépì|4ÄVÁú|\"d Ü§)N÷¥ú+Dv§WÏÎBFÿP æC«»öÚ\rLw(Ë\Z(¹Ôü^Å×¥«TÍw£ ..Àºß/Õú¤SÔ,ÞvB5ØWhðEDGô­ÕÖÃ¿ÑÌÓ\r>Hb,áõ9®}\'[/ Cvs^\\	½/jýºBólï0ÍV¦6c	µvï,m¥FN:ö`r×á9	ÚÀ¡^gþËC-µ86X÷¼NI3=ák*­ÒbÚWEa2+=25k¦{üå©ÞL~Îúï\\hßbQ7ùèzWÿ(6>z~±¬L	 )òí@y¦.éqO§è\"¿?\rcÅ¼Ïê[}¢6³¼ôhÞ`y­÷<ÖQa}8È\\_\nKÈV0FV^µu\\Îs\'%ÌáÅ9ÆÒnÉ|è¶b¯ÖP\'cC­ôEx5¾ûFöOÕßP\n£UÿJT*Ûî¼ûx±£þl´Õj+¥MfÜÎÝóÝÀ¡eÊRdªï\0MXüjÆÐ6ªôüÓ	)éN§ãDÿhkïMï.æ¨U\\2WhvM×d[Íç\ZÅH=·\nÞ2Ô|E÷äî×ÅQQôÖ¬À[Vféj¶+±ÐñÛo\'@=6»âhcRh¯ÚD>.ô&áÂÓ2²»%Ñ7ÊÕjûºÇ[iÏÓ¥&iñ­ëNuí¥dÜªQÔ§æÖù!FÉ¯÷i³àâ£Å4-Íô×YëKTi>0NcºqD¦â¤U³§§ÀÏÛµÈ¬ôÍ¸øÃW´&J¾_?ká{Õ]VètyÙ2z¤ófßv ´Ðß´Ê\n!>môFò9z¦}ð¬7wÜóö%ik®ïU_ïùDhÅòàEï°HI~aó»³âë7ú<Óú½ÓJ@á²]\n¤*g$²äc×\'Ô­Ad²Åç±¨k|îÝÆYïÕ¨ÁÉ+ôLµÐñ«6mÜÃ®-\r{¦&âÏÑÔ>Ö3-$¾j¯ìÎAfQèafQ	ÜÝô²Zîö	¿±áxïîÑt®\0HÛpÕìggù~AIß§Rî¤ÙÖvMÒø©;;-Syqß¶Ãø¸ô\rÖGë±S°ÙõVmwÌï3\n þuj´#ï·}âÑZ5è¾ëÍgæm>ä5kWÃp²dÕµ¼¯U´¤Uj¹»{@p»«L×O÷cíË62h¦T	ÛµÛ·ÌBiwt]Õ»iÀiOF+	²uXhl¦$lòaúø³i7¿%Àé1ú©©Ê÷ØäÀôGÿªy)Ë×)\nêîWò¦äI|©\\ã@¿éÄ2³EI©p>d®^j\\¦êMôÏl+©©ì8Ö\\¦ð·¼¿^,\n5Ö_Í¿ä5ÒtPO´!Î¹¼hý3ùà³7<#ïDÓø}­¨àiºs­Â§@®Oø	æ±Ïè\0EBfi\rFMåí2Îqpw\'{Àeôpõª¬\\#pZÞñÕ`òG@àTô\"0Ã+üÀ¡\'c3 MÉ¤µ­(égè¥ÏXvÓTr9\rØ§$Y­·-µËø%«\rf´±~¬ÀáøöûãäÁGa?º¦ß@CTÏìüaÉ(p).ÓqèG\Z¸³ôq%4ê#ä[ñ\r3±kùE6aWÙTýãÓ|WÁµPÃÁÁÒæ¥r=EJp\r¶Ø~ZÈáV	¹ÔÊXÇKÁÉAËÖMæ=?×¯òÎQh¦U«JÏÑi4¬ 9~RrHâùô ¨ ÙìÆÍqÙ§d»8¨QRã%=3=rUü@éÔYÖ³y#IT:Î|°Õè]¦ØªSÁ\ZÍý0nvÝÕËüò3Ã!¥£öâý©5nåMN·:[¹¿Ä-Î áe<ÍsC\nHÂrÙ8Øç>Ç {ÑJsTËiµ\0+.cRå¶H\"Û¬ý×lFâ®E ëß}gZS¬\0}§Ä»SÂm)7QzÙs²õúáíñBL¢	ª0áÄí»YÛ¬nÝÃïg´wX`mân½ÞÕjÓtö`ÛXnYWy´ë¼ç¬RW£ã+nXôpIj9K«Üå1fr.ñÌsT#øÈªSJùÀñ$ð	(ôÓieµ\0ÇDÍ×G69K*½­Y¡Yïm_l¦¥øF-ENCZPæÝËuj&ÑltW[Í@&u¥²VXáÙZ/cÙ#½\"*ÓÂ¸|#Ì8æÚær{ÖmùßEÁÕì7;ù,÷oÀTwë¯;ã¨rQ¹ÆW^Y¾ÅPT?@å4\'AfÉT©W¾>b±ÎÿøxµcUv\\£pßÝmehýåÎóã£TÛH<>äÙãýû\Z÷dÄð¶k¦#­fÊVCÕ=gqI[ó?Ö¦ÑvcÝÊw%r³§m.RéªAàFÎ\"Y®;Yo$:ÇAó°¯SåÉz³§/ìªC)$·ùUÙùÊ\rj7øn¬{§Ü7zg+¶ºØO1¼¶ëEO2ðI2s?/PzÛÊ·ºã­v-i)0MC)¬ô ¢Lºïâ¢7nçZ]e2µe =ÕW¼_ü´µÕùã}­C,n%(Ý&è 6¤Ô¼7\Z-;LH¸ÃCÅÓTA>gÇd¬göã&ÇÎ%ô¹Ùe¬ºd?é©Îx³nBâ`¬wã%·ÍáÎÖtZ3Øu?ï%0L¾òâSþ=êÈÉ·\0Ù~7FsGêQ\rvÏ{ ú³÷wmîñÐU©µh:nÿð00&Lãnì_ÌßÑyAPu£ÞÙªBtjp:§èVø¨ªÙí$,Úe3V,ÂmºÁ¦¹¾WHÏ]6¨Ò>«{gÐoªÏ¹$5B¦ÆVúªFöw\"´-HTº]W;-!ô¥wüßÏ?\0x.}óõYlþï&{}û=íºZñúø\rËK.9Ò\\B\n{>ï¸gkrÞËÓQv6Ìw¡Éãrpâé®d`-}¡\\\\¦d÷Æ4JJ±Åv3õÑ±Øû?&¿px¯ÉK3·Ü$x o>[j^ä\râF¿Ôë)pw¨\n;~Y!®;\\w_òÃ%¦.HHF3zT)±ïLEÚ&Qv¿þq-.ò£a@GÌÔàÍ­døËm$%:µýËæ\Zïî¼ÔÐã2O±;_¶Ì_òºðÒ*¬äm\'Æç¤ø?ÅòöoµCù¤a¬mÞ¢#gyßßß1áLÇÅ¹ e.¡õîSªP\\¿<\\s-3´4¥ZÁÁÚuÐ:°>÷ÇøÞôcr¾¾a¬6ÚS²¡ó+»¤å/l5zîX8@\r¯_Ã¥|6ÝÓY$\"ÕAL´*yØóo¦RZîv}\Zæ\rn-Q`»Û~¸¼mÔøÖÒÄÂTÈ*!4¼Ä_iãA.É^¨Ê	ûÚ°À[oÂÞj}I\\T½éÄ®½éËÞÊ¾éÐUð¢dþB£­¨Ç­Çv½/å{ò\"³GöÚ\rÆÖ\'Ï§}ynÌxF­eb| ^Äòk)W¦Þhu([å/&\\©Þ\"âùòhvà¼î£ËýØÝçþÌõpÁ6¢&³®U×pûEíÜ¹!¥º¡¡òò~|lÿáÖm3ÃBw¢X¾¼0RT®Ñ·\'v¹Y1xõ»ä·®F@Üí·LRbíÞºPø·,Ò±¿h CDF&||×Cg;ÿ_ #a\nendstream\nendobj\n24 0 obj <<\n/Type /FontDescriptor\n/FontName /FYGEPU+CMR7\n/Flags 4\n/FontBBox [-27 -250 1122 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 79\n/XHeight 431\n/CharSet (/one/two)\n/FontFile 23 0 R\n>> endobj\n25 0 obj <<\n/Length1 1449\n/Length2 6397\n/Length3 0\n/Length 7380      \n/Filter /FlateDecode\n>>\nstream\nxÚxTÓ}Û?]Òé@:HIwwä0²Ñ ÒÝÒ! !Ò% %-¨(ïôö~ç~þÿsÞ÷ìíwõõ¹¾ë»±1ëòÉ;ÀíÁ*pOø ¨mh.\0Âü@ 	ÿ­\'`3{  pØÃÿðPô\0Û!Q:%;$ÊQhxBÂ\0AÑb@(ñ·#Üã!@ÉÎâ\0ÐæhÀa`\"ÜÝ×âäDÕùûÀ	âJHñþÈ»=  ;@ÛévCUÙApôýG\nN)g$Òý¡··7¿îá$ÃÅð `ØÃì\0ø cçþ\r`äAüe0;\"½í<À\0\naT\'Ìì@UªktÝÁ°¿µþràü@_ð_éþDÿJý¶ànîv0_Ì	àº*ZüH$/ÀæðËÑ£âí¼ì P;{ÃïÖí\0*òú\0;Â?ø ;Á@aø5fe\"ÜÍ\rC\"~õ§ñ\0Ps÷øs¸®0¸7ÌÿoÉspüÃÁÓ]Àyì	VWúãRü[çFD¢¢\"\0ðc\0Øä,ð«¯;ø·ñ·\Z!ÐßîpDÁ\0BÁ¨ôðúÿ§á  ÀBìÁNÁ¿³£Ô`Ç¿dÔù{@|\0@ýÀ_¯=Y¡æ\0A}ÿíþûÌUÍ-,xþ@þQAîðç\0ðI¢\011@à?óük£ÿ­Õ³üéî?2ªÃá\0¿@ ¦÷7¯?Ìàü³6\\VÐ£øpþþ\"@êMðÿ¼¿CþÜÿå¥ÿw¤â	þ¶sþåðÿØíÜ Pß?(>{\"Q»¡\rGmì¿]MÁ-´6ØâéößVu¤jGäaN(ó	>à>øKA¨@|Àz$Èù/.ý}¨\ZP¬G@~Ý;¨( ð¿l¨Õ¹¢îêÈ~À¨Íúg]eîðkDDvv¾( $¿ jWÀ>¿)àÁ¨\0\nc ÀîAðë`EE\0ò¿T¿¥\0¨po{¨=5è¿\r\"(ìôûD@íYþÑ	ÈÓÃµ¬¿)jóoù÷Í\0ûAKópd¸ËËðÎëzyzo¾qõî$óh$ûÂ3g-ÜÕÇ\n¶µ4£zÓóôÜ®\'|½ÉYËP+D¢)l)ò\r=ãfrÓ9MeÆl$ë3ØZbYr¤ÎßDõ\nï¾øXò£±k!qp]2gÐ#ãåº13³n GÌ&Üõ°Ìò4R7üñp¥ÐGûÕwË2!{äýû·yÂgÅ}u¢µä´~\ZÌ£)C´Éy\Z¯hì\n\"éI,´¥nìk¶bkßg;=tCîè>kñlÌKô®1Ølç\Z} ¢iMqæ­ÏdU`«s@»É:©öaQ1p\Z»WnµgáåWæZË-q¸OÂ­?NÑ\\ÛÆç$\nY¥KCÅ><WÕ2¹:.ßH¥ÈéØÈõÔ1u]6<Gïóòy>\0©6»\n»Øk}Û9Òu\ngýÄH9dÖsØüJ]äò	·²(²AsÞcÃX8dPX¥×Ñ­*i!\'±8Åh\"LRdD¶`¤µ¥oþ0B>xÜõS%ãå\ZÑ±gÒ¡­ÒéâÁÀ\'+S§èJúG¤\r[wô{¿b[\'Ù{\náYkv[8Ûëph $AZnöÌgBNÅæ×\n~\ZÙW<yTèÿ=áËîEóI¡|c´4&­g&hËæùcÅ`CÖë©£¾.ô]µæoX§äö#ªXÂK¡Õ-\"íï)c-í´:/Zñ<zÇ[.¾\nZ^I>Øq·ÞkÖ9qÿ^õXA	pc1BBx«V;]Â0Ú$Hèø]\"»©æP¡y?³cÁ6TVsªøÐõik,Yã7U÷ÓË>÷äí\r\ZC~ +ÌÒPñï^zÂ«ÌtEßúÊÃ{\Z>=9Üµ2}L¯ªÝmþ`½ü<²¬Ø<qn¬ØLOùTëÐPÛÚ¶J¸Zº? µÏ-ÅðGO§\'m@èúò©Î=Få´³²ãì¶ÄYïìi[YÐ{*·T´È0_0©Ø.«ä)^[ÊJWz9ñÂ¼çàa<4yÚÇ÷\Z¯ ² îµhOµÖA5­ªÜ\"·IßAÊÃ5«tgÕïÄ½}ù}æÙOä¬©dvÏØç¬!O9ÎûUHî±ròÙ;ÆÏòü¶¾|Ñ´ÞQ©b¦wû`ÕÐãÌ SÔLå+zk7%MÖ¦~)¶PÀ3W¼ÚRd{ÓîI¦å5H®ÊðnWw?b©þÚC=mpíe ¾X§¯äL@K<+gÃ[0D5GÒåz*ÞÞº+¯~­gQÕí½C^æ >¬æçÊ	ºóùÄ;rd8b¬§Þèè¯9Q9  ü4n^×Yt,päõ&qÒ²¨íû\"S«nÜa¶ZXdê]©5=ç£+A^És¼¬M,ÎÆåÚ²²©îÜóáb^ÄÔÒ+zÀ-UT¹ëSáô£FqÇöH\0¯~YTX.WxQ\rPlöãq~¸*aÉ·¿çäççûþQSÖdJÎ«RÛÅþÙÙ\né£óß^. 9Ï}×6ëm^Ì¾³1§6ÀèÄsÑ~D×¾yàª+M}ü³ZnÞR±\nå}¯W~ºFýÑã]67±ÞcLËef£«o¯&÷fÁ;B­X_±ÇíYCÓ·_!ÚØÃÃß$mnZså0íôÛclÔ|ZjÜ \né2d)LÜK¿ñ´F3!9ËU&[)ö­dmáÕf\'6Lv²DL_U[	àóúGOËÎfð<eÈ£ÿ¨ÙM¸ÃW¶f?ÌùWéT¢8³!¾Ví\0ÐÚ6tJ¨B·wjL·\'Âzì*s¬.ödçx	1ÏìEÐÔ,gRÑä[Ýh¯^rý±F$C5¦Þ1³¾ûþ$ú«6Ñ«Î7¥{=Û^L®¾d	TÍj)¾îtJÃ[TÚcÁ¼©§áV5ïsíýTeYØBÀïK½÷\Z2ÆEãGK\rôöX?¾j{xÛõk¸+Aùþâ^©GMßN=_[á[!4ú\0ÛçÀ¨¥ú¸ÅUjB·Ñ:ºþb-bñÉ×Kñ ÑóæI8ÅFMl®Zé»vÍÕó®¬/¸xV@æ¾éã¥¹èä6Úcq?lùä\ZqwMp~Ðs\\äM6L]V\"\r+KHdß7QbsEô_¹ê6¿>VYÚSlÌØwm\\éÃ]78æ\\´Zd#bÈßü8rï@ Ù¸ÁgßU> Õßi§¬\r/òÍ\'HM\\öºw÷çIRI!Sr3(áÝË%ÌíÁÃÚKFªCäbæ\Z8\'rIO±ißKçÓ.ªh aÙÑ\'ÜÂ«fÁ\"yê¤×qi<»õÛm&s×cU+j b¡ô¦~k6ÇÒßUYü9ªFiÊ8{húÒ\"OhýV[üf´ú,ÂÚbÐð|Ý\0*»·ÄÒY~k=ÚªÁn|»A»Ø*¿Öö¦	ínPûQdfâÐ.fÐánzW&9u£y».GÑ0]«	ráU$BXâ§úNBY?CªûLd!=wïÆøïôÊ8Üºø\ZåÄô5¸\r}ÌÜ }\\>æ¤8B||²øº=]Â»cÇ(Zq-H ù¤=y +»ÎÈ})7è19§þ´îRg|¬yIîãRÔÎÏ3~Íc/X?ÿò3az.TIëDßS8äªE¿è<ëâ2ïZÇó	\n\\ÇÄq+ÜÏtú\\OÈð·R¬aý©ïçÄ<ÍýÞ6íûOç{Èñxéx-üL<q@Ó[ßé}¼{· 59q(ÿ|ltþDïa¡IÌ··7×nDP»	\"+6#~2Û¤Jú¯ AtÛî¯/Fpq)\"¾üfa3ã/¸>d(6*:F+»tÔ,,v­®uyT]GúQW©¾`Ü¸÷8æUâ¡]¥©þ>_ø,ÆË¶E³ºâ^a¤º/°¿û9?ÖìýËÔû%aJ÷ß¦¸»×©pWW|iXËò:ñÐuÁîÍ`:Jq×Ñ=üÒ½+3Ôó{|MÑc<²O\"Ý.ÅEÑ²Ï5µ,âÔW¯É}b¦Ù±bÒÂá·dq>&Ï¸Ìût9y§qÎ¨3¬/;iEkbXãðälßZ	RñÃ²ìô!B*µU¨ù3ÅqÔ·\\´û8_ELÂ§cë^ÝÌHßÆå ~Ïôèèõáì!r$>3%nï¤r0ò8¹ËóÖó¾p©!SËý2GrQ×¹È@\ZÄ¿/ RAO?Ü6\n,Î@\Zäm´Çbð³0x	éh{õ·çÝÜÏ>iDÁäê63BnmNägË7õ)÷{L.°J(·S%¹H<µTïåû{c×Ù_ª|ríi|¯½·{$_Q}w£ëñËÉÓQ{ë¯×¦4ãÆ2E$M}|¡çHó¿æwÞp Pôb«áGI¹eòû7^¶;¾ÇS_ôù\\©²ÞÒLòµMÜK{UA½:Ù­2ªoÈI¦©}ãÈL~{´«G`×§?Æ@¼Sniéi¨µK®O]Ý-³àýs3æ·néàÏ#rP*bÓ[Eµ½ë|ñw®ÔsÉØR¾×y:Dvi¸¥]üe\'H¦Òþh¨ÐKÒVWyu«(.jík Ãâ·æK°fºÐxìÄ9ö\nnëÆ¡d\ZÉ&Í\rû«á\0©õÌ«n¦iºãú»·KU<i âÚà©¢\'¾nG©lãý	wfnrýÎå/Ûe:¹ªM\'ØY2Äã¯]¬îÂÎÍd4üd¥u®#Ð»ìaDñþ©íÍ9eXÄ¹÷v»Vø\n_Ã7c¯ÑVÁç1j[½DJÞm×V%Á]ôIÏüS(GJûz,Ñndñ³Rlì:Ó!ó.ý\\Y]]Y­ÖQb[¾Õv(bfÈÎ¿Ìt¿Õ¯{ªÿ1;Ë~£RÀý½ùüQêãniq,sòd)=°Crýw¸·Ån	þì~Rs=8!ng[±±Iª¦Ã¼ç9¸©~<66B!¥èçâ\\Ïðd+Üh¹\nF\'/ÚêÓ76¯}ïsnÕÙ²-ûWÑ3wê3å	\0Ùë>m»\nÕ<5sOO×O,ÓËNºñúÏY¿±¾¦ ûº\'{à \'â\"µ®¢Ë >cCcãÖTcè£ËÞ/-Ttx¾=ìáÞE[/Háò£P´\'\Z`D¦«r\\m*>ÊhwçÂªåºÄùgs/¬«a³í[niómívæÆp¢Ç^ì-u#Wë;Â:h-ZFo#=Oÿd*Dgûdýµ^ÁS¾üÚÊ\"ã§\r*_¯õX:4\'\"#yª;gÌ»Ábä²ÀjÎôK<=}V¤+®Ä»æê|IqPÛ_>IÚÎQî~ÂS{ØôâÙ¹\Z£½`jófÚ«wØµùt-1/Á3VwjJKg&t²îg¸¾Ómzkl*Ò¡½C\nQ8KEªzÎOt,[±ÔGl¢ñN¨üÖfñwñ¥f3ÒânBÐm ¾ç58:l¼gµ\r4ÀÇ!	Å]zTL¶©#äêXlw÷ÔÎ\"=h:óÚ8è¹Ò\\1õÏÓ]]H¯Ô>³úúÐVÌë^Ri¶Ù¦$v¸Â½ür3òD~½\ruIÙBf£h\0ÿWª#ÌKc«ía)ÒÓf±?ïüHizì¬ñ®äÞ\n±WÄì~bMÔ ÷h(r´\\¥ß£?º¸Z,fÐ\nÁ8+ÒKeC\"I0.=Uý$5,OÇ3I¾òäbÙoü¶jÑëÕ5zzóEñI£lFX@\n¨1=PfãgUS6HË22[=-}ò±¿væ×°ÚX¨bó¾Õ}Ïø´ y8\Z$BvZl²9ZÙÈSCVúª¦öõ\r£Xl£1\"4çÅ|å ïîÎH*®Qa¢ÈªÓ¦1N?©ÈkbTf{@}bsO,Þô÷ªUÛâDEu8Ú^;ë.ÔÈò°­u\0ÑçÉbØçã\\«	«}1SÝÅdºh7bþ¸ç	µ§øÝÔSYp)ûñ~rîöw\nÖ/¿¼Gr\ZñH;(4ÏùpØ {¹EnýI3Ú)\n«r`¯¤·r\\..Ï¨&\r0ÇawÉÂ6¨`«¯ø¡øíÖ§Rd^jqà9{ð~q	þóå»öt^\n  åYÂa²hv¨ÄYÌÌé_]e÷¡l/2m1	ÇÐXw4Hì\"¤èfYú¡ZWL&ÄÕôkiqeÆ¨YGØËOeTy$½RÆå/tVÄµà.+baÒ(Âìûôt3¦fé<Êb\r§:Û8xÙqâþVgqnmùQ´w?t,$P:ÐyÑ>5ÇÄ1Ï¸üyÏîN~±Í­Ü¯/¦\"§ìwÑ#Ø<«eÉ}ãª71°¤÷)áBRÁZ?Q·2Uøk·ÂáÆ0OX&ë«uõAâÛB]ðOÛw÷²X_¯ÛòIPêôîh7dß\rÌÔ7£39ocZÅÙöàÿØï8¨¶9¾ÏäÁ\"=B2ôVÕ[Næ5DÓjý¬Ô+aÓNV]Û\'B5/záEÎ=¢k°ßî;Ó6Q¡ÜNð¸ªïJÈ8fV¾N]÷·\\#£ZªoÛ\\ª\"ËúXÊ>^|J\'(\Z¶¤Õu.ÄH0¿KÙÈµs¥\\ÿz-W-å\ZoÏDÀ¢ás\\ªV ¥¢I¶µµ=~ì\\~§ÍBt&ÍwmÚÙÏÔân\"1æ\rÇ«ú«éíUoüF;hÕÃÖk]u½ípï>©e`,³æpÌÔ(õÎôW§Ç?%\rÊî,Ò?GAü¹®ªã9ÅÑÃ­X|Ý¯mïà»§dù·®W¨R+fhþPÄð®Ïw£À­^1|ÇúBÿ;Ó´¢ÖEñyr+O7þî2ÆÖµ\\lv¢\',áÛÊ©2ã-¶X$^ßÙ®ï-×Yæq¬NBÁ±,ªÆt.ñëÕ8á¾±§H/¹úÉT¾6/XR«Ûóì¾Ñ´ZÖù|àõ>Û5{©HÚ£¤É¤Kû&Ê1ÓIÎÛÊ±Ì${´×ò èÉa Ê×}&kya¯\Zü¡MÝ\\¯:!t/B¿o;F­kßFKï)ìï_æ¢[æúùN¦Ì±bkV\\çD2äl9\"äü¤±}MezN£·e¾%×íúÊ}¸m3Þø÷û/>5É!Æ©¯½X%Ý\'±ý[®2êÝI:CÖJçöÁ#´Þq,YAWF(eV¿â©û:[Ï½H£áËæó¥ØV¯;ÿMÔ ¢·ÄçíÞ!Þ½hý¼o§©äÍÎ?:\nrYª ¹ö§~m\rYê¾s°ßÄ¸{T¸j¾Ãë³¿~&íA\Z^}ìgc9æÚp7º^[z]ÅB#ÔìI¥N¹æé_ªG[qÐáQ4´Éú°k­ÿîâ´Þz·ÐeàDKçëEFº¼ù\\ÓïEQløîÍÖò.ïØDhLZ\ZNÎEÁ¢\Z2ùPòpÎxIhºUfX0zám*I¾iû³0Ý_¦pëú}oçµ»ÒªÍÙoÖW\'É¤Åî¦Ód7]^¿==à¨¯«Ä¦äÉÞÅfoYÙ!øt¸w_\Zµ7¦%nÇ[d¥fè>°ì¹­jÐyTy9¼×ñAöos:ó*­åçRôÚTôîyû~f ßÈ²åÙ_2c9HW¿`ha/@{[-¯ÞgëJÖp}óõöÉ¥ý6Ð)ÒÓ_6Ë÷n\ZJYïÿ3ëáµá]lZ¯û)«%¶«ß§û\"×®z¹wºI¼í0\"ÉË¼NïgÑiÊ6©dK`-`wàeìo7õú*Ññã²`Ùª¬¦5£¯­ë\nUÔ#1YÃ\nõ¾ÍË|Ù±£jï¶yÉc´&?×Ù³$Þ¼¬p¬2vÀÔCG{qW^nîZ|ÉÜq[i#	náé|ôbÔcfbõ³±^N.ñBÉâ×mO\'W» ø+Ë\"M¸xA)\"G/{wÍS>§DÒ¡a¸<Ùôyô4ü×Ï¾Gû4ÌbXqáÑ¾á9¼÷´iê[CPsð èYÏÙEîñ:\'4¥sÎ~X^äÇ7ÉQ\'¯a7ß°ø¼\0h,7;,¦a<ó¶¦¬\r8¨M\ZXè; MáØÌ0Wµ½aíÚ¸ÿáàç`YÆéîË¢/t7	44`l«±+±üzì¬UÞN¡YI7²¯yÞÙkX|q(çµúÓÝ{\'ó8èc¿î®ßNz·)Õ«§m[ C¯O=¼²iQ×ÏfÑ¢¬}Âì!Y>«Øê×a+]ÔßqÌÅdôÄ}òÿ[*§ÛãÈ¦F%Òo^3Vâù°0±Þ[µþO_¿¸}öÂ¨9çª¯cÏñL-áRw^®ÄÕ|Ä«!Äñä9»5ÃZú!ïZ&¹Ï«{B]¤`ë\'©owöf¯½âÐ?»qç¥JÖþ{ä\\3Y°_ì£³>4TïGyqÔzjï]Ò\"ãÑÛMpw^=¬Ú|YhØÌ`gfBæ¤Á$H<¿úY¿¥¿8>\0L^ÿ=.7´ýh=U¦é1µ.qÇÆIåÿ\0¥Wà\nendstream\nendobj\n26 0 obj <<\n/Type /FontDescriptor\n/FontName /DYGYZZ+CMSY10\n/Flags 4\n/FontBBox [-29 -960 1116 775]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 40\n/XHeight 431\n/CharSet (/A/arrowdblboth/negationslash)\n/FontFile 25 0 R\n>> endobj\n27 0 obj <<\n/Length1 1394\n/Length2 5926\n/Length3 0\n/Length 6875      \n/Filter /FlateDecode\n>>\nstream\nxÚtTkÛ.Ý(ô 0-Ò!\rÒÃ0À30ÝÝHHH©RÒ¤ ÝÝ%¡À?êÞßþ÷wÎZç¬Yë÷¹ó¹îûº^vV-]^KTGñøøÅrêºF¢\0~~A>~~\"vv=Êú]t!àâÿ+@	£Ð6y0\n§T]ì A\0HD$*ÎÏàçøw )»Â,ê|\0UêLÄ.pô@Â¬mPè6¿8!\\\0ÐÃ¢~§d H¨Q6PtGØ À (à°A¡Å@777>°3i-Åõ\0àCÙ\0t ÎP¤+Ôð0@ì\0ý gsþc×EX¡ÜÀH(\0m°A pgtÜ tUÔ\0Pø`µ?\0Í\0âý§Ü_Ù¿\nÁà¿ÁÂÁ÷Á­V0{(@SQåz\0\0Ã-íè|°+f¶@ü¾9 (£\r\0£þÏ9¢ùaö¿ AOYn)ppÂQÎD¿î\'CB!è±{\0ÿlÖp{ýu°Á-­~°tq>Ã\\ *ò MDÿØ¬¡(0ÿC!1\0Ô	\0uØ\0×ópþv~Ñ|¼\0+4¨Ì\nþ#òr»B(¤ÔÇë;þ}\"\00\n`µÁþ©6C­þÑËGÂÜ&ühî\0ü¿~ÿy{¦%nïñOøïý5tU4Õxþ þOVáðâ	x\n\0 ôCTL\0àóï2ÿÀßà[µÀ°¿.ÇÿOE¸ððôðþÆáú-8ÿàß4h.CÿPß_~þ¿ð;åÿÆû_Uþ_Ôÿï)ºØÛÿvsþöÿn°ÌÞã¯\04]PhY¨#Ðâÿw¨ôÕ¡0ÿöª ÀhyÈÀ­Ñç	ññý±ÃaîPK-\nbóH¯ÝÃj!a¿¾8è,~þÿò¡U±CUÑûí¢Eõï¾\npÂòúE\0`$ìAÄ&°0À©%Ôý7¿@>8N 1ú\0¬H¢_kEs\0è¡á£ÍDÿ*\rqA\"ÑÂûÍ\0tß¿Ï¿UºC!DãÈ£`Ûàó27ÞÕ¼ùÅ¦8£ÎpaÇÄ+/5üt¥\'Ùç¥wúR´¾½\r÷fàÞ;t7mÍKVÎAa(t.Ëðæ~¾8nµ2[\"è­DS\"É÷ãµn?7Á1¹h0þ3D´MpýýZþUóºñÃm ð;k2*F&»i+ÊmÕkdJK4IuÑSy:t=m¦»ðX6MëíÉìêL<zý¤ýHi(%§*kv_B7u|¦j3¬ðw¹·Iqwé\nB9æ°*Æ@l±tü\"FÛ>X8fRó¶êPU}Ãp¿\0GëOO¼Wì·\ZzI`,p(¬²éQÔß´Öt¡Tµ:?ä:è¿\r6bËÔí>¸Ó·ÛÆ)3gåt |KCó2ra½5-Î±^6øEû½°ü°ñî´Z·¶È,4:ÿ«Íñ©Ý\n;rwí\r×&Ò·×1ÆeÝä/ñ·\r2p?ÜÇPX7YT7¿TV?\nïkyË¡\\´rÌ7¶¨VøBÞì»ßgZ©Úì}E­T¦»À?czm9þr¤È@ÿZ-ÓÄ}$À\0ù$.Ê·¶+kÑ¤Uî5·úÎ_³Xª¯ê!-Eï,0ß­ö!\\iXþ^õf6Ðd4Mè[}­g£§ÓÂ0ó\Z¼¤ê¾À©<\ZÏ­î×©¼?4_PÐ&ÒôîS¤Éå¸¢Èfý0~¿aU\'=¸¾¿Uæzq#]Ä¹çAA_[9?zdsÜ	ÉrîA³èÊ] 8j©G»Êdû»bñ\"TôNos)®<?u\'1¤J·`·= d+´­Åªx]Ê*FÞVsÓ)Åò¥{%+:r]UÚ UÖÂ->xßgè*9^ÕâNÔt0v/-âU5]¿¶y0_\Z6äßÅ~ÛâõEÛâù¿êP8ouÅÉá¦¸ª-ÞlBVXäÔøË _õÔ	rkï¾	\'ÝX´{NØ\n¬63]^/`în½	5{£öÕ{ÎPT²Ó\0Êï¸ïp{g,°ó+á{&¢ÜJÀßâVóÛi«^fÍøç2î8£}ö$­3\"¯fÝ}4fÊ»³·§ú!®&ëf¡!|Gw±.®!8®Z¶¹{i7ãûÒÁäl§EÞ1B)î§ó$7}ïÉßrÆ¤¾?ìêôOÃEm¾¥ÓYyzIG>ée ¦¤»d7º¨VE\0#zûÉ_îâD¯\ríñ¬Ï>f%¨RÉºÝªý }Eæ#Lãð#	î1ÔOIN*\\\Zx·,Z£à\'õò6ù¶_zü5µæ\n?¾ÅKÌK­TêÚà¡ÄxO¦8ÂÔ\0¾|Li\'¹çö%é:ÄO eiB9¤ÝO?9àÆÕ}å¾%JàôØñ.æñN69g</U¨ 8¦0¸#­Í%ûâªQ¼§r[~ª¿ÛÚù°.£%^vXü³	^^]¤Aì.}îÛ|aQµÛ¥tWfÞË0i«áMö¬¥ Ñóy£ûòù4,ñtÒcK·ª?Ê÷\"º¾âÿ¸qæ´Ôô[Áw¯1´O-(±8R\r A i}²\n±ÉH¬ù¾9³eÑ+Ò©úy<nµ9Q_ý|çz)@ù«²Ï1Ñ|üçz3i¿¿ñy7çû:.êáf% ûÝö4AÈfGsÿë¸áCûÌI[m\\{±ªMdºn4B¬U;»%²+qú*CBSôë¶TWÅ>-5n5ÉPýÚ¨ý0:[-EìÃRHåhÝcþ²äê×SÓÖøÞ=eåÏõWíö(_$¤fdÔOÄtÞdégÎú¼énÑù<È(à1añçl8Â+{l¦k|æúÃWbÇÕCQÃÇÄ¿/÷rñÂ®óí,©{kéêý\"¥\ný¬äñÊ\'Â²s>FgÐ>ç§úòp$ZÆotçU¢eÂqê©÷¹Â¼<¯T¤ß¹µYý0õ}}cÆè·#¯S70Fcýõfi(KspÚ ³õÁ÷~©`dÝlq×I´ØìDP§{ÜLã¬×³BÅºi«wK(ÝuÕ\nú,òN[yÂ\'\Zn½¬µ¤çáGf¨ëß²ÑöüÒõHôtmÃpnû£RD·?Tqé~zàÂöl\'ú~)tüi°0kqä)<D =Ü´º¬YRäÀ0¨v1NqÝoÊe#£²Duèñü>=¾ÏH\'ÛI%ù¡`VØ¥§sÓï]²À\\Z´×õ=þ4Ðî\'¯>ô_¥0%¢x}ôÙ6kÔ<ò§¬¿\Zæ]`7RÍ!ÖL¢¦ö}\r{ÇHè1-%ÚÉÞÉçÁhQ¦æ¡e7¾AÍÀ·9ñý±{·r\nÓýÀ9øûúS\r\ZÂRò\'jç´}.é\Z¢!8â¾ìÝ/¼®%	t_ç\rç¸Ø07T¾¦,ñ#hì|³ØHãÅÈQ<Æ*\\bgåØÉþ$h%3n¹iôS]\'wóÿ[Å8u&Æ}£ïJnÃÛ.{íxæÜ17+Ì¸ïÝJ%e¤®LÉæMvöUÅri9¯m¶&×4{ØÅ­¿2|^ÓiÈÔPÏåâdábyÈ¸Á·¡ö¡Yìá2\ZùÂºmHºòÌ[¿×á;>®EÈT@òvÜFIqcPüúâÇ\'ãwÖd¡\n\r,ú,Â3ìråéÍí_né½Ws;Õ«q$øä§	ë÷®Ø°@]ü«J¸ÌÔ\'fÛÆcÉVª<â\\Î\Z¶~/S/X\r»U±Çô×ð$ÌVßa²eæ­lwkZ×|~÷~gø]ÇÉâÊå:OÖW£¹$Rí»ïvzPSÞ½ý§±´x~©ï¸Ë¤Z$UÔ-²ìÛ÷·Üaâ9~¢û@Ú¼BÌÄZñ,ò4µøVg·åÔö4åF`¥`(w·¶¹Ã©¶\"üCÒÀ4¥&a2\\	ºÓí	b\r9_åÀ×¦Aw:wdrß_¯=#¥)1ý	­³rõlPoWG°1É×_ùGö}Ïð\ZE²­ÅÝ.Êîß W5JËäcK¼àöàÀ¯^ÄQ}bÃcô|u	ô·«ãý~§FDÊÊ\0 ²\" +\"ÒÈxMj×à¿\"Ïr$òíuº$\rR$úÜ¶5Áj®q[(çI;LF{oA\0Û{:9¶á]õ3\ZÃÅÀéâõ¯Q$sÜ/;Íqtæ#òØ±ª4?/ìï4Z%a!MèuA3Û<ýÃúÎý;ò[ÎJ7h´PÇ ±pQñLp¿qÍBàè³^!5¦¨Bx<|*Ä<Þ£«*Çó°ÖfëñMIiv\"åâ0i»Ý\\ê,sê\rcù&1É5ãÆæú©@eCá5sDOô²­w!Á£¥LMOÆ*³6]K-QiñßêÙDRÅ\"}­¥Í©Å¾_zºØ|sg_òöoÆg];Á[µÚÖ²kt^FÞTTGZoëyG;ú¾°C)QM»S	hÑlXÝI0¤ûøQýt~þ^¼f>f?yìJâ°¹h­iÜÄâÀ(eLG÷¾~ø4J¹;F\"Ü&£~}¯}þÖ/ºº6m©y	%\0×¨z\'^yø£qÞ£ÕÊ©jÿåó¡wê_qý^_U¨Wh:¦·äßÊn³w}{øæGÞ³-cÖ9êoS\0®W~¯²ÉqÊD	Ñi9à[`}¡a.ìôÂãb\"t®JYrªS~Yzû(Èö¥ëðÏ^{g;ó^Ó¼av<Êdû¸eóW7GýâJ4ûÑRïJ8qgçÒáá0qÚ5áÊ_FÕ tF¾ïÎõ\0}ËåüfI*6°wÙíÕ«¼b«¾aÜa.ùê·.üêVÍ(}ÁÔp1©é][ñh% )¹¥;tÁCqzgtðô@8ÁpdShh¸moãH¯§^½TÓfFÍÖkÖ}|ä\0ÅR~Õµ	ùöØþéÝ!Vão=víÁR¼4ø¯T>Sª®ñêÈpk=®aui8¨ÞåênwÅyMÌûxuÅæùÃ<$µ9îý#ÈÌë°Jsê>ÂNq5I=yÂ5ùSþ¦¤òr,]+SÝÍÅã¢CG~ÑSíü®Ë:ô&Ïëª£MurÅðÔ{_¾xgHFT08Çza|]¼u³s#z`Ï7\'=í^¶J\nfÊQïD8ó­}âÔG&Çhôy+>p_X:Q\rlE¶\rO­4`\0\'=hi;âI§ïë%ÃÊ$ÞÀfSÏªåßnóô´í«¸]~[NLhæÔÜgÃ	5TÒ[7Êxw1ÉÈë»2Ô¶ñÃ°ÜÔ=$G3ýÒ­¢OjmyõÌ º)o-æÜ)LÑ3îIë99<sB©iEÇ<¢1l¥½ç#c:ãPßc¡Æ#&àAoD#c¢~òÝ.dæÂ ñ4Ï¹ó£UêMc¥øO5rØTå#ý¬â»£öiÒjºÆÃõkÈ«tª£>kÊeÊ\'	Ì×d¯o¶vj\"6Vy#yÏ÷_£²!]ì/°u¤Eµ´)\ZV®Ò>êàFª_æ7N2ybÜ	ª3Ãán]ú¨A§\n£tÝÿù!vøQwít~Å\n7àhìÍ{¢rßµøÓû9TÞ5I\ZÂw)÷}Iz\0tÔ	B©¹\'/rcW	$¾À.É6`!½-HÊ\nOÞz³/âN_¿YÁsè«3	3\rêPRa$ëõéìÙ#hðô_éOÞ^r¥C»VnlaW²ãlªOÍ\ZùùZÆOì~¹aàge÷jX//&©ç L¢t;¹\"êm¥_ªBZ@þï=éøÚÚ.£Ê]æ\\·©ÛYi?¤#«³ðQãÊÄõÞp2Ãl¨°(Ç~þ=Æ¿£¯©,Ucm«Û\ZIÒ,j7ìª¸M%/9~QÄByÖ¦Ò÷Î»s0¸¬æóD°l÷ÅaØ§/ÉIÛO\n?¤@·TgÖëxh³¶éDcíãsÕG¦*EeZõµ2Ë2³Õß>Õi)KîÀ÷·Ú	Çæ©Oo­&5ws×»\röyÜ\Zp°ºST1ÊµHâ£O}Í¦f¸Ü­åÙd-ÆÄïðìo$\Z¦+(Ê¨3²ábâ}ÇÖ´iF¢4áGV¸I.FÚÎcR·#®±öDfó¹?áT3\'×®2µäF«×üùðÇºgÒ\n¾z~Õ%§×á÷«\"ë]6/-ö¦¼É»ÛNØ#ó,æ¯Ë¦»¾È»ü4¿¡h;ÆºÒr§¤ïbLEE¾ë<NàB®³Øésµ1ÉIÉûD·U(3ßÓU~ð.%þjSM2í5U÷þTõÖqï·Êçîåúò?K8°Ò;î3òou/ÑÛjòj\\àbê+*5-g5&5ï\\%Erû=þÑfÚm·ÂW¶{JºÈdoX©YöF^¿0yF6º÷C#¬$u\nüºÇð=ª4ó´ñÐþQ\' Î\\¨z²SgØ+/å» Å,\rmÏ<Ñ¯l/Opû\\ÚÍòË]°©«\0f¿vß¯Auê¢ý\'C{ì_¶í\rÉ	:¯`8÷ûdû4vösyÀñ^è½ª§Ä.YñìÔ!{STtÛþ{æè-DukÏ¢.s§hòö\ZM2ëÎÖáM­°*ÂkFfYýÌÖ¶	4·.ýa¢ôowÅü©2²+IÆÓUUõaIRI×6\0¿½\'GëÜ¾m*+µl×¼VÓ7ËË¸SÚÐÔË¡Ê@Lw¹`mv÷~Ô>%~ý¼qç³ßN°Q\n<fßÊ¼s>,ø§h¸\'ø¸Zæw%ÏlÔfÎÚÁD© æø¡Ì²l­}Û°×³ý]ÊÁCÐ(`yÐ®wÞ<º2ÌKq§ªQ¢¨áÿ3èå^òA7¬©Cr³+hFQl»\"j]R½Á+´Å¤h ÷hr`ps´¯ú²TOTXFb\n¡¤&¨UêÅf+õH­¾©É%Þ¶I\'r=&¸ÝYlúæ}^åÑ£·*«hÚmÚÎÖ*Zw	Îæãí*Y}f_ÑÕüù¨T,÷F(êZbPkW©h¸ã±\'AóaÃ`_ÉÁ©?ýx)Hn|TUU5¿ëÜlÝ°N.æµX²}æ*¢È.)ÐnÎbÖ¡ZÝ?î·3É ªRìÜRöxK¿·@0·æwj^Î®¥ªM^2ÄøµÛx\Z3â¾ÓsFÆþLèvqû3=¹Ì½\\Ë±õrÓ3©|x{C¼îÉAçæõ!Îîfô[,ÊçPH÷^8çQc$eÅ|ÐMpøV§{)¤êí[BwÔ<dqZïmøòü+ÆÎ\rké^ôY=Q¢2ßã¯d\rGx\ZýäzæÞÆ´Óñn³µp{RÐá°Qäõ\0¹a[7ºîâúNÊ^ÍÀ­QKÃ)kUi.ÆEàðúåÞã£Ù8ÏJ|ÉÕJb&¢Ùc-k¸´<Õ4YïÙcÈ;Æu@\'%Dx#ò=âX´KÖQG^eFG>7R{\"û³ë$Ä]OR´mNíI¾uÞ$2gÕwÒEläðA|¨ùÌÆ3¤n¤ÏÊ¯÷úTûO\r¡\'ÄÃÉ#8Ñ^ÜGÛð.wêÏ½7®-É´åk¯z<¦QÚÀ£÷ç{ÍvB/Ö±&³?»:=1_Êj¹à](¶«õ\n\\óÏ{äÏ»Ý]øÖj*m2¿Kt1äJOþúëê<)RìÕÄ\'O$¦LR\0é«7¸íöyÔìÞónøJB-FåÀ.Æ,?TaàäLzÿ³R	ÞV»V;r¡ï_S74«\\Á2¾GË{¹/~ê7fzHcR%Sø¤ÈH3»îëIev\n¥¸Ða¼f2àmw¦f \r+®U°ºãe 3%º;@<B½ªLcc;ÕÓ4RDE°ÁJØz]Þ{âàhÐ^×ÿX¾ílQÕ»AìtR°¬JB0o??;ÿXÐ\nendstream\nendobj\n28 0 obj <<\n/Type /FontDescriptor\n/FontName /NSJEOL+CMSY7\n/Flags 4\n/FontBBox [-15 -951 1251 782]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 49\n/XHeight 431\n/CharSet (/prime)\n/FontFile 27 0 R\n>> endobj\n5 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /JYDSID+CMMI10\n/FontDescriptor 18 0 R\n/FirstChar 59\n/LastChar 120\n/Widths 15 0 R\n>> endobj\n6 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NAZTKW+CMMI7\n/FontDescriptor 20 0 R\n/FirstChar 107\n/LastChar 107\n/Widths 14 0 R\n>> endobj\n4 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DARTBM+CMR10\n/FontDescriptor 22 0 R\n/FirstChar 11\n/LastChar 121\n/Widths 16 0 R\n>> endobj\n8 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /FYGEPU+CMR7\n/FontDescriptor 24 0 R\n/FirstChar 49\n/LastChar 50\n/Widths 12 0 R\n>> endobj\n7 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DYGYZZ+CMSY10\n/FontDescriptor 26 0 R\n/FirstChar 44\n/LastChar 65\n/Widths 13 0 R\n>> endobj\n9 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NSJEOL+CMSY7\n/FontDescriptor 28 0 R\n/FirstChar 48\n/LastChar 48\n/Widths 11 0 R\n>> endobj\n10 0 obj <<\n/Type /Pages\n/Count 1\n/Kids [2 0 R]\n>> endobj\n29 0 obj <<\n/Type /Catalog\n/Pages 10 0 R\n>> endobj\n30 0 obj <<\n/Producer (MiKTeX pdfTeX-1.40.10)\n/Creator (TeX)\n/CreationDate (D:20120919220656+05\'30\')\n/ModDate (D:20120919220656+05\'30\')\n/Trapped /False\n/PTEX.Fullbanner (This is MiKTeX-pdfTeX 2.8.3759 (1.40.10))\n>> endobj\nxref\n0 31\n0000000000 65535 f \n0000001741 00000 n \n0000001629 00000 n \n0000000015 00000 n \n0000061201 00000 n \n0000060921 00000 n \n0000061061 00000 n \n0000061477 00000 n \n0000061340 00000 n \n0000061616 00000 n \n0000061754 00000 n \n0000001862 00000 n \n0000001886 00000 n \n0000001916 00000 n \n0000002050 00000 n \n0000002074 00000 n \n0000002450 00000 n \n0000003066 00000 n \n0000011328 00000 n \n0000011562 00000 n \n0000018734 00000 n \n0000018952 00000 n \n0000038207 00000 n \n0000038585 00000 n \n0000045736 00000 n \n0000045958 00000 n \n0000053457 00000 n \n0000053704 00000 n \n0000060698 00000 n \n0000061812 00000 n \n0000061863 00000 n \ntrailer\n<< /Size 31\n/Root 29 0 R\n/Info 30 0 R\n/ID [<FBA237106D5FCD3258C201401627AA50> <FBA237106D5FCD3258C201401627AA50>] >>\nstartxref\n62085\n%%EOF\n'),(2,'Approved','PDA',NULL),(3,'Rejected','Project Fund',NULL);
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_club_item`
--

DROP TABLE IF EXISTS `form_club_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_club_item` (
  `form_id` int(10) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_club_item`
--

LOCK TABLES `form_club_item` WRITE;
/*!40000 ALTER TABLE `form_club_item` DISABLE KEYS */;
INSERT INTO `form_club_item` VALUES (1,'Dell ,IPad'),(2,'Phone'),(3,'Tele');
/*!40000 ALTER TABLE `form_club_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `Item_no` int(10) unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Cost` int(10) unsigned NOT NULL,
  `Quantity` int(10) unsigned NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `s_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Item_no`,`form_id`),
  KEY `fore1` (`form_id`),
  CONSTRAINT `fore1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Dell',10000,1,NULL,1,NULL),(1,'Phone',6000,2,NULL,2,NULL),(1,'Tele',2222,1,NULL,3,NULL),(2,'IPAD',5000,1,NULL,1,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mainview`
--

DROP TABLE IF EXISTS `mainview`;
/*!50001 DROP VIEW IF EXISTS `mainview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mainview` (
  `form_id` int(10) unsigned,
  `F_id` int(10) unsigned,
  `a_id` int(10) unsigned,
  `A_name` varchar(45),
  `Role` varchar(45),
  `A_status` varchar(20),
  `A_reason` varchar(100),
  `A_timestamp` timestamp,
  `A_present` tinyint(4),
  `Deleted_Ad` tinyint(4),
  `form_status` varchar(45),
  `source_funds` varchar(20),
  `specifications` blob,
  `C_id` int(10) unsigned,
  `Timestamp` timestamp,
  `Deleted_Fac` tinyint(4),
  `F_name` varchar(45),
  `Item_no` int(10) unsigned,
  `Name` varchar(45),
  `Cost` int(10) unsigned,
  `Quantity` int(10) unsigned,
  `Description` varchar(1000),
  `s_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mainview2`
--

DROP TABLE IF EXISTS `mainview2`;
/*!50001 DROP VIEW IF EXISTS `mainview2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mainview2` (
  `F_id` int(10) unsigned,
  `form_id` int(10) unsigned,
  `a_id` int(10) unsigned,
  `A_status` varchar(20),
  `A_reason` varchar(100),
  `A_present` tinyint(4),
  `A_timestamp` timestamp,
  `source_funds` varchar(20),
  `A_name` varchar(45),
  `F_name` varchar(45),
  `item_name` varchar(255)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `c_id` int(10) unsigned NOT NULL,
  `F_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`c_id`,`F_id`),
  KEY `k1` (`F_id`),
  CONSTRAINT `f1` FOREIGN KEY (`c_id`) REFERENCES `committee` (`C_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `N_id` int(10) unsigned NOT NULL,
  `Text` varchar(300) DEFAULT NULL,
  `form_id` int(10) unsigned NOT NULL,
  `Read` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`N_id`,`form_id`),
  KEY `frk1` (`form_id`),
  CONSTRAINT `frk1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `p_name` varchar(50) NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`p_name`,`form_id`),
  KEY `fkk1` (`form_id`),
  CONSTRAINT `fkk1` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('SE',3);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `mainview`
--

/*!50001 DROP TABLE IF EXISTS `mainview`*/;
/*!50001 DROP VIEW IF EXISTS `mainview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mainview` AS select `admin_form_with`.`form_id` AS `form_id`,`fac_fills_form`.`F_id` AS `F_id`,`admin`.`a_id` AS `a_id`,`admin`.`A_name` AS `A_name`,`admin`.`Role` AS `Role`,`admin_form_with`.`A_status` AS `A_status`,`admin_form_with`.`A_reason` AS `A_reason`,`admin_form_with`.`A_timestamp` AS `A_timestamp`,`admin_form_with`.`A_present` AS `A_present`,`admin_form_with`.`Deleted_Ad` AS `Deleted_Ad`,`form`.`form_status` AS `form_status`,`form`.`source_funds` AS `source_funds`,`form`.`specifications` AS `specifications`,`fac_fills_form`.`C_id` AS `C_id`,`fac_fills_form`.`Timestamp` AS `Timestamp`,`fac_fills_form`.`Deleted_Fac` AS `Deleted_Fac`,`faculty`.`F_name` AS `F_name`,`item`.`Item_no` AS `Item_no`,`item`.`Name` AS `Name`,`item`.`Cost` AS `Cost`,`item`.`Quantity` AS `Quantity`,`item`.`Description` AS `Description`,`item`.`s_name` AS `s_name` from (((((`admin` join `admin_form_with` on((`admin`.`a_id` = `admin_form_with`.`a_id`))) join `form` on((`admin_form_with`.`form_id` = `form`.`form_id`))) join `fac_fills_form` on((`admin_form_with`.`form_id` = `fac_fills_form`.`form_id`))) join `faculty` on((`fac_fills_form`.`F_id` = `faculty`.`F_id`))) join `item` on((`admin_form_with`.`form_id` = `item`.`form_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mainview2`
--

/*!50001 DROP TABLE IF EXISTS `mainview2`*/;
/*!50001 DROP VIEW IF EXISTS `mainview2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mainview2` AS select `fac_fills_form`.`F_id` AS `F_id`,`admin_form_with`.`form_id` AS `form_id`,`admin`.`a_id` AS `a_id`,`admin_form_with`.`A_status` AS `A_status`,`admin_form_with`.`A_reason` AS `A_reason`,`admin_form_with`.`A_present` AS `A_present`,`admin_form_with`.`A_timestamp` AS `A_timestamp`,`form`.`source_funds` AS `source_funds`,`admin`.`A_name` AS `A_name`,`faculty`.`F_name` AS `F_name`,`form_club_item`.`item_name` AS `item_name` from (((((`admin` join `admin_form_with` on((`admin`.`a_id` = `admin_form_with`.`a_id`))) join `form` on((`admin_form_with`.`form_id` = `form`.`form_id`))) join `fac_fills_form` on((`admin_form_with`.`form_id` = `fac_fills_form`.`form_id`))) join `faculty` on((`fac_fills_form`.`F_id` = `faculty`.`F_id`))) join `form_club_item` on((`admin_form_with`.`form_id` = `form_club_item`.`form_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-24 15:28:19
