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
INSERT INTO `admin_form_with` VALUES (2,1,'Ongoing',NULL,'2012-10-12 06:49:23',1,0),(2,3,'Approved',NULL,'2012-10-25 16:14:56',0,0),(3,3,'Rejected','Funds not sufficient','2012-10-24 07:13:41',1,0),(4,2,'Approved',NULL,'2012-10-17 07:12:57',1,0);
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
INSERT INTO `form` VALUES (1,'Ongoing','PDA','%PDF-1.4\n%ĞÔÅØ\n3 0 obj <<\n/Length 1535      \n/Filter /FlateDecode\n>>\nstream\nxÚ¥WKoÛ8¾ûWè(5—/‘b‹E‹fÅv‘\0=´=(²µ%WR6Í¿ßeK1í¦Xˆ©áˆœÇ7ßŒŞŞ,~ú-OsFšäæ.‘Ö0©tb¹eBfÉÍ:ù˜¾éûú¾ÙUÍRæé°\\)¥S½ü|ó>Y	Å™Ì]²’‚9‘“¾`Ë•“2ıÄ3^À?±\\eœ§U¾´¸ºY|]ˆ„ÃŸH„Ë™:1³Ü‰¤Ü->~æÉ\Z6ß\'œ)—\'^u—dÌ8\r«mr½øgñMbbûá¨<c’[²å^9÷Ñ1‘8Çï¯«¦*ğ)é°YŠ4¬oë½}¬û (Ûİ~[A(†ºmh£½Ã_ôØ]İÜÓ­3ó$wÌJ5^1ltĞïCµ3éß]‹ş‹ÿfE_jÉŒÔˆ~²õîê\ZS¤ÒŒì?q¡«r6l*ÚÙwí~¹Â;ïå‰_G¬vš)mçù½\nz<1ÌY•£e\nX	¦Á¯õåÔAÍ—ÉD¹T±Ü±;=\'glâ‡3\0`Òæé/‘£à8ËGİ2hè‰†eÜºQáUìÉì!mW§VZ3¡\\b2ø5ù%S\0æFñp”¶Ì)ñ@*¦¹šò™e™„¬e`8)Ü%ËÆ+®ãQ‚–.¦&?“šgÆÙœåò%¶…¸dÛxÒÄ´òÔ4À°èIX(ğå¸Û#Gıá«íŒ6yZ\r.,ÔÛzx@FÀíaS÷$ŠÔŠ‡–»jıPVA¶	oñıÔï‹q«¯Š®\\J›nèù®íhõ.r&M6¯ö_‰	”fâ¾àîHÛò<\rƒ~Çİ]Ÿ)AèšXò¼!ÓŸ—+aL,ë`™±fvÀrzKQ¡¢ñ5Iª¦ìöJáÙS)ü¤·«ú¾¸¯b%iË´¹@P´Â8â¡YWâ9TƒËF]ğsvdg\"` Gà¥”Úû½&¶öN)rF¦e½ß\0<ªoCäê\\3{´¶Œ¼òHR><Å0%ŞD.un:±ùÜŞDÂ%coŠl>tBXßµÛ-Uö5ri{ßvõ°Ù‘kˆsc¯iÖa0ĞĞ„õ3°†ÄÑbIx\r=Ş»Å]Ñ¬ÛİÖ·#è¸xé¦õj{jbÔfaó|\Z…ÑŒŸäÑNX6óÀ´W‰ÓÈXfÍ¬WmdÁ€¦@Õwô¨>WK\0k¾c4Ç\'ÀÓM-òõh£èW€şìtÈ9o:	œÏÊf†r§•\r	©ö=>BÂ\Zw2£E0	@lİ\0°îIåDJë\Z £ªî0a|\nçùè£¸ZºÃ¦›*Üâ©qÇçF–m³®¿p›\"_+O&£5YÊ¤p¦šéV¹\'÷Ûâ¶ŞÖ‡QÉïú=éåı=I’=v-Í‚Ï\ráëç²3°‘+?Á±P3Üd0å\0£ ?µÌi†ùxIœeÂ¼ŒóÃ,ú’±0Šc­eÌéxËıó.b¶„÷ô%ŞÂÏ|Æ[\'\\êŞ€·–û¢îÂŞ™(ÈŠRÏ:É´8i2zAqÚHm–Ñó”ûûœÔz¨ağÃWÂ‡dïÚrHş\0ÛÄ=Ò±ó^èP˜ªàVèÕ¸J}…«Jë\re¡ĞÁ %¨†Hƒşç˜¦@ÖÁ•¯õå+äX¾ ¸ñsˆ¦=\räõv;ïS¢1…EĞ‚ú&BÃ§cQ,\0Ï[6£CŒÂ5P0ÇQI©±QêùÀ.u¨´¨oƒD…‡qô_{T“ªŒM‹ŠQ9|pƒ,ª¯0Û\0ë[HZÒ÷¯JßUGº…øŒ£-j y®3G[E7¹b÷dşßhŞ¢/±Y\0±nÒ8/ÚaÜ‚¾õH9R6jµMÔá“¾ÆnNûAÚ¸¤ZÃÌ·ái6¥­ÅN6;d]wU‰nöt6Ë}˜ß†dÃY»bK™C¢®*ë¾\n~Ã§¡G#PáKÇLh¿©şÇé>‡\nendstream\nendobj\n2 0 obj <<\n/Type /Page\n/Contents 3 0 R\n/Resources 1 0 R\n/MediaBox [0 0 595.276 841.89]\n/Parent 10 0 R\n>> endobj\n1 0 obj <<\n/Font << /F8 4 0 R /F11 5 0 R /F10 6 0 R /F14 7 0 R /F7 8 0 R /F13 9 0 R >>\n/ProcSet [ /PDF /Text ]\n>> endobj\n11 0 obj\n[329.4]\nendobj\n12 0 obj\n[569.5 569.5]\nendobj\n13 0 obj\n[1000 1000 1000 777.8 275 1000 666.7 666.7 888.9 888.9 0 0 555.6 555.6 666.7 500 722.2 722.2 777.8 777.8 611.1 798.5]\nendobj\n14 0 obj\n[607.3]\nendobj\n15 0 obj\n[277.8 777.8 500 777.8 500 530.9 750 758.5 714.7 827.9 738.2 643.1 786.3 831.3 439.6 554.5 849.3 680.6 970.1 803.5 762.8 642 790.6 759.3 613.2 584.4 682.8 583.3 944.4 828.5 580.6 682.6 388.9 388.9 388.9 1000 1000 416.7 528.6 429.2 432.8 520.5 465.6 489.6 477 576.2 344.5 411.8 520.6 298.4 878 600.2 484.7 503.1 446.4 451.2 468.8 361.1 572.5 484.7 715.9 571.5]\nendobj\n16 0 obj\n[583.3 555.6 555.6 833.3 833.3 277.8 305.6 500 500 500 500 500 750 444.4 500 722.2 777.8 500 902.8 1013.9 777.8 277.8 277.8 500 833.3 500 833.3 777.8 277.8 388.9 388.9 500 777.8 277.8 333.3 277.8 500 500 500 500 500 500 500 500 500 500 500 277.8 277.8 277.8 777.8 472.2 472.2 777.8 750 708.3 722.2 763.9 680.6 652.8 784.7 750 361.1 513.9 777.8 625 916.7 750 777.8 680.6 777.8 736.1 555.6 722.2 750 750 1027.8 750 750 611.1 277.8 500 277.8 500 277.8 277.8 500 555.6 444.4 555.6 444.4 305.6 500 555.6 277.8 305.6 527.8 277.8 833.3 555.6 500 555.6 527.8 391.7 394.4 388.9 555.6 527.8 722.2 527.8 527.8]\nendobj\n17 0 obj <<\n/Length1 1492\n/Length2 7140\n/Length3 0\n/Length 8143      \n/Filter /FlateDecode\n>>\nstream\nxÚ·T“ë.Œ H•*½D6„Ş{ï½ˆ!	J’HééHi¢  ¤)U@\"()Ò¥İåœ}ş­{WÖ\"ßÌ<3ó>ï<ó­ÀuÛÈTPŠt€i XAP ª¯¯\r€@Q! P„”‹Ëuƒıí\'å²€¡1p$Bæ¿ªh‹ó©±8 >Ğyè\0‰@2 I  Jÿ\rD¢e\0j`O8 /ĞA\"`R.U$Ê\rwrÆâúüıàğ@ÒÒ’¿ÓÊî04F\0ôÁXg˜;®#ì0EBà0¬Ï¿JğÈ9c±(aa///!°;F‰vRà\0xÁ±Î\0†ö„A¿(Àî°¿¨	‘rÌœá˜?¦HG¬\rànpÁ¥<D@ah\0®;ÀT[`ˆ‚!şëı	\0üu9\0èŸreÿ*GüNC HwáG8án0€¡†Ö+\0\0# ¿€`7—öÃİÀ8Àï£ƒ\ZÊÆ\00á_ü04…Åaàn¿8\nÿ*ƒ»fuTéîC`1¤¿Î§GÃ ¸{÷şk¸®¤ÂïoË€:ş¢}ˆ6GÀ=Â´ÕşÂà\\¤ÿñ9Á°\0q ”¤¨”8\0æ€yCœ…50óAÁ~A¿Ü8~($\nàˆ£€;Âp_¤~°\'€E?„øıwàß)€Â!X€Ì	 ıOuœæø§›?\Zî\r°âä\0}şy²Å)ŠD¸ùüş{ÄÂ:Öj¦ÚjüQş\'¨¢‚ôø	ŠŠ\0EÄ\0PL\n ‰{øwnàoö¿½F`ø_§û¯ŠÚG$àW‹_,p×÷7Ï¿¤Áó×ŞğşİÂ\0‰4ÀóıßŠ!¸? ÿç-øòÿ\'ş_Uş¯úÿßi<tsûçùğÿ‰ƒİán>!p‚~ˆÅ-‡>·\"ˆÿ…ZÂşÜh}şĞı£ÚX0nI”N8¡‚Ä„€búá\r¸7jÇBœÿÓßÓÀõpƒ#`FHü×‹—şO·{WÜËƒ›ÙŸ!0·ˆØßãıeÃp«öïs¨# Hè¯—\0€Ñh°)N8KàÂ-/æı[ó\0a!‹Kà8\0‘hÒ_ƒ–«ÿrı¶¤qäKü—…ÛIğ?P ìú_&áşSöşmşëŒ‡h4Äoqáümÿ~‰À`Ş0éçI$D6Ì¥&¬õ¤Z™ÅKpuXp7ãÄJDp¸ø1¶G}Ìn)Ù47gZ÷…ÆçnÆ—“¼ù©}¿•Z:±#Au\'‡ÄÉ«£k)~Ç¬w&)›ğZ¦«°Ë<C÷à±ÅRu’(BzL¹(ıÿ¨éú”âÅMW¦!©ŞjĞŞY]–£GÏ*m±ıÅÛìĞo¶*~ÀøGş÷„Ğå¸ûÑO²îèÊµŸ’&{UQ-ö\rôÏRw³½‰\rÖñYıÎ¥V—ígU»Qe1[xógş3Ï­,\Z?MZ¥-hOùoúIÁóÊŞ–ímÔNIgûTÇ8Ğ¶ï)5j–N%]P´É‹ä hìSH9ÆXteÂµŞÎ¿üÂæª®ë3=Ñ5ºøó¡îm›‘Ş0ıdùËŠ•í€z®¶xOÇü–?ªÓ©WÔùésx7C{9İrgxÂ\',El¤2œ[ÍJg¥ÃZ‚¬¨EE)<á•æ7…ë¿öİ(±>òó»,ÜooWáö¨ŠEÄÓÄù.ÖÎúg?=Û	¿«ƒd¾ŠSõõr_:ò¯ò^²ÕësG–¼ômuÿ¶8Eı8)àÈ{¾ÙÏ(Ô}çåÌrwÔ!{~\"¯Ì  üì ˜ş}/²O”Ô³,8îlË÷b?`@Šªó%|atKÖb¬ÃI¢¯°‡_á³ÀÕ…–\'†A:bîÊÀ¡Ñ†Éf>º~¿vşBú–\Ziê¥pøÃÕıÔC%Jç\0AÚÇ!tÆı¡É	q­Ê‹Íù±¼ã¯X&¾‘·–ÉI?ÿš³u êÄÂ¼Ÿ#“Ã¦İãÊá\niwë»\n«EñÂYoÈà†=Ë;ß˜ğW\Zr³ß.‚÷6÷40†I¼a©Å\\»P‘½f¯8ƒ×/ÇµÕ¿Ïä&õX§İlıV÷\när¯2Ô©ì&QÈ¡½9GçØß¾İ9ş™Ã#Ş7^Ö¡»n Kê÷\Z+<IŸ\'RÚg&ÓÆğBnÂG4¨KÁ±MÇÉ\0ğù¤i‹›˜¯ÅÆş:Âd±ƒÍ.¦TUË‡ïëŸ”f	j”â}Ü—™­aúx#:’àZ ğ Î!9ë»ï`31˜l0\\ÌN…hy“–fö¼wø´Ë?:M=~rÛ²¾Fd\0…ÌQ;Ï)&h÷VpœÒª=³á°5S?zã’eÒ(ÌN¶²B¿	ÈÊ šs“ZñµšMFÕägçjİ¶8\r†6Ün’…Š™•P~—X>ó¤»ÑMà›”å÷¹uÃ*®ŠÆ—ÂÀPl<¾àÕ£\0öèuXÅkŸ5ëRq‡+Â>|<N’Útlnûî¢ûóñ8§k“ÛÑ<—İ;§-U¦ô²`whÁ*ƒ+Xoğóìi†ÙˆÈïC0-3¢ úñÇ<i?³¶¡VG¢ˆ/ß\n^úEëmqGuv’XåJ/”.ïÔ/((ÓN¯Ô™|êGî˜xe/ÉF²gÃšwI…÷H¢[ÖÙXß0ÒûœkºV‰]›¶*m¹#´ç\r[t<è¤YMå­ºnj2n•æÃ@#—ƒ©qI3|ĞºÚBÅÕI`Û¾è§0/\\PQõ\\Õ¹°\næªxŠša€~õs¦Sˆ¡‰¹ñÀK­ô»Ìø\0z³›`‡Z>XTê¨W$F‘ÃEeYk‚Uzš•Ù`ççì}‡ä£w^êB6ÖìHI~¾ûi†•/æc¥mz7xæSôù.Š–ˆ3Ó|˜\\\ZT”+n,rOT†1·‘¥_ÎZsÔtr±Ğfª&à±Cëß9‰Æ†Cƒ‚Bç^lEˆØBàà¥#±ı+ù]¶÷èÌ×>3UÎøŞhé~~åÿà“u´m=³şV‘¨\0_}wŒ§x€Ğ‹éR†êü;àÖ:ê›0ë¬€D‰ç\"º¡À;‹júá×q7f†„ŸItF÷\\U’£z/İv¼’ç­6å¾hYÇW÷^÷ö¤i£\rZÑäÌ¾“í@w›§Ş×UÍØÄ+[ÛwsÃ¥¸©;×•lÅ€éHìå8‘ØiæÁBíì•‹2_¶½ÓX¤ñ‹W5$<¥_eƒ«)Ì9ÂTQëï•dOºTñ¤aÜ\Z6<±¤…?ÃOOK‡ãÑx1ß2Z[ì*ÃoP9\Z[ÎÀ_.Ë/{x\nœ;NŠwN®ä®?$7VvZÿñIğ+Á=k‹{/¶Å¬òl†€‡\\èÔ\'\\k‚jn[õtê%¶7œ<íK2R}”½Ğt;3ÓbíGŒ]údwÃÌ{{¯~bÂ•¯ÏæÄ ÃE9†ım9\0U¶™+k,¾ÍÁs•ÜiÌ©šÍAJõBÂÒø²}£Ú×6G4|S9KÛƒÌ?	ëâ¸M9Jx{,°‘øÖx¼\nÑÒ®åã:›qHsM©úiıÊéı¡Á¥rç‰wQi[Á}Ÿz^ƒbKÅzˆNû)?G?‹+8¼À†ŞwvÈ1ãUÍ“)Gm¾9G&y|}\ZzÑq^®ÖÏ+©R<^T6òvÜ¼w;‰=oK§‹T‹—m|”XÏf,~TôÈŒÑA/@XaXÜ•f›ñXŞØ«ĞğR’^ügÔ]™´)Bs;z=#Å¤ú¾ÕÊ5Sı£ğİÓ\ni7©{G£VÉWˆòM¹ÜµìÊUÛ”ZåÜ÷ßË»İ¨³00ÓtÉ¼1­—\"k÷ˆjœ®£ÍÙĞ’ŞeİÏó‰‘ŞİÄcö¸HÇ†19Ğq’Š@Z ½\\¢öƒè¬h<Ğ@özë9«©\0¡\"(A1”˜lRy¢gÁÇ\'dYïZóöuÁ®y\"ÍÎö:I\'S¹»Òıy¢tâŒz3~‰¥¡“àtúä›8Êj­\rÔ\ZãM°ûâû¾Åo©„ÇÆÙÃÔ],ırAÑû ¡P³Wizcâ>–ºş¾AcûËO¾ûO7`o»¨@7Â-ä+}?‹NwšMê¶®ÙÔ´×_~µ¿ğ,¸D!Ğ¡æäú–/²„¾ÒZb×336ª_Öˆøæ~ü‘V‚I*g*Õ»uÏÙ¿vÈZ‹ÁËoÁÓŞ¢e³ãÍ½—¹?a£R¿iŠ¥(1‡ˆo¿W]RŠ\rAöˆSõyë©½ïPÎˆixtÑcPÊöÁ„ û-Ç±×{MD\'=dQP3=™3Ÿ12ú<CÑõ¹5>ôË™z¸š€}_İæ¹ AÅEãöáÍõĞ²`ß¶ôÕt%!åæâg‰Ê2=|á˜Ä¯2M*ô‡€Éù)î M–¼±aĞC	 -Æ>˜4ù Í?«%…ç½XşÂ3ï*5‚Ô®­¯›ózÓ]K–Î_ë²WºÇÎ)ÍÛ+ÿ±6Õy¯e¼“†X€ÓFâ>¡fCğ2¾38ø½ò{4‘ÕlŠò…”»²ïçÃ¯9×¡í²wV2‰F“ËÚQ­GOn51©j–ŞJ1ø_ı¸{Á_ {cG‚ªSyáx¢ÏŞ~¥İEF˜Ÿï^mBĞÕ¥y)ß™ËıOû\r*kK)ÓIr›«Fqœ(——A½^]Øp~xÙ<¼²XçÅD^ãÏ	@›yIÏàwÌºuK®Kx@!éı·X-ÕÍ»§ì™Â¤jK«€×$~pX÷2y&A…ÜÓ*–öÍ‘ÿ·B~O Õ‘n\'ÀÇEQ<Ïè§©gğï¼gmbı|¯éÅ	àşA~FYÇ©ş\"YC+Şwa¾X”°»`²\nÏvãry»Ş¾PÍ”	’Şøj7,ø:À5PoTéë·Š·ƒšòİÊ?mòºVe7ÃI¤Æ“N”0N¼5¯„’\"ˆ)·\r#²îÅî¸T-kĞ™Í¶~ àï†2›ÌTŸaSëŠŠ?İw‚¸‚¯ø×G­-\\z£¾é°+ Zé±ßÅqaE»¥]”İ;‘qİv¦ámÈ»«/ç&0¤½gòR\ZÊ€RÜ™¨¬Êqü¨:|‹èÕóÉfKÂ#TÄÄ¾+Qaèp¿rÏg[ı¦)jJ*º£ÙÄÁ/G?\Z¦½r›ùà#ÏzPöÀW\\=.˜É—ó2dòm8èj\ZƒJhSşïü!o‹²\'ÔyŸré\ZÛÚ<¤©î<Á½®x+4PD»XÉbŸ–»¬${;y_I/löÄÖK¶MéÛQõ3ß›csÙAõQæÕğäk3‡/sâ+U?ÛDRÛÊ·u½=D»JßÙaŸ±½ÌŞHüà?j9Å,\Z’_SORªjIÚy°ˆ®-‘ÉçaÓR¨€­O\rÍÕNÈVê›z\Zàn™³!ø£^IyØcqHÌ‹û|Ñ…iR¢³KÁ´\nã?É[Öˆê£4LV[şÄm\'vŞù¾¦½Ãµ#0»TqV#\'Ïü^ÿsQÚ*¬º‰Ãİå}UÂ;åW±M‡.—ÔxñŠùg³ƒÊlãkâBe™vÛ>Y-‘Êğ¶\ZE·º\ZÍÊ%QÉñÁmqÑÌ¦ ôø“0³p_’ƒ\\DZÊì…ë¹ğªßÑÆh*2{¸€6,á}/Áòv‰”&u4j¸õİVo£ş™ñ´3ÄÅ[NˆiĞ‹øíÉy-À´˜/ÓJá·ÓWÔHÆïJÉ’?zºWwµ¹Î–ÿ`³ZŞIõ{aR]ğœâéúÖ”ï\rÙx;Û”Vt îÿF­”ªhaìO²®ıu	Õç’šN›3Nß±ÈPªÈKsŞøÑ·ÅÈ™Í×(‘txÖïŒ¦<¼JÂ«]¼4fÙ#T\r<Ö¼ªg,\r“àÏ+V\ZJâ½áÕ1/<È“†šªÊS_RM¢¾:\\óò±]˜¼Ÿ3‹ñpß¹TÌúT¢Ûpv$ëwxhÖ,BÑ™ÿ6á™AáîÕ\"Q»ëÖb7tÑû¶³º|_è³¨Ûd[4À,¹3€¢eG;äü[¶ÈSå]Š’Èë™—›=6$ÕOH?&C^ø4››».$â~‘ÔD³”¿îˆóoµ2š(°hëáÙğİt÷ól{Üe€åËú‘¡ÂSË|5ÄœLf\'‹u˜ÌÎİcãzö¬P£ìt7“‰üdî[\ró5eÃ|ÊÌ;ÇW\\<³ç¨aµ­;\"Ü„‚¨2İİÀêh‡åÑÛòÕ÷7RŸól©ÉÉÖºTw4-|Ö^=ÁĞ±6,œ+×9Eh¦¼70í‹ôŠLül™BÓEÌ-K~T}ü@U¥`)v½šN~8jŸ¾G—ãæñ’GÄv®#Ó\0Æ’«»\n¬eÛV|6†¥ÿ {Ÿ±w“îµ½Q é‡¼îÜ•¢úéš.Kv6w-ÿ~tú>§	§ÍTœ°÷$J´oë‹µùÓ\nPÂz>|û4àù±2ÙËs©Ş¾d\"\nCÎzJ¡^räæúÌA	aÌ¿?$k’‡ÈKñ‰¨¢ûÜÀşz]wã“®…Yèİr)æ¥¸¼4”ºL»×@nŞ(½:„†,%¿«¢K^ûp#ú™NŸı÷w©V¼&Ş»óÉ‰İŞ$â£BÓÎew‰[Ô´˜6ó?ûñ!õošéuJÈ—#švƒKd<®Ó÷ö;ûèÎÕ]jÈÊY_åÿØå¿WŞ¸@2AM{`&Œî¸(å¨ÚUîvØlí+ª;_q«àró=\0f1_SÔŒT\rÄtï7Ìí­)ªßıa‚;N»³¹äzw.ÿ YÉ´àÌ_‡Œ÷ê@ëşu\"º\0Ô1OsE59Ş Áô]Ûâì‹â´×ß“+¾Ìoh~è£~“Bˆ×˜eÆ¹®­´ä‹—%E/&¬Ïæ_İØq7_Ş^‚¹—Ÿ0	KA;,å:À/\\\'’s8MËÉo¾FºœÏÅÏ.+O‘}]sæÑ#_)*IS4Š;¢†3Úõpå½Ò2q}iF,X?(êm:İİ\Z˜ÿyÆCÕöL2r¬^¤Ôè+à“(ÿ‘ñÍvCvŞ«T\ZiX’tÃ|ü\"yïš’–ÂØiŠO¥vk=òW)TüOªÆ¥W#”†ŸŞ\'[òy@) ïm÷¦ÜœğuBçÂS	CâH•ée)ÅpÅ°¯«j„¯ãñ’Xmø¨¥~î¸ánYjw7Ù!|•îïÅK­m¿Hù²ûƒ{1m‚B:¹f¨;¢ıÊJÜk>Jmßè¿Œ‡…ãw¦#…°£ÌdŞdiû‡üCô|’\r»Z#v\'ÆrŒ OŒaPs¨ÙµÚ×âO V˜³t­Ç¯B¡®–(ÉU“1¹>ö%o2ùÁÏ¨ë?5Gèª­›w|!™U#‚¼püî“<zYéË–N±Ï¯]¢‡å…_Qvpƒ4ÌÔm´Š>]xfÊÅÊ­ßä_d­ZœJâpºÜT\ZÏO¢ìuK·ˆô¸\rÀú2)‡¤H]b…ÍÍ)G$vy¢?`Çlk•øG†gÛ¹¢±©Ëbø‡¼â¥ÔGoÈ2ü«!zT×ÃêÌ®SçïøöSSãç\\±è1GHN”¼Ôä¿×9˜¯÷j!¦cS¾‰˜{(ØL²\\*ğQdâİŒ±ÅŞ·´·R·\Z8jzÚšœuÎKß°ò¸Ä_9¬òÑËûcãX c)@š [ãnuİ{ŒœE‹^Eh,õø)G‚SèŞÁ²®™ÚSêG¾HñĞş’ÙòZh•ú£”óî.ºOD½ÏŠOé5)ëæ?.O›Ú«’ã…HzÀÌ²ŠéŸÉ9”¡PØšÆù±j¬™¥¡}ëØw1!CoNïdï¯Ô?ŸX51T:IéjÒÙí\0koO\"|K-C¿\rÂeúˆ,[ù÷®?Ñ­míø9ivİëësŒG¤YE»sˆzzsO/…[ÆÒ:¦»53	°ìô¢¸^ª‰¯{#›Bé\\ôãıS©§Eô8]ß(] 6Wœç]™0qà\Z=ŸFÆ5e¬+ÄHP,w÷òf&“–?ï³ò/|gpÉß5³ŒÆÄ)Ì8¯SŞ®IÖ´˜ÂŞwø&¨ˆ¼ëŒ\Z5ÛàêŞ[½&hRÀ£PÂ7|F2V¶İ/\"åÜº¾Ûâ¯-$şğ½±QÑñd¯ıçOŒû\Z6x~Ş8KgL«}ğ,t>,„N¡\nÅF,®Ég¯øŞDC¿Œb±+èòãÓòãMT§ãô>‚à¯]¼D	­(nNú¦Û½Ec£GêÓäAR§ÒÙÀÙ¥ôSÔ€ÄÆmË­EÒáÄ3õ[\r½ÚÍ»\'çÚfo8#ã/‡}²?Gî¤\\ÓJGÁ›×®, Îy¶ŒnÜ3O5ºædšßRopŞí!¾­&S†KÎÅ‹ƒÌ¸œ­ïrÑßwÇNïÉ™\"ë[(\rß™Lä$pWÄVÒ›g»EEVi$ÕÊÇ*tİSœ-3è wø¸ÖVÏ8¸ËwÒ û-mŠ¿QI&$8|1°~©ÊTÉDy=ıioÛ\0Õnïèı@&ş[œ]Ètµ’Ìi§ˆâKŸàÓÍ‚u0GùW5zowè¨Ò· Òù$ôó‰M0wiwdçÕÚÄO¡ÊØ¶¹%‘İÃ%[}n©Ş¢‡f¹/È¸ô|™‰L}Çëä2‰MÛap/#!ıç±·T™Á/³¹ßÃë§Æj\"=oøùmqMÚÄ-ç	fğç7Ó!•X¾Øu\0ı³óÃ¢#Ó£ ,ytÛbi7ÔõsnS«ß-Âs»”ÕûÈ@~NHux°Ü!‹±:¸K(äKØ €Eâ­.#ËDÁ‡Ğ²ıÍ½KG^·[p¾¼Æ˜ò¥t¶º.åáşhÆç81?2şªO7¡ó,}æ¼w°­Fz#“™›—ß†½Ë¦¼W\'êã“Ş{OÄs{`%-O(i±cÇ»~HšF}¿˜P”{®ğò=±ğüÀÌøZ=¹Ãˆ-o*–X´[@qE¥İø„ş{g\0»ˆå§eìrÅÊ¼‘Z‘›¥OÈã=jÓxıİ¦FïuÂ†µ©²Î İå—--å¯}‹%èª1]&¥Ô¶k%\rPD	ïšF§€*·Â¥ÆãÎ?æ	Pó°T¼H¥˜U8À{Á£t%½„¹~ªmOï° Ej”Ê;-Z¼arß“”¥¹!P–à§æ2LñŒ\\»:Ñ>Í«ƒ)ò¼Ä¥ÜP+©õ¥E<ùûºšÙN\rŒW¶çúÅoçÉ±§È5–£œÜyöÚ\'ÔTÚµpB¿ãºêu¦ÉŸ|rÄ\"VCıÙºÁß±EÖ&¥ÎUxÜõ¥~z¼˜ûÖnÂ&—\0^ê)_Có£é&?É¨­É£rÅ‘Îçğ\0—%ó:sÚ¸‹%ã¾¼ö‹ºGjG{İµ~%İØÆ¦ADaOShæ¾—ø+Ú:®áÖÜÍ^:µ¼œò´Üz-)Ò94‘»ºkÛ\'ÔÓÆÙ8_?’/j™Jy?y59ã{:zs¼\r0rãKìCİÅ¡Õ–`ŸK=nˆ}H¶—•åû¤ëA_è6¾Ïë;ù’%”hÙøÔ*›9ÔCcªXÙ˜)ëwM\Z­*cØÈbË¼7v¼^;¯~T\'{;­)$©ÊîaXà|È(ìºÏö¸Gß/ÈOİQ¼EXìDñE@Ÿƒ&¹åƒ¹÷Wysl\n?I!Ï÷ŞƒĞ7<::!ß|ÍÆ‡ùxH¢·lµäÆ¹ıi…iÆî9†Ä‹?wëÆÃœd»¬›•/{…ÂÏmDuÈ—L>o\'Õ>d\'åÕw¢°=¹÷X¯Ü¾NP/~B‰I‚m2É¢¶Âèr\nÈ1íPŸò“—^#ıf£ëù¡Å×yU–Æ4üÆ»cì«f<ˆŸlTÖL]ÈÉ>1º†jxŒtdrÑ;uÔXC]xÛlñÌ7‚ıAƒxÄKf¶ÖZßŠè*T^>4Ñ.å‹V€A­(‹vŠ<¢úÅ®‚¹¶a3»×äÍ¯á×7Mí3Ë¤Ä©æÉéBBª¸	4„Ğl&5ñ³/}ê™x­8P¼³µ2İJ·Tra1ûéæM{D¨(—aHŞWÊ{ÎÁœ±è¸/ùp‡–äôœ\"~C‹päâÖcFVà|H„f%¢á~Ò²Ô.<Ëû±n„‹ÎP;Ë~‘°òÔöZØ’-U­_¥„üƒü‡¡Ñï½à7Ï¥@a’š]Ï\r”JyŠyiså¼Öä_ÅyCç¿\ZŞéqÂª˜§qĞ¨<3êú\ZîÜÚÃªr·æšWÕPÄ„˜d–ÊáÍ¨öQª˜#\n–®)=ÂÌÖ?\\|<7B$_ƒ6È+Äi-µ¤úgn›‘ª`|ªÒÉGÚ/NµÁï8áÇ6¼s\"/\r°GÁÔH©Ê“<ÇÙ=ı€ı”şíerµ*÷:ókqùã{;»š·=èsÃÒ~ ,œÛ»Ë¹càl¶Ê¾»]-~fjVG•HÙ->ÃÄ«Rº±ÕÜ˜úZMÍ®)[i@âûåQH^ù¡´dT¡ãrôX’ë«ºm¾{?wåÃ:/Şğ&\"h2\0Ğşğ1Ä¡Ş‰‘Øª\"ÏÈ·ir|ŞÉ›ªÎØ#{ï\\-İ	YÛ9\"^Š)ïJ±“Ì‹ôıš§¾ íMk†ÂçÔ´Ë¯­äğá\'ÿÊÈ#\nendstream\nendobj\n18 0 obj <<\n/Type /FontDescriptor\n/FontName /JYDSID+CMMI10\n/Flags 4\n/FontBBox [-32 -250 1048 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 72\n/XHeight 431\n/CharSet (/E/c/comma/k/m/x)\n/FontFile 17 0 R\n>> endobj\n19 0 obj <<\n/Length1 1407\n/Length2 6093\n/Length3 0\n/Length 7053      \n/Filter /FlateDecode\n>>\nstream\nxÚtT”kÛ.)8Ò5ÈCÇ]Ò t—\"01C\r\"H#-% ‚t§„„”4\"­(R’\"Í?êŞßş÷wÎZç¬Yë÷îçzîëzÁ¬z†Š¶h„\Z\Z…€\nB¤AÊÚÚê DD€ÁFHŒ3â/7\0l‚p÷@¢QÒÿ+AÙÃ`}*06Oix:ƒ \" ¨¸4TB\Z	C R\'¢İ¥A*0/¤-H[¤F!<\0`e´«¯;ÒŞƒó÷+ˆÎ‚JIIğÿ.)º Ü‘p\n¤\rÃ8 \\°á0g!\ZD`|ÿÕ‚[Öƒq•òöö„¹x¢İíåxøAŞHŒÈ\0áp÷BØ‚~éÀ\\	À #¤Ç¿!Úã\rsG€°g$òÀVx¢lî ìp¡ºH×ú“¬õ\'ô×İ€ ‚Ğÿ´û«úW#$êw1G»¸ÂP¾H”=ÈéŒ\0éªi	b|0ü ÊöW\"ÌÙ­‡yÁÎ0lÂï“Ã@jŠú à_ğ<àîHWŒ‡ ÒùD¡_m°·¬Š²UF»¸ PÀ¯ó© İpìµû\nıÙ¬\níòÿË°C¢lí~°õt2F!İ<ê*¥`]€|öH\")!\")B¸>p¡_í|]¿ƒĞ_n,‚@W´+Èˆ´C`ÿ\0ş0/ãî‰ôÿß[\0(d‹„c@6{$\nğOw¬a÷ÇÆ.ßéºÁr\n‚üúıçí–^¶h”³ï?é¿÷+¤£xÏHÓ”ïâÿÄ””Ğ> (H@X‚B%  	ìKà¿»üÿßØ{õ`È¿Îù§¡:Ê\r‚Bş`À^Şß8¼ş¢÷_’áı{„\ZËeˆûê[@Ä pìúÿ-€ß%ÿ7Şÿêòÿ¢şHÍÓÙùw˜ûwüÿÃ\\Î¾%`©ì‰ÁÊBê¿SM¤¬°EzºüwTÃÊCe¥¸\0TT\"úÇôPCú lõ¸Ã\"ı½ìg$\n¡‡ö@şúâ`« ÿŠaUwÂ~U<°û‚y`%ˆù½Ü_6+²ŸCGÛşR£°˜8æîó`	µÄ@şP¬lm>¿ùD¡1Øs Èíøµf(D$äôËøW_¸§»;vğo:`‡şmÿ–<áƒ€f§Ğp™PÇÚĞÖãjE&o•QYÂôc3aÑ|KbL¯ê„Õ—$Ãì¬9ÍRµÙ¨š¥c‡’ÛñóOÓşËu,õ¾¢G,jßìYl¦®p\'“ıÙ¦È›prMS•nI¹÷âè1ÇÜ|s]ŞÖ¾×LÀUÛ=“ìÍI]¬&¡ÖªÓş¦º8K‹(e²µd€i¶é7Z;¤çÊYr‰üõ‰ETšÎ36MÙö@’wÕÍÏ}ƒı=Ì1Á\Z^!+»á\nU™~ Š(Q•ÉBÙyN‘×æ3J›;TJwyîOğ$\'¬döšnET\rº¬Æ®z¾”ézä¸Yz¥ø1´YœÜ5ËZøíÊ÷ºšƒàC–«Azüàk­ñ•\"»\nÏomåïßm…\0«œ{ÊÈ@ÆKÀÛ†§(¨ôá³ëÓ,~ÆÂq¬åÓƒU€•áfæ>Ü‚-\nñ…Îm3VÛ§÷KÆtÛ\'¬8)ˆN³ß¼widK\'_ÈK¥tîô¾¸,÷h\\y6,©˜§­=Ó’/yÍ*–ºYHJJ0Û ‘å†óİË\ZCÛ!d×Ë/+T{™.z¬ÆéÚ}dÉŞä=uüI]q’Hú\"ê¡u·S¢‡Â7nâg	æw_}+iˆl÷_/‘{ã19SœŸ#U÷éçXš>×SpW¾å“c%\rQ\\”+ønÏh®OjıPJ‡UE\"÷LivÚdøßækÉöèYh\'o“Gßª\n9y‘BFô–|ë4“`Ñ3È—æzßCµE#»Ø•t;µƒLÍfìK¹hq¦NŸ¿údrŸvğ»‰(ù“Jõ…¾\Zê\0ÒE7T)Fß€]Ş\Zd[^j‘ñ¸aÑ_¥ÉÃ„û2ô<ï:É»6¼ıVîü—CRÄ«øç<6¦~lç÷¤ªú%8ê½¢aäÄ»\\óŸY%ãùŸEæ•l}lŒ\n§äê¶NBKFŒ>Şî¸²à‘İûBP*²¯B -ºdrVİíÍ1ï–­—ãoìZ_Ï(Ê«—Ùu¾û	»dÖŸZ~¯Ô\r?µOŸ¸ı<éŠAá«eœ½%èj¨*z€sGŠ~UøÙî\"«âû¹£z„z*„1®·˜pˆÏØZg‘ñ¬d/Aö–›ÿÌòÛ“GûEqÁÛB©‘@J\Z‚„PêÍ³‹MÉßÁ¶¹·Æ¹—×ù2ûRæ¤+ÚBƒòîSËãœSd¸ÈÈ.jÍMÙÃ·vHÑY€iS¯áú¶«òZrÇôÜ	ıÖõØó’Iï†g¹¬ˆæ¨™:¢5=jñ»µÚD±.wî™]Ié{áÙº]®I(ß/íÏznú€-Ï&\Z×9V¿|\\Ä9“#«kÎä:zÕÚ’u$ù_«è¿Ş|dà\rk¹–`;™ê„Uòó~wø:Û»˜«s8Yërg»éy7mÄæÅátoe	/c–¥À½»N.\"µ»mÇ8«½íĞ—îÕYùd¼ÒÍkx|m’üŒœ–ô³~N-ÛŞ\ZNeø™®o×ŸÛqLPÓÀüÉs\ZvÏğï)Í]_Ÿ¦¡F?L=ìÑB¼òÙìø°–sIš{Ó”…©MX§ëÆB“íÈé±¹°ûÆ°«šá›*»\"¼Ÿy“ÜdEUÅb6¢a2Â-{@:ú.\n\0¾2-å{kœ„&õ>V!‹i®½sW±q§aïvíÄû?85¿W­‰5ı2·‰WÔõÙ:D 2öğÍú^:FQÈWÃ•æË¿¼HÿÑ²ƒO¿+ªãGßúE#*àóTW3@±Kãn\Zx$C\\ĞñgØ]$AéÅn®œ³ıwÎËYïêÂÈ°É€p1eS&¼\'i!Á§û‘#Óâ^‡Ô…¢ÂJ‘rdx½ÅÃnåà½‡_e+*|FD­Ñİ£¹ÎU)3:×¦³é¾5tß½à£í&‡§½>2Ép\'‹)É5åµ%@•`²>T|Ye¤Wqƒ~fÆÏlÛt¿¤Ÿ/¾\"­©È@½¤(ÑniÅ%N©âˆÓ0Ì(IĞqÈûr^EúÖv¶ï^ÚQ¿™2”U<Ë®}É˜”šØh˜IqåÍçOAE-Ÿ\'k\\ÉVr¿”E`®nğMÆÅE•=ì8 ûj)JúšŸ.}”-”=ÅÚĞö£`ÈÈM½]™ƒ·F’LâÂı˜e¨™±‘Vœ>Ì$_¡)PûÜ\"»É¼¡ÒD¬p!+cv5˜EôtSuŸ+‰ i²ßn˜Ú¸]ñ‰‘ù|Äó5¦õS¤^ÔÄ³yÕ¥Äj«MÓİ¦©9ŸËZo0ub‘wSàHj“6S†9¬·O@îİ©v¬’ıb‡?á‚aäOŸ–î*…èİ,¼3<)ªùD%¢~/Ã˜\nÿÃ±üÖ[:/ü9î7@›I÷ˆGµ§õ–±TÑRÇMˆí-HöËÏñ”]Ë“û|e.«Ò¥«¡xgÆÆtøm}a@Áæ¤è€yEËm®ª.q¨Ç#ô.lÑümÀ².K0¦™?Ö»Å©‰ƒ¢\Z²j¼¨.™‹[n¥aîj¼½İãÂ¢3kXA$İdJ(Û=)M.>M‚^“ŒÒNq†äRú!Ò&yóŞúsã¹¯¼¥¡Íí&¼$Ú¼¥‚oL¯/øy$ó(YŞ÷\rN¬Õ{[)72èÄKO¬š?ŒÛ‚p¸”Èn†Ï­dQAë‹ïTK\rT¿—ÏÚúàåæyƒ:@±qºÙ¯¥OgU¥šZŒ†É’ºøìhD½9ïÎ‹gksˆzâîúÏ­S«¦ÓÇè³ß\"¯¢C¤˜ÛæıÄñ£Å:®>)!)}×({€çDš3m@Ş¿+½ı:ùLÃñvcØhöŒ2…Ë8“mæğ]=âÉW.ğÇ…&?/ô¿î…È qK‘ü=î71Y­ó‹²F’<ë#©e¸UGr/F“;ŠÂ1Ë›{[3ì¯m2bN]kÜìEBoé¤İâ\n¦–íI5Ê[êIfzü\\`Ü¬s4¥Æú$¬g }(ï¾0ËÛ@>½,g?Ö·´æ¥ÔVo½Å_²3ù÷3¿]ôíÀ¾(È,¨#¡š§îİ‘½\0ÁĞ,ıĞl\ro”Ë—@î$c²„kícæ=‰Æ–r\0¾7\Z·Ôl“éÇÀíuÑeÌÃkÒ·û¿Ù«jÇ,ãÔx^é\'¹šÓºrJÜ—r›§ĞG«¿8o0I%ˆ×~\0ë‰?urã°TœytPc7+´¤ï^zBü”ÜÀÄë<Ñòğ€`·ò:îÑp@O‰ÀS×Ÿ;Û;øeä±ÙDAò\\Dk1ö~3´ÎµÅÉÇ»ü/V˜FëØ›\nŸ5+¾RV«ÈH5wyfycKá‰ UáŒÇTKÂ“ëàÌ´Å‹‰÷Ê7ï\\T{Ò·¬Ğ§›ğUo­4õ˜¥ıJÚ]½ÄU¬nÄD¡6òHc»1t@ş-–S ÁaòbÌ	LW{½gv;ÕË™ıˆK|/óFLäqréİÅvÅ‰Ì—ª‘Ó‘\"sâ9Ÿ¡áå•H!_»»€\r¹c\\7Ëë¤ıàÓÚ.ŠÕ‡\\uÙøÖ\"—ëû“Ü«ËĞ²©y–‡]ë~“ŠŞÇ•0IvŒÎ`µ[îá8YQH>ÇMÜO)©\ru³ŞéÒäm($VtÄ4¼fZö¥`ö‡n«õ–\r¥v?æ‰¶TÓ~¨!xüNyPÔ|qÚşô«Š0d·¦3³A6%I[Æ}R&†»ê}ÔwoPîB–gôÏ8=pSzÈÂYğ˜:²òâùS‹F=#S‹@®1²·7A}sÊ9~ÙñÙîæ4oNyùßĞ{DõR¬¡Ç3òÔ>¡ãiKª\rOnVÜïÀí^Jz~Ô¤!Çù™-J)dï:½!üÙtô!Ã­ÁÀ 1•àãÔV‡ÉuÍ ¨6ÓÛİb½#b°€3E\0f“°)ıŞvF”üÅˆÄÊáÍ¢C\rî^¬Ó~ZDGëB\"ó«ˆå†\ZgĞág’€Ó‰Ò¶“Ş¶E¿Síe‰v’âœ9ª£®1ë“t?	Z ¾åU¥ÃKÅaæJ’8ßg{ÍZÀÃôk}¢õ:ÅD×ÛËõ¡í6Ö%µúãv5’JMSv³a=EÜ<8uUlú±ŸÁ6ã\nô½n|I–zâŠï–=YJ{?„êIßá& t|<w—W#Æfm07i•Ó€!èm¹ƒsÌ*$Şô×^”dQá­5à?^”]VRL}š\n²\ZËÓóëÕvZY$p»6©Íc‚‘µ[®Ñnü$­µpÖŒÏ‰Å«ÁH°?XŞÌ+¥ôÑIQ4QÑsÄDè7(VÇSÍJNÂv#Ÿ“–*Ñ«N5‡­XÁ+	\rânf\n{éP¾uVû”iÌÂÕ´ì°:¨ŠóòˆjV„éœ¹Æ\\\rıÂºë« š4*Üz8°â7¯BÚ.‘ÿ¾| }ëóÓ{xo,ük[6U\\udãÆ[ÂÂ>f¼Ó^õës\Z“ä/÷÷Ó^\"iş ã›Ÿòò¢gÁè§¦•î~z¸öDkçÄ¾Rg.ûuİŠ† °M“şˆ}£½ìäpÊªCš*’ìe\rá’!¥dëà=ö’zEš\rYÆJ‹)º†U‹—œIs©†^-G—`&Í4ıè%.ĞêË \Z¢FQ©X¶±4w‰U æ¾<Üƒk2{÷eR‹Ó›«ÇÏ\')Ö|ùU?ï|ş`rÖû®_#(ŠlägïÑé²®À’Óù\ZæÏ1S;zv‰>—v’?2pu¯Vöóéı±e_æ¾œ¹¾î$B7ˆæåàõ‹…ñé6LEÔLfrBa+ÛM!L¨vprÅå÷ë¹\'\0Ä\0³Ÿ-Ğ”åaŞnñ±¾HùY¸Õ¨cŞ)àÁ|›É‡Ûy!ÜçV}–¥OX¤­ıGä¯”:ŒÏˆ¦‰8s[p¯­,M^^Ÿ•ºÛãf,¼\"°Mƒ>jµİUyu#ŸAyåÁ±˜—æªê)ÒäëiÓÚIs}Œ[\nyÒ-râULÂ¹.XÂÔ/ù mÛñaM×±½¹[kèÊöZ|œa\'0µ~q×t„ZÖîÃ\ZR·ux[®ÀL3NkG˜­WNªŠ#*›Yúãn…Ì× k ë\'€ª©Zu\'.^ÉÑ9“\"@%xúT¶Ô³¾]si‡a‹íö9®¤$Ÿ İÅëË\nÁMÑw?é¬³VŸ*û%=ZºÆ=y\\>/Ò…ïÏ1@eÜòğ¬8¹òAP”}$|§oôçmF—„ëcFµ?çù	×vŸŒßé*.{F©œMk™·äHz¶úYmÉ¾v¯Éß|ğÄ¹1å%ä½èÚîÿcwtÓzìuàëÌtQ‘µÎÚnîI~øA2“:Ûh™|ÎËÛ°]……ğzÛ·ƒªÀÀÌX½(}^^éIxùyçÜ,)E—zÄ‰@BOæ£í½ña6B[§ìtNŠF³oÊÚ[AKítÀ‰õ|Õá¤Bü\'>¤M~£Ûë;\'_ŒVå–‡Y\ry.$Ì*ÿ.Í^?_Ü­z’ŒâFò>0VÌ§€Ó[nÎŞ9áW2´ûüà‘w9„´ÎLlúh`şú£7¬ååß_âdÍ_§ ¹¸û,n¨ù@_úåÀsfj’o©ï*Ÿ KKšÒ½D|·Ï¹g\"7BÍ~Ş$-«¯ù:#`cs.¬îM<ArùiweÊoŸ8õZ@<´)˜QŞ1³C“ªòòÇ\r’şñ™¼Ãº£ÍHk³©Ó®2BCø5ºöK\"uO\rêËbZË!…ï¤÷dôûÒdí/@Öùë×qMD¾æ¾2wÙc÷doÖ²^hÔÅ-R,•;DH˜G®tEé¶_•èŒĞîÒ·8ÁuİŸ°E‡H2qò¨Ïm$)$•¿xR\0pá¾]|_TÔ­1ÈíŞ-ÏÁˆ•PâlÑ¦ü›gróvØ«¶|…\'õ ªÑ3«9Ñ©Ql6âÜ:qW¶&œÈ#¦/Œ`^°XõK~Á•µ ˜â!“$´İQ\\P&¿óİ÷¦è@Ø‰PL•+¸-È¹øÅÕüu^O6zía‡ñtşåóB¦(jñŞOúrv‡E?:¿k­m÷Í‘ÕSMú{±ôâ9Æãpw®–”%Ó½¯ï@zC­Ñuş:!<Gˆ]O{ªWßhã“•¸–èNmXCydSC#Xúy¥@§ù³üi\0r±SY¢*ÿP?÷7)kVô¡Üœı¸¼G „²_ì¾÷UÌK¾¶2‘H.§Dğn°îıÔÛu­°¸›lõ$Øg¨¾ı’Z2$r—Ÿ=ÓbÿNåğT±²p›]€l­2¤›GxöNáz©\nªòøåÏY«y?ÆHx£ÇR|DÊ³K¶ìñÂ\Zš•#ªä\0‘ËR½PAÇGõ«?¡şßÏÕŸƒ(â\\ÙÉäp9¤Ş¼.¹V*…¥k-¢2¿üÚš’ÏD½‚/¿è(;/o«¹ğõÒ¥ìŒÊşG£G¾Kö3Fre‡ÇÇ÷+R)Í’ıU ëš]yÍJ¯PÍÿeŞtË„ã§¬ŒËuš¶Q°¿ò¦?Ş}o©}3rJ†Ò(W›ÍJOğ®±ZúLrÄŞXdOOdÊD\'C‹OÈ¹™ò«şĞV…[»õ4 v\'Óûp|ÄÒtÓ»ç|·T_å}f÷CÉ‡ÜOÙ.ïM\\gÓˆu>ÓdÃS1º<\0 ÓÒ=İYÃÕøwe«‚Ìèõí|”¿¶¦˜Iß8È¿w~”2ğÚm¨iör|•{3À´ÑŞÔÛ—µíè±Ûrã b oir`¸ß—.‘@|ŠCÛ6Ïû6ûèKÁ¦/Éîyß#*¼Ñı›‰2èö,ş©À—g„{A7Â…h\'ËŒ©*^´ÜÊ!@ùÉk¥éË…“Ü{ùÆP{}©öıøD²ØËæ”a¯¬5x?sÆV<–ü\"şÖ˜35{ÖF‘m²Ò#mÇ6³à7A\"sÕıG›(U†– k£Mâû\r¯¨FærŞ‰kuª?¤!—U¾\rQz‘ŞÖÕ…1ä:Â\rÓmÙ‹ëOĞ÷l³uîn&5w\'Jo†íğnÓR7øBH7;¿§on_»,QyÀ­lıú9ÍRUz[ÛÅÌPØ‡ƒcÌY	¤ZyT”‰¿%Şà°|Üe÷8!ê¤QÁ¥·Îq¿º›,\n\Z$hVe¿©°ûbí[±“şİ	*“Ö-ıÓ\'0£AIÜí¦\n@Wf× ¾›¯7ùø€tÈuÃåCÇS©©‹öÔói\Z‘§;rStÏä˜ğÂï‘\rÁTÒwfj\Z&ãüf2İ&…ßÍœÔ<Ií˜L“ò7ùéÔ)l-p4XçÚ‡1íÿdó9ÊNuunXãĞãºÑh•mÇÆø±«Ü|m¼‚–\\{û¼şrŒ!º +özWèçÔ9+7Ã¢†I•¨A·ÚØX7>Í\"±:5i¤Œ$nNÆÏ’Kè>}2~N5uÇ½ #› §n°}¢¥ubØòkì÷ô\Z²\Z=m$>%p“×¥w`ÙáG‚ÌÙéaÉ‘üŠğÏÇto*?ĞœÙIà0+ƒÁ6ŠĞöò[[Ó+:€&?N¯DQë=–ÆaüU–ÀÚ“\"\nh²U$}\'P:o~]Mæö*QŸß¤§Ï;È}åXÙ®9“Ù€QÉp¿›X7åN@{¥Ijúãp›$Oy‚½pìzÑñ\nÕø“‰°/+oMøöXavÀ~LcüV,ÅJ¯`r\ZÔ›¨Éè\'\"@¹ÄãP|Áàæ,áÜ:nØÁr&^_×m/,,Ä·ûp¸e³á¤;wåNêa%É‚Jx7Qì½p—£˜w‡ìóËdpvYiûéò‡šCİÊÜ¶mƒAï<7ÊÅğò?UsQ/Íòä‘S”ÏPã ò=:\0k‡Agõ@$QpnÊ±­÷Œ´Æ2¤¬³Bÿ„“¢f%ÿ-‰M4„XßÉZr¿j`çÙÂZ÷£ñ\Z©áQY!Ş÷\n}›I­!·Enb”ğ)”÷Ë8¸~j¿y@_·/búÜ‹€ò\0c¥ï\nendstream\nendobj\n20 0 obj <<\n/Type /FontDescriptor\n/FontName /NAZTKW+CMMI7\n/Flags 4\n/FontBBox [-1 -250 1171 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 81\n/XHeight 431\n/CharSet (/k)\n/FontFile 19 0 R\n>> endobj\n21 0 obj <<\n/Length1 2167\n/Length2 17839\n/Length3 0\n/Length 19135     \n/Filter /FlateDecode\n>>\nstream\nxÚŒ÷P\\ÛÖ\nãîî4îîÜİ%¸4î®ÁÁİ!¸wîîÁ‚;s®äÜïÿ«Ş«®êŞcÚšcÊÚÕ$JªÂ¦öÆ@	{;Ff^€¨¼\n3€™™‘™™‚BÍÒÅøo1…ĞÉÙÒŞ÷¢N@#—™˜‘Ë‡¼½@ÆÕÀÂ`áäeáâef°23óüÇĞŞ‰ fäfi\ngÈØÛá(Dí<,Í-\\>ùÏ#€Ú„ÀÂÃÃEÿ·;@Øèdibd7r±\0Ú~œhbdPµ7±ºxşOj~^&&wwwF#[gF{\'s\Zz€»¥‹@ètršş\"P0²ş‹#@ÍÂÒù_rU{3w#\' àC`ci´sşğpµ3:>¨JË€vÿ2–û—=àßµ°0²ü7Ü¿½ÿ\ndi÷·³‘‰‰½­ƒ‘§¥9ÀÌÒP”ctñp¡Ù™şehdãlÿáoäfdicdüağwæF\0	ae€ÑÁÓs6q²tpqft¶´ù‹\"Ó_a>ª,ng*jok´sq†û+?1K\' ÉGÙ=™şÕYk;{w;ï3K;S³¿H˜º:0©ÛY:º¥Åşmò!‚û#3º\08˜™™¹xØ\0@G\0ĞÃÄ‚é¯ğjÀ¿•,‰?øz;Ø;\0Ì>H\0}-Í€?pŞÎFn@€‹“+Ğ×ûŸŠÿEp,,\0SK€1ĞÜÒîOô1Ğì_ø£ùN–\0æÙc0ÿõùï“ŞÇx™ÚÛÙxş1ÿ»¿LbÂ*j\"òtÿbü_ˆˆ½À›ÀÀÊÁ`ùkÈ¸>|ÿ7ÌğòK•Œ,ÿÜ?\"JÛ™ÙxşÅá£xÿááöï± ş÷ÊĞ\0ş÷ûY¨ÿŒ¾.3³ÉÇËÿçøÛåÿßÜÿåÿmôÿoB®66«©ÿÖÿÿ¨l-m<ÿmğ1Ê®.k!oÿ±vÿ×Tø¯U–šZºÚş_­´‹ÑÇzÛ™Ûü·Œ–Î–@S%K‹ÍĞºğŞÆÒ¨dïlù×e`øhØÿÑ},œ‰õÇ…âüÑ«¿UÀ}úß#ÅíLìMÿZ<VN€‘““‘\'ÜGë?À›åcCM6€‰ÑÎŞåÃğAÏ`fï÷WG99\0LÂ‰ş…8L\"÷Ç¤ıA<\0&ñÿ\".\0“äÄ\n`’úƒØ\0LÒĞGL¹ÿ\"nf\0“Òôa©ú±˜Ôş .\0“æÏ2úƒ>23şƒ>23ù/âøĞ™ØÛ|ô?vö¿$¶¶üÿª4“é?ààŸÿ«Íÿåş—ŞÑõc:ÿ¸|P6û?ÌşÿRZş	ø´wuú‡÷qóÀ-ş?šbùøÁİúğƒà?ù`oûD>˜ı¡Îñáj÷1HÿĞdjÿ§4Îöÿ£şHÕáú#˜ÃÇ[ÃÎhö§\Zì,ÿ–:ıO‘Ø?Êæğ±Ñöÿ(ìÇ;“ÉñOÿB®@ç¿ÇıÍù”†åƒ¼ó?àGÔ?g|\\ L.NÀ4ë#Ewû8|Pvıü¨–Û?àa÷ôéÃÛãğ#¼çßğ–ÌÄÕéƒ­Ëß×àÇşÿıª=€&pËö&|ÁVµÁíÕÂøî{Ÿf)ö4Si¼—:\\Ÿ “hª27î„“†{PÖvÄ©o…Vˆ_½OZê¡C[”Û}^âT¦÷Úà–¦°&N„ëú	a	Ô„ö}^}4¬Á[@ÊPä8ºr#)å¡?¸÷IzÔõ—­}]ØSŞ¯â”…)›aˆRÔ\r(£È5ÎšÇ!…ra „¡E»ô@»½›Eû>ùN,Gç{\ZÅVèıy‹5úqŞk½\\Õ¹—÷3!ø-ÚØ4¥·Èa²ö¢wIáÚÀ’G!ñwDú”5ÆCÖŒ*K•»¦Ş\Z·±åN–İœ$@0ş\0únBMi†©\"fU›AºK\r›5ğ°ÓLd½ıN£ÛÌ*…`…g¦î0‡¨mqâßÜíı\\ï¸><2Àpÿ5¥õa¸id§ÛW³X°_ÀÜ…VÜB\'|m•7ƒ0²Ìe¬K(B¿â–ÄıiÂïø[ä	e»€™ù37d/èÁ9GÏïhßŠ†K…Î­9ÔEw4½ ÷ N…wãŸ)——¸lâ†™_©s3Ä»¿ånÄP)óÕæ‚Ê˜.·*°ÅJ=‰åâ·9–~’²KKöî-V‡ëzZ=òä3kT¨·Årä+“ìF0Œ6‰…ôñÜ™nßıø!¢yd¯ñxYá&2ıK+8÷[§Šÿ÷.gÅ4Iá°¢ûù^Xc²357Û¦dMµOO;ã]E/îôeÒbT…Ëòı²Gü¡>ËzKb…½¸ÕşBXßn›üYk;¨A2QÖ£)2÷WÁÉ:†›4~¿á‰à«ª=ä‘ymô.ÎŒïŒNï{ÛTè³÷5ø8\"ÓÀmâ(IwüÓ¯7?QG†¿™…7o¨»×¯ÔdÌ\r\07O‡Æ DÈ ;Ø˜1&N¥\0¥T™r…tï	ÙVÛ^YBOÄ1ÍŸ*uk70nùC~|ÒíÒ%ßS?†ÚáLú>ã!™«l7ø?=w×²Šb!1›dq\ZN»F\';õf§Ğ†$Ò,D+Æä5d‡\nc¨6&ù·\nº›x.I0o\r*êÖÛ”0’r#är_­¨ÌˆŒKe¯7T,g\rY€ÆTïT×Éü‚Ô<~ÂuSé’Ä¢¹;©GbŒûoÕ0rŸª÷\0{eş‰ƒ‰xøiÃ/üYD,Ì¥>0iïümG¶õMK™Ã—9Á›Gş0\r\rÕÕ‚Ã¸†‚×\\É\'Xğc9:I×ÜJüì,ó„×Ÿ\\&¤@Vù8ÓZš}d]YØÓÕEA -Ó±ê¥\\*j§g}ï<qˆŞ¾˜Qèn:^øë¶¶î³+²»‘èdÜK·æU_ÔU½`ì›Dà1oş¸’—y”ÿ®Í\\>ãæÍ¹‰“¸ ûĞ\0súî8œNÊ†ûé<1KmF[–qMçx˜¦›[rDÖÛ(Lô³ˆdv¡ç*5R¸,Õ×^VEæY”JNi%rr›ç£§òf†ì-.œ“9àøpÄÃ ®ìØ\"%+…y¢q•Wè½Ìn\Z½«ıùrÖ>¯\r×ø´œĞ9NÚô6Ú\"ÄşÄÓï<?\'J6ûòe±LhpF\'ïé^šw© ,İ‰ì»y¶ƒR;qïHØo\'Ï1UĞmÎ(˜XQ¼[˜*Ôdõ >äv$‘3©ÜÁ·?ù²Ë¢Á9$òI¨ææéŒ„9¾[;×Şë‘üìqê~ĞŸ¢¯âçô0¦û¯_¬zöe½›€JƒWAi‹Qd×Ã\\Ûs	(lŞ$˜¥dS˜Ò!OÎûÀ®•\r\0¡bI0œ‡ê•;e)ÃÉluU¶¤×C	Ï1Î§!ªø]ê±×vé…§úï]E4\0R*¸œ›É¼-&¤eCQå©üé±mŸP“æü×\nœ‚\nÛ5c\næåTHÚ\'Ãôè¾Ü„Í&³ÛŞ,›\n%qÖ\\^\"\ra\ZU9¦}ş2¬sô2ÑláüÍû,¾JïÑ.xj²Ö%-H;	¨xR˜T`no•%ûxÔî>5lê]ÍK0cá7?Y{yxô…ÙMÔÍ7‚¸DÏ]ùÃwNÿ95ú÷F.ÙÄ0BŠ,\'¹LY ¿‰Ù<‰ÈÒvLåå§$û?¿®ë€Û–¿·zMFJøAÁ¢Ù”=ş í‘¨B,iˆÄhŠøhĞÄB¬©­ZâÒç^l_¨ a5cv´ID\r‚—u(e1vÈALû{<@áèLhi„¡b^ß(çT!ª)½ßºå<ÂGèãŞVğ‚œü,š\\±~ÇG\ZÒÙxãÁÜ•ïb\r„Ì°9Ùğ¤6•ŒÜ¦½pÕÇ1\rª¿c|şÁBD[¶;…V#O7hìàÿ•Ï{½l6 B™\rëPCƒo)·}<l	­R‘Q1{Ë’¾›ûÇQĞiï×óïŸt?m	‘Jl=ÉJ<¨å\Z?§ÆujDÛPÛ˜Wvg­ÏTD­“4–Í\'Ïêşz}4bWfÁ®ûøÁ³í¨QØ\\<VˆwÖ·>Ës6Î°CòŠë†®È?(à] ËöÂÕ‹F½,s‚/Ì+rSëŒ—äâ!—–³|£L^2ÇÿegÃé	\Z*#¡ØpÅ/»w¢4^ -,Œ3âö5ÁocÆ&ò áA{o±jyDsej/ˆ²+9@ğ†‹™Îd	k¹<ã\nkœ×#\nÇ=Øç%,U8ÿ\rÎ“ñJ\'Ç£e{İ…EØµ¢,ÁAx’Q‡=_u‰ÕØ=‘ÎàRZp®\0ÄÃ± «]‡ï\'M#!ú²ûƒËA·ÀİM{[NC¼r|í0à»ÁZK²dÃı¯Ë#j\"a›&ôésÃ5nWÆkWºóeÒ§k¾Kz?¯áúi\n8û¶ªÍğ!æTç@Ô…!\\4M	Éó¹Ã”M€ù›m\\Tƒ‡†çmÃ\nêt©™×œ”b·«nÄ,Â¯qiwKı%ŒN\"<ßÈ1íšµE+DYú\\ÊL…ÈîK¸A¦¬Bç\"d«Asfùò»çl$¨¡à—\"®Ã‹@ù¶~š¾•÷<ŸÆW ¼lÒ¶‡óå&íô££—;wñğ7HÆ ŠŠ†håYlu÷Q`*\'LHÚ+uômO£ù‘—ÅvN³±µß+ñ,òœ~ræ	¥2Ü© B<uZÑ|äUH,<r½Ll\"‚2BÈÔ\'Ô\\¡dewG+µñ‚ß\'ŸcÕ¼@¯u_8Uä1~Ïß#U,ú>2®ÙK+¦·ÎTdèY©\\6œ¨«œÔƒ/A[¶f©†õ;êP_pgj/oTğU•B­N¡U–+¦\n†N%máTÇ©0ãeHû¶ıLÛèÛ^³D€Pq¿¤ªôt7!ª.wzıy9+Ô5,IUÛ \0úYYhYzyË…\"÷=9³K§„†«²ó%ÇbÂ.¡÷H›jnÕ¨§Q­÷7•–“ßÜf\Z“]¸Œ\\.<u²\\íAÎèT:\\Eƒ¡·¬DÃæê¥¾u†ñFİñ¬3C¹ª|=˜U£õ\\Ğ–~ï—04·í¹ÍµÖı<ö„–Tr?t\'[á÷sç$Œë+»Ï›à´imŸJïGœo/í30Œ…¼ã<àaHDE‰#¼±M`5ı>7^í3cÛÁo;„˜;+¥š’3LëŞUMÌePÊñ;ü„@kF¶AGğiù’QÏ}øÄ8Ü—ÜHg61èåYâDüË VÄ«r$ôû×VA·¹v(°ãëöÛÅĞ^-P£|nÜù[¸äÕPs÷eh8˜®=	Xm!OU½/¿C¾ƒ¥U<ÚØ‹,•\'À\'g¹‘0?6…K$\"¬o>—Šo\Zé„š=(y°ûK…ä`úCk¾Ôó­J-` h£“²‰Üp,_¿ì?ü’Ò%ı¡õÀ’<‘vfÂ¡ğÀSæ ÀÊ%Ó&òzİàÌ~ŞhN}Sê©Lä\" S¹Í= éÜßÀK¬BÎ£Ç‰AödëYIcÙ€î6|dÕs§Y!×§\"¢O¨\"bdóóÄ£Î gQ;‹·–C¾¸\nbsÿ|ã\"\Z=º­¹ß¯ä™Éª d«9—ÄwÃ0ñüDŒR“À¨lwAY«…Jj³ø\0yÌEº ¢ÖohqY›à·Ğ’æ§dƒ›S»µ€ÄNÅ—aH9D»äˆAHƒ\r,}ƒUsŒø†/ÙX1|Q†DÕSg%²\"¡—œÀ¾Æî5âª¸f8ÄC›ŸÊq_ñ~äùÍÒt}mÌzl(¼bŠâƒVÅ¥BĞo¹åİu©±:ÆğøQ$NÍ,9Â7ÑŠ¹ªì]:˜h­FÕr™Â—Íëˆo·´ë\Zàb#\'Ê’ ÕàÇKsŒ[ìsœ)Ü˜òbU¥ë\"ÈWbéıBSe‡gû!“,¿2œdCı{¶†¨8¬¼Çdë À!Ëªù\n÷¡é]]Ú0\n—J®ØúÜ2[Åî\Z¥îû³¿ï ÷¦\nC0M2š¬tzòH2*\r3§½W2ûW–âĞ¤P¼ªù”è9ã“Èò˜´¾¿*Ë=€ìz¶ÕiLGù«œE™6Ã^àU§7O#€¼’¶déüDDé4¶6VDˆ‡üúæ45ÜCfœ\0|VoPÓ°˜”UhÊ3¦f ÇZ2Ü>cÀÊÔBUUî¤uJåŠMerÿÁJzõ0–ÆlzWÂ+Ã°i°I0oGÚDHUŠ2™ÿ²=şèfÂ%H »£QSÆÖmT!LâéÙ¾Ãû{–#Û„$ßã29ĞxRşmáÛ/&3_¶ÍäŒ“Ñ¢ÁRÉÒdÔŠ*3yçiè9b-MõWß—»†¦fí¾†(}xÿ¹E\n«ñA©Î‹E©w˜áñhbƒÇÆ¾ÃĞÚ‰+¿¸m™f·\\¤Ú\0½528òeè2äU*QÁ\04ş`UœWÂ¶³ÑêîßB	8Y°éFåõşiÂ~&á_lì5Aëå©¯b œ@šŠÉV\r§ì´½­V\rÙ|lÀÜ+\r[©¤mr^ı¶jHöê_rog•zFN½ó Ä«R/>M8êÃ,Yœ(Zƒf5gì8<<!Tp»z®‘;]%¯_\'¹Â™ùš8öÒqt{~!y]×›ÏzÂè:ER§¯\0ítÉ¡Ù·ä•ºÊéTé[¥®4\0*Jht¾9NAa	”»nõ1Hò†ıúİç”’!õY—\"FıÌm©„qÊkGgkT$Ê“Â_Am»¹‘íN¥ÖÉ–`»-†LüÃ,[ğ=¡åÎ¢”ĞZl€ÙdĞ«u³\nãIÆí«•ÿ -#\ZÕ¸êNXÛØ²ç1WV‚öí‚h]E¿íQƒ~c•¤+‡dôCÃ2KÑ3²SäüÛVÔØö%Üû·\Z–\n»0ƒg1_(º}³2srÂ§’~P=¡ùGÃ%ı™IÙ;>Pîƒ\'m»ÒNÂ%lfÂ›Ú¨–®åş=ë»½WÓ§3hÚN(G„b·w¼1Q+¦DĞ*…àë€aT„†²XzšíV£²‚áV‹íI¹b×wÕÙxÜ`Ô>5ÙR#-ò]wóá„FÅ m0|ÇÁ |Oiêä÷v+¹â2é.“_¢.ò8/±mtõÉX÷6í(º×òÏ¼}“ı™,?¯\Zlü–]øƒ †®B`x>å§Ä˜ka‡õéú+œøçLÙÓÏ†F—¹hECˆá:Uá(†3câÙù=îxİ§FDø¹^û–WrFÁØh¾V#ÕÃBÏùá{¾ı~ÈûšĞi{v¡ÎÑ©Ìv´HŞHU6‚ŸK½®#’FĞ\"š¸Ïˆä¦)‡òŸÁ/d\r\0†õ%=†Éyçë?‡Ë[İFÛôu_¾ÑÆc.¼*ü*Q06¡[mïÜÎ¶\'…Z.V‡m÷š¾6?67Úu­—È™NãïE×zò\\o.+Ÿ{¢m2¿{gÔbÕë‰e/‘JÏËX¼J×ïr”Ú×f¦ªŸ]A¸/ŒŸâ8¥(¸N“²‹Ík-©æ\"=òûªÂÏÄêò*ß?xóè¼WäÿlÍ#­uo–_š9\r¾ı>ùúL‡¾\\¤%~ZœŒ2Äxü‹¤kª—”VfU•©kE›¨\n†àòÂj‘rfYøPîÇ~ØÏ–6´´O·É\n¹{äœnµªxjÚ¨ßÈVq*åRŞÙ\'ŠÏ3@&©îNï{ı$°M5$åèé°œ1Ë%ß\n¶ô™šKë{!†ï@-\"û‘Ë?•{‹•º!°İÑÒ3¾Ê/		XÑğkZîÊ·‡	¼/æ\r¿ùÜ:Ó“™÷IimÕBö.u\nÂP:„7ÃyKÍOTòåƒ\'m—½›%›ˆSËiB’¸Ò=À{½×ŸK\0\'Ä‡çKƒíò9Vˆéö\"J¹Îq¾+÷¿N¥Re)³\róy5G³]«ñ–Y£­R4»ÈÄA3	Œä*¾Ÿg:ilôàzèU·@µĞl_|ïnĞó·Ézç°ïDÑ9È’àC¡W ,¡B·,\r×­QPî–¾’š¿™\"îTã=Z’¸À>Px‡‡VÕê^g®á/§i³ØÒ\\€\nè`7k‘k²ˆYe\\ªS£ÑW…œf \n±s÷}¥‡û¬Ğ,9%\nzSu¯\r¥	lğê™»»dkŸÑ…k\\r9{{ÓşÅaƒ-ñÅ Ã£;*\\=Û\'‚J+¾a04XRY}…S\Z^—8-ø`íNà…wXÃàlX`¾ˆ‡VšÙk¶A—Ô{	æ‚M}Åkà÷°ë®D¦øØrAÈ­ÒfÉxl7rà‹zaæ“;Må¥9zø(¦ãï–©YaKÕ\Zf˜´ã |af»³=\"C‹P<œ,¸$WÌi…òT(Ø~ÙÓàó•—³OH o~ŸÜ|½*zx!¯¿YÙ¼m{q0ÛEÌÂ¥*<kß\'Ü¸:Ó¦¥„™Lİµ:,¢\n‚+,“Óÿ—Gd¨Q—N+–éá§·pÌÊ®éÊ7Ü1·zYbPØ«úÉ$ØØL¸Ô—åàzµ\r~õn-^ˆÀ•UAº;Š­\ZØ3…¶5U¯Aİu QeÙ¤½}™uæ‡jGíë»úÆ¥šı0P«Ôµ´ä€Hw¨ò‡C\ZÌğÈ„}§Š^m¯BşÂ¯”ØN)|Â¦Ò¢ø†La¾pV\0PN/İQ›+ä±×ğLYv<Úñ\0YÜÅuÍBÕ=¥ˆñJá2Iª >¬¾µ\'ìº©™1ñÖ¥))%®nì*¢3í]Ía†Z‰a4qù¸E½ô!‘oÛßÉÑ@ô~³Rğ+·ìoÙ·ĞÿE´s4vZí—?H¶2èmZäà>LbùdyLlÃã”0®îmç5êË©ªwıIÉ`ç+à[ƒ\Z ]YÍA¹PAE§8ü^Ñ¾àUS‘³ŒÑtàWÉÁbÊ¡°>^%ö,|åšh…ËÚØBHä¾*]³f7¢N3z.\0ñÁzBJ„Ìx–ø‹ä#¼8_tÑP\Z„BÊŒD;f×Í®©ıÃ£E¿Ø’\'¨h“›²İöÜ˜ÿ.ı’…–(%\"lcÿwËï>oo×À£zçO’x¢}åÎ|-t¦°„,¡C·ÚyÚh|LE3Rús&MC¶‰`|êànHŸ%+~uäL”+v=~3yÑ°:„©ŒTºhÃšAÒ Zíc#ºÑw{ºNœV”r*à}’H\0}TÂ_Nn^G{\"Ü1ú\Z0R’eòJ 3PÆQ–\'.uÌ\'Ò˜ÖOæiïVÍ]åšpgpUK{Ö I}äh®ã\r\nRÃ”\Z>3}³ÆT#”3ÂIª”\0á	”¯¼qğŠNğ˜QJLMZpš\rt`î<ã6‡z·İax§Êâò±×ç¶\'\"UyĞ~Zş’•É]¯Xaq.~¼Ş\\¹Él3IE5Ò—Ë\'3Â–ÍeÀú[Ë´v”yÓÎø¦›c[£çd†W¹¡†ƒ·!³`0ïU,v±è>\Z‘|³ó\no§Gp¤IxK…¯¥wÛ!‚{“}8ø­´İÏD	!ÜYï\Z«(—…pOH+m¸xî¹\\ï×Egª‚˜İãw#ALoÛ~¶œìÓ“‹/”Ğ\'ÕåÏ™ØœpŒ ZÂ aH¡Åe/®Z·áBÒ­…—È¼>˜åõ7Ó@˜ ¬ãg*ô«)çÒgÌ³ßsŸ\nÖüzë»%Étğïı¸X¢rõ ®cÏ¨V.š%+1„\\)ûo\rVõìT¥‰»³iÁIÎòĞ%å¼™õov©ibëÁP®—šñêõ0y›ƒƒXF´±6ôúo6.L8„v¦•É^Í¦1GÖê$ª~sZ|ò§¯^¨²Cšö—Më	ŞeH]üYõÀ^%´kï¨†åİ3ğ2§™‰Êî\r*§·$+}¦{‹«¯)¯ª$Ç-CìP^ºU2Ø^)ÁÑÁ.ØìÖÊnCz2ÛGàv×$ò ?ÆV×P=öèÄŠRWâ¾BN%8#fÿÛw§}\nèãAZ7‹ŠşP]ğxÆ½–Ÿ\"D‚ĞZ†ï²Òã\r}‘ãfçì‚›.Dk…¨ä™N\n£,úÔëN‰_T*C|Àf}¸ö‹îõÉHÎ!¦o`I=¬‚ûÙÓ¹<©¬Ãäê†”P°Ú¾‹ezK#^•É\ršTæïÊ1äé€:f•uª^1Õ Ÿ¢„S`‚Æƒl±,šuDîoá~a×ôÈºNDh9Ë5g­ÂBò™\"j V‹”·(y{Ñkª‚ªæ™pšãló˜–^8µøğ¶2ÑZKÈ€\0†Š—@m>bÑÁíÎoZƒS£&ê’ 6\"o`9/	ºõZ§¤›8’$Ûa„r¸Ä–„ ¼¯/S\0ÿ³æ›GÔ±.ş§ã¡;\'xë·Ú–\Z3™8Gálª)›2`©\rü˜ÄbKÀl72V:¥#¶¯,ÊÅ@‡X(¸ßnövŞ=!\'¶\\_±õCõUå—¨–Ôª[İñ!+N+ñPŸG¡±££%6İ¥8[A÷¾ş³)™]%bµ×KcÏ‘ ëçÃµº]ÌzTàˆ¼ë\'ßĞÎ\0z×åè§‘(>Ğ]\'­¡’&šGxg“$’v“<\nJî]¹_å\r]Ò2ğ½ßHì2ŸÁi}ñ/‚ã“úF.à7Sé0|IS85X°*Ï¼¬r©wğ/wÛw¯Ì‡Æ56ßa5ëC<°4HNÃkÔ4)Ô{~[›Å\nO$ZğéçeG EŸº±ñ“¾ÑÌ÷Åoâ6a>œ“Do7b‚ÃLË7¨dkH©İ (ÎR#à8,o¿ìËu.­PÍE$Ş;o°Yõ%egÆÿ™”ãJİ(Ô›UÃ\n4ôáX:Şµ“1L76ŠåP&Nm3#÷ÇäîæK\Zz­Ušì›³é+ö¢ëÅak?é§û´Ç\rÅœ›ø°nXÊı;_D6ì”ˆÅ‡Û9b¡”x3› Çãs‘§kæ[Š¶š‚èRô-÷§å½ô<Óìí^DÏ¨Úı<íé»Ø†’ùÈèjÆn	—ÏDUşŞˆ„d°¥û|ŸÅ®r\'F ¾«	}B14d·†ÊA•(M¾Ã¥CXëd]ÊçÉ	ôÕŸ¦šìÙkY7Xu7Îí¬Jæ ACŞbIXGM&‰0‹Ğ˜ã-Üğ £e5¶Y­j÷ˆ®3Rô ˜¦eªl%Mã«]Ã-ß‚í’CòKwo(‘	ÕB‘Ç¹%R£èÌp†lSÄÒ)bKŞ\\‚ÃòûÖÎŸˆ™_µ|C`“}×è£ÒİÚß{Ï´Jä‹5N_î¡«Ë3ğ1í”Ì­VIÖß;Cİß5/´FR”Qê¥¥ıŠV%÷åÈ­QYÛ­†³=Œ½•Æ4\'Šœ¥NË\r|·æ6‘¼î.¨Ğà0ï’E¡¨z3@ItÍX÷ã0áï¦.–^I,)Ú¨İ¾Z>}ízÊÇbSş\\UœWMÍ£—0ÁÈÁ»u›Âş;Å*•Oª.ÌÌ’¯ \\±Á˜wÖÑOŞlôYâ(ğë¡·×B_˜¶‡ÁÀ1ö,CÂ5W³!¶»ªA{%ò\"ôÑ2*{‹CËOà°9ßZyió½½åœpÚ¯y +m»4Ú™¦L+LòLZjËÁé>[PÑâ9ïáùˆŸ@qUxºiVp\r58>\"0È±õ×úTÖôe·Ê!µ]˜r–åÌÓFˆËœ²mW¸s‰×ËÇw[ÇG%=œBä¾SØ¥–àÎërÎô«ÛÊœ×Ó3†ã“Õ]05#Ñ}6¡MÂH#³gÆ3Éô…çø‚½ë\\ñ= ıÀÜîœÈÎáAg;s)eb,¼à·Ëm}±’W+g^õ÷bEV…*$ªÒ‰_0X8\\\nèË&YÆ<-Yn0c7İ†/#$ÆŸ¤ ™>}*Ştÿ^DÊœ¶ó,ty÷fîû# aL\0<CiolEÚš˜tMQOå|1¿FÄÖ÷Š`÷§ËÁå‹J>ÙÒ˜âÇ`6/ğªÖ_¦‰¨†&0>š‡‡:XeöÓàÔÅû¹é\nU³A·$\'kë6¿Ñ\Z†×ğ 0Æ—qù‡¬ÓìP?l*}F%©íÊTyË–y`”\"›êŞúzBÜx>Çe˜ÑÂÑ®Ô‰à¸W¾&­ÈÑ¢\0‘±ƒ––uŞ‹OY·t@có8Ú4ß¹äš3º\0MÉÓ•Iğ÷¶€T‘±-(4˜ï>ÑñÄ‡ú‚ĞãáÒÈŒãhÈµ8Yõ\"=@±ƒ²Ò‰|éº+èX,°cµ$J}\n5  ¹ÈlÆ?ä-ğŞîµèUÁÕ÷Y‘@E@AC½v®}ãI¿™áÄªBÙëÁ>¬øÈ,@³Ñûİ\rÌfkT’ù­<yŒ©Šç›x6âü’¯l5(!¾€G™ñÓ²ä{7º>[ı½Ì™kJÈN—7œÈ–)^(Ä|ğw+£‡¡bèr8ö¤Ñ-¾áªrªÊ÷íå[bg­IÙ›¸¦/=¨ŸF×;±ôZòã§²=«”¿2÷]šºåëYšÒĞ«…^¹‘€wX¾ÑÃj\ZËs›9r›æÁ§iÁø|?8Šğ˜Jœ1òP9²]T¿Z6|¢_õ†ú±q¹ZLbAó`	}şØ\'Íìã¼şz=ßvù*DR¯L™ã¹ØPŠ\0gChI}vx›\n+\'™%S>ûpWæ½¬T^‰.\ZEÒY…x¬i—Â-“’Sišß½›¹´8ù½Ö—í`$Ü\\Z¸·¶îIÉuÃ_eÉ—”ñõ’Œ4Â˜‘ÿ‰Xâùc#d;µÂñN]üÌ8‹v7·Bš-4cèóÂï7ç¹Ùs~ú0åA#¾O5Ä—#k%bÂ¨Ÿ‘µ‚öfùO8ÇBWÁÉ%	ZøâİÜÌ6êì0¥J=0Üìí¦N„£ø¥ıêl •™v£Y|3Y$	ek#kÔÈ\n`6+ÇÓ˜Óº³[½3Í«XËÃòl†-nŸ£l¯£[M:¯h?t{’IÃGàÄ9¾Ã¢¦!YDOU@Âİ}À.IÀ“ÂØ]D…w¦Tm3E2s9ÆŞ\ZvA,&ÍyP@Çôš\rÅzÒ](¤4KUMöôÚU™&}ûqÈW¸!q¿ø\\”ah¢› Vá^*¾ÑªüRƒ»•oSÜ»<ÃÄs¥>ğC¡ÃÖJ³8mx.&xOGÖÖÇön6a@Íö\Z¿.ë*¶ôj\\`¹H¥İ+\Z¿Öëh¹Ä˜è§Í@Y¬ÕÓCgû€ãH<Rı¬µKCØ\"ôƒ„Ş†uXœI¨4$gÏ:ÿp&·yãëœ7Ò±DÏiûx·•¼Ãx[Ó…x³6ÜáÂØ$âÏzªV1Fú{!à¦¦”ó\"´Ç\03:Lô}+	\0´¸Yïx*^ ÛkjG¼7.ª¸vÒ$¬\"cáÈBD¦ğ:l»ÁKøí¨ey¸,å»ç$UXÏ™ë(Ì›ÂNNy‹ÄP³ü V7Lô—\"ÒfP3Wa y­M©ñJrÈeıH›	„ÏÁ‚pa5†öÊë+ä¾fhHS»Ï€A>”²Ş÷Ùn2 æYÀÖ†![·‘le=,ØÌgUı\ZÛ§Qdã—	\"ïÓaîâ³ı›‚Éè°˜Mùô¡pÈ6±7£u`´`Jñ”Å(¢IœŠù(’4õn›‘ËÙø§kê­dR”r«J Mƒ)9c$ji<vqjóµ»¦³ıX”ˆnã CÒº\nzï$tGRÛC\'êÎ7²™“ªHéÃ~X>¡tÙE¨	fóèh·Êá¶RÍ±\nÔN®$B†ÁôŠ~PéÇ½\n\0ì3;®=ˆÌºiù·K›×$øZí‹e|ñ}¦Z¦ÏI$Â”³Z6a¥\n­Œ?ıĞ—Æn¯õı%3åãUiÕôÄ–¿½9¶´—§N}Í®ó4èOdç®Jønüâ¬±|ú\\Q™p7š[†JPFÙ‚»DªÓÒıñG`ÉgnÈÜ%©5iÜoKæÖÇâ¢&\rÎÎ½ë§¤^ó¹ñXÔà¡d—`nË†q{¹)°.U\'‚ûÂ†ÿŠRF•ãƒµÂ{¾iì[Ô\rüuşn®/ù¸³aU_ú|‘ éÎLÜúºMqlÿÌŞşo€vÜ¹¸NÇùHO>´¶/´AÚùÀ,7íbÛ£o(l²p6,—eBŞŠç* wl?8Ö~æbT î¯pkJ)¼İmàWÈâBRy^‘rh\0é½·o,.„‡m¨$ßpö@\'äC§è}Ç?ÀÂà[§f6¦ô¸=Í§Wƒ_QE·ïVÑt§Bîî2÷ìè±zF‹[Uv@}±Á~¶$ØµJNÚĞ+£Œw¸–à|†KŸõ#ñë^ó$ÛjLPŸë¼.› ¾\\ß…E$9…4úYc¯6Ã’í¬ƒî=™²qB Ùê\r)Ëhƒœ¸£¢ÍTxubp<ı¤(=Ş)Wš–.å¼{Şñ…6úr0:é2í;œ£8î$D½0ø½1õ~ ñmh?æMhmë¡‰€A†wHFŠ±Ğ²´©BÚ>]±ëÛâ¹]ƒg—hÚ,Æ$ìØ\"-lšÊ9N+K$/*SO¬(^Á€«¢iè9D¹Ù“\r†®ˆÅAn„	ëª\"\\DaxÕÉçv÷pı¢ YšŞˆÂ0q\n¤i™$:RúÛ+¯ö~±{j³÷Ê÷oƒÃõUJ:^u+)Fz³8\'`ãEôµA‰*åsKQ=¤-–s˜m²adå—†P©íRüµ±´!3òÊ™Wyöq–¦Iï-Öß×õ[\"Y,7&ä~Ğvoœ´¶§†‚pmõygALòŞ¸h¢j?ëÒˆP mV¸¶6P¶í‰oîÓCH«G\'¦ÎKa3q7?üš\r¸&^’Øè-/§xú¦¼™4ò¶Âj.‰¡«ƒêAsØºöHÿc\"eÉÿWÚO¥„D3Yºa%93\Z„<«Ÿ$­$‹ÕÜòyùB‚­éä}‘qó\Z#åˆµßŠğÍXsN8©Dxe\0Qn*Ip\'İ¤ÛçñA\"†{•,‘Š\n5[\r»Ü·1·6¶Ñç/AÖKŞ^ëë±µÙ±,Õı§æª)Tı“5»ËÆÑk!ZÎı—3Àk=ê#VA„C*S°ë ‘Î5]4±‚Ø¹èLg‘jÑY>9‹$`~ëÁ˜6š9À1ûPiWï*äkQ¨\\[ƒ¡ÿS¤²\"R\n.1·Sˆ÷\nñ3;~ÃÃİ¤,µglÂzÌêAJm\0‘¹º1%côV¼ù@TÉ\'õœ\\nòöè1äÒu6or„ŸÄpd¡jšPjÈÁlôÉRÔXÒ´!÷L\0Á^&³Ÿa:j×C ¹0˜KÓPZk $ ve½ø“+C´c0ú¥úat¯p%ƒÇÜ‚ª	í“Š;KBÌÏŠ¹	{”:à€ír»Ó­-å5®¤Re\\Ùök¯·x2Æ*¯Hó«ìq’$Áö½ßP\0¢˜4TFd]ş’ÇgÄnJ†„ßÙ\ZKÍI¦ÕŠrèßœ½_Öäl¬œ7 õë\rÓq÷m©Ô\r„4Jæ–}›~-æ>µF>ŒÍ/‹{¨\\ß-(Wt¤º¡¹j¿ípoÔ¦ßö8\n -Z²p¶›\\°TÛÚhó±ÎIU\'ŒF*ì«)œãè?£¢²VïgTC‰™Có7Ğ€Ù{ÑÜ*¢E¥(Á8æYø-¸‡Ä¸CÌsÓ0e\"¯İVãíLr0Ğ\Zr	=¢H0YbDÏy6èßF0ŸÁMå^ólø ezj™„Õáô¥ÉEÅùIE¢ôŞšöÚù\rÿ”BÄní4OÑÆF‘Œ“ÔÁo5ğU_IVwcõBs¥˜}rnÄíğg-£Å€µOMgòxYx™ÄDìû¤C‹m¼ïésÏvùìWŠB±°Ç–b­æ5øÅ­ß‡™4ò¿d\"¨—7êgK-4^Úª\ZK¡Î†ı-q´u‰O‚ØÑıµÆ×g<“›+„´İ]Í“ò7­ƒŞŒN¸¾Ô†hÁüænL|–É±A×UËìí¦_ÓbJÃch¼>mù²ş8R·İ¾¹–ôì¤ì7Lgûàí„Á–üèÆ¯EëHÁ¦ZáüµOMı¦à<;Ş\\ìÍ<CcCùãŒ\Zcß\Z„]ç‰Ñ›pw³Ğ5Ö_´“\Z:°Ç¯©»X¦½_13Ä™§Ä9õ,P\0xÒ­V]:uU\n^$ıMQKSÕdÊN³(?	ö¾Emã“î$‡‘`„ô\'Y7´†¶X7›KÿD2¦4ü”ïÏ~\r‚n®¶Ai«¦¡,7ñÒ]f½GÓR‰¼,Kèl¸·%sgR,ÖiN¿ıÌÄ‘ÌÏv…”‡ğ„Wói¢®÷“à êç‰é4]oŸÖ$!£ô˜Ğ/.¹€Ÿ¸’ß}šƒÄÃÄ‚·µªİ0• ‡2†L‰cºù<“\"Rüòw”ÄTÜ‡ÒŞ¾îãt¥à/Ú/ kït\'äa¸Q¦Í_ÔÍğä«!ñnRKÒsÁXz¾`¹÷RÕr{EƒˆŒÅ\nÀhÀWÂÓÍİd²ÆMÆ™”ÎŸ¸ÇÛ?Œ?^u™49ıZ?çúÙåİB5ÈX\Zq,ùó0‰yÁDÙäN¨C?á6ù6ŞÏ\'_¼+ºˆc±‹AÈ¹A¾•“­´MÛ×¨”4§ŒA\rb<¿Ò‡z¨ÖwDİZX<ô2pªè63Ÿ\n‹1\"<`Ûkƒğî÷Bˆ\'è.µJü©\Z~R®á•»xº:5ÂnˆgŸâé¨ïó}M‘9\\BÜ\0{}•¼Jòº]T `p_6\Z¡Q¾¹=i¬‹Ãœê«ª~êf]¦ Qz-­dŒÌ×ÔòUa±­ì%\nH7]¾ aƒá“±ç¨»g;Ÿüšêé{•{Muãvîw£©\\äbr+Azˆ\"*ÈFÔú6©oÀş\rf%¾éû…lAÓÎø\Z.>DÀ[‡Ÿ’ÜÀ£¦¤Gjéô—¡Ê\nNÍo›»şw uÕK?z&:Æ‡r/æ÷b:‰Ñåé¤5ó¿Tø‚J+š’‡gW‘WlÄÉîXWR¶9Iµd×ü’_!9†›Éœ»c—nö.Ş²†á‘lË¶£jËìÜÓ1Z}ªU·õ‘ÊW |ŞiûMÒZV]Y¥ÏAÀ6óÃV¿ABLÀ$\r3—>²Ÿ|=E°HêàÁDnlqAİ^¿\rTç×óƒpeèqrYµ”|$vñ…¸yñTú]ˆü¾kd-³…v\ZßrÉ~øX”iysı¦ĞQ:—iÜì“pÙóÂÔè@Ğ¾ZÎ›ßÈ¨ï0ñ5K4ûËQdN!JÆÄd*Y;âUğR`Syôl¯Úã8LT‰5oQ”ñs)Ç––ëØ%g¼êÊ®£3_“•E>éw=ÎsXÜ™	Nf™tâ«Qò€‰)d^†˜ïAùµm.>¿p«ÊÆÌÅe“4Ş‡L^¡`üv’—-ó`wÓ}‰2#©0[e¦ÌÀh„âîGÌgûµdC´5¯›Šïá GÀ\n-¾9zô³wÜ3u¯BÅS“6Ú[H>0ğOñ¨àœ¿íF¯ÎcÚJ¯0wq=+Õš<ó’`\"‚‰•\"ii(zàË‡ıZoëZ¹ãs7{d$ö1E´x¶ÉßfqÿÙ®$tŸjISÍÄ6Â”SRn„”\nPƒÏƒ?FŞÄ}¬ÿƒí\r{œB·”ª¿ÿ¦Œ§ÑşıáĞÂE¨NtÂô“‚Rí\\Ü8¥™ó12\0µ\n»Ocà‰Uği¸HB%ÜŠ%ğÛ‚ãç,ıŞ•ƒ4M_—Ç×¼½ò<ÅÆ|=‡ñœjï„Gµß”/G3Iò:ëÒë°ùöÖZ%ĞWÀ+i¹:¸|G)GÂ¯H^áÛ>ª	B(;ÃBššTõ—’¿Qa†ñKJi÷2`//¥×@qN‡a¹±Ioqù¨\n5^ë¼NÍ(æw +ˆ\r(ZS¶Df0<0/iøpV\0x #¬ëáâ©àHõådõo?\'¥7Ñ_ƒfkazé]qß	!¬÷®¯{¥Ò–”û½K‰K=èf·fÙ%à¬x¬•Æ†mŠ|»\r·#Ü»#\ræè^…?Ï!ŠLè‘ùbéÈ›r`yò•²­q·ÌÇ°T¢l84rdhßPƒf:ıİLÏ“™’ùô³¾HËûŠ‚Z)9üE£†§ÖİK8^Áï+r‰yú”Lñ	€^²Zi6•¿®ŒÅ…ãK¼ŒéàUÜ×¸Öh½gì’)ówø>¹û®_EİUUøt¬YLÖwì‚\r¾û! ±áÜD¬=Š&äìÛ.&*(f_+ŞççŞ©ÌºRÙ6dpZ+»¶,‰åRv¢5?î¦\"ÕÅ8x…¯&ã¨ÔŞc?Ø×îĞ5îØÁGÎHã•›‡8G³`nŠs)PÖñ†¸Ï}Èjg<oâÄ¿>¡Á#D?Ïsœ‡CĞâ*¦äCÏßW)io¢§‹šT-bÁDØÅ¸Un&lH Ø`¿¨ä‰\nSëÅ?³ ~ÍiÈ|3SÒã6”QŞÙ‚ïø	Ú?’‰4ÍW—”AÛW‰ÙÌ5td´} ±è[B)€¶xØrü2(äºİ=+Ù°¿…gf,¾\\ƒ¶‡CK?ìY]HŞ8HwÇÔz\\W@ëVx!„2$r¸trúíé˜\'™$]Ç¯ÁŞ8==;¤dÙ`\"‹J!–œ—w_3È?ªáJgUÙnK7xv;ÛĞ`ñ»C]+P&µ[bÛöRhB5êå·xô$9)øNó@ŒÊš~dİ]’åôXRı°xAÎİ·ÒòÁ6ñj+ÊÉ®;>óªû¬‡N¨~ã¤—…,fÆ‰ªÄû:õ‚¯=Ğ“SœÖÂnR\"\nâ6{¼ÂÍÍë‡ˆ(p^:–³ãtµ”/˜+|	†€ù“Ğf;ûóü™gô~Æà©R»#*˜u Ÿ,y@®I¼÷‰u¬ğQ_)ù\\ËÁ0({•#Ÿ˜úÈògT¿¡\n9~Ğ`P·CZ#`jZŞîÏøâSü(ıMŸñ)wtÉ/ï|=ìJ†\0}Œü°²&#&¯ZR‹÷³ÖÜ·Ç3q»ñ=NbùòiôOİ%/“ÂMÕ¯0ÂËp›Â¬É!…^;-ÁvñFb‹F0½×ù-\Zãº­½Zèë_À»™}ı¬ú.øÂà …2?t°ÌuƒR8ÉdåñŒÏ×oğÌlç%f¨şJì;—NFGV”kq€şÅ4¶™üìäûU5&Lñw\'zóÂ¸^¡Íì\"CL™z„¬U´t²0gºî_»(]g‚–\"şy>7œÙ¿-Ó:ÄÊÆÔX^€08$¡ËDã¦dl‚=Í­–a­«Eîåú²\"€İIÖ[æjôSüã+ŠzY^—ÕnDûç6DÛ!5]?qè#wåíôFfgŒbCz«P‚ˆ¾•„8·ëŠ²öŸ<ÆBËz*XûU½ùô0É›nY_&ij~p;½µÛ\Zƒ¤éªé!@÷Ù>ıp¤šØtd\\ÎTbÿÎ‘bçæH·Ÿıf/Ìv5›Ãæİ?è‡l,ß´„WQ–ŞÅ`aÔd6e´Â¿\'‰ÕîÓÀz¬FÑ´÷¹OlG§#>[w:(¥µ|:œÆZ=ñ¸h½a„*H9ú)Y¶kêL{Ò!üıéû—¨Ó™o]|FıX.¿¤Ô¼ºoÒd§e?³¯Ş×\Z#Á[Ie9\"E‚ÈiŸ)ïj_…Üì¼cÉÀ{|/x‰‚oÓ÷91†·2ƒÃœ®ôG3Şx¾\\ÊÙkB~PSòËûjR°İ²iß‡yŞmÈ)‹ß?ü³ïn¥!Ñƒlä$ÍĞºËó:x f/ÑÕÈó\r{_¡ªE@÷ï——cQ­.öHõ:ÛÆïc¦Æƒ\n[Ke-K°ïÙD‡¬®$bæ/[E¿|ä	¿)sy_ôláTãÁ)÷°„z«!‰nƒÃ{‡ù‹¥H–¼¦*«\rz³=FçÖßC>4¾£Ò}ü…~\"µ\r´9ÒìÈIV±5:â	?ù¢e°óRšQ¯“\Z|êÑêÕxúµ”u¸é@+¼Ñ½EMÕ=uÆ»q«Ö~“$İrG(‰†ñşˆQ\në«š¨‚v+\nÆ1n–²8š^v#)X­¤:ü²ù9‘&©VÔÓ@†Dá\0œUÆÛê³?Xe[M¦3+{d)Úßy²¶ià%`ó\ZêÜæîšú¡ØvÓ9JUKè#<&=™¿³¬ïu‹*št¼Ï«½Qğş7\\¿S¿ä‰³âw†oÖçßN¥á‡]Ü>yYç\ZX\ZíËîLô‰-%V­^,ÂÚ;{ò¬×<Jœ²×„N­ş0‡åIíCl&¥şÉ=‹,¢˜5\0Ó)<ˆpgÑ_ÙCIÛ–nkl\'Çqİ«ûv½|uSyá £cÇ‹Öi¾•ME,”eQ\\ÖF¯Rë¢8HÈ=g<#¥ı¶k\'ëİ$+Lâ“Øv%¤›†ôÓKÿx\'[©¼)•UÇñ·¤ùÆşlHzTDíK]W=;¬Fy…}¹	ÎÉÛWv´‚8L\Z;íOêÃØŸ·µàç^@‘°Õvör\"IAÊA0¥<	˜6Ôª.İ»/;R-J\ZÑCx›õ0˜2 ¨èâÖÂê0äçE6ë4g¤´ Ax§µÉçD‰¾Jt;i8äEËÔïDˆù8l¶ƒiÎyÁZ¿Í\rCÌö²ªRm³ÛÈºË‹’¬RİëÏ’L\nÕ¢Â$«í®\rıôü!àÖ¥‡E¬ÃK1H\'¹¸²»‡‘L\r1Ä¾í4:f™iE§P8lÛ›Š2Ó5ûy	$\\2wçZ,­sRéÚ×\rÉ,ù?×s¥9½N9çıæ²“xy¯ñæéa\\ŸÛËåv±í‹ÌO«ƒÆèyæWJ)¸ñ1OSŸÑ’l)²ã´‰5ëqÌ•8–på‹3¢P¿“Lù)š~]¹±¨iYğ\'â˜u’aŞ©}­*1ë1uİ|ò9Ñâõ_­ŸÌÄ9ÑöµG¦H¦¹®|ÿ-w×>â¥c¸µ\nI+‚Ô·rq<İ(ªUCoËÛ\\­	†¹¼\Zo¥.v	¡ºõÙÒ·¿_àgä%}ûŠj,±ÒØeù2‘îd¿£T¬E›2‡é[ó!o)FµH¥œbªRìz™òsŞ‚OÁ5Ôo†Äâ\'áry½-öñ=œPÕ_ÓİÌßîMÖbã­äHw~¸–ãf­p3ÚwacÛˆ(™Bùk3î/|a¸Yƒï\0e\röÖ	PÌ9ûé^\\š‡X²ZŞO/5¿¦¾–ÿ«=Fø’ù6«÷Ş%ÍŸã{ç3—ÚüºÒ)Ì§‡\nªéıõ·‡Î*¨Y»XÆX’áŞó2k=qyºbÎ`CLp÷3£CõSaoÆ2\riJ„º.Ğ¨‚¼Ş¤\Z9ÔÒàà”°.æPşj8èt,1Ÿ#Íğ^³­ÓEî˜‘\'ó[M6•òÚLö‚3´Lw‚5ûaª\\´X‚º‡A}=åõØÕw9ÛaD*Øüf©.½bcÏ;—øè¸Âh«¼Wğé”Ê’ØZ o:Ì\ZÀ—vRö[§¦ìjó÷êAEÃÊËQ±»*\"ÉÉ¤ûZCR<a¯Ì½ê@x \" &»êñ†iªu×ïDEG‹ãÁM*÷EÏbÄı—R&‘ï\r¸-Q‰Tßw?å<£ıtK]ä\'ÓñáˆS‹ä`ŒäÃ½ìÏšĞ^	ì[i˜¨ÂjåL>€—S‘†ª}5#çmÙí(±Tøüÿ5	Êö\r¶ß‚Õ@\r˜“7ßÙl—¤,¬[BÌ¶\'DÓÏËHŠ&CS²qsŒ›×Ì\'Õ[Ã„Ï,œZğ¨£Ãƒ´Ìå\'ßc€ÌÓñeu“%,r¢’-°Aïk8TF?¿!¿i»H;nç)8Æ$ùê8²<¸ş-´xv*»ŒuŞŞçY¢»ÊìKè¢vêî£j?2% ·®‚W6X\\·œÉÛŒ>çVş)‰ùì)¾™ßF‹$š?¼zÙNå÷î†`ÖÅ‹h¿1á\Z©j¡p$£m1½s¤ˆsz8zhÆë0Û¶[‹Š(\0+8j\"ñ› „™(»Ü’İÏø÷,Õ¾æÂít8sıåKá•kù¨±Ùfç—/!ğ>9\r@_@9b-üöÉœÜÃPØ<ù‘*”KŠ^‘%b\0ëÄc—Ê^Á€¦)APí,ç§Ş†@¤ÈYÒ1&)&PØl(@ÿ_0¿¸À}ÁŞ/˜µ8¦Ê\Zè<#ÒÈl«™8L˜Û Šø˜Sg¢Üa+³†®Fˆ{WjµŠ*_H;ıÂ¥-Í;§UæÂ•	ØàUyj$èÜä8§Yş~±‰êãàå”\r;Îg.ß:myÜFÊ(Hö,¬hÁS\"-õœ`ä$}\"dfAj:J8îö–•  ÌZç³ôÔ@mæÖ?“P_ÏtøçXVÁl›Ò…Ş€Ó¢‚a¨ÄWBòĞ’ŞK&RÃÅq5uÒŞxBá û;j™Ûº?šô¹hå!¦7	UPD®v†Uµšù{­¡k³rí‡ëË¢ç‰–q<½=Sp®Øíä¥nŞ\"˜Â×^:øyïùD$mø‘»í/¦w\"ÿ(¬î¶EPx\Z5‹ò®!Øs×hÿ*â3Š\rºdáJÃœrmwåh!Eº	@ùå‹§¦l3¼;E€ˆ8–Ş\\¡É†3”)Ã`¸EÉ…v;Pf{N=Á½n£á‹Nd“U3mÂQÁŞAB³Õ3bçšRà5!¹×q,7²Ğ_/Ó±ªéˆ00hŸ³;ätzñ=Î©¿™YlÒÅ½¦$‹7e$±Rô¶Ük¿¬¨O‚zG®Ü—õ8ƒ¾8Æ…ŞÈ<¼X¬FäY¯ şP†üã«§À<É@<A[#†RÁ˜/Yz(KJÈYşø÷5ª­ÆzÍš–iÀÂHÃ\'£Rø=Ü|N,›¤ê.èZÍİ1\\Nˆ#IQg»2¼G«æ%ûÏgUA¤\"‚5Ûc6çŸYk¯‰ÊÚĞUl™o«ó/Z<8ğA¨š«>\r-ì\'21˜m^¾øÆ_!óé%ºÇòõ²}\r@m€sj“¨C%WQÍôË¬Š\\ •O}ªv^`.°üÊ¡ÖÈ€^B&€{¡fÈ‡~„\r0ÂÅLÃ|¤’ô%BWCİ•Ş%£@Û§ó›ü\r]Œ`\r£K\nW“·=,}lq¡[FâàÌACƒœ={Úrœ&wÔyáh\"‹ûà\nİïƒ\0ºüe4ñ¹@‚Wÿß|xyrÿ\r%•\0fÊ Pzzsd=PÙ~Òÿr:—;¡2¤´×¥åÇ\n¯n¤ğlx$¡Q¤/,‹i€RV{õ„—ìé£øÂÎš7!ùrbø_\"‚S··×êÂè®7%T˜–í^RK›â°ò?3¨Øƒ|ÎA´I§TOj$½Çştô+4mıÇ\r>ôUe_õ3ÁŠIñ¹é¸Hÿ²ÍäòYÛX`ŸöD¡-\\xü^Pœ]%7ÇÎE!k«¯éR¼¬bŠdE†ªĞÖí Øv ª>ÈQe0‰5QMu‚?ï»	ÔŒÜ³Å|9\Z0W†\nuâ%öw•L2£s\r»Ì×±­¸š\"Ğ¨&¹5NÈæ#¤Øæîâ’¼ÿä–EÛ\'€àvµgVÆ*1t0f6ûmN`QÒ”çŞp_ş4)è¯eLM;deşLÆúK_bßGCO¯ğGF•&0üb”sÏ?WXŞVÂ¹ìÒ3‰g–LN­TÏ2ÌÒ_Úë¶SæópşëÛçl£˜\ZVt‡n_Àd›ŒT\"3ŞàgFİ U½\"ŸAnœì¡Cg{—X>4`É\Z¢plOñ³†#§)–ZÅ]àC¾ » <µú‹»Ñ31TÎØr?%+Ã#”hjWLœjP—Õ³ˆ{»aö¡Aö=<*Œ­Z@n\0}5HÇñ­¤…€1¬|$Ç÷+€WK«ù\\8QUk!=w>_›•eË§›ÀÉ¥˜>÷àìDû\0¡²_+Á!ÏRµŒsìOÌ<a¤JŠ¼\0\"œô&®’û@áóâ‚Í›4¸Vµãû¾Àğá\"[=d§ïı•$Ï£ÁÈYNRæ¶Ü\\à%:_@ÆsrÂ:˜Y½¨V@Å¬;øCæ®é×]ª?twX  &ã_,zƒPKôjYÏ¢f£[§®‡ë°•@%”öy“¦óŒì4ş…	ù<ÄRºw—&Àşğ†‡]Q)¼d¡‰ºñ9QO<0Ì¸“˜«ÊVJ“\n+öbk2#ãìúaâmã2l9=ùš-{Šìj\0a.ëj‘7Psls,Â3µKTÿw»\0/¼EõĞ\0½`qëîŒø¿0œÓÚ-íé.FV\\Ò€‹]Ô[Ë–±°óåé$¹˜·!–ĞVNõölôJ?­qI#MÈ»àü‡3]§DÂ¥4ºã]qpY*ß¯œNÔëdìåŞ¢MkYÓ«P`rí\\d˜ $¡\"ººËåû$mÆ·/,ş­1Ÿ8t?¿Ÿ÷\"÷˜Gº–ÈÑÿ<CØñ¦¼8¿Ët^³M@2-‹Tn{ægÅ”wwê6‘z…èF9-ıX†ZèÍ·ë.[ZXÚÀ»5ó´\ZÁŸÿhı™Z§tLLA˜\0Ä7^0¤éï2×ß“Ù¼½×W}fÎ¨õ»¤‚IvıïèŠ¦À	½~Õà…FPİqšçİij°nß7Í>ş\'¹]¨¶1×†Âr½rZ´–\0Æ•¡¶\"4»¯>rÈ¹î¦q}ÅÏwA\n€O£¹UÆtHêë¾14³w\'ç{ZõÁ¿Pø¿i–˜~òÔ³|iÚbĞîİ€Ä!ÒK-wº],İŞR$¬ªî°rt\\\\ñòôû•‚c\nendstream\nendobj\n22 0 obj <<\n/Type /FontDescriptor\n/FontName /DARTBM+CMR10\n/Flags 4\n/FontBBox [-40 -250 1009 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 69\n/XHeight 431\n/CharSet (/A/B/D/E/G/H/I/L/P/S/T/W/a/b/c/colon/comma/d/e/eight/equal/f/ff/fi/four/g/h/i/k/l/m/n/nine/o/one/p/parenleft/parenright/period/q/question/r/s/t/three/two/u/v/w/x/y)\n/FontFile 21 0 R\n>> endobj\n23 0 obj <<\n/Length1 1395\n/Length2 6090\n/Length3 0\n/Length 7032      \n/Filter /FlateDecode\n>>\nstream\nxÚVTì»§$F‡42	¥·‘‚t·¤„Ôlƒ1r4J	’\n’ÒŠ(ÒÒ  RJJ()ÒÜéW÷ûß{Î½gçlïÓÏï}~Ï{ÆÕÈTTÅ	í×D£°¢1°PÍÀDKˆÁâ\0~~3Öş‡ÀñF QrÿÍ®†C±x:‹w3@£€º>@ˆ\"-‘‘ƒâ`°ì_hŒPê‹p\ZˆuÑ(¸7€_\rí€A¸¸bñUş:`‚@ˆ¬¬ŒÈïp \nAÀ ( ë\nGâ+Â @S4Çü+…€¼+ë)ùùù‰A‘ŞbhŒ‹¢ ĞušÀ½á_¸ğ\\ !	ÿ\rLÀ4sExÿ¡6E;cı 8¯ğ@Àà(o|€Ê	âkMuô·<á¨?œõÿpşy5@ˆäïtFÿJ„@ı†Â`h¤\'€@¹\0pà-M}1¬?VE9ır„zx£ññP_(Âêˆwøİ8¨©b„âñı‰Î†Axb½Å¼¿‚~¥Á_²ÊI\rDÂQXoÀ¯şÔ8ë ßcuG¡ıP¸?ÎÎ”“ó/N> sÂË®£ş§^øGçÇ¥À`°Œ,÷Âıa® _ÉÍ<á¿_j|ÿÁ8O´\'ĞŒp†ã\08o¨/ˆÅøÀƒqÿİğo	\0\00,Ğî‚@şÉWÃÿñ“Ç üwÀxâA€à_Ÿ¿O¶xn9¡Qÿ¸ÿ.HÓJKÃÈ\\ø7à¿Mªªh NT\\(*.B ââ@ü!øßYşÆÿößZ#(âÏŞÀÿdÔA9£²@Àßİ_0|ÿä„ÀŸë\"üwC4Çp À?´·Kaø/Èÿ›ü¿Cş7ÎÿÊòĞş?ûÑôñğømøeşV(áğ§Ïb,~#Ğø½@ı§«ü%6€;!|ÿiÕÁBñ›¡‚rñøûŞš¸“sıƒ@Í\0ŸŞ‚¡½¿ (ş~×`îø§Ä?©ß&8~•ş]RC;ıÚ9q)i ƒ\0ğƒÇKR@¿œNpÿß¼‚ÄPh,>ˆ‡tFc\0¿æ))á«_Êß2¾ë‡ş-ÿ«ÌƒÁ/ßo\"à»øKş½ép¸?˜š@ÃnŞu{u÷Ía•\n‡Ÿèò Â(ÿ²E¦ (n\nÓìsLC–&ø\";bs ’Ö×A÷iIC`_yšû·Şğš,º1Å¸é$èÔ>Ùdd¹	09ÌüvèéºJu7§¨™òJĞ™WĞípwâÂV]ş</Ÿ4FŒ‡~]ZşÕİå3ï£&–W^HëQ–M0·	/ãÏw|2ÎÊCŠå\"bØñ§Û?eÈºàÖMo$Há¬çÅÆ??3÷ncãc³få\"Şgx?r\r§º–®ËòWZ4[8fãS+ñ©ÀV+db‘BF>\0‘|ã¥R/ñÕ—…Ÿ­”õı(­˜Êéô§+g\"¡•DR+«§àıÜŞPº-ÜW9Cí+ÖÓ§2j‡¯]^”\rÓå½Ê® °=•{sÚ—[qš[k-½òjˆšÛ˜Z“ÆàuH·3y…C(q_ ‡ç*¢¬= &Å¨HÕ]xJá”\"¢kWQsƒDdgÈ6Â®\0¸ÊÂÂşAˆƒb·F8Æİµl”Èí–ßZó\'¯\r\"Š÷k\")+öJaŞŸ÷ÅÀ®ğ¤ ”ŠÇ-bRsRÒÇïs3¶±rS$¸w¦¯Ä¥9l&X?¯Kíí=0e ¦L\ZPJ«!\r…‘}I]¶èvA·$o%Ÿ³¿«|åØ¸á\n÷>l©2¦Eßík”ÔÌO>bô­wğ8ÌˆêöÖr)ódR›\'Â=¹ŞÁm{|ç‹C[VM»F…¹ š|ë[Å¥›ª¡óıö™¶úH£>³øIÒÆâP{¾í¯tÏ©û|Ô˜¢&%É2TÙ¬M|$©ÖrJı;æ‹æFäÏsã!“ó-ÜÓdXFu²\Zù9N×‚GC“×g–Í]–…\\æÓá¼ğšh¤Ã[-jÀ2´vÛß}¦Ã¿{CyöÍØL6£õœ®´kØöóÅiW•éª¹Á÷¤rt­¼IhÇ	ßÆY&0¼ÅæŒ{6“°#¿›œÒ·vifôB5×Í^àL 0wXë‰ûöYëñu\\\'äc›²Ó zH€%¦%M½ò–uR©FŸØPÒ\'…õ~»Òføí¶zÁúö\'ß>t÷|˜ÛÙDn7²97²‘]bà4I³:ÌÆÖ™é#÷@„_Œõ¾ãŒ Ô›4àB¾ä(zY”½s:I!l÷µ~ÂW¥ú\r\0­Ñ®åÏ]îË¹±iY§ã¯BÔ÷ÃâuîS²ŞãqEÿiµòÖu©’ÈÔ½í«~ù£v_S¨˜&»Š&}Sˆ÷F$ED#àßßŒ6’+Lb—62”Õ«½à^íéôO*8É«EóóJÉı56·€|ûŸ2˜“\n„$Ğo*3#¬Æ„Á8aC±ã³š°nÅ¡˜˜ë\nyáu=:º\'œ\0gÛ÷Ñj<Ş¨ˆª<ñNâXAãtÚ­rHrÌÚğ8€àÅ¾^ˆ_x£Ò9áóÓµ-Şô×yQ$²åì7÷\0¯IT.	>6\n ¡”‰	şdWƒôáĞÜÊì?ËO}Vå‚”î •¿m§çAÌ=xûAÀÏÊ§<\ZE7hµèóWº¿tÕuµ¨Æ¸5Ó¬¾‰ë4ÍtH²±£e¿x|\"\\d›Ãí¶¼n¤æ–:­E¦ÈZñ±9”×~NËÜ¦¡Íı¸Î©½âòÑù”¶SX¡œ>`û\"»Üÿ>Û6Eâë9å#óàaôI¾r<Å;4ZŸmı{¥d_=®\rFx–@÷ÈNòCxŞµ§º)èímsFài¸³4û˜çANvûÁäbékm–¢ìÛ˜¥Ø—ƒi‡Š_*h¹%¯‘ku+aŠl‚¤³JiõêÂı:ŠY“?ufª\ncÆT“`«39y÷Ú}YóW_?“ã|ØôW:†U®Í¸ã¼$,ìT	Ê®?ù,pÆÈjUDĞëŠOXt™¬=0]P\"ğa8\"˜î¢:#ÚÈ°îæ®ªM‹y€HF½^\Z§0Õ\\?×“)¸‚«ñ~¡°†´‰Hkõ¡÷°Ór5ìå$U>YŸàÌHò¦ö\'i:–¾œ2Åù’ÄñØ :ü:ƒĞ7òÚëÄåÅİÒËJ_–×Q­*y\r¸ìœªGÜ\"M 1¸,ƒ˜\r±	¤¡$[£ûÜŠ\0cVƒ‡Øàˆ®œ¸5wfeÁFƒ ­\Z¸X#z=Gşhßóls\0»ğ™‚}½I«x Ä•œCí3^Ô™´µ—î¨?ªKßÂèĞg²jŒ6oöSÆÚ†\'8w¯ŞşV9R1ë&sjíkû±Ï#ŠãİİdY)á\r?¾8[åt¼•1sç» ı–öó7dc*–DÓ\ZëM©]%?Í]råİk¼JôÙ:«U+V&Ş	¹=m¤w¥™Ğ‰¿NÅw©EyZ)&òÊà/÷ô\0ª†8¨mœ¿.ûèÂ®d4Óèå.ï<vMMğõ·E¥JQm®\nñ`¶ÓëZãoÚÜØ–ò	ÙZ¾#Ç-¬¥&·÷JS˜Ç0<Êºm‰dËPÁ*›må\"g„ªÊow1j“Zä\rÏKìåy\"yšŠZÌdVk?¶°õŞ¹m™³&VŒm~¡ù®%3^Ğ`’WøšÕyº¦yxœÿroäa ÷ş=-ƒyã1…D£şmõ!‚/{úôf=Vo=u—¨Øbìa³ÆOä¶æÜR¾.•ÎÉ+ròbéÖúm¤äd-ÍG€nqD&Ys.¼¶ÛD^5ÙÛÖõ¥ÉKMaÛûQ££yjÄOÖ¶xrbÉ×_¹ñ\n÷,öôÚ<šÀ¥¤†¤­–§Ù7ÓŞ:,fŸñÓ€?ô$¿}òã$ø\"èTÇÖÚéÙj6¸¦İ²ât[—O¹2hûş•æ(–xJ¡o¥ì-Y~;ÌgtôTz¹´CWwÆiÀ•kë‡Ä^¾$bš•ö\\–*éùšÁ÷¥,Tìˆè‚ã-ÇFÅo¥y­””„zUEÆsğä\0ïctúBú>qó•(z¯Ínî’^WY)—5ö–J—­ÑÕátš\'‰ß\\Zx…V{ıy#’[E\\¡MõHi«ğM;I} İÅ¾O$¤öä§—˜F…~?”a&}¡dçø^2òó^0ö\'<§íœ˜•hlú¢N²~-EßÉz xO<ÊâG½ØºdIb¤ØV“ÿ€PÑ0W5s¿úTĞ¶µRõæ]™»‰ÂçTBÔêòFK~7Û£ØyÊ@İÆÃ´¼Ï¤ß*r}gRgÏU2²¿ØÆ£ó~èÅ¥%éÇ]‡•Çí×qìÏR|âœ‹Î»de2%Udj}?É”œHu3tpñ	„xyºà~šÃ FY];ˆ:tåÜy#6Ö}{â³¦p¿ŸãçÜŒ/‚&–´¼\\õÅG²EŞ’ß-cy^ñ:.Òúëãr`Qša†Ï	ÜÈ¯g½Ï3KÆ6p‰s|4›F…l‰mVDï¶ös¤•Ûw_aÜaKª?wx®y –nåœrZHñˆ¹„|•0U|vu cwÀ{öÆ\náÁ¥ÏQÔéiˆÌú©¯ê2\r}Ìê§MG•?x—_ìÏ´¡5NŒÀ£`Ï2Tùûû\Z6á]S•\'Â“\\2éïì)›Œ’FštÅR±\"ÔÑª³‚òòP|Äâ—owfµXpïm×0™ìøì<¶Ûh°}-#Îõ¼5zçÀ_†i¹ÎTƒ¹Iªª0íVÎäğ¶ù;9%ôs/ªj:Úów—¿/sçzÅ³°Í¼ÃÊï_v%\\ªéèX0ñ}!sŸVÃ‘ ¢{¥ÑZŠI}_±3ë(ƒìÑN÷D6Óa!ïå&WS•ê\rEñ®YÒHò[ãJ´<^³´#êßnEEïû¸ïKÚsÏôäğ–Q9¶Æƒ\r+È\"èšìÕ–ŸM©Ê/*T¸¬ëİ¢€¡ÍW7¯F¥8èö?ÿÈ&+İcRØ_\Z\0!s#+şîÊĞ¯şépì|4ÄVÁú|\"d Ü§)N÷¥›Ÿú+Dv§WÏÎBFÿ‚P æC«»öÚ\rLw(Ë†\Z(¹‡Ôü^Å×‘¥«ŒTÍw£ ..Àºß/Õú¤SÔ,ŞvB›5ØWhğE•DGô­ÕÖÃ¿ÑÌÓ\r>Hb,áõ9‡®}\'[’/ C’vs^\\	½/jıºBólï0ÍV¦6c	µvï,m¥•FN:ö`r…×á9	ÚÀ¡^gşËC-µ86X÷¼N‚I‡€3=ák*­ÒbÚWEa2+=25k¦{üå©ŞL‚†~Îúï\\hßbQ7ùèzWÿ„(6>z†~±¬L	 )òí@y¦.éqO§‡è\"¿?\rcÅ¼Ïê[}¢6³Œ¼ôhŞ€`y„­÷<ÖQa}8’È\\_\nKÈ…V0FV^µu\\ŒÎ—s\'%ÌáÅ9ÆÒnÉ|è¶b¯ÖP\'cC—­ôEx5¾ûFöOœÕßP\n£U–ÿJT*Ûî¼ûx±£şl´Õj+ƒ¥MfÜÎİóİÀ¡eÊRdªï\0MXü˜‚jÆĞ6ªôüÓ	)šéN§ãDÿhkï…Mï.æ¨›U\\2WhvM×d[Íç\ZÅH=·\nŞ2˜Ô|E÷äî×ÅQQôÖ¬À[ƒVféj¶+ˆ±ĞñÛo\'@=6»šâhcRh¯ÚD>.ô&áÂÓ2²»%Ñ›7ÊÕjŸûºÇŠ[iÏÓ¥&iñ­ëNuí¥dÜªQÔ§æÖœù!FÉ¯÷i³àâ£Å4-Íô×YëKTi>0Ncº‚“q“D¦â¤U³§œš§ÀÏŠÛ˜µÈƒ¬ôÍ¸ø›šÃW´&J¾_?ká’{Õ]VètyƒÙ2z¤ófßv ´Ğß´Ê\n!>môFò9z¦‡}ğ¬“7wÜóö%—ik®ïU_ïùDhÅòàEï°HI~aó»ˆ³âë7šú<Óú½ÓJ@á²]\n¤*g$²äc×\'Ô­Ad²Åç±¨k|îİÆYï‘„Õ”¨ÁÉ+ôLµĞñ«6›mÜÃ®-„\r{¦&âÏ—ÑÔ>Ö3-$¾j¯ìÎAfQèafQ	Üİ‹ô…²Z…îö	¿±áxïî“Ñt®˜\0HÛpÕìggù~AIß§Rî¤ÙÖvMÒø©Œ;›;-S€y‰qß¶Ãø›‘¸ô\rÖGëˆ±ŸS°ÙõVmw—…Ìï3\n şuj´#€ïš·}âÑZ5è¾ëŒÍgæm>ä5kWÃp²›dÕµ¼¯U´¤U•j¹»{@p»«L×Š‰O÷„cíË6†2h¦Tš	Ûµ‹Û·ÌBiwt]šÕ»i•ÀiOFš+	²uXhl¦$€lòaúø³‚i7¿%Àé1ú“©©Ê÷Ø…äÀô†Gÿªy)Ë×)\nêîW•ò¦ä”I|©›\\ã@¿éÄ2³EI©Œp>d®^€j\\¦êMôÏl+©©ì8Ö\\¦ğ·¼¿—^,\n•5Ö_Í¿ä5ÒtPO´!Î¹¼hı3ù•à³7<#ŠïDÓø}­¨àiºs­Â§@®Oˆø	æ±Ï–è\0EœBfi\rFMåí2Îqpw\'{Àeôpõª¬\\#pZŞñÕ`”òG@àTô\"‡0Ã+üœ‹À¡\'c3 MÉ”¤µ­(…égè—¥ÏXvÓTr9\rØ§$Y­·ƒ-µËø%«„\rf´‰±~›¬ÀáøöûãäÁGa?º¦ß@CTÏìüaÉ(œp).ÓqèG\Z¸³ôq%4ê#ä‹[ñ’\r3±k…ùˆE‘6aWÙƒTıã‰Ó„|WÁµPÃÁÁÒæ¥r=EJp\r¶Ø~‰ZÈáV	¹œÔÊXƒœÇKÁÉA‡ËÖ†Mæ=?×¯òÎQh¦U«JÏÑi4„¬ 9~RƒrHâùô Œ¨ ÙìÆ˜ÍqÙ§d»8¨QRã%=3=r„”Uü@éÔYÖ³y#IT:Î|°—Õ…è]¦Øª–SÁ\ZÍı0nvİÕËü’ò3Ã!¥£Œöâı›©5nåMN·:[¹¿Ä-›Î áe<Ís”C\nHÂrÙ”8Øç>Ç {ÑJsTËiµ\0+.cRå¶H\"Û¬ı×lFâ®E ë‚–ß}gZS¬\0}§Ä»SÂm)7QzÙs²õúáíŒñ•BL¢	ª0á—Äí»YÛ¬•nİÃïg´wX`mân½ŞÕjÓtö`ÛXnYWy´ë¼ç¬•RW£ã+“nXôpIj9K«’Üå1fr.ñÌsTŸ#øÈªSJùÀñ$ğ•	(ôÓieµ\0Ç–ŸDŒÍ×G6–9K*½­Y¡’Yïm_l¦¥øF-EN‹CZPæœİËuj–&“ÑltW[Í@&u¥œ²VXáÙZ/cÙ#½\"*ÓÂ¸|#Ì8æÚær{†Ö‚”mšù‰ß’EÁÕì7;ù,÷oÀTwë¯;ã¨ŠrQ¹ÆW^Y¾ÅP˜T?@å›4\'AfÉT©W¾>b±ÎÿøxµcU”v”\\£pßİmehıåÎóã£T‰ÛH<>äÙ’ãıû\Z•÷dÄğ¶k¦#­fÊVC‚Õ=Ÿg˜qšI[ó?Ö¦€ÑvcİÊw%r³§m.…RéªAàFÎ\"Y®;Yo$:ÇAó°¯’Så›Éz³§/ìªC)$·ùUÙ•ùÊ\rœj7øn¬{§Ü7zg+¶ºØ‘O1¼¶ëEO2ğI2s?‰/PzÛÊ·ºã­v-i‹)0‚MC)¬ô ¢Lºï‹â¢7nçZ]e™2µe =Õ—“W¼_ü´µ…Õùã}­C,n%(İ&—è– 6¤Ô¼7\Z-;LH–¸ÃCÅÓTƒA>ƒgÇd¬göã&ÇÎ%ô¹Ùe¬ºd?é©Îx³nBâ`¬wã%·ÍáÎÖtZ˜3Øu?ï%0L¾òâSş=ê€ÈÉ·\0Ù˜~›7FsGêQ\rvÏ{ ú³÷wmîñĞU©µh:nÿğ00&Lãnì_ÌßÑ™yAPu£ŞÙ—ªBtjpˆ:§èVø¨ªÙí‡$,Úe3V,ÂmºÁ¦€¹¾WHÏ]6‰¨Ò>«{gĞoªÏ¹$5B¦ÆVúªFöw\"´-HTºŒ]œW€;-œ!ô¥‰wüßÏ?\0‘x.’}ó”õŠYlşï&{–}†û=íºZ”ñúø\rËK.9Ò‰\\B\n—{>ï¸g˜ŒkrŞËÓ‹Qv6Ì›w¡Éãrpâé®‰d`-}†¡\\\\¦Ÿd÷Æ4JJ±Å›Švš3õÑ±Øû?&š¿px¯ÉK3·Üš„$x o>[j^ä\râF¿Ôë™)pw¨\n;~Y‡!®’;\\Šw_ò˜Ã%¦.HH‹F3zTŒ)±„ïLEÚ&Qv¿şq-.ò£a@GÌÔà‘Í­døËm$%:µšıËæ\Zïî‡“¼ÔĞã2O±;_¶Ì_òº…ğÒ*¬äˆm\'Æç¤ø?ÅòöoµCù¤a¬m…Ş¢™#gyß„ßß1‘áLÇÅ¹— e.¡õîSªP\\¿<\\s-3´4›¥ZÁÁÚuĞ:°>÷ÇøŞôcr¾¾a‰‡¬6ÚS²¡‹ó+»¤å/l5zîXˆ8@\rˆ˜™¯_ŒÃ¥|6İÓY$\"ÕAL´*yØóo™¦RZîv}\Zæ\rn-Q`»Û~¸—¼mÔ“øÖÒ—ÄÂTÈ*!4¼Ä_iã”A.É^¨Êœ	ŸûÚ°À[oÂŞj}I\\T½éÄ®½éËŞÊ¾éĞUğ¢dŠşB£­¨˜Ç‘­”Çv½/å{ò‘\"’³GöÚ\rÆÖ\'Ï§}ƒynÌxF˜­eb| ^‚Äòk)W¦Şhu([å/&\\©Ş›\"–âùòƒhvà¼î£ËıØİçşÌõpÁ6–¢&³œ®U×pûEíÜ¹!¥º¡„¡ò‡šòŸ~|lÿ“áÖ”m3ÃBw¢X¾¼‚„0RT®Ñ·\'v¹Y1xõ»ä·‹®F@ˆÜí·LRb‘íŞºPø·,Ò±¿h CDF&||×Cg;ÿ_ #‡a\nendstream\nendobj\n24 0 obj <<\n/Type /FontDescriptor\n/FontName /FYGEPU+CMR7\n/Flags 4\n/FontBBox [-27 -250 1122 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 79\n/XHeight 431\n/CharSet (/one/two)\n/FontFile 23 0 R\n>> endobj\n25 0 obj <<\n/Length1 1449\n/Length2 6397\n/Length3 0\n/Length 7380      \n/Filter /FlateDecode\n>>\nstream\nxÚxTÓ}Û?]’Òé@:HIwwƒä0²Ñ ÒİÒ! !’Ò% %-¨(ïôö~ç~şÿsŞ÷ìœíwõõ¹¾Ÿë»±1ëòÉ;ÀíÁ*p’Oø ¨mh.\0Âü@ ›	ÿ­\'`3{  pØÃÿğPô\0Û!Q:%;$ÊQhxB‚Â\0AÑ‡‚b@€(ñ·#Üã!@ÉÎâ\0ĞæhÀa`›\"Üİ×âäŒDÕùûÀ	âJHˆñşÈ»=  ;@ÛévCUÙA†pŒôıG\nN)g$Òı¡€€··7¿‚îá$ÃÅğ† `ØÃì\0ø cçşŸ€\r`äAüe0„;\"½í<À\0”\naTˆ\'Ìì@UªktİÁ°¿œµşràü@_ğ_éşDÿJı¶ànîv0_Ì	à‚º*ZüH$/ÀæğËÑŠ€£âí¼ì P;{”ÃïÖí\0*òú\0;Â?ø ˆ;Á€@aø•5fe˜ƒ\"ÜÍ\rC\"~õ§ñ\0ƒPs÷øs¸®0¸7ÌÿoÉspüÃÁÓ]Àyì	VWúãƒRü[çFD€¢¢\"‚\0ğc\0Øä,ğ«€‘¯;ø·ñ·\Z…!ĞßîpDÁ\0BÁ¨„€ôğúÿ§áŸ  ÀBìÁNÁ¿³£Ô`Ç¿dÔù{@|\0–@ıÀ_¯=Y¡æ\0‡A}ÿíşûˆ”ÌUÍ-,xş@ş—QAîğç’\0ğIˆ‚‚‚¢\011@à?óük£ÿ­Õ³ƒüéî?2ªÃá\0‰¿@ ¦÷7¯?Ìàü³6\\€VĞ£øpş›ş€\"@êMğÿ¼¿CşÜÿ•å¥ÿw¤â	…ş¶sşåğÿØíÜ Pß?(>{\"Q»¡\rGmì¿]MÁ-´6ØâéößVu¤jGäaN(ó	>à>øKA¨@|Àz$Èù/.ı}¨\ZP¬G@~İ;¨( ğ¿l¨Õ¹¢îêÈ~›À¨Íúg]eîğk…DDvv¾( $€¿ jWÀ>¿)à‡Á‘¨\0\nc ÀîAğë`EE\0ò¿T¿¥\0¨po{¨=5è¿\r\"(ìôû‚D@íYşÑ	ÈÓÃµ¬¿)ƒjóoù÷Í\0û€AKópd¸ËËğÎëzyzo¾qœõî˜$óh$ûÂ3g-ÜÕ™Ç\n¶µ4£™z‹•‘ÓóôÜŸ®\'|½ÉYËP+D¢)l)œò\r=ãfr€Ó9MŠeÆl‘$ë3’ØZbYr¤šÎßDˆõ\nï¾øXò£±k!qp”]’2gĞ#ãåº1š3³n GÌ‘&Üõ°Ìò4R7üñ’p¥ĞGûÕwË2!{äıû·yƒ™ÂgÅš}u¢µ‘ä´~\ZÌ£)C´”Éy\Z¯hì\n\"—Š•éI,´¥n‘ìk˜¶bkßg‹;’‡„=›tCîè>kñl„‹ÌKô®1Ølç\Z} ¢iM‰qæ­ÏdU`«s@»É:©†öaQ1p\Z»WnµgáåWæZË-q¸OÂ„­?NÑ\\ÛÆç$\nY¥KCÅ‡><WÕƒ2¹:š.ßH¥ÈéØÈõÔ1u˜]6<Gïóòy>\0©6»—\n»Øk}Û9Òu\ngıÄH9’dÖ•sØüJ]äò™	·²(²AsŞcÃ•X8dPX€¥×Ñ­*i!\'±8Å’h\"LRdD¶`¤µ‹–¥ƒoş0B>x–”˜ÜõS%ã‹å\ZÑ±gÒ¡­ÒéâÁÀ\'+S§èJúG‰¤\r[wô{¿b[\'Ù{œ\náYkv[8Û–ëph $AZ“nöÌgBNÅæ×\n~\ZÙW<yTèÿ=áËîEóI¡™|c´4&­g&hËæùc—Å`CÖë©£¾.ô]µæo—X§äö#ª‡XÂK¡Õ-‰\"íŠï)cŒ-í´:/Zñ<zÇ[.¾\nZ^I>Øq·ŞkÖ9qÿ^õXA	p—„c1BBx«V;˜]Â‹0Ú$H‰è‹ø]\"»©æP¡y?š³cÁ6TVs™ªøĞ’õik,Yã7U÷ÓË>†÷äí\r\ZC~ +ÌÒPñï^zÂ«ÌtEßúÊÃ{\Z>=9Üµ2}L¯ªİ†mş`½ü<²•¬Ø<qn¬ØLOùTë‡Ğ–PÛÚ¶J¸Zº? µÏ-ÅğGO§\'m@œèúò›©Î=Fƒå´³²ãì¶ÄYŒ‹ïìi[YĞ{*·T‚´È0œ_0©Ø.«ä‰‚)^[ÊJWz9ñÂ¼çàa<“4yÚ‡Ç÷\Z¯ ² îµh–OµÖA5­ªÜ\"·IßAÊÃ5«t‡g˜ÕïÄ½œ}ù}—æ‹ÙOä¬©dvÏØç¬!O9ÎûUHî±ròÙ;ÆÏòü¶¾|Ñ´ŞQ©€b¦wŸ‹û`ÕĞã–Ì SÔLå+zk7%™—MÖ¦~)¶P„™À3W¼ÚRd{ÓîI¦å5H®Êğ†n•Ww?b©şÚ’C=mpŒíe ˜¾XŠ•§¯äL@K<+gÃ[0D5šGÒåz—*ŞŞº+¯~­gQÕ˜í½”C^æ >¬æçÊ	ºóùÄ;rd8b¬§Şèè¯9Q9 ‹ ü4n^×Yt,päõ&qÒ²¨íû\"S«›n‘Üa¶ZXdê]©5=ç£+A^És¼ƒ¬M,ÎÆåÚ²‡²©îÜóáb^ÄÔÒ+z‚ˆÀ-U’T¹ëSáô£FqÇöH\0¯~YTX›.WxQ\rPlöãq~¸*aÉ·¿çäççûşQSÖdJÎ«RÛÅşÙÙ›\né£óß^. „9Ï}×6ëm†^Ì¾³1‰§6ÀèÄs„Ñ~D×Œ¾yàª+M}ü³ZnŞR±\nå}¯W~ºFıÑã]67±ŞcLËefœ£«o¯&÷fÁ;B­X_±ÇíœŸY‘‰CÓ·_!ÚØÃÃß$mnZså0íôÛclÔ|ZšjÜ \né2d)’LÜK¿ñ´F3Œ!9ËU&[)ö‚­dmáÕf\'6Lv²DL_U’[	àŒóúGOËÎfğ<eÈ£ÿ¨ÙM¸Ã†W¶šf?ÌùWéT†¢8³!¾VíŸ\0ĞÚ6tJ¨B·wjL–·\'†Âzì*s¬.ödçx	1Ïì‘EĞÔ,gRÑä[İh¯^›rƒı±F‰$C€5¦Ş1³¾ûş›$ú«6Ñ«Î7’¥{=ƒÛ^‹L®„¾d	TÍj)¾î’tJÃ[€TÚcÁ¼©‡§áV5ïsíıTeYØBÀïK½™÷\Z2ÆEãGK\rôöX?¾j{xÛõk¸+Aùşâ^©GMßN=_[á[!4ú\0Ûç„À¨¥ú¸ÅUjB·Ñˆ:‹ºşb-bñÉ×Kñ ÑóæI8ÅFMl®–Zé»vÍÕ‹ó–®¬/¸xV@æ¾éã¥…¹èä6Úcq?lùä\ZqwMp~Ğs\\äM6L]V\"\r+†KHdß7˜Qb‘s†™‡Eô_¹ê˜6›¿>VY”ÚSlÌØwm\\éÃ]78æ\\›´Zd#bÈßü8rï@‹› Ù‡¸…ÁgßU> Õßi§¬\r/òÍ\'HM\\öºw÷„çIRI!Sšr3(áİË%ÌíÁÃÚKFªCäbæ\Z8\'rIO±ißKçÓ.‹ªh aÙÑ\'ÜÂ«fÁ\"yê¤×qi<»õœÛm&sŸ×cU+j b¡šô¦~k…6ÇÒßUYü9ªŒFšiÊ8{húÒ\"OhıV[–üf´ú,ÂÚb”Ğ™ğ‘|İ\0*»·ÄÒY~k=—ÚˆªÁ‹n|»A»Ø*¿Öö¦	ín˜PûQd‰fâƒ˜Ğ.fŒĞ‹ánzW&–9–u£y».GÑ0]«	r‰áU$BXâ§úNBYŒ‹?CšªûLd!=wïÆøïŠô”Ê8Üºø\ZåÄ‡ô5›¸\r}ÌÜ }\\>æ¤8B›||²øº=]Â»cÇ(Zq-H ù¤=y +»ÎÈ}œ)7è19§ş´îRg|¬yIîãRÔÎÏ‹3~Íc/X?ÿò3aŸz.TIëDßS8äªE¿è<ëâš2ïZÇó	\n\\ÇŠ…Äq+‹ÜÏtˆú\\OÈğ·R¬’aı‰©‚ïçÄ<ÍıŞ6‹íûOç{Èñxéx-üL<q@Ó[ßé}¼{· 59q(ÿ|ltşDïa¡–IÌ“‹··7×nDP»	\"+6Š#~–2Û¤J›ú¯ AtÛî¯/˜Fpq)\"¾üfa‰˜3ã/¸>d(6*:F+»tÔ,,v­®‹uyT]ŒGúQW©¾`Ü¸÷8æUâ¡]¥©ş>›_ø,ÆË¶E³ºâ^a¤º/°¿û9?Öìı˜ËÔû%ŒaJ÷•ß…¦¸»×©pWW|iXËò:ñĞu˜€‰Áî”Í`:J„q×Ñ™=üÒ½+3Ô™ó{|M‹Ñc<²O\"…İ.ÅE’‡ÑŸ²…Ï5µ,ŸâÔW¯É}b¦Ù‹±bÒÂá·dq>&Ï¸Ì…ût9y§qÎ¨3¬/;iEkbXãğälßZ	RñÃ²ìô!B*µU¨—ù3ÅšqÔ·€\\´Œû8_ELÂ§cë…^İÌHßÆå ~ÏôŠèèõáì!r$>—3%nï¤r0ò8¹ËóÖó¾‘p©!SËı2G˜r’Q×œ¹È@\ZÄ¿/ RAO?Ü6\n,Î@\Zäm´Çbğ³0xƒ	éh{ˆõ‚Ÿ·çİÜÏ>iDÁ›äê63BnmNäg‚„Ë7õ)÷{˜L.°J(·S%¹H<µ’Tïåû{c×Ùˆ_•ª|ršíi|¯½·{$_Q}w£ëñËÉÓQ’{ë¯×¦4ãÆ2E•$M}|¡çHó¿æœwŞp Pôb«›á™GI¹eòû7^¶;›¾ÇS_ôù\\©²ŞÒ‡—LòµMÜK{UA½:Ù­2ªoÈI•¦©}ãÈL~{´«ŠG`×§?Æ@¼Sniéi¨µK®O‡]İ-³àıs3æ·néàÏ#rP*bÓ[–Eµ½ë|ñw®ÔsÉØR¾×y:Dvi¸¥]üeƒ\'H¦Òşh¨ĞKÒVWyu«(.jík’ Ãâ·æK°fºĞxœìÄ9ö\nnëÆ¡d\ZÉ&Í\rû«á\0©õ‰’Ì«n¦iºãú»·KU<i âÚà©¢\'¾nG©lãı	wf›nŒrıÎå/Ûe:¹ªM\'ØY2Äã¯]¬šîÂÎ…Íd4Šüd—”ƒ¥u®#Ğ»ìaDŒñş©íÍ9eX–Ä¹÷v»Vø\n_Ã7c¯ÑVÁç1j[½D‰JŞ›m×V%Á„]ôI”‡Ïü•S(GJûz‡,Ñnd“ñ³Ršlì:Ó!ó.ı\\Y]]Y­ÖQb‚[‹¾Õ‘v(b™fÈÎ¿Ìt¿Õ¯{–ªÿ1;Ë~£‚RÀı½ùüƒQêãn•iq,›Ÿsòd)=°Crıw¸·Ånš	şì~’Rs=8!ng[–±±Iª¦Ã¼çŸ9¸©~<66B‡!¥èçâ\\Ïğd+…Üh¹\nF\'/ÚêÓ76‹¯}ïsnÕÙ²-ûWÑ“–3wê3å	\0Ùë>m»\nÕ<5sOO”×O,‘ÓËNºšñúÏY¿±¾”¦ ûº\'{à \'â\"µ®¢Ë >˜c˜CcãÖTcè£ËŞ/-Ttx¾‘…=ìáŞE[/Háò£P…Œ´\'\Z`D¦«r\\m*>ÊhwçÂªåºÄù™gs/‡¬˜«a³í[niómív‚æÆp¢Çƒ^ì-u#WŠë;Â:h-ZˆFo#=Oÿd*Dgûdıµ^ÁS¾üÚÊ\"ã§™\r*_Œ¯õX:4\'\"#yª;gÌ»Ábä²ÀjÎôK<ˆ=}V“¤“+®Ä›»œæê|IqPÛ_>IÚÎQî~”ŸÂS{ØôâÙ†¹\Z£½`jóf‡Ú«wØµùt-1/Á3V•ŠwjJKg&t²îg¸¾Ó™mzkl*Ò¡½Cƒ\nQ8—K—Eªš‹zÎOtš,[±ÔGl¢ƒñN¨üÖfñwñ¥f3ÒânBĞm ¾••ç58:l¼gµ\r4ÀÇ!	Å]zTL¶©#äêXlw÷ÔÎ\"=h:óÚ8è¹Ò\\1õÏÓ]–]HŒ¯Ô>³úúĞ”V’‚Ìë^Ri¶Ù¦$v¸Â½ü˜r3òD~½\ruIÙBf£’h\0ÿWª#ÌKc«ía)ÒÓf±?ïüHizì¬”ñ•®‹äŞ\n±WÄì~bMÔ… —÷h(‚r´\\”¥ßœ£?º¸Z,fĞ\nÁ8+ÒKeC\"I0.=Uı$5,ŸOÇ3I¾òäbÙo”ü¶j˜ÑëÕ5zzóEñI£lFX‡@Š\n‹¨1=Pfã‚gUS6HË22[=-}ò±¿væ×°ÚX¨bó¾Õ}Ïø´ y8\Z$BvZl²9ZÙÈSCVúª¦öõ\r£Xl£1\"4çÅ|å ïîÎH*®Qaœ¢Èª‡Ó¦1N?©ÈkbTf{@}bsO,Ş“ô÷ªUÛ‹â™DEu8Ú^;ëœ.ÔÈò°­u\0ÑçÉbØçã\\«	«}Œ1SšİÅdºh7bş¸ç	µ§ø–İÔSYp)—ûñ~r„îöw\nÖ’/¿–¼Gr\ZñH;(4ÏùpœØ {¹En‘ı€I3Ú)\n«r`¯¤·r—„\\..Ï¨&\r0ÇawÉÂ6¨`«¯ø¡øíÖ™§Rd^jqà9{ğ~q	şóå»öt^\n  åYÂa‘²hv¨Ä…Y›ÌÌé_]e÷¡l/2m1	ÇĞXw4Hì\"¤èfYú¡ZWL&ÄÕô›kiqeÆ¨YGØËOŒeTy$”½RÆå/tVÄµà.+ˆbaÒ(ÂìûôtŸ3¦‘fé”<Êb\r§:Û8xÙqâşVgqnmùQ´w?“t,$P–:ĞyÑ>5ÇˆÄ1Ï¸üyÏîN~±ŸÍœ­Ü¯—/¦\"§™ìwÑ#‘Ø<«eÉ}ã”ª›71°¤÷)áBRÁZ?Q·2Uøk·ÂáÆ0OX&ë«uõAâƒÛB]ğOÛw÷²X_¯Û†òIPêô—îh7‚ƒdß\rÌÔ7£3‘9ocZÅ–ÙŸöàÿØï8¨¶9’š¾ÏäÁ\"=B2ôVÕ[Næ5DÓjı¬Ô•+aÓNV]Û\'B–5/zá„EÎ=¢k°ßšî;Ó6Q¡ŠÜNğ¸ªï™JÈ8fV¾N]÷·\\#£ZªoÛ‹\\ª\"ËúXÊ›>^|Jš\'(\Z¶¤œÕŠu.ÄH0¿KÙÈµs¥\\ÿ™zŸ-W-å\ZoÏDÀ¢ás\\ªV ¥¢I¶µµˆ=~ì\\~§ÍBtŠ&ÍwmÚÙÏÔân\"1æ„\rÇ«ú«éŠíUoüF;hÕÃÖk]‘u½ípï>›©e`,³æšpÌÔ(‹õÎôW§Ç?%€\rÊƒœ’î,Ò?GAü¹®ªˆã9ÅÑÃ­X|İ¯Ÿmïà•»§dù·®W¨‹R+fhşPÄğ®Ïw£À­^1|ÇúBÿ;Ó´¢ÖEñyr+•O–7ş‡î2Æ•Öµ\\lv¢\',áÛÊ©2ã‘-’¶X$„^ßÙ®ï-×Yƒæq¬NBÁ±,ª™Æt.ñëÕ8á¾±§H/Ÿ¹‡úÉT¾6/XR«Ûóì¾Ñ´Z„Öù|àõ>Û5{©HÚ£¤É¤‹Kû&Ê1—ÓIÎÛÊ±Ì${´×ò èÉaœ Ê×}&kya¯\Zü¡Mİ\\¯™:†!t/B¿o;F­kßFKï)ìï_æ¢[æúùN¦Ì±bkV\\çD2äl9\"äü“¤±}MezN£·e¾%×íúÊ}¸m3Şø†÷û/…>5É!Æ©”¯‚½X%”™İ\'±ı[®2êİI:ŸCÖJ—çöÁ#´ŞqŒ,YAWŸF(™eV„¿›â©û:Ÿ[Ï½H£ášËæó¥›ØV¯;ÿMˆÔ ¢·‰ÄçíŞ!Ş½hı¼o§©äÍÎ†?:\nrYª ¹ö§—~’m\rYê¾s”°ßŒÄ¸{T¸j¾’Ã‘ë³¿~&œí‰A\Z^}ìgc9æÚp7º^[z]ÅB#ÔìI¥N¹æé_ªG”[œqĞáQ4´•Éú°k­ÿ’îâ´Şz·ĞeàDKç‡ëE‹Fº¼ù„Ÿ\\Óï‘EQløîÍÖ•ò.ïØDh†LZ›\ZNÎEÁ¢\Z2ùPòp†ÎxIhºUfX0zám*I¾iû³0İ_¦“pëú}oçµ»€ÒªÍÙoÖW\'É¤Åî¦™Ód7]^¿==à•¨¯«Ä¦äÉŞŒÅfoYÙ!ø›t¸w_\Zµ7¦%’nÇ[d¥˜fè>°ì¹­˜jœĞŸyTy9¼×ñAöos:ó*­åçRôÚTôîyŒû~f ßÈ²åÙ_2•…c9HW¿`ha/@{[-Ÿ¯ŞgëJÖp}óõöÉ¥ı6Ğ)ÒÓ_6Ë÷n\ZJYï›ÿ3ëáµá]lZ‹¯û)«%¶«ß§û\"×®”z¹’wºI¼í0\"ÉË¼ŒNïgÑiÊ„6©dK`-ƒ`wàeìo7õúŸ*Ññã²`Ùª¬¦5£¯œ­ë\nUÔ#1YÃ\nõ¾ÍË|Ù±˜£jï¶yÉc´&?×Ù³$Ş¼¬€p¬2vÀÔCG{qW^nîZ|™ÉÜq[i#	náé|ôbÔcfbõ³±^N.ñBÉâ×mO\'W» ø+Ë\"M¸‹xA)\"G/{wÍS>•§DÒ¡a¸<Ùôy‹ô4ü×Ï¾‹Gû4ÌbXqá‘Ñ¾áŸ9¼÷´i’•ê[CPsğ šèYÏÙEîñ:\'4¥sÎ~X^äÇ†7ÉQ\'¯a–7ß°ø¼\0h,7;,¦a<ó¶¦¬\r8¨M\ZXè; MáØÌ0Wµ½aíÚ¸ÿáàç`YÆéîƒšË¢/t7	44`l«±+Š±üzì¬•UŞN¡YI7²¯yŞ–ÙkX|q(çµšúÓİ{\'ó8èc–ˆ¿î®ßNz·)Õ–«§m[ C¯O=¼²iQ×ŠÏf‡Ñ¢¬„}Âì!Y>«Øê×a+]Ôß“qÌÅdôÄ}òŒÿ–[*§ÛãÈ€¦F%Òo^3Vâù°0‘±Ş[µşO_¿¸}öÂ¨9çª¯cÏñL-áRšw^®ÄÕ|Ä«!…ÄŠñä9»5ÃZ‰‡ú‰!ïZ&Š‘¹Ï«{B]¤`ë\'©–o‚wöf¯½âĞ?»qç˜¥JÖş{ä\\3Y°_ì£³>4Tïƒ‰GŠyqÔz—jï]Ò”\"ãŠÑÛ–M–pw^=¬Ú|YhØÌ`gf†Bæ¤ŒÁ$H<¿úY¿¥¿8>\0L^ÿ=‡.7´ıh…=U¦é1µ„.qÇ’ÆIåÿ\0Œ¥Wà\nendstream\nendobj\n26 0 obj <<\n/Type /FontDescriptor\n/FontName /DYGYZZ+CMSY10\n/Flags 4\n/FontBBox [-29 -960 1116 775]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 40\n/XHeight 431\n/CharSet (/A/arrowdblboth/negationslash)\n/FontFile 25 0 R\n>> endobj\n27 0 obj <<\n/Length1 1394\n/Length2 5926\n/Length3 0\n/Length 6875      \n/Filter /FlateDecode\n>>\nstream\nxÚtT”kÛ.İ(ô €„0-Ò!\rÒ‚Ã0À30İİHH—H©€RÒ¤„ İİ%¡À?êŞßş÷wÎZç¬Yë÷¹ó¹îûº^vV-]^K„TGñ‚øøÅrêºF¢\0~~A>~~\"vv=Êú—™ˆ]Št†!àâÿ+@	£Ğ6y0\n§€T]ì A\0HD$*ÎÏàçøw )»Â,ê|\0UêLÄ.‡pô@Â¬mPè6¿8!\\\0ĞÃ‡¢~§d H¨ƒQ6PtGØ ‹€À (•à”°A¡Å@777>°ƒ3i-Åõ\0àCÙ\0t ÎP¤+Ôğ0@ì\0ıƒŒˆ gsşc×EX¡ÜÀH(\0m°‡A pgt†ÜŠ ›tUÔ\0šPøŸ`µ?\0Í\0âı§Ü_Ù¿\nÁà¿“ÁÂÁ÷€Á­V0{(@SQåz\0\0Ã-‚íè|°+f¶@ü¾9 (£\r\0£şÏ‚„9¢œùœaö¿ •AOYn)‡pp€ÂQÎD¿î\'CB!è±{\0ÿlÖpƒ{ıu°‚Á-­~°tq>…Ãœ\\ *ò… MDÿØ¬¡(€0ÿC!1\0Ô	\0u‡Ø\0•×óp„şv‚~™Ñ|¼\0+4¨Ì\nŠş#òr»B(¤ÔÇë;ş}\"\0–0\n`µ†Á‰ş©6C­şœÑËGÂÜ&ühî\0ü¿~ÿy{†¦—%nïñOøïı5tU4Õxş şOVáğâ	x\nƒ\0 ôCTL\0àóï2ÿÀßà[µÀ°¿.ÇÿOE¸ğğôğşÆáú-8ÿ’àß4h.CœÿPß”_˜‚~€ş¿ğ;åÿÆû_Uş_Ôÿï)ºØÛÿvsşöÿn°ÌŞã¯\04•]PhY¨#Ğâ€ÿw¨ô”Õ¡–0‡ÿöª ÀhyÈÀ­Ñç	ññı±ÃœaîPK-\nbó‡H¯İÃ‡j!œa¿¾8è,~şÿò¡U±CUœÑûí‚¢Eõï¾\npÂò—ú„E\0`$ìAÄ&™€°0À„–©%Ôı7¿@>8…N 1ú\0¬H¢_kEs\0èˆ„¡á£ÍDÿ*\rqA\"ÑÂûÍ\0tß¿Ï¿U…ºC!D“ãÈ£`ÛŠà†ó27ŞÕ¼ùÅ¦ˆ8£ÎpaÇÄ+/5üt¥\'Ùç–¥wúR´¾½\r÷fàŞ;t7mÍ˜KVÎAa(t.Ëğæ~¾8nµ†2[\"è­‡DS\"–É÷ãµ™n?7Á1¹Ÿh0ş3D´MpııZşU“óºñÃm€ ğ;k2*F&»i+Êˆ•mÕkdJK4IuÑSy:t…‹=“mˆ¦»ğX6‰MëíÉìêL<zı¤ıƒHi(%•§*kv_B7u|¦j3‡¬ğw¹·Iqwé\nB9æ°*Æ@ŒŒl±tü€\"FÛ>X8fRó¶êPU}Ãp¿\0GëOO¼Wì’·\ZzIš`,p(¬”²éQÔß´Öt¡Tµ:?‘ä:è¿\r6bËŠÔí>¸Ó·ÛÆ)—3gåt |KCó2ra½5-Î±^6øŒEû½°ü°ñ”î´Z‰·¶È,4:ÿ«Íñš©İ\nŠ;rwí\r×&Ò•·×1Æeİä/ñ·\r2p?ÜÇPX7YT7¿TV?\nïkyË¡\\´˜rÌ7¶¨VøBŞì—…»ßg†˜Z©Úì}E­T¦»À?czmœ9şr¤È@ÿZ-ÓÄ}$À\0ù$.Ê·¶+kÑ¤Uî5·úÎ_³‚X—ªƒ¯ê!-Eï,0ß­öˆ!\\iX‚ş^õf6Ğd4Mè[}‘­g£§ÓÂ0ó\Z¼¤‚ê¾À©<\ZÏ­î‹×„˜©¼?4”_PĞ&ÒôîS€‹¤Éå¸¢Èfı0~¿aU\'=¸¾¿Uæ’z”q#]Ä¹çAA_[9?zdsÜ	ÉrîœA…³èÊ] 8j©G»Êdû˜»bñ\"T–ôNos)®<?u\'1¤J·`·=š d‰+´­Åªx]Ê*‘FŞVsŸÓ)Åò¥{Œ%+:r•]UÚ UÖ‹Â->xßgè*9^ŸÕâN…Ôt0“v/-âU5]¿¶y0_\Z’6äßÅ~ÛâõEÛâùˆ¿€‘êP8ouÅÉá¦¸ª-ŞlBVXäÔøË _õÔ	›rƒ–kï¾	\'İX´{NØ\nš¬63]^/`în½	5{£öÕ{ÎœPT²Ó\0Êï¸ïp{g,°ó+á{&¢ÜJÀßâ‰VóÛi«^fÍ™øç2î8£}ö$­3\"¯f‚İ}4fÊ»³·§ú“!®&ëf¡‡!|Gw±.®!8®Z¶¹{i7ãûÒÁäl‚—§EŞ1B)î§ó$7}ïˆŠ‚ÉßrÆ¤¾?†ìêôOÃEm¾¥ÓYyzIG>ée ¦š¤»d7º¨VE\0#zûÉš_î‡âD¯\ríñƒ¬›Ï>“f%¨RÉ’ºİªı }Eæ#Lãğ#	î1–ÔOIN*\\\Zx·,Z£à\'õò6ù‚¶_z–ü5‡µ—æ\n?š¾ÅKÌK­Tê˜Úà¡Äx•O¦8ÂÔ\0¾|Li\'¹çö%é:ÄO …eišBœ9¤İ›O?9àÆÕ}å¾%JàôØñ.æñN69g</U¨˜ 8¦ˆ„0¸#­Íˆ%ûâªQ¼‚§r[~ªˆ¿‡ÛÚù°.‹£%‡^vXü³	‘^^]¤Aì.}îÛ|aQµÛ¥t‹‘WfŞË0i«áMö—¬¥ Ñ•óy£ûòù4,ñtÒcK·ª…?Ê÷\"º¾„âÿ¸qæ´Ôô[Áw¯1´…O-(±8R\r ƒA i}²\n±ÉH‡¬ù¾9‰³eÑ+Ò©úy<nµ9Q_ı|çœœz)@ù«²Ï1Ñ|üçz3i¿“¿ñy7çû:.êŒáf% ûİö4AÈfGsÿë¸áC…û›ÌI[m\\{±ªMdºn4B¬‚ƒU;»%‹Ÿ‹²+qú‡*CBSôë¶T“WÅ>-5n5ÉPıÚ¨ı„0:›[-EìÃRHåhİcş˜²äê×SÓÖøŞ=eŠåÏõWíö“(_$¤fdÔOÄt…”Ş‹dégÎú¼énÑù<È(à1añçl8Â+{l”¦k|æúÃWbÇ–ÕCQÃÇ•Ä¿/÷rñ–Â®óí,©{kéêı†\"¥\nı¬äñÊ\'Â›²s>FgĞ>ç§úòp‡$ZÆotçU¢‡eÂ‰qê•©÷¹Â¼<¯T¤ß™¹µYı0õ}}cÆè›·#¯S70Fcıõfi(KspÚ œ³õÁ÷–~€©`dİlq×I´ØìDP§–{ÜLã¬×³BÅºi«wK(İuÕ\n•ú,òN[yÂ\'\Zn½¬µ¤ç‹áGf¨ëß‘²ÑöüÒ„õHôtmÃpnû£…RD·?Tqé~zàÂöl\'ú~)tüi°0‰kqŒä)<D =Ü´º¬YRäÀ0¨Ÿv1Nq—İoÊ’e#£²D‘uèñü>=¾Ï›H\'šÛI%ù¡`ƒVØ¥§sÓ“ï]²À\\Z´×õŒ=ş4™œĞî\'¯‡>ô_¥0%¢x}ôÙ6kÔ<ò§¬¿\Zæ]`7RÍ!•ÖL¢¦ö—}\r{ÇHè1-%ÚÉŞ‡ÉçÁhQ¦æ¡e7¾AÍÀ·9‘ñı…±{·r\nÓıÀœ9øûúS\r\ZÂRò\'jç–´}.é\Z¢!8â¾ìİ/¼…®%	t€_ç\rç¸Ø07T¾¦,ñ#hì|³ØHãÅÈQ<Æ*\\bgåØÉş’$h%–3n¹iôS]\'ƒwóÿ[Å8u&Æ}£ïJnÃÛ.{íxæÜ17+Ì•†¸ïİJ%eŒœ¤®LÉæMvö“UÅ‘ri9¯‹Ÿm¶&×4{ØÅ­¿2|^„Ó•iÈÔP‘Ïå•âdábyÈ¸Á·¡ö¡Yìá2\Z”ùÂºmHºòÌ[¿×á;>®E‰ÈT@òvÜFIq›cPüúâÇ\'ãwÖd¡’\n\r,ú,Â3ìråéÍí_n’é½…‡Ws;‘Õ«q$øä§	ë÷®Ø°@]ü«J¸˜ÌÔ\'fÛÆcÉVªŠ<â\\Î\Z¶~/“S”/X\r»U±Çô×ğ$ÌVßa²eæ­lwk–Z×|~÷~gø]ÇÉâÊå•:OÖW£¹˜$RíŒ»ïvzP™SŞ½ı§±´x~Ÿ©ï¸Ë‰¤Z$UÔ-²ìÛ÷·ÜŸaâ†9~¢û@Ú¼BÌÄZñ,ò4µøVg·åÔö4åF`¥`(w·¶¹Ã©¶‡\"üC”Ò›À4¥&a2\\	™ºÓí	•b\r‡9_ƒŠåÀ×¦Aw:w™drß_¯=#¥)1ı	Ÿ­€’³rõlP„oWG°1…É×_ùGö}Ïğ\ZE²­Åİ.Ê—îß W5JËäcK¼àöàÀ¯Š^ÄQ}bÃcô|u	ô·«ãı~§œ”FDÊÊ\0 ²\" +œ\"ÒÈx“Mj×à¿\"Ïr$òíuº$\rR$úÜ¶5Áj®†q[(“›ŒçšI;LF{o‹ŸA\0Û{:9¶á]õ3\ZÃÅÀéâõ¯Q$s™Ü„/;Íqtæ#òŒØ±ª4„?/…‰ìŒšï4Z%a—„!Mèu•A3Û<ƒıÃ„úÎŠı;ò[ÎJ7h´PÇ ±pQ€ñLœp¿qÍBà‰è‚³^!5¦¨Bx<|*Ä<Ş£«*Çóˆ°–ÖfëñM‡Iiv\"åâ0i»İ˜\\ê,s‰ê\rcù&1É†š5ã‚Æ€æ•ú–©@eCá’5sD‚O‡ô²­w!Á£¥LMOÆ–*³—6]K-Qiñ‚ßêÙDRÅ\"}­¥Í©Å¾_zœºØ|sgŠ_òöoÆg–];Á[”µÚÖ²k‹™t^FŞTˆ’TGZoëyG;ú¾°C)QM»…S	hÑlXİI0¤ûøQıt~ş^¼‚f>f‰?yì›Jâ°¹h­iÜÄâÀ(eL‹G÷…™¾œ~ø4J¹;F\"Ü&£~}¯}şÖ‡/º˜º6m‹©y	%\0×¨z\'^yø£qŞ£ÕÊ©jÿåó¡wê_q˜ı^š_‘U¨Wh:¦·ä‚ß†Ên³w}{øæGŞ³-cÖ9êoS\0®W~¯²ÉqÊD	Ñi9à[Œ`}¡aŸ.ìôÂãb\"t®JYrªS~YzŠ•û(Èö¥ëğÏ^{g;ó^Ó¼av<Êšdû¸eóW…7‘GšıâJ4ûÑRïJ8qgçÒáá0qÚ5áÊ_FšÕ tF¾ïÎõ›\0}ËåüfI*6°wÙíÕ«ƒ¼b«ƒ¾aÜa.ùê·.üêVÍ(}ÁÔp–1©é][ñh% )¹¥;tÁCqzgtğô@8ÁpdShh¸moã–H¯§^½TÓfFÍ”•ÖkÖ}|ä\0ÅR~Õ’Šµ	ùöØşéİ!Vão=víÁR¼4’ø¯T>Sª®ñêÈpk=®aui8¨ŞåênwÅyMÌûxuÅæùÃ<$µ9îı#ƒŸÈ’Ìë°J‰sê>ÂNq5Iš=yÂ5•ùSş¦¤ò€Ÿ›r,]™+SİÍÅã¢CG~ÑSíü®Ë:ô&Ïëª˜£MurÅğÔ‹{_¾xgHFT08ÇzaƒŠ|]ˆ¼u³s#Œz`Ï7\'=‘Ší^¶J\nfÊQïD8ó­}âÔG&Çhôy+>pŸ_X:Q\r–›lE¶›\r‘†O„“­4`\0\'=hi;âI§ïë%”ÃÊ$ŒŞÀfSÏªåƒßnóô´í«¸‡]~[NLˆhŠæÔÜŸgÃ•	5TÒ[7Êxw—ƒ1ˆÉÈë»2Ô¶ñÃ°ÜÔ=$G3ıÒ­¢Ojˆm•†yõÌ º›)o-æÜ)LÑ3îIë‚99›<sB©iEÇ<¢1l¥½—ç#c:ãPß‡c¡Æšƒ#&àAoD#cš¢~òİ.dæÂ ñ4Ï¹ó£UêMc¥øO5rØTå#ı¬â»£öiÒƒj˜ºÆ›ÃõkÈ«tª£>kƒÊeÊ\'	Ì×d‡¯o¶v”j\"™6Vy#yÏ÷_£ˆ²!]ì/°u¤Eµ´)‚\ZV…®Ò>êàFª_ˆæ7N2yb„Ü	ª3Ãá”n]ú¨A§\n£tİÿù!vøQwít~Å\n7‹àh‚ìÍ{¢rßµøÓû9TŞ5I\ZÂw)÷}Iz\0tÔ	”B©¹\'/r—cW	€$¾À‹.É6`!½-HÊ—\nOŞz˜³/âN_¿YÁsè«3	3\rêPRa$ëõéìÙ#hğô_—éOŞ^Œr¥C»VnlaW²ãlªO“Í”\ZùùZÆOì~š¹a‡àge÷jX//&©ç ™ˆL¢‰t;¹‡\"êm¥_ªBZ@şï=éøÚÚ.£ŸÊ]æ\\·©ÛYi?¤#«³ğQãÊÄõ‰Şp2Ãl¨°(Ç~ş†=œÆ¿£¯©,Ucm«šÛ\ZIÒ,j7ìŸª¸M%/9~QÄBŠyÖ¦Ò÷Î»s0¸ƒ¬æóD°l‡÷ÅaØ§˜/ÉIÛO\n?¤@·TgÖëxh³¶éDcíãŒsÕG¦*Ee„Zõµ2Ë2³Õß>Õi)KîÀ÷·Ú	ÇŸæ©OŠoŠ­&5ws×»\röyÜ\Zp›°º‡ST1ÊµHâ£O}ŸÍ¦f¸Ü­å‡Ùd”ˆ-ÆÄïğìo$›‹\Z¦+(Ê¨3²ábâ}‹ÇÖ´iF¢4áGV¸„I.FÚÎcR·#®±ö€Dfó¹?áT3\'×®2—µäF«×üùğÇœºgÒ\n¾z~Õ%œ§×‡“†á÷«\"Ÿë]6/-ö¦¼É»ÛNØ#ó˜,æ¯Ë¦»¾È»ü4¿¡h;ÆºÒr™§¤ï‘bLEE¾‰ë<N™àB®³Øésµ1ÉIÉ„ŠûD·U(3ß˜ÓU~ğ.%şjSM2í5U÷şTõÖqï·Êç‰îåúò?K8°Ò;î3òou”/ÑÛjòj—\\àbê—+*5-g5&5ï\\%Erû=™şÑ‘fÚm·ÂW¶{JºÈdŸoX©YöF^¿0yF6º÷C›#¬$Šu\nüºÇğ=ª4ó´ñĞ™ş„Q\' Î\\¨z²Sg„Ø+/‘•å» Å,\rmÏ<Ñ¯l/Opû\\ÚÍòË]°©«\0f¿vß¯Auê¢ı\'C{ì_¶í\rÉ	:¯`8‹÷ûdû4vösyÀñ^è½ª§Ä.YñìÔ!{STtÛş{æè-DukÏ¢.s§hòö\ZM2ëŒÎÖáM­°*ÂkF’fYı’ÌÖ‡¶	4·.ıa¢ôow…™Åü©2²+IÆÓUUõ›aIRI×6\0¿½\'GëÜ¾m*+µl×š¼VÓ7ËË¸™SÚĞÔË¡Ê@•L™wŸ¹`mv÷~Ô>%~†ı¼”qç€³ßN°Q\n<fß›Ê¼s>,ø§‘h¸\'ø¸Zæ‹w%–ÏœlÔf–ÎÚÁD© æø¡Ì²l­}Û°×š³ı]ÊÁCĞ™(`yĞ®w„Ş<º2ÌKq§ªQ¢¨áÿ•3ƒèå^òA7¬©Cr³+hFQl‡»\"—j]R½”Á+´Å¤h ÷–hr`ps´¯˜ú²˜T‰OTXFb™\n¡¤&¨UêÅf+õH­¾‡©ŸÉ%Ş¶I\'r“=&¸İYl™†úæ}^å•…Ñ£·*œ«˜hÚmÚÎ’Ö*Zw€†	Îæãí*Y}f_ÑÕüù¨T,÷F(ƒšêZbPk›W©h¸ã±\'AóaÃ`_ÉÁ©™?’ıx)Hn|TUU5¿ëÜlİ°„N.æµ•XŒ²}æ*¢È.)Ğn›ÎbÖ¡Zİ?î‘·”3É ªRìÜRöxK•¿·@0·Œæwj^Î®¥ªM^2Ä˜ø‚µÛx\Z3â‚”Ÿ¾ÓsFÆœşLèvŒqû3=‘¹Ì½\\Ë±õrÓ3©|ˆx{C¼îÉA‰çæõ!Îîfô[,ÊçP‚™H÷^8ˆçQc$eÅ—|ĞM–pøV§{)¤„ê‹í[BŸwÔ<dqZïmøòü+‹ÆÎ\rké^•ôY‹=Q¢2ßã¯d\rGœx\ZıäzæŞÆ´Óñn³µ’p{RĞá°Qäõ\0¹a›[7ºîâúNÊ^ÍÀ­€QKÃ)kUi.ÆEà„ğúåŞã£Ù8Ï•J›‚|É•ÕJb&¢ÙcŸ™-™k†¸´<Õ4YïÙcÈ;Æu@\'%Dx#ò=âX´KÖQG^eFG>‚7R—{\"û³ë$Ä]OR´mNíIŠ¾uŞ$2g™Õw„ÒEläğ™™A|¨ùœ‹Š˜ÌÆ3•¤n¤ÏÊ¯÷úTû—O\r¡\'ÄÃÉ#8Ñ^ÜGÛğ.wêÏ½7®-É´åƒk¯…z<¦‹QÚÀ…£÷ç{ÍvB/Ö±&³?»:=1_Êj¹à](¶«õ\n\\óÏ{äÏ»İ]øÖj*m2¿Kt1äœJOşŒúëê<)’RìÕÄ\'O$¦LR\0é«7¸íöyÔìŞónøˆJ‘B-FåÀ.Æ,?Taà–äLzÿ³R	ŞV»˜†V;r¡ï–›_S7Š4«\\Á2¾‡GË{¹/~ê7fzHcR%Sø‚¤ÈH3™»îëIev\n¥¸Ğa›¼f2àmw¦f‰ \r+®U°ºãe 3%º;@<B½ªLcc;–ÕÓ4RDE°ÁJØz]Ş{âàhĞ–^×ÿX¾ílQÕ»AìtR°¬JB0o?œ?;ÿXĞ\nendstream\nendobj\n28 0 obj <<\n/Type /FontDescriptor\n/FontName /NSJEOL+CMSY7\n/Flags 4\n/FontBBox [-15 -951 1251 782]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 49\n/XHeight 431\n/CharSet (/prime)\n/FontFile 27 0 R\n>> endobj\n5 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /JYDSID+CMMI10\n/FontDescriptor 18 0 R\n/FirstChar 59\n/LastChar 120\n/Widths 15 0 R\n>> endobj\n6 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NAZTKW+CMMI7\n/FontDescriptor 20 0 R\n/FirstChar 107\n/LastChar 107\n/Widths 14 0 R\n>> endobj\n4 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DARTBM+CMR10\n/FontDescriptor 22 0 R\n/FirstChar 11\n/LastChar 121\n/Widths 16 0 R\n>> endobj\n8 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /FYGEPU+CMR7\n/FontDescriptor 24 0 R\n/FirstChar 49\n/LastChar 50\n/Widths 12 0 R\n>> endobj\n7 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DYGYZZ+CMSY10\n/FontDescriptor 26 0 R\n/FirstChar 44\n/LastChar 65\n/Widths 13 0 R\n>> endobj\n9 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NSJEOL+CMSY7\n/FontDescriptor 28 0 R\n/FirstChar 48\n/LastChar 48\n/Widths 11 0 R\n>> endobj\n10 0 obj <<\n/Type /Pages\n/Count 1\n/Kids [2 0 R]\n>> endobj\n29 0 obj <<\n/Type /Catalog\n/Pages 10 0 R\n>> endobj\n30 0 obj <<\n/Producer (MiKTeX pdfTeX-1.40.10)\n/Creator (TeX)\n/CreationDate (D:20120919220656+05\'30\')\n/ModDate (D:20120919220656+05\'30\')\n/Trapped /False\n/PTEX.Fullbanner (This is MiKTeX-pdfTeX 2.8.3759 (1.40.10))\n>> endobj\nxref\n0 31\n0000000000 65535 f \n0000001741 00000 n \n0000001629 00000 n \n0000000015 00000 n \n0000061201 00000 n \n0000060921 00000 n \n0000061061 00000 n \n0000061477 00000 n \n0000061340 00000 n \n0000061616 00000 n \n0000061754 00000 n \n0000001862 00000 n \n0000001886 00000 n \n0000001916 00000 n \n0000002050 00000 n \n0000002074 00000 n \n0000002450 00000 n \n0000003066 00000 n \n0000011328 00000 n \n0000011562 00000 n \n0000018734 00000 n \n0000018952 00000 n \n0000038207 00000 n \n0000038585 00000 n \n0000045736 00000 n \n0000045958 00000 n \n0000053457 00000 n \n0000053704 00000 n \n0000060698 00000 n \n0000061812 00000 n \n0000061863 00000 n \ntrailer\n<< /Size 31\n/Root 29 0 R\n/Info 30 0 R\n/ID [<FBA237106D5FCD3258C201401627AA50> <FBA237106D5FCD3258C201401627AA50>] >>\nstartxref\n62085\n%%EOF\n'),(2,'Approved','PDA',NULL),(3,'Rejected','Project Fund',NULL);
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
/*!50001 VIEW `mainview2` AS select `admin_form_with`.`form_id` AS `form_id`,`fac_fills_form`.`F_id` AS `F_id`,`admin`.`a_id` AS `a_id`,`admin`.`A_name` AS `A_name`,`admin`.`Role` AS `Role`,`admin_form_with`.`A_status` AS `A_status`,`admin_form_with`.`A_reason` AS `A_reason`,`admin_form_with`.`A_timestamp` AS `A_timestamp`,`admin_form_with`.`A_present` AS `A_present`,`admin_form_with`.`Deleted_Ad` AS `Deleted_Ad`,`form`.`form_status` AS `form_status`,`form`.`source_funds` AS `source_funds`,`form`.`specifications` AS `specifications`,`fac_fills_form`.`C_id` AS `C_id`,`fac_fills_form`.`Timestamp` AS `Timestamp`,`fac_fills_form`.`Deleted_Fac` AS `Deleted_Fac`,`faculty`.`F_name` AS `F_name`,`form_club_item`.`item_name` AS `item_name` from (((((`admin` join `admin_form_with` on((`admin`.`a_id` = `admin_form_with`.`a_id`))) join `form` on((`admin_form_with`.`form_id` = `form`.`form_id`))) join `fac_fills_form` on((`admin_form_with`.`form_id` = `fac_fills_form`.`form_id`))) join `faculty` on((`fac_fills_form`.`F_id` = `faculty`.`F_id`))) join `form_club_item` on((`admin_form_with`.`form_id` = `form_club_item`.`form_id`))) */;
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

-- Dump completed on 2012-10-27  0:44:42
