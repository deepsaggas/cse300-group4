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
INSERT INTO `form` VALUES (1,'Ongoing','PDA','%PDF-1.4\n%����\n3 0 obj <<\n/Length 1535      \n/Filter /FlateDecode\n>>\nstream\nxڥWKo�8��W�(5�/�b�E�f�v�\0=�=(��%WR6Ϳ�eK1�X��ሜ�7ߌ��,~�-OsF���.��0�tb�eBf��:��������U�R��\\)�S��|�>Y	ř�]���9���`˕�2��3^�?�\\e��U����Y|]��ßH�˙:1��܉��->~��\Z6�\'�)�\'�^u�d�8\r�mr��g�Mbb��<c�[��^9��1�8�ﯫ�*�)�Y�4�o��}�� (��~[�A(��mh���_���]��ӭ3�$w�J5^1lt��C�3��]����fE_jɌԐ�~����\ZS����?q���r6l*��w�~��;���_G�v�)m���\nz<1�Y���e\nX	������A���D�T���;=\'gl�3\0`���/���8�G�2h艆eܺQ�U���!mW�VZ3�\\b2�5�%S\0��F�p���)�@*����e���e`8)�%�Ɛ�+��Q��.�&?��g�ٜ��%���d�x�Ĵ��4���IX(����#G����6yZ\r.,��zx@F��aS�$������j�PVA�	o����q����\\J�n����h���.r&M6��_�	�f���H��<\r�~��]�)A��X��!ӟ�+aL,�`��f�v�rzKQ���5I�����J��S)��������b%i˴�@P��8�YW��9T��F]��svdg\"`�G॔���&��N)rF�e��\0<�oC��\\3{�����HR><�0%�D.un:�����D�%co��l>tBXߵ�-U�5ri{�v��ّk�sc�i�a0�Є�3����bIx\r=޻�]Ѭ��ַ#�x��j{jb�fa�|\Z�ь���NX6���W���XfͬW�md���@�w��>WK\0k�c��4�\'��M-��h��W���t�9o:	���f�r��\r	��=>B�\Zw2�E0	@l�\0��I�DJ�\Z����0a|\n��裸Z�æ��*��q��F�m���p�\"_+�O&�5�Yʤp���V�\'����ևQ���=���=I�=v-͂�\r���3���+?��P3�d0�\0��?��i��xI�e¼���,���0�c�e��x���.b����%��ώ|�[\'\\�ހ������ޙ(ȊR�:ɴ8i2zAq�Hm�������z�a��W��d��rH�\0��=ұ�^�P���V�ոJ}��J�\re��� %��H�����@������+�X����s��=\r��v;�S�1�EЂ�&BçcQ,\0�[6�C��5P0�QI��Q���.u���o�D���q��_{T���M��Q9�|p��,��0�\0�[HZ���J�U�G�����-j� y�3G[E7�b�d��hޢ/�Y\0�n�8/�a܂��H9R6j�M�ᓾ�nN�A���Z�̷ፁ�i6���N6;d]wU�n�t6�}�߆d�Y�bK�C��*�\n~���G#P�K�Lh�����>�\nendstream\nendobj\n2 0 obj <<\n/Type /Page\n/Contents 3 0 R\n/Resources 1 0 R\n/MediaBox [0 0 595.276 841.89]\n/Parent 10 0 R\n>> endobj\n1 0 obj <<\n/Font << /F8 4 0 R /F11 5 0 R /F10 6 0 R /F14 7 0 R /F7 8 0 R /F13 9 0 R >>\n/ProcSet [ /PDF /Text ]\n>> endobj\n11 0 obj\n[329.4]\nendobj\n12 0 obj\n[569.5 569.5]\nendobj\n13 0 obj\n[1000 1000 1000 777.8 275 1000 666.7 666.7 888.9 888.9 0 0 555.6 555.6 666.7 500 722.2 722.2 777.8 777.8 611.1 798.5]\nendobj\n14 0 obj\n[607.3]\nendobj\n15 0 obj\n[277.8 777.8 500 777.8 500 530.9 750 758.5 714.7 827.9 738.2 643.1 786.3 831.3 439.6 554.5 849.3 680.6 970.1 803.5 762.8 642 790.6 759.3 613.2 584.4 682.8 583.3 944.4 828.5 580.6 682.6 388.9 388.9 388.9 1000 1000 416.7 528.6 429.2 432.8 520.5 465.6 489.6 477 576.2 344.5 411.8 520.6 298.4 878 600.2 484.7 503.1 446.4 451.2 468.8 361.1 572.5 484.7 715.9 571.5]\nendobj\n16 0 obj\n[583.3 555.6 555.6 833.3 833.3 277.8 305.6 500 500 500 500 500 750 444.4 500 722.2 777.8 500 902.8 1013.9 777.8 277.8 277.8 500 833.3 500 833.3 777.8 277.8 388.9 388.9 500 777.8 277.8 333.3 277.8 500 500 500 500 500 500 500 500 500 500 500 277.8 277.8 277.8 777.8 472.2 472.2 777.8 750 708.3 722.2 763.9 680.6 652.8 784.7 750 361.1 513.9 777.8 625 916.7 750 777.8 680.6 777.8 736.1 555.6 722.2 750 750 1027.8 750 750 611.1 277.8 500 277.8 500 277.8 277.8 500 555.6 444.4 555.6 444.4 305.6 500 555.6 277.8 305.6 527.8 277.8 833.3 555.6 500 555.6 527.8 391.7 394.4 388.9 555.6 527.8 722.2 527.8 527.8]\nendobj\n17 0 obj <<\n/Length1 1492\n/Length2 7140\n/Length3 0\n/Length 8143      \n/Filter /FlateDecode\n>>\nstream\nxڍ�T��.� H�*�D6���{ｈ!	J�H��Hi�  �)U@�\"()�����}��{W�\"��<3�>�<��u��TP�t�i XA�P����\r�@Q! P�����u���\'岀�1p$B��h�󩁱8�>�y�\0�@2 I  J�\rD�e\0j`O8�/�A\"`R.U$�\rwr��������@�Ғ����04F\0��Xg�;�#�0EB�0�ϿJ��9c�(aa///!�;F�vR�\0x���\0���A�(��	�r̜�?�HG�\r�np���<D@ah\0�;�T[`��!���	\0�u9\0��re�*G�NC Hw�G8�n0�����+\0\0#���`7�����8�\Z��\00��_�04��a�n�8\n�*��fuT��C`1��ΧG� �{��k�����o���:��}�6G�=´����\\���9��\0q�����8\0��yC��50�A�~A��8~($\n����;�p_�~�\'�E?���w��)��!X��	� �Ou������?\Z�\r���\0}�y��)�D����{��:�j��j�Q�\'�����	��\0Eā\0PL\n �{�w�n�o���F`�_�����G$�W�_,p��7Ͽ���������\0�4�����!�?���-����\'�_U�����i<ts���������n>!p�~��-�>�\"���Z���h}�����X0nI�N8��Ą�b��\r�7j�B�������p�#`FH�׋��O�{W����ٟ!0������e�p���s�# H话�\0��h�)N8K��-/��[�\0a!�K�8\0�h�_�����r���q�K����I�?P ��_&��S��m�댐�h4��oq��m�~��`�0��I$D6̥&���Z��KpuX�p7��JDp��1�G}�n)�47gZ����n��������}��Z�:�#A�u\'��ɫ�k)~Ǭw&)��Z����<C����Ru�(B�zL�(��������MW�!��j��Y]��G�*m������o�*~��G�������O���ʵ��&{UQ-�\r��Rw���\r��Y����V��gU�Qe1[x�g�3ϭ,\Z?MZ�-hO�o�I�����ޖ�m��NIg�T�8ж�)5j�N%]P��ɋ� h�SH9�Xteµ�ο�����3=�5����m���0�d�ˊ��z��xO���?�өW���sx7C{9�rg�x�\',El�2�[�Jg��Z���EE)<���7����(�>���,�ooW����E����.���g?=�	���d��S��r_:��^���sG���mu��8E�8)��{���(�}���rw�!{~\"�̠��� ��}/�O�Գ,8�l��b?`@���%|atK�b��I����_�����\'�A:b����ц�f>�~�v�B��\Zi�p�����C%J�\0A���!t����	q�ʋ�����X&�����I?���u ��¼�#�æݎ���\niw�\n�E��Yo����=�;ߘ�W\Zr��.��6��40�I�a��\\�P��f�8��/ǵ����&�X��l�V�\n�r�2ԩ�&Qȡ�9G��߾�9���#�7^֡�n�K��\Z+<I�\'R�g&���Bn�G4�K��M��\0���i�������:�d���.�TUˇ�럞�f	j��}ܗ��a�x#:���Z � �!9��`31�l0\\�N�hy���f��w���?:M=~�r۲�Fd\0��Q;�)�&h�Vp�Ҫ=��5S?z�e�(�N��B�	�ʠ�s�Z�MF��g�jݶ8�\r�6�n�����P~�X>��M�������u�*��Ɨ��Pl<��գ\0��u�X�k�5�Rq�+�>|<N���tln������8�k���<�݁;�-U���`wh�*�+Xo���i�و��C0-3� ���<�i?���VG��/�\n^�E�mqGuv�X�J/�.���/((�N�ԙ|�G�xe�/ɐF�gÚwI��H�[��X�0���k�V�]��*m�#��\r[t<�YM孎��nj2n���@#���qI3|к�B��I�`����0/\\PQ�\\���\n�x��a�~�s�S������K�����\0z��`�Z�>XT�W$F��EeYk�Uz���`���}���w^�B6��HI~��i��/�c�mz7x�S��.���3�|�\\\ZT�+n,rOT�1���_�Zs�tr��f�&��C��9�ƆC��B�^lE��B��#��+�]����מ>3U���h�~~����u�m=��V��\0_}w��x�Ћ�R���;��:�0덬�D��\"���;�j���q7f���ItF�\\U��z/�v���6�hY�W�^���i�\rZ��̾��@w����U���+[�wså��;וlŀ�H��8��i��B�앋2_���X��W5$<�_e���)�9�TQ��dO�T�a�\Z6<���?�OOK���x1�2Z[�*�oP�9\Z[��_.�/{x\n�;N�wN��?$7VvZ��I�+�=k�{/�Ŭ�l���\\��\'\\k�jn[�t�%�7�<�K2R}��Џt;3�b�G�]�dw��{{�~b���� �E9��m9\0U��+k,���s��i̩��AJ�B����}���6G4|S9Kۃ�?	���M9Jx{,�����x�\n�����:�qHsM��i�������r�wQ�i[�}�z^�bK��z�N�)?G?�+8����wv�1�U͓)Gm�9G&y|}\Zz�q^���+�R<^T6�v��w;��=oK��T��m|�X�f,~T�Ȍ�A/@XaXܕf��X�ث��R�^�g�]��)�Bs;z=#Ť����5S����ݏ�\ni7�{G��V�W��M�ܵ��U۔Z�����˻ݨ�00�tɼ1��\"k��j�����В�e������c���Hǆ19�q��@Z �\\����h<�@�z�9��\0�\"(A1��lRy�g�Ǎ\'dY�Z��u��y\"���:I\'S����y��t�z3~�����t��8�j�\r�\Z�M������o�������],�rA����P�Wizc�>����Ac��O��O7`o��@7�-�+}?�Nw�M����Դ�_~���,�D!С����/�����Zb�336�_ֈ��~��V�I*g*�ջu�ٿv�Z���o��ޢe��ͽ��?a�R�i��(1��o�W]R�\rA��S�y멽�PΈixt�cP������-Ǳ�{MD�\'=dQP3=�3��12�<C���5>�˙z����}_�� A�E�����в`߶��t%!���g��2=|�į2M*���)� M���a�C	�-�>�4� �?�%���X��3���*5�Ԯ����z�]K��_�W���)��+��6�y�e���X��F�>�fC�2�38���{4��l�򅔻���ï9ס��wV2�F���Q�GOn51�j��J1��_��{�_�{cG��Sy�x���~��EF���^mB�եy)ߙ��O�\r*kK)�Ir��Fq�(��A��^]�p~x�<��X��D^��	@�yI��w̺uK�Kx@!���X-�����¤jK���$~pX�2y&A���*��͑��B~O Ցn\'��EQ<���g��gmb�|���	��A~FYǩ�\"YC+��w�a�X���`�\n�v�ry�޾P͔	���j7,�:�5PoT�뷊�����ʝ?m�Ve7�I�ƓN�0N�5���\"�)�\r�#����T-kЙͶ~���2��T�aS늊?�w�������G�-\\z���+�Z���qaE��]��;�q�v��mȻ�/�&0��g�R\ZʀR�����q��:|�����fK�#T�ľ+Qa�p�r�g[��)jJ*�����/G?\Z��r���#�zP��W\\=.�ɗ�2d�m8�j\Z�JhS�����!o��\'�y�r�\Z��<���<���x+4PD�X�b����${;y_I/l���K�M��Q�3ߛcs�A�Q����k3�/s�+U�?�DR�ʷu�=D�J��a�����H��?j9�,\Z�_SOR�jI�y���-���a�R���O\r��N�V�z\Z�n��!��^Iy�c�qH̋�|хiR��K��\n�?�[ֈ��4LV[��m\'v�����õ#0�TqV#\'��^�sQ�*�������}U�;�W��M�.��x��g���l�k�Be�v�>Y-���\ZE���\Z��%�Q���mq�̦ ���0�p_��\\DZ�������h*2{��6,�}/��v��&u4j���Vo����3��[N�i�����y-���/�J��W�H��Jɒ?z�Ww���Ζ�`�Z�I�{aR]����֔�\r�x;۔Vt ��F���ha�O���u	�璚N��3N߱�P���Ks��ѷ�ș��(�tx�<�J���]�4f�#T\r<ּ�g,\r���+�V\ZJ���1/<ȓ����S_RM��:\\��]���3��p߹T��T��pv$�wxh�,Bљ�6�A���\"Q���b7t������|_賨�d[4�,�3��eG;��[��S�]���뙗�=6$�OH?&C^�4���.$�~��D�����o�2�(�h�����t��l{�e�������S�|5ĜLf\'�u�����c�z���P��t7���d�[\r�5e�|���;�W\\<��a��;\"܄��2����h��������7R��l���ֺTw4�-|�^=�б6,�+�9Eh��70틁�L�l�B�E�-K~T}�@U�`)v��N~�8j��G����G�v�#�\0ƒ���\n�e�V|6��� {��w����Q�����ܕ���.Kv6w-�~t�>�	��T���$J�o답��\n�P�z>|�4���2��s�޾d\"\nC�zJ�^r����A	a̿?$k���K���������z]w㓮�Y��r)楸�4��L��@n�(�:��,%���K^�p#��N���w�V�&޻�����$�B��ew�[Դ�6�?��!��o��uJȗ#�v�Kd<����;����]j��Y_����W޸@2AM{`&��(��U�v�l�+�;_q��r�=\0f�1_SԌT\r�t�7��)���a�;N����zw.� Yɴ��_����@��u\"�\0��1OsE59ޠ��]���❴�ߓ+��oh~�~�B�טeƹ������%E/&���_��q7_�^����0	KA;,�:�/\\\'�s8M��o�F�����.+O�}]s��#_)*IS4�;��3��p��2q}iF,X?(�m:�݁\Z��yƁC��L2r�^���+���(����vCv���T\ZiX�t�|�\"y���i�O�vk=�W)T�O���W#����\'[�y@) �m��ܜ�uB��S	C�H��e)�pŰ��j����Xm���~��nYjw7�!|����K�m�H����{1m�B:�f�;���J�k>Jm�迌���w�#�����d�di���C�|�\r�Z#v\'�r� O�aPs�ٵ�׏�O�V��t�ǯB���(�U�1�>�%o2��Ϩ�?5G����w|!�U#��p���<zY�˖N�ϯ]���_Qvp�4��m��>]xf��ʭ��_d�Z�J�p��T\Z�O��uK����\r��2)��H]b���)G$vy�?`�lk��G�g۹����b�����Go�2��!zT���̮S����SS��\\��1GHN�����9���j!�cS����{(�L�\\*�Qd�݌������R�\Z8jzښ�u�K����_9�����c�X c)@��[�nu�{��E�^Eh,��)G�S�������S�G�H������Zh������.��OD�ϊO�5)��?.O�ګ��Hz�̲���9���Pؚ���j����}��w1!CoN�d��?�X51T:I�j���\0koO\"|K-C�\r�e��,[���?ѭm��9iv���s�G�YE�s�zzsO/�[��:��53	�����^���{#�B�\\���S��E�8]�(] 6W��]�0q�\Z=�F�5e�+�HP,w��f�&��?��/|gp��5����)�8�SޮIִ���w�&�����\Z5����[�&hR��P�7|F2V��/\"�ܺ���-$�����Q��d����O���\Z6x~�8KgL�}�,t>,�N�\n�F,��g���DC��b�+������MT���>���]�D	�(nN��۽Ec�G���AR����٥�SԀ��m˭E���3�[\r��ͻ\'��fo8#�/�}�?G�\\�JG��׮, �y��n�3O5��d��Rop��!��&S�K��ŋ�̸���r��w�N�ə\"�[(\rߙL�$pW�Vқg�EEVi$���*t�S�-3� w���V�8��wҠ�-m��QI&$8�|1��~��T�Dy=�io��\0�n���@&�[��]�t���i���K���͂u0G�W5z�ow�ҷ���$��M0wiwd����O��؁���%���%[}n�ޢ�f�/ȏ��|��L}���2�M��ap/#!��籷T��/������j\"=o��mqM��-�	f��7�!�X��u\0���â#ӣ�,yt�bi7��snS��-�s�����@~NHu�x��!��:�K(�K� �E�.#�D��������͝��KG�^�[p��Ƙ�t��.���h���81?2��O7��,}�w��Fz#����߆��˦�W\'���{O�s{`%-O(i�cǻ~H�F}��P�{���=������Z=�È-o*�X�[@qE�����{g\0�����e�r�ʼ��Z���O��=j�x�ݦF�u���� ��--�}�%��1]&���k%\rPD	�F��*�¥���?�	P�T�H��U8�{��t%���~�mOﰠEj��;-Z�a�r������!P���2L�\\�:�>ͫ�)�ĥ�P+���E<�����N\r�W����o�ɝ���5����y���\'�TڵpB����u�ɟ|r�\"VC�ٺ���E�&��Ux���~z����n�&�\0^�)_C��&?ɨ�ɣrő���\0�%�:sڸ�%㾼���GjG{ݐ�~%��ƦADaOSh���+�:�����^:�����z-)�94���k�\'��Ə�8_?�/j�Jy?y59�{:zs�\r0r�K�C�šՖ`�K=n�}H�������A_�6���;��%�h����*�9�Cc�X٘)�wM\Z�*c��b˼7v��^;�~T\'�{;�)$���aX�|�(����G�/�OݏQ�EX�D�E@��&�價�Wysl\n?I!��ރ�7<::!�|�Ƈ�xH��l��ƹ�i�i��9�ċ?w��Üd����/{���mDuȗL>o\'�>d\'��w��=��X�ܾNP/~B�I�m2�����r\n�1�P��^#�f������yU��4�ƻc�f<��lT�L]��>1��jx�tdr�;u�XC]x�l��7���A�x�Kf���Zߊ�*T^>4��.��V�A�(�v�<��Ů���a3����ͯ�א7M�3ˤ�����BB���	4��l&5�/}�x�8P���2�J�Tra1���M{D�(�aH�W�{�����/�p�����\"~C�p���cFV�|H�f%���~Ҳ�.<���n���P;�~�����Zؒ-U��_������������7ϥ@a��]�\r�Jy�yis���_�yC�\Zޝ�qª��qШ<3��\Z���êr�暏W�PĄ�d���͝��Q��#\n��)=���?\\|<7B$_�6�+�i-���gn���`|���G�/N���8��6�s\"/\r�G��H�ʓ<��=������er�*�:�kq��{;���=�s��~�,�ۻ˹c�l�ʾ�]-~fjVG�H�->�īR���ܘ�ZMͮ)[i@���QH^���dT��r�X�뫺m�{?w��:/��&\"h2\0���1ġމ�ت\"���ir|ޞɛ���#{�\\-�	Y�9\"^�)�J��̋������ �Mk�����˯������\'���#\nendstream\nendobj\n18 0 obj <<\n/Type /FontDescriptor\n/FontName /JYDSID+CMMI10\n/Flags 4\n/FontBBox [-32 -250 1048 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 72\n/XHeight 431\n/CharSet (/E/c/comma/k/m/x)\n/FontFile 17 0 R\n>> endobj\n19 0 obj <<\n/Length1 1407\n/Length2 6093\n/Length3 0\n/Length 7053      \n/Filter /FlateDecode\n>>\nstream\nxڍtT�k�.)8�5�C�]Ҡt�\"01C\r\"H#-% �t����4\"�(R�\"�?�����w�Z�Y����z��z��z���h�\Z\Z��\nB�A���� DD��FH�3�/7\0l�p�@�Q��+A��`}*06O�ix:��\" ��4TB\Z	C R\'�ݥA*0/�-H[��F!<\0`e���;�����+���JII��.)� ܑp\n�\r�8 \\��0g�!\Z�D`|�Ղ[��q������x����x�A�H��\0�p�B؂~��\\�	� #���!��\rsG��g$���Vx�l� �p���H������\'���݀��������W#$�w1G���P�H�=��\0�i	b|0� ��W\"�����y���0l���@j�� �_�<��HW�����D�_m�����UF�� P��� �p��\n�٬\n���˰C�l�~���t2F!�<�*�`]�|�H\")!\")B��>p�_�|]���_n,�@W�+���C`�\0�0/����߁[\0(d��c@6{$\n�Ow�a���.����r\n�������^�h���?��+��x�HӔ���Ĕ��> (H@X�B%� 	�K࿻����{�`ȿ����:�\r�B�`�^��8����_���{�\Z�e���[@� p���-��%�7�������H����w��w���\\�ξ%`����B��SM����Ez��wT��Ce���\0TT\"�Ǐ�PC� l����\"���g$\n���@���`� ���aUw�~U<���y`%����_6+��CG��R���8���`	���@�P�lm>��D�1�s ����f(D$����W_���;v�o:`��m��<Ⴠf��p�P�����jE&o��QY�c3a��|KbL��՗$��9�R�����c������O���u,���G,j��Yl���p\'��٦țprMS�nI����1��|s]�־�L�U�=���I]�&�֪����8K�(e��d�i��7Z;���Yr����ET��36M��@�w���}��=̝1�\Z^!+��\nU�~��(Q��B�yN���3J�;TJwy�O�$\'�d��nET\r��Ʈz���z�Yz���1��Y��5�Z���������C��Az��k��\"�\n�om���m�\0��{��@�K�ۆ�(�����,~��q��ӃU���f�>܂-\n��m3Vۧ�K�t�\'��8)�N�߼widK\'_�K�t����,�h\\y6,����=Ӓ/y�*��YHJJ�0۠�����\Z�C�!d��/+T�{�.z����}d���=u�I]q�H�\"�u�S���7n�g	�w_}+i�l�_/�{�19S��#U���X�>�SpW��c%\rQ\\�+�nύh�Oj�PJ�UE\"�L�iv�d���k���Y�h\'o�Gߪ\n9y�BF��|�4�`�3ȗ�z�C�E#���t;��L�f��K�hq�N���dr�v��(���J���\Z�\0�E7T)F߀]�\Zd[^j��a�_�����2��<�:��6���V����CRī��<6�~l�����%8���a�Ļ\\��Y%���E��l}l�\n���NBKF��>�����BP*��B -�drV���1��o�Z_ώ(����u��	�d֟Z~��\r?�O���<�A�e��%�j�*z�sG�~U���\"�����z�z*��1���p���Zg��d/A������ۓG�Eq��B��@J\Z��P�ͳ�M�������ƹ���2�R�+�B���S��Sd���.j�M���vH�Y�iS�������Zr���	�����I�g�����:�5=j��D�.w�]I�{�ٺ]�I(�/��zn��-�&\Z��9�V�|\\�9�#�k��:z�ڒu$�_����|d�\rk��`;���U���~w��:����s8Y�rg��y7m����toe�	/c�����N.\"��m�8���Џ���Y�d���kx|m�������~N-��\ZNe���oן�qLP���ɏ�s\Zv���)�]_���F?L=���B�������sI�{Ӕ��MX���B���鱹��ư���*�\"��y��dEU�b6�a2�-�{@:�.\n\0�2�-��{k��&�>V!�i��sW�q�a�v���?85��W��5�2��W���:D��2����^:FQ�WÕ�˿�H�Ѳ�O�+��G��E#*��TW3@��K�n\Zx$C\\��g�]$A��n����w��Y��Ȱɀp1eS&��\'i!����#��^��ԅ��J�rdx���n�ཇ_e+*|FD��ݣ��U)3:צ���5t߽��&���>2ɞp\'�)�5�%@�`�>T|Ye�Wq�~f��l�t���/��\"���@��(�ni�%N���0�(I�q��r^E��v��^�Q��2�U<ˮ}ɘ���h�Iq���OAE-�\'k\\�Vr��E`�n�M��E�=�8 �j)J���.}�-�=�����`��M�]���F�L����e����V�>�$_�)P��\"�ɼ��D�p!+cv5�E�tSu�+��i��n�ڸ]��|��5����S�^�ĳy���j�M�ݦ�9���Zo0ub�wS�Hj�6S�9��O@���v���b�?�a�O���*���,�3<)��D%�~/Ø\n�ñ�֝[:/�9�7@�I��G�����T�R�M��-�H�����]˓�|e.�ҥ��x�g��t�m}a@���yE�m��.q��#�.l��m��.K0��?ֻũ���\Z�j��.��[n�a�j����¢3kXA$�dJ(�=)M.�>M�^����Nq��R�!�&�y����s�������&�$ڼ��oL�/��y$�(Y��\rN���{[)72��KO��?�ۂp���ȏn�ϭdQA���TK\rT��������y�:@�q�ٯ�OgU��Z��ɒ���hD�9�΋gks�z���Ϗ�S������\"��C��������:��>)!)}�({��D�3m@޿+��:�L��vc�h��2��8�m��]=��W.�ǅ&?/���� qK��=�71Y��F�<�#�e�UGr/F�;��1˛�{[3�m2bN]k��EBo���\n���I5ʞ[�Ifz�\\`ܬs4���$�g }(�0��@>�,g?ַ���Vo��_�3��3�]����(�,�#�������\0��,��l\ro�˗@�$c��k�c�=�Ɩr\0�7\Z��l�����u�e��kҷ��٫j�,��x^�\'��ӺrJܗr���G��8o0I%��~\0�?ur�T�ytPc7+���^zB������<����`��:��p@O��S��;�;�e��DA�\\Dk1�~3�ε��ǻ�/V�F�؛\n�5+�RV��H5wyfycK� U��TK���̴ŋ���7�\\T{ҷ�Ч���U�o�4����J�]��U�n�D�6�Hc�1t@�-�S��a�b�	LW{�g�v;�˙��K|/�FL��qr���vŐ�̗��ӑ\"s�9����H!_���\r�c\\7������.�Շ\\uف��\"�����ܫ�в�y��]�~����Ǟ�0Iv��`�[��8YQH>�M�O)��\ru�����m($Vt�4�fZ��`��n���\r�v?扶T�~�!x�N�yPԏ|q������0d���3�A6%I�[�}R&���}�woP�B�g��8=pSz��Y�:����S�F=#S�@�1��7A}s�9~�����4o�Ny���{D�R���3��>��iK�\rOnV����^Jz~Ԥ!���-J)d�:�!��t�!í�� 1����V��u� �6����b�#b���3E\0f��)��vF��ň���͢C\r�^��~ZDG�B\"��\Zg��g��ӉҶ�ސ�E�S�e�v���9����1�t?	Z ��U��K�a�J�8�g{�Z���k}��:��D������6�%���v5�JMSv�a=E�<8uUl����6�\n��n|I�z���=YJ{?��I��& t|<w�W#�fm07i�Ӏ!�m��s�*$���^�dQ�5�?^�]VRL}�\n�\Z�����vZY$p�6��c���[��n�$��p֌ωū�H�?X��+���IQ4Q�s�D�7(V�S�JN�v#����*ѫN5��X�+	\r�nf\n{�P�uV��i��մ��:����jV�霹�\\\r�º끫 �4*�z8��7�B�.����| }���{xo,�k[6U\\ud��[��>f��^��s\Z��/���^\"i� 㛟��g�触��~z��Dk�ľRg.�u�������M���}����pʪC�*��e\r�!�d��=��zE��\rY�J�)��U���Is��^-G�`&�4���%.��ˠ\Z�FQ�X���4w�U �<܃k2{�eR�ӛ���\')�|�U?�|�`r���_#(�l�g��鲮����\Z��1S;zv��>�v�?2pu�V�����e_澜���$B7����������6LE�LfrBa+�M!L��vpr����\'\0�\0��-Д�a�n�H�Y�ըc�)��|����y!��V}��OX���G���:�ψ��8s[p��,M^^�����f,�\"��M�>j��Uyu#�Ay�������)���i��Is}��[\ny�-r�UL¹.X��/� m��aM׎���[k���Z|�a\'0�~q�t�Z���\ZR�ux[��L3NkG��WN��#*�Y��n��נk �\'���Zu\'.�^��9�\"@%x�T�Գ�]s�i�a���9��$������\n�M�w?鬳V�*�%=�Z��=y\\>/҅��1@e���8��AP�}$|�o��mF���cF�?��	�v����*.{F��Mk���Hz��Ymɾv���|�Ĺ1�%�����cwt�z�u���tQ����n�I~�A2�:�h�|��۰]���z۷�����X�(}^^��Ix�y��,)E�z��@BO����a6B[��tN�F�o��[AK�t���|��B�\'>�M~���;\'_�V喍�Y\ry.$�*�.�^?_ܭz���F�>0�V̧��[n��9�W2������w9���Ll�h�`���7����_�d�_� ���,n��@_���sfj�o���*��KK�ҽD|�Ϲg\"7B�~�$-���:#`�cs.��M<Ar�iwe�o�8�Z@<�)�Q�1�C�����\r���ú��Hk��Ӟ�2BC�5��K\"uO\r��bZ�!����d���d�/@����qMD��2w�c�do�ֲ^h��-R,�;DH�G��tE�_����ҷ8�uݎ��E�H2q��m$)$��xR\0p�]|_Tԭ1���-�����P�lѦ��gr�vث�|�\'����3�9ѩQl6��:qW��&��#�/�`^�X�K~������!�$��Q\\P&������@؉PL�+�-ȹ����u^O6z�a��t���B�(j��O�r�v�E?�:�k�m�͑�SM�{����9��pw���%ӽ��@zC��u�:!<G�]O{�W�h㓕���NmXCydSC#X�y�@����i\0r�SY�*�P?�7)kV��ܜ����G���_���U�K��2�H.�D�n�����u����l�$�g����Z2$r��=�b�N��T��p�]�l�2��Gx�N�z�\n�����Y�y?�Hx��R|DʳK����\Z��#��\0��R�PA�G��?����՟�(��\\ف��p9�޼.��V*��k-�2��ښ��D��/��(;/o�����ҥ���G�G�K�3Fre����+R)͒�U���]y�J�P͐�e�t˄㧬��u��Q���?ށ}o�}3rJ��(W��JO𮎱Z�Lr��XdOOd�D\'C�Oȹ����V�[��4�v\'��p|��tӻ�|�T_�}f�Cɇ�O�.�M\\gӈu>�dÝS1�<\0 ��=�YÝ��we������|�����I�8��w~�2��m�i�r|�{3�����ۗ����r� b oir`����.�@|�C�6��6��K��/Ɂ�y�#*�����2��,����g�{A7�h\'���*^������!@��k��˅��{��P{}����D����a��5x?s�V<��\"�֘35{�F�m��#m�6��7A\"s��G�(U�� k�M���\r��F�r��ku�?�!�U�\rQz�����1�:�\r�mً�O��l�u�n&5w\'Jo���n�R7�BH7;��on_�,Qy���l��9�RUz[���P؇�c�Y	�ZyT���%��|�e�8!ꤍQ����q���,\n\Z$hVe����b�[����	*��-�ӎ\'0�AI��\n�@Wfנ���7���t�u��C�S�������i\Z��;rSt����\r�T�wfj\Z&��f2�&��͜�<I�L��7���)l-p4X�ڇ1��d�9�NuunX����h�m�������|m���\\{���r�!��+�zW���9�+7â�I��A���X�7>�\"�:5i��$nN�ϒ�K�>}2~N5uǽ�#� �n�}��ub��k���\Z�\Z=m$>%p�ץw`��G����aɑ�����to*?М�I�0+��6����[[�+:�&?N�DQ�=��a�U��ړ\"\nh�U$}\'P:o~]M��*Q�ߤ��;�}�Xٮ9�ـQ�p��X7�N@{�Ij��p�$Oy��p�z��\n�����/+oM��Xav�~Lc�V,�J�`r�\ZԎ��ɝ�\'\"@���P|���,��:n��r&^_�m/,,ķ�p�e�ᤞ;w�N�a%ɂJx7Q�p���w����dpvYi���C��ܶm�A�<7����?UsQ/���S�ϝP� �=:\0k�Ag�@$Qpnʱ�����2���B����f%�-�M4�X��Zr�j`���Z���\Z���QY!��\n}�I�!�Enb��)���8�~j�y@_�/b�܋��\0c��\nendstream\nendobj\n20 0 obj <<\n/Type /FontDescriptor\n/FontName /NAZTKW+CMMI7\n/Flags 4\n/FontBBox [-1 -250 1171 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 81\n/XHeight 431\n/CharSet (/k)\n/FontFile 19 0 R\n>> endobj\n21 0 obj <<\n/Length1 2167\n/Length2 17839\n/Length3 0\n/Length 19135     \n/Filter /FlateDecode\n>>\nstream\nxڌ�P\\��\n���4����%�4����!�w����;�s������ޫ���cښc���$J�¦��@	{;Ff^���\n3���������B����o1�����ގ��N@#����ˇ���@����`��e��ef�23����މ f�fi\n�g�����(D�<�,�-\\>���#�ڄ����E��;@��dibd�7r�\0�~�hbdP�7��x�Oj~^&&wwwF#[gF{\'s\Zz����@�tr��\"P0���#@����_rU{3w#\' �C`ci�s��p�3:>�J��v�2���=�ߵ�0��7ܿ��\ndi��������������9���P��ct�p�ٙ�ehd�l��o�fdicd�a�w�F\0	ae����s6q�tpqft����\"�_a>�,ng*jok�sq��+?1K\'��G�=���Yk;{w;�3K;S��H��:0��Y:����m�!��#3�\08����x�\0@G\0��Ă��j����,�?�z;�;\0�>H\0}-̀?p��Fn@���+������Ep,,\0SK�1����O�1��_���N�\0��c0������x����x�1���Lb�*j\"�t�b�_������������`�kȸ>|�7���K��,���?\"Jۙ�x���x����ﱠ����\0����Y����.3���������������m��oB�66��������l-m<�m�1ʮ.k!o��v��T��U��Z���_�����zۙ�������@S%K���������d�l��e`�h���},���ǅ��ѫ�U��}��#��L�M�Z<VN�����\'�G�?���cCM��6��������A�`f��WG99\0L����8L\"�Ǥ�A<\0&��\".\0���\n`����\0L��GL��\"nf\0���a������ .\0���2��>23��>23�/��Й��|�?v��$�����4��?�������������c:��|P6�?���RZ�	��wu���q���-�?�b��������?�`o��D>������j�1H��dj��4�����H���#���[��h��\Z�,��:�O��?������(��;���O�B�@��������僼�?�G�?g|\\ L.N�4�#Ew�8|Pv�����?�a�������#��������郭���������=�&p��&|�V�������{�f)�4Si���:\\����h�27��{P�vĩo�V�_�OZ�C[�۞}^�T�������&N���	a	Ԅ�}^}4��[@�P�8�r#)�?��Iz�����}]�Sޯ┅)�a�R��\r(���5Κ�!�ra ��E��@����E�>�N,G�{\Z�V��y�5�q�k�\\�չ��3!�-��4���a���wI����G!�wD��5�C֌*K����\Z���N�ݜ$@0�\0�nBMi���\"fU�A�K\r�5���Ld��N���*�`�g��0��mq�����\\�><2�p�5��a�id��W�X�_��ܝ�V�B\'|m�7�0��e�K(��B����i���[�	�e����37d/��9G���hߊ�K�έ9�Ew4��� N�w�)���l↙_�s3Ļ��n�P)���ʘ.�*��J=���9�~��KK��-V��zZ=��3�kT���r�+��F0�6����ܙn���!��yd��xY�&2�K�+8�[����.g�4I������^Xc�357ۦdM�OO;�]E/��e�bT�����G��>�zKb�����BX�n��Yk;�A2Q֣)2�W��:��4~��૪=�ym��.ΌN�{�T���5�8\"��m�(Iw�ӯ7?QG����7o��ׯ�d�\r\07O�� DȠ;ؘ1&N�\0�T�r�t�	�V�^YBO�1͟*�uk70n�C~|���%�S?����L�>�!��l7�?=wײ�b!1�dq\ZN��F\';�f�Џ�$�,D+��5d��\nc�6&��\n��x.I0o\r*��۔0�r#�r_�����Ke�7T,g\rY��T�T�����<~�uS��Ģ�;�Gb��o�0r���\0{e����x�i�/��YD,̥>0i��mG��M�K���9��G�0\r\r���ø���\\�\'X�c9�:I���J��,�ן\\&�@V��8�Z�}�d]Y�؞��EA -ӱ�\\*j�g}�<q�޾�Q�n:^�붶�+����d�K��U_�U�`�D�1o����y����\\>��͹������\0s��8�Nʆ��<1KmF[�qM�x���[rD��(L���dv��*5R�,��^VE�Y��JNi%rr�磧�f��-�.��9��p�� ���\"%+�y�q�W��n\Z����r�>�\r�����9N��6�\"�����<?\'J6��e�LhpF\'��^�w��,݉��y��R;q�H�o\'�1U�m�(�XQ�[�*�d� >�v$�3�����?��ˢ�9$�I���錄9�[;�����q�~П�����0����_�z�e���J�WAi�Qd��\\�s	(l�$��dS��!O�����\r\0�bI0����;e)��luU���C	�1Χ!��]��v�����]E4\0R*���ɼ-&�eCQ����m�P����\n��\n�5c\n��TH�\'���܄�&���,�\n%q�\\^\"\ra\ZU9�}�2�s�2�l����,�J��.xj��%-H;	�xR��T�`no�%�x��>5l�]�K0c�7?Y{yx��M��7��D�]��wN�95��F.��0B�,\'�LY ���<���vL����$�?���ۖ��zMFJ�A��ٔ=� ��B,i��h��h��B���Z���^l_��a5cv�ID\r��u(e1v�AL�{<@��Lhi��b^�(�T!�)�ߺ�<�G���V����,��\\�~�G\Z��x�����b\r�̰9��6��ܦ�p��1\r���c|��BD[�;�V#O7h�����{�l6�B�\r�PC�o)�}<l	�R�Q1{˒�����Q�i����t?m	�Jl=�J<��\Z?��ujD�PۘWvg��TD��4��\'Ϗ��z}4bWf�������Q�\\<V�wַ>�s6�ΰC�놁��?(�] ����ՋF�,s�/�+rS댐���!���|�L^2��eg��	\Z*#��p�/�w�4^�-,�3��5�oc�&���A{o��jyDsej/��+�9@�����d	k�<�\nk���#\n�=��%,U8��\rΓ�J\'ǣe{݅Eص�,�Ax�Q�=_u���=���RZp�\0�ñ �]��\'M#!�������A���M{[N�C�r|�0���ZK�d����#j\"a�&��s�5nW�kW��eҧk�Kz?���i\n8�����!�T�@ԅ!\\4M	���ÔM���m\\T����m�\n�t�����b��n�,¯qiwK�%�N\"<��1횵E+DY��\\�L���K�A��B�\"d�Asf���l$�����\"�Ë@��~����<���W��lҶ���&������;w��7H� ���h�Ylu�Q`*\'LH�+u�mO�����v�N����+�,�~�r�	�2ܩ B<uZ�|�UH,<r��Ll\"�2B��\'�\\�dewG+���\'�cռ@�u_8U�1~��#U,��>2��K+����Td�Y�\\6����ԃ/A[�f���;�P_pgj�/oT�U�B�N�U�+�\n�N%m�Tǩ0�eH���L���^�D�Pq����t7!�.�wz�y9+�5�,IU� \0�YYhYzy˅\"�=9�K�������%�b�.��H�jnը�Q��7�����f\Z���]��\\.<u�\\�A��T:\\E����D��꥾u��F����3C��|=�U��\\Ж~�04���͵��<���Tr?t\'[��s�$����+�ϛ�im�J�G�o/�30����<�aHDE�#��M`5�>7�^�3c��o;��;+���3L��UM�eP��;��@kF�AG�i��Q�}��8ܗ�Hg61��Y�D�ˠVīr$���VA��v(�������^-P�|n��[���Ps�eh8��=	Xm!OU�/�C���U<�؋,�\'�\'g��0?6�K$\"�o>���o\Z��=(y��K��`�Ck���J-`�h�����p,_��?���%������<�vf¡��S� ��%�&�z���~�hN}SꁩL��\"�S��=� ����K�BΣǉA�d�YIcـ�6|d�s�Y!ק\"�O�\"bd��ģ� gQ;���C��\nbs�|�\"\Z=���߯�ɪ d�9��w�0��D�R���lwAY��Jj��\0y�E����oh�qY��В��d��S����NŗaH9D��AH�\r,}��Us���/�X1|Q�D�Sg%�\"�������5⪸f8��C���q_�~����t}m�zl(�b��VťB�o���u����:���Q$N�,9�7ъ���]:�h�F�r����o���\Z�b#\'ʒ����K�s�[�s�)܍��bU��\"�Wb��BSe�g�!�,�2�dC�{����8���d��!���\n���]]�0\n�J����2[��\Z��������\nC0M2���tz�H2*\r3��W2�W��ФP�����9�����*�=��z��iLG���E�6�^�U�7O#����d��D�D�4�6VD�����45�Cf�\0|VoPӰ��Uhʎ3�f��Z2�>c����BUU�uJ�Mer��Jz�0��lzW�+ði�I0oG�DHU�2���=��f�%H���QS��mT!L��پ��{�#ۄ$��29�xR�m��/&3_��䌓Ѣ�R��dԊ*3y�i�9b-M�Wߗ���f�(}x��E\n��A�΋E�w���hb������ډ+��m�f�\\��\0�528�e�2�U*Q�\0�4�`U�W¶�����B	8Y��F���i�~&�_�l�5A�婯b��@���V\r�촽�V\r�|l��+\r[��mr^��jH��_rog�zFN��īR/>M8��,Y�(Z�f5�g�8<<!Tp�z��;]%�_\'���8��qt{~!y]כ�z��:ER��\0�tɡٷ䕺��T�[��4\0*Jht�9NAa	��n�1H�������!�Y�\"F��m��q�kGgkT$ʓ�_Am����N��ɖ`�-�L��,[�=��΢��Zl��dЫu�\n�I�����-#\Zո�N�X�ز��1WV���h]E��Q�~c��+��d�C�2K�3�S���V���%���\Z�\n�0�g1_(�}�2sr§�~P=��G�%��I�;>�P�\'m��N��%lf�ڨ����=뻽W��3h�N(G�b�w�1Q+�D�*���aT���Xz��V����V��I��b�w��x�`�>5�R#-�]w��F� �m0�|���|Oi���v+��2�.�_�.�8/�mt�ɞX�6�(����ϼ}���,?�\Zl���]�����B`x>�Ęka����+���Lٞ�φF��hEC��:U�(�3�c���=�xݐ�FD��^��WrF��h�V#��B���{��~������i{v��ѩ�v�H�HU6��K��#�F�\"��ψ�)���/d\r\0��%=��y��?���[�F��u_���c.�*��*Q06�[m��ζ\'��Z.V�m���6?67ڍ�u��șN��E�z�\\o.+�{�m2�{g�b��e/�J��X�J��r���f���]A�/����8�(�N����k-��\"=��������*�?x��W��l�#�uo�_�9\r��>��L��\\�%~Z��2�x���k���VfU��kE��\n����j��rfY�P���~�ϖ6��O��\n�{�n��xjڨ��Vq*�R��\'��3@&��N�{�$�M5$�����1�%�\n����K�{!��@-\"���?�{���!����3��/		X��kZ�ʷ�	�/�\r���:����Iim�B��.u\n�P:�7�yK͏OT��\'�m���%��S�iB���=�{�ןK\0\'���K���9V���\"J��q�+��N�Re)�\r�y�5G�]���Y���R4���A3	��*��g:il��z�U�@��l_|�n���z��D�9ȝ��C�W�,�B�,\r׭QP����\"�T�=Z���>Px��V��^g��/�i���\\�\n�`7k�k��Ye\\�S��W��f \n�s�}�����,�9%\nzSu�\r�	l�ꙻ�dk�хk\\r9{{���a�-�� ã;*\\=�\'�J+�a04XRY}�S\Z^�8-�`�N��wX��lX`���V��k�A��{	�M}�k����D���rAȭ�f��xl7r��za�;M�9z�(��YaK�\Zf��� |af��=\"C�P<�,�$W�i���T(�~���󕗳OH�o~��|�*zx!��Yټm{q�0�E�¥*<k�\'ܸ�:Ӧ���Lݵ:,�\n�+,����Gd�Q�N+�����p�ʮ��7�1�zYbPث���$����L�ԗ��z��\r~�n-^���UA�;��\Z�3��5U��A�u�Qe٤�}�u�jG���ƥ��0P�Ե��Hw��C\Z��Ȅ�}��^m�B�¯��N)|¦Ң��La�pV\0PN/�Q�+���LYv<��\0Y��u�B�=���J�2I��>���\'캩�1�֥))%�n�*�3�]�a�Z�a4q��E��!�o����@�~�R�+��o����E�s4vZ�?H�2�mZ��>Lb�dyLl��0��m�5�˩�w�I�`�+�[�\Z�]Y�A�PAE�8�^Ѿ�US����t�W���bʡ�>^%��,|�h����BH�*]�f7�N3z.\0��zBJ��x�����#�8_t�P\Z�BʌD;f�ͮ��ãE�ؒ\'�h�����ܘ�.����(%\"lc�w��>oo���z�O�x�}��|-t���,�C��y��h|LE3�R�s&MC��`|��nH�%+~u�L�+v=~3yѰ:���T�h��AҠZ�c#��w�{�N�V�r*�}�H\0}T�_Nn^G{\"�1�\Z0R�e�J�3P�Q�\'.u�\'Ҙ�O�i�V�]�pgpUK{֠I}�h��\r\nRÝ�\Z>3}��T#�3�I��\0�	���q��N�QJLMZp�\rt`�<�6�z��ax������\'\"Uy�~Z����]��Xaq.~���\\��l3IE5җ�\'3�e���[˴v�y�����c[��d�W�����!�`0�U,v��>�\Z�|��\no�Gp��IxK���w�!�{�}8�����D	!�Y�\Z�(���pOH+m�x�\\��Eg�����w#ALo�~������/��\'��ϙ؜p� Z� aH��e/�Z��B�ҭ��ȼ>���7�@� ��g*��)��g̳�s�\n��z�%�t����X�r� �cϨV.�%+1�\\)�o\rV��T����i�I���%弙�ov�ib��P������0y���XF��6��o6.L8�v����^ͦ1G��$�~�sZ|�^��C���M�	�eH]�Y���^%�k暴��3�2���ʁ�\r*��$+}�{���)��$�-C�P^�U2�^)���.����n�Cz2�G�v�$� ?�V�P=��ĊRW�BN%8#f��w�}\n��AZ7���P]�x�ƽ��\"D���Z����\r}��f�삛.Dk����N\n�,���N�_T*C|�f}������H�!�o`I=����ӹ<�����ꆔP�ھ�ezK#^��\r�T���1���:f��u�^1՞����S`�ƃl�,�uD�o�~a��ȺNDh9�5g��B�\"j�V���(y{�k����p��l��^8���2�ZKȀ\0���@m>b����oZ�S�&� 6\"o`9/	��Z����8�$�a�r�Ė� ���/S\0���GԱ.���;\'x�ږ\Z3�8G�l��)�2`���\r����bK�l72V:�#��,�Ő@�X(��n�v�=!\'�\\_��C�U嗨�Ԫ[��!+N+�P�G����%6ݥ8[A�����)�]%b��Kcϑ� ��õ�]�zT����\'���\0z����(>�]\'���&�Gxg�$�v�<\nJ�]�_�\r�]�2��H�2��i}��/���F.��7S�0|IS85X�*���r�w�/w�w�̇�56�a5�C<�4HN�k�4)�{~[��\nO$Z���eG E��������o�6a>��Do7b��L�7�dkH�ݠ(�R#�8,o����u.�P�E$ޏ;o�Y�%eg�����J�(ԛU��\n4��X:޵�1L76��P&Nm3#�����K\Zz�U����+�����ak?靧���\rŜ���nX��;_D6씈Ň�9b��x3����s��k�[������R�-����<���^DϨ��<��؆����j�n	��DU��ވ�d���|�Ůr\'F ��	}B14d���A�(M�åC��X�d]���	�՟����kY7Xu7���J��AC�bIXGM&�0�И�-�� �e5�Y�j����3R����e�l%M��]�-߂�C�Kwo(�	�B�ǹ%R����p�lS��)bK�\\�����Ο��_�|C`�}�������{ϴJ䞋5N_�3�1�̭VI��;C��5/�FR�Q�����V%��ȭQYۭ��=����4\'���N�\r|��6���.���0�E��z3@It�X��0��.�^I,)��ݾZ>}�z��bS�\\U�WMͣ�0����u���;�*�O�.�̒� \\���w��O�l�Y�(�롎��B_�������1�,C�5W�!���A{%�\"��2*{�C�O��9�Zyi��pگy�+m�4�ڙ�L+L�LZj���>[P��9�����@qUx�iVp\r58>\"0�����T��e���!�]�r����F�˜�mW�s����w[�G%=�B��S������r����ʜ��3���]05#�}6�M�H#�g�3�������\\�=�����Ν��Ag;s)eb,���m}��W+g^��bEV�*$�҉_0X8\\\n��&Y�<-Yn0c7݆/#$Ɵ���>}*�t�^D����,ty�f��# aL\0<Cio�lEڎ��tMQO�|1��F����`�����J>�Ҙ��`6/��_�����&0>���:�Xe���������\nU�A�$\'k�6��\Z��� 0��q�����P?l*}F%���Ty˖y`�\"����zB�x>�e���Ѯԉ��W�&��Ѣ\0�����uދOY�t@c�8�4߹��3�\0M�ӕI����T��-(4��>��ć�����ҏȌ�hȵ8Y�\"=@���҉|麐+�X,�c�$J}\n5�� ��l�?�-����U���Y�@E@AC�v�}�I���ĪB���>���,@����\r�fkT���<y����x6����l�5(!��G��Ӳ�{7�>[��̙�kJ�N�7�Ȗ)^(�|�w+���b�r8����-���r�����[bg�I����/=��F�;��Z�㧲=���2�]����Y��Ы�^����wX���j\Z�s�9r�����i��|�?8��J�1�P9�]T�Z6|��_����q�ZLbA�`	}��\'����z=�v�*DR�L���P�\0gChI}vx�\n+\'�%S>�pW揽�T�^�.\ZE�Y�x�i��-��Si��߽���8��֗�`$�\\Z����I�u�_e��������4���X��c#d;���N]��8�v7�B�-4c�����7���s~�0�A#�O5ė#k%b¨�����f�O8�BW�Ɏ%	Z�����6��0�J=0���N�������l ��v�Y|3Y$	ek#k�Ȟ\n`6+�ӘӺ�[�3��ͫX���l�-n��l��[M�:�h?t{�I�G��9�â��!YDOU@�}�.I����]D�w�Tm3E2s9��\ZvA,&�yP@���\r�z�](�4KUM���U�&}�q�W�!q��\\�ah���V�^*�Ѫ�R���oSܻ<��s�>�C���J�8mx.&xOG����n6a@��\Z��.�*��j��\\�`�H��+\Z���h�ď���@Y���Cg���H<R���KC�\"��ކuX�I�4$g�:�p&�y�덞�7ұD�i�x����x[Ӆx�6����$��z�V1F�{!দ��\"��\03:L�}+	\0��Y�x*�^ �kjG�7.��v�$�\"c��BD��:l��K��ey�,廎�$UXϙ�(̛�NNy��P�� �V7L��\"�fP3Wa y�M��Jr��e�H�	�ρ��pa5����+�fhHS�πA>������n�2��Y�ֆ![��le=,��gU�\Zۧ��Qd��	\"��a������谘M���p�6�7�u`�`�J��(�I���(�4�n������k�dR�r�J�M�)9c$ji<vqj󵻦��X���n� CҺ\n��z�$tGR�C�\'��7����H��~X>�t�E��	f��h���Rͱ\n�N�$B���~P�ǽ\n\0�3;�=�̺i��K��$�Z�e|�}�Z��I$�Z6a�\n��?�З��n���%3��U�i��Ė��9�����N}ͮ�4�Od�J�n�⬱|�\\Q��p7�[�JPFق�D�����G`�gn��%�5i��oK����&\r�ν매^����X��d�`nˆq{�)�.U\'����RF�ぃ��{�i�[�\r�u�n�/���aU_�|� ��L���Mql����o��v���N��HO>��/�A���,7�bۣo(l�p6,�eBފ�* wl?8�~�bT��pkJ)��m�W��BRy^�rh\0齷o,.���m�$�p�@\'�C��}�?���[�f6����=ͧW�_QE��V�t�B��2����z�F�[Uv@}��~�$��JN��+��w���|�K��#��^�$�jLP��.� �\\߅E$9�4�Yc�6Ò����=��qB ��\r)�h������Txubp<��(=�)W��.��{��6�r0:�2�;��8�$D��0��1�~ �mh?�Mhm���A�wHF���в��B�>]�����]�g�h�,�$��\"-l��9N+K$/*SO�(�^����i�9D�ٓ\r����A��n�	�\"\\Dax���v�p��� Y�ވ�0�q\n�i�$:R��+��~�{j����o���UJ:^u+)Fz��8\'`�E��A�*�sKQ=�-�s�m�ad嗆P��R����!3�ʙWy�q��I�-����[\"Y�,7&�~Ўvo������pm�ygAL�޸h��j?�҈�P mV��6P��o��CH�G�\'��Ka3q7?��\r�&^���-/�x����4��j.������Asغ�H�c\"e��W�O��D3Y�a%93\Z�<��$�$����y�B����}�q�\Z#刵ߊ��XsN8�Dxe\0Qn*Ip\'�����A\"�{�,��\n5[\r�ܷ1�6���/A�K�^�뱵��,�����)T��5����k!Z���3�k=�#VA�C*S�� ��5]4��ع�Lg�j�Y>9�$`~���6�9�1�PiW�*�kQ�\\[���S��\"R\n.1�S��\n�3;~��ݤ,�gl�z��AJm\0���1%c�V��@T�\'��\\n���1��u6or���p�d�j�Pj��l��R�XҴ!�L\0�^&��a:j�C��0�K�PZk��$��ve����+C�c0���at�p%��܂�	����;KB�ϊ�	{�:���r�ӭ-�5��Re\\��k��x2�*���H��q�$����P\0��4TFd]���g�nJ����\ZK�I����r�ߜ��_��l��7 ��\r�q�m��\r�4J�}�~-�>�F>��/�{�\\�-(Wt����j��poԦ��8\n -Z��p��\\��T��h��IU\'�F*�)���?����V�gTC��C�7Ѐ�{��*�E�(�8�Y�-��ĸC�s�0e\"��V��Lr0�\Zr	=�H0YbD�y�6��F0��M�^�l��e�zj�������E��IE�������\r��B�n�4O��F�����o5�U_IVwc�Bs��}rn���g-�ŀ�OMg�xYx��D���C�m���s�v��W�B��ǖb��5�ŭ߇�4���d\"��7�gK-4^ڪ\ZK�Ά�-q�u��O�������g<��+����]͓�7��ސ�N��Ԇh���nL|�ɱA�U���_�bJ�ch�>m����8R�ݾ�������7Lg��������ƯE�H��Z���OM���<;�\\��<CcC��\Zc�\Z�]�ћpw���5�_��\Z:�ǯ��X��_13ę��9��,P\0xҭV�]:uU\n^$�MQKS�d�N�(?	��Em��$��`��\'Y7���X7�K�D2�4����~\r�n��Ai���,7�Ҟ]f�G�R��,K�l��%sgR,�iN���đ��v�����W�i���������4]o��$!����/.��������}����Ă����0� �2�L�c��<�\"R��w��T܇�޾�t��/�/ k�t\'�a�Q��_����!�nRK�s�Xz�`��R�r{E����\n��h�W����d���M���Ο���?�?^u�49�Z?�����B�5�X\Zq,��0�y�D��N�C?�6�6��\'_�+��c��AȹA�����M�ר�4��A\rb<�҇z��wD�ZX<�2p��63�\n�1\"<`�k����B�\'�.�J��\Z~R�ᕻx�:5�n�g�����}M�9\\B�\0{}��J�]T�`p_6\Z�Q��=i����ꫪ~��f�]� Qz-�d�����Ua���%\nH7]� a�ᓞ�稻g;������{��{Mu�v�w��\\�br+Az�\"*�F��6�o��\rf�%����lA���\Z.>D�[���������Gj�����\nN�o���w�u�K?z&:Ƈr/��b:����5��T��J+���gW�Wl���XWR�9I�d���_!9��ɜ�c�n�.޲��l˶�j����1Z}�U����W |�i�M�ZV]�Y��A�6��V�ABL�$\r3�>���|=E�H���DnlqA�^�\rT���pe�qrY��|$v�y�T�]���kd-��v\Z�r�~�X�iys���Q:�i���p�����@оZΛ�Ȩ��0�5K4��QdN!J��d*Y;�U�R`Sy�l���8�LT�5oQ��s)ǖ���%g���ʮ�3_��E>��w=�sXܙ	Nf�t�Q򎀉)d^����A��m.>�p�������e�4އL^�`�v��-�`w�}�2#�0[e���h���G�g��dC�5����� G�\n-�9z��w�3u�B�S�6�[H>0�O�����F��c�J�0wq=+՚<�`\"����\"ii(z�ˇ�Zo�Z��s7{d$�1E�x�ɐ�fq���$t�jIS��6SRn��\nP�σ?F��}����\r{�B��������ѝ�����E�Nt���R�\\�8���12\0�\n�O�c��U�i�HB%܊%�ۂ��,�ޕ�4M_��׼��<��|=��j�G���/G3I�:������Z%�W�+i�:�|G)G¯H^��>�	B(;ÝB��T����Qa��KJi�2�`//��@qN�a��Ioq��\n5^�N�(�w +�\r(ZS�Df�0<�0/�i�pV\0x��#������H��d�o?\'��7�_�fkaz�]q�	!����{������K�K=�f�f�%�x��Ɔm�|�\r�#�ܻ#\r��^�?�!�L��b�țr`y򕲭q��ǰT�l84rdh�P�f:��Lϓ������H����Z)9�E�������K8^��+r�y���L��	�^�Zi6����Ņ�K����U�׸�h�g��)�w�>���_E�UU�t�YL�w�\r��!����D�=�&���.&*(f_+���ީ̺R�6dpZ�+��,���Rv�5?�\"��8x���&��ޏc?����5���G�H����8G�`n�s)P���}�jg<o�Ŀ>��#D?�s��C��*��C��W)io����T-b�D�ŸUn&lH �`���\nS��?��~�i�|3S��6�Q�ق��	�?��4�W��A�W�ٝ�5td�}���[B�)��x�r��2(��=+����gf,�\\���CK?�Y]H�8Hw��z\\W@�Vx!�2$r�tr����\'�$]ǯ��8==;�d�`\"�J!���w_3�?��JgU�nK7xv;��`�C]+P&�[b��RhB5��x�$9)�N�@�ʚ~d�]���XR��xA�ݷ���6�j+�ɮ;>����N�~����,f�����:����=ГS���nR\"\n�6{����뇈(p^:���t��/�+|�	������f;����g�~��R�#*�u��,y@�I���u���Q_)�\\��0({�#������gT��\n9~�`P�CZ#`jZ�����S�(�M��)wt�/�|=�J�\0}����&#&�ZR����܎��3q��=Nb��i�O�%/��Mկ0��p�¬�!�^;-�v�Fb�F�0���-\Z㺭�Z��_���}���.��ࠅ2?t��u�R8ɍd����o��l��%f��J�;�NFGV�kq���4������U5&L�w\'z�¸^���\"CL�z��U�t�0g��_�(]g��\"�y>7�ٿ-ӎ:����X^�08$��D�dl�=���a��E����\"��I�[�j�S��+�zY^��nD��6D�!5]?q�#�w���Ff�g��bCz�P������8�늲��<�B�z*X�U���0ɛnY_&ij~p;���\Z�����!@��>�p���td\\�Tb�Αb��H���f/�v5����?�l,ߴ�WQ���`a�d6e�¿\'�����z�FѴ��OlG�#>[w:(��|:��Z=��h�a�*H9�)Y�k�L{�!��������o]|F�X.�����o�d�e?����\Z#�[Ie9\"E��i�)�j_���c��{|/x��o��91��2�Ü���G3�x�\\��kB~PS���jR���i߇y�m�)��?���n�!уl�$�к��:x f�/����\r{_��E@�cQ�.�H�:���c�ƃ\n[Ke-K���D���$b�/[E�|�	�)sy_�l�T��)����z�!�n�Ý{����H���*�\rz�=F���C>4���}��~\"�\r�9���IV�5:�	?��e��R�Q��\Z|����x���u��@+���EM�=u��q��~�$�rG(�����Q\n뫚��v+\n�1n��8�^v#�)X��:���9�&��V��@�D�\0�U���?Xe[M�3+{d)ڐ�y���i�%`�\Z�������v�9JUK�#<&=�����u�*�t�ϫ�Q��7\\�S�䉳�w�o���N�ជ]܍>yY�\Z�X\Z���L�-%V�^,��;{�׎<J��ׄN��0��I�Cl&���=�,��5\0�)<�pg�_�CIۖnkl\'�qݫ�v�|uSy� �cǋ�i��ME,�eQ\\�F�R�8H�=g<#���k\'��$+L���v%�����K�x\'[��)�U�����lHzTD�K]W=;��Fy�}�	���Wv��8L\Z;�O���؟����^@����v�r\"IA�A0�<	�6��.ݻ/;�R-J\Z�Cx���0��2 ������0��E6�4g���Ax����D���Jt;i8�E���D��8l��i�y�Z��\rC����R�m��Ⱥˋ��R���ϒL\nբ�$���\r���!����E��K1H\'������L\r1ľ�4:f�iE�P8lۛ�2�5�y	$\\2w�Z,�sR���\r�,�?�s�9�N9��沓xy����a\\����v���O����y�WJ)��1OS�ђl)�㴉5�q̕8�p�3�P��L�)�~]���iY�\'�u�a���}�*1�1u�|�9���_����9���G�H���|�-w�>�c��\nI+�Էrq<�(�UC�o��\\�	���\Zo�.v	����ҷ�_�g�%}��j,���e�2��d��T�E�2��[�!o)F�H��b�R�z��sޝ�O�5�o���\'�r�y�-���=�P�_�����M�b��Hw~���f�p3�wacۈ(�B�k3�/|a�Y��\0e\r��	P�9��^\\��X�Z�O/5������=F����6���%͟�{�3�����)̧�\n�������΍*�Y�X��X����2k=qy�b�`CLp�3�C�Sao�2\riJ��.����ޤ\Z9������.�P�j8�t,�1�#��^���E\'�[M6����L��3�Lw�5�a�\\�X���A}=����w9�aD*��f�.�bc�;����h��W��ʒ��Z�o:�\Z���vR�[���j���AE���Q��*\"�ɤ�ZCR<a�̽�@x�\"�&���i�u��DEG���M*�E�b���R&��\r�-Q�T�w?�<��tK�]�\'����S��`��ý�Ϛ�^	�[i����j�L>��S���}5#�m��(�T���5	��\r�߂�@\r��7��l��,�[B̶\'D��ˎH�&CS�qs����\'�[Ä�,�Z�Ã�̎�\'�c����eu�%,r��-�A�k8TF?�!�i�H;n�)8�$��8�<��-�xv*��u���Y����K�v��j?2% ���W6X\\���ی>�V�)���)���F�$�?�z�N���`�ŋh�1��\Z�j�p$�m1�s��sz8zh��0۶[��(\0+8j\"���(�ܒ����,վ���t8s��K�k����f�/!�>9\r@_@9b-��ɜ��P�<��*�K�^�%b\0��c��^���)AP�,����@��Y�1&)&P�l(@�_0���}��/��8��\Z�<#��l��8L�۠���Sg��a+���F�{Wj��*_H;�¥-�;�U�	��U�yj$���8�Y�~������\r;�g.�:my�F�(H�,�h�S\"-��`�$}\"dfAj:J8����� �Z���@�m��?�P_�t��XV��l�҅��Ӣ�a��WB�В�K&R���q5u���xB� �;j�ۺ?���h�!�7	U�PD�v�U���{��k�r��ˢ牖q<�=Sp����n�\"���^:�y��D$m����/�w�\"��(���EPx\Z5��!�s�h�*�3�\r�d�JÜrmw�h!E�	@�勐��l3�;E��8���\\�Ɇ3��)�`�EɅv;Pf{N=��n��Nd�U3m�Q��AB��3b�R�5!��q,7��_/ӱ��00h��;�tz�=Ω��Yl�Ž�$�7e$�R���k���O�zG����8��8ƅ��<�X�F�Y� �P��㫧�<�@<A[#�R��/Yz(KJ�Y���5���z͚�i��H�\'�R�=�|N,���.�Z��1\\N�#IQg�2�G��%��gUA�\"�5�c6�Yk�����Ul�o��/Z<8�A���>\r-�\'21�m^����_!��%�ǝ���}\r@m�sj��C%WQ��ˬ�\\��O}�v^`.�������^B&�{�fȇ~�\r�0��L�|���%BWCݕ�%�@ۧ��\r]�`\r�K\nW��=,}lq�[F���AC��={�r�&w�y�h\"���\n�\0��e4�@�W��|xyr�\r%��\0f� Pzzsd=P�~��r:�;�2���ץ��\n�n��lx$�Q�/,�i�RV{���������7!�rb��_\"�S�������7%T���^RK���?3�؃|�A�I�TOj$���t�+4m���\r>�Ue_�3��I���H�����Y�X`���D�-\\x�^P�]%7��E!k���R��b�dE�������v �>�Qe0��5QMu�?�	Ԍܳ�|9\Z0W�\nu�%�w�L2�s\r��������\"Ш&�5N��#����Ⓖ��E�\'��v�gV�*1t0f6�mN`QҔ��p_�4)�eLM;de�L��K_�b�GCO��GF�&0�b�s�?WX�V¹��3�g�LN�T�2��_��S��p����l��\ZVt�n_�d��T�\"3��gFݠU��\"�An��Cg{�X>4�`�\Z�plO�#�)�Z�]�C����<����с31T��r?%+�#��hjWL�jP�ճ�{�a��A�=<*��Z@n\0}5�H�񭤅�1�|$���+�WK��\\8QUk!=w>_��e˧�����>���D�\0��_+�!�R��s�O�<a�J��\0\"��&���@���͛4�V�������\"[=d����$�Ϗ���YNR��\\�%:_@�sr�:�Y��V@ŏ�;�C���]�?twX��&�_,z�PK��jYϢf�[�����@%��y�����4��	�<�R��w�&�����]Q)�d����9QO<0̸����VJ�\n+�bk2#���a�m�2l9=��-{��j\0a.�j�7Psls,�3�KT�w�\0/�E��\0�`q����0���-��.FV\\Ҁ�]�[˖������$���!��VN��l�J?�qI#MȻ���3]��D¥4��]qpY*߯�N��d��ޢMkYӫP`r�\\�d��$�\"�����$mƷ/,���1�8t?���\"��G�����<C��8��t^�M@2-�Tn{�gŔww�6�z��F9-�X�Z�ͷ�.[ZX���5�\Z����h��Z�tLLA�\0�7^0���2�ߓ����W}fΨ������Iv��芦�	�~���FP�q���ij�n�7�>�\'�]���1׆�r�rZ��\0ƕ��\"4��>rȁ��q}��wA\n��O���U�tH��14�w\'�{Z����P��i��~�Գ|i�b��݀�!�K-w�],��R�$���rt\\\\������c\nendstream\nendobj\n22 0 obj <<\n/Type /FontDescriptor\n/FontName /DARTBM+CMR10\n/Flags 4\n/FontBBox [-40 -250 1009 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 69\n/XHeight 431\n/CharSet (/A/B/D/E/G/H/I/L/P/S/T/W/a/b/c/colon/comma/d/e/eight/equal/f/ff/fi/four/g/h/i/k/l/m/n/nine/o/one/p/parenleft/parenright/period/q/question/r/s/t/three/two/u/v/w/x/y)\n/FontFile 21 0 R\n>> endobj\n23 0 obj <<\n/Length1 1395\n/Length2 6090\n/Length3 0\n/Length 7032      \n/Filter /FlateDecode\n>>\nstream\nxڍVT컧$F�42	����t����l�1r4J	�\n�Ҋ(��  RJJ()���W���{νg�l����}~�{���TT�	��D���1�P��DK����\0~~3������F�Qr�ͮ��C�x�:�w3@���>@�\"-�����`��_�h�P�p\Z�u�(�7�_\r��A��b�U�:`�@������p�\n�A��(��\nG�+ @S4��+���+�)����A��bh������u����_��\\�!	�\rL�4sEx��6E;c��8��@��(o|��	��kMu�<�?���p�y5@���tF�J�@���`h�\'�@�\0�p�-M}1�?VE9�r�zx���P_(��w��8��b�������Axb�ż��~��_��I\r�D�QXo����8���cuG��P�?�����/N>� s������^�G����`��,���a��_��<῍�_j|��8O�\'��p��\08o�/�����q���o	\0�\0�0,��@�ɎWÝ���� ��w�x�A��_��O�xn9�Q���.H�JK��\\�7�M��h NT\\(*.B ��@�!��Y�����Z#(�����d�A9���@���_0|�����\"�wC4��p��?��K�a�/�����C�7������?������m�e�V(���b,~#���@�����%6�;!|��i��B񛡂r���ޚ��s��@�\0���������(�~�`����?��&8~��]RC;��9q)i ��\0���KR@��Np�߼��Ph,>��tFc\0��))��_��2���-�����/�o\"��K���p�?��@�n�u{u��a�\n�����(��E��(n\n��sLC�&�\";bs����A�iIC`_y�����,�1Ÿ�$��>�dd�	09��v��Ju7����JЙW��pw��V]�</�4F��~]Z����3�&��W^H�Q��M0��	/��w|2��C��\"b���?e����Mo$H�����??3�nc�c�f�\"�gx?r\r������WZ4[8f�S+��V+db�BF>\0�|�R/���������(������+g\"���DR+������P�-�W9C�+��ӧ2j��]^��\r��ʮ��=�{sڗ[q�[k�-��j��ۘZ���uH�3y�C(q_ ��*��=�&ŨH�]xJ�\"�kWQs���Ddg�6®\0�����A��b�F8�ݵl����Z�\'�\r\"��k\")+�Ja�ޟ����𤠔��-bRsR���s3��rS$�w��ĥ9l&X?�K��=0e��L\ZPJ�!\r��}I]��vA�$o%�����|�؎��\n�>l�2�E��k���O>b��w�8̈���r)�dR�\'�=���m{|�C[VM�F�� �|�[������������H�>��I���P{��tϩ�|ԝ��&%��2T٬M�|$��rJ�;��F���s�!��-��dXFu�\Z�9NׂGC��g��]��\\�����h��[-j��2�v��}��ÿ{Cy���L6�����k����iW�骹���rt��Ih�	��Y&0���{�6��#���ҷvif�B5��^�L�0wX����Y��u\\\'�c��ӠzH�%�%M��uR�F��P�\'��~��f���z���\'�>t�|���Dn7�97��]b�4I�:��֙�#�@�_���㌠ԛ4�B��(zY��s:I!l��~�W��\r\0�����]�˹�iY��B����u�S���qE�i����u���Խ�~��v_S���&��&}S��F$ED#��ߌ6�+�Lb�62�ի��^���O*8ɫE��J��56��|��2��\n�$�o*3#�Ƅ�8aC�㳚�nš���\ny�u=:�\'��\0g���j<ޞ���<�N�XA�tڭr�Hr���8��ž^��_x��9��ӵ-���yQ$���7�\0�IT.	>6\n����	�dW�����ʞ�?��O}V���� ��m��A�=x�A��ʧ<\ZE7h���W��t�u��Ƹ5Ӭ���4�tH���e�x|\"\\d���n��:�E��Z�9���~N�ܦ����Ω�������SX��>`�\"���>�6E��9�#��a�I�r<ŏ;4Z�m�{�d_=�\rFx�@��N�Cx޵���)��msF�i��4���ANv����b�km���ۘ�ؗ�i��_*h�%��ku+a�l���Ji����:�Y�?uf�\nc�T�`�39y��}Y�W_?��|��W:�U��͸�$,�T	ʮ?�,p��jUD��OXt��=0]P\"�a8\"��:#�Ȱ�殪M�y�HF�^\Z�0�\\?�ד)�����~������Hk�����r5��$U>Y���H��\'i:���2������ :�:��7���������J_��Q�*y\r�윪G�\"M� 1�,���\r�	��$[��܊\0�cV��������5wfe�F� ��\Z�X#z=G�h��ls\0��}�I�x ĕ�C�3^ԙ����?�K���g�j�6o�S�چ\'8w���V9�R1�&sj�k���#����dY)�\r?�8�[�t��1s� ����7dc*�D�\Z�M�]%?�]r��k�J��:�U+V&�	�=m�w��Љ�N�w�EyZ)&���/��\0���8�m��.��®d4���.�<vMM���E�JQm�\n�`���Z�o��ؖ�	�Z�#�-��&��JS�ǐ0<��m��d�P�*�m�\"g���ow1j�Z�\r�K���y\"�y��Z̝dVk?���޹m���&V�m~���%3^�`�W���y��yx��ro�a ��=-�y�1�D��m�!�/{��f�=Vo=u���b�a��O���R�.��ɍ+r�b���m��d-�G�nqD&Ys.���D^5������KMa���Q��yj�Oֶxrb��_��\n�,���<����������7��:,f��Ӏ?�$�}��$�\"�T�����j6��ݲ�t[�O�2h����(�xJ�o��-Y~;�gt�Tz��CWw�i��k���^�$b���\\�*������,T���-�F�o�y�����zUE�s��\0�ct�B�>q�(z���n��^WY)�5��J�����t�\'��\\Z�x�V{�y#�[E\\�M�Hi��M;�I}��žO$��䧗�F�~?�a&}�d��^2��^0�\'<�휘�hl��N�~-E��z xO<��G�غdIb��V���P�0W5s��Tж�R��]������TB���FK�~7ۣ�y�@��ô�Ϥ�*r}gRg�U2������~�ť%��]�����q��R|✋λ�de2%Udj}?���Hu3tp�	�xy��~���FY];�:t��y#6�}{⳦p����܌/�&���\\��G�Eށ��-cy^�:.����r`Q�a��	�ȯg���3�K�6p�s|4�F�l�mVD��s���w_a�a�K�?wx�y���n�rZH��|�0U�|vu cw�{��\n����Q��i������2\r}��MG�?x�_�ϴ�5N���`�2T���\Z6�]S�\'\\2���)���F�t�R�\"�Ѫ����P|�⎗owf�Xp�m�0����<��h�}-#���5z��_�i��T��I��0�V����;9%�s/�j:��w��/s�z��������_v%\\���X0�}!s�VÑ �{��Z�I�}_�3�(���N�D6�a!��&WS��\rE�Y�H�[�J�<^��#��nEE����K�s����Q9���\r+�\"��Ֆ�M��/*T���ݢ�����W7�F��8��?��&+�cR�_\Z\0!s#+���Я��p�|4�V��|\"d�ܧ)N�����+Dv�W��BF��P��C����\rLw(ˆ\Z(���Ԟ�^�ב���T�w� .�.����/���SԞ,�vB�5�Wh�E�DG���������\r>Hb,��9��}�\'[�/�C�vs�^\\	��/j��B�l�0�V�6c	�v�,m��F�N:�`r���9	���^g��C-�86X��N�I��3=�k*��b�WEa2+=25k�{���L���~���\\h�bQ7��zW��(6>z�~��L	�)��@y�.�qO���\"�?\rc�ż��[}�6����hހ`y���<�Qa}8��\\_\nKȎ��V0FV^�u\\���s\'%���9��n�|�b��P\'cC���Ex5���F�O���P\n�U��J�T*���x���l��j+��Mf�������e�Rd��\0MX���j��6����	)���N���D�hk�M�.樛U\\2WhvM�d[��\Z�H=��\n�2��|E�����QQ�֬�[�Vf�j�+�����o\'@=6���hcRh��D>.��&���2��%ћ7��j���Ǌ[i�ӥ&i��Nu폥dܪQ���֜�!Fɯ�i����4-���Y�KTi>0Nc���q�D��U�������ϊۘ�ȃ��͸����W�&J�_?k�{�]V�ty��2z��f�v������\n!�>m�F�9z��}�7w���%�ik��U_��Dh���E�HI~a����7��<Ӟ���J@�]\n�*g$��c�\'��Ad��籨k|���YՔ���+��L���6�m�î-�\r{�&�ϗ��>�3-$�j���AfQ�afQ	�݋�Z���	���x����t��\0H�p��gg�~AI��R���vM������;�;-S�y�q߶������\r��G눱�S���Vmw����3\n��uj�#����}��Z5���g�m>�5kW�p��dյ��U��U�j��{@p��L׊�O��c��6�2h�T�	۵�۷�Biw�t]����i���iOF�+	�uXhl�$�l�a����i7�%��1������؅���G���y)��)\n��W���I|��\\�@���2�E�I��p>d�^�j\\��M���l+���8�\\�����^,\n�5�_Ϳ�5�tPO��!ι�h�3���7<#��D��}���i�s�§@�O��	�ϖ�\0E�Bfi\rFM��2�qpw\'{�e�p���\\#pZ���`��G@�T�\"�0�+�����\'c3 Mɔ���(��g藥�Xv����Tr9�\rا$Y���-���%��\rf���~����������Ga?���@CT���a�(�p).�q�G\Z���q%4�#�[�\r3�k���E�6aWكT��ӄ|W��P�����r=EJp\r��~�Z��V	����X����K��A��ֆM�=?ׯ��Qh�U�J��i4���9~R�rH��� ��� ��Ƙ�q٧d�8�QR��%=�3=r��U�@��Yֳy#IT:��|��Յ�]�ت�S�\Z��0nv������3�!��������5n�MN�:[���-�� �e<��s�C\nH�rٔ8��>Ǡ{�JsT�i�\0+.cR�H\"۬��lF�E������}gZS�\0}�ĻS�m)7Qz�s������BL��	�0���Y۬�n���g�wX`m�n���jӍt�`�XnYWy����RW��+�nX�pIj9K����1fr.��sT�#��ȪSJ���$�	(��ie�\0ǖ�D���G6�9K*��Y��Y�m_l���F-EN�CZP���uj�&��ltW[�@&u���VX��Z�/c��#�\"*�¸|#�8���r{�ւ�m���ߒE���7;�,�o�Tw�;㨊rQ��W^Y��P�T?@��4\'Af�T�W�>b�Ύ��x�cU�v�\\�p��meh�����T��H<>�ْ���\Z��d��k�#�f�VC��=�g�q�I[�?֦�ѝvc��w%r��m.�R�A�F�\"Y�;Yo$:�A󰯒S��z��/�C)$��Uٕ��\r�j7�n�{��7zg+��ؑO1���EO2�I2s?�/Pz�ʷ��v-i�)0�MC)����L���7n�Z]e�2�e =՗�W�_�������}�C,n%(�&�� 6�Լ7\Z�-;LH���C��T�A>�g�d�g��&��%���e��d?��x�nB�`�w�%�����tZ�3�u?�%0L���S�=��ɷ\0٘~�7FsG�Q\rv�{ ����wm���U��h:n��00&L�n�_��љyAPu��ٗ�Btjp��:��V�����$,�e3V,�m�������WH�]6���>�{g�o�Ϲ$5B��V���F�w\"�-HT��]�W�;-�!���w���?\0�x.�}����Y�l��&{�}��=�Z����\r�K.9҉\\B\n�{>�g��kr����Qv6̛w���rp�鮉d`-}��\\\\��d��4JJ�ś�v�3�ѱ��?&��px��K3�ܚ�$x o>[j^�\r�F����)pw�\n;~Y�!��;\\�w_��%�.HH�F3zT�)���LE�&Q�v��q-.�a@G����ͭd��m$%:�����\Z�������2O�;_��_���*���m\'����?���o�C��a�m�ޢ�#gy߄��1��L�Ź� e.���S�P\\�<\\s-3��4��Z���u�:�>�����cr��a���6�S����+���/l5z�X�8@\r����_�å|6��Y$\"�AL�*y��o��RZ�v}\Z�\rn-Q`��~���mԓ��җ��T�*!4��_i�A.�^�ʜ	��ڰ�[o��j}I\\T��Į����ʾ��U��d��B����Ǒ���v��/�{�\"��G��\r��\'ϧ}�yn�xF��eb| �^���k)W��hu([�/&\\�ޛ\"����hv����������p�6��&����U�p�E�ܹ!��������~|l����֔m3�Bw�X����0RT�ѷ\'v�Y1x��䷋�F@���LRb��޺P��,ұ�h� CDF&||�Cg;�_ #�a\nendstream\nendobj\n24 0 obj <<\n/Type /FontDescriptor\n/FontName /FYGEPU+CMR7\n/Flags 4\n/FontBBox [-27 -250 1122 750]\n/Ascent 694\n/CapHeight 683\n/Descent -194\n/ItalicAngle 0\n/StemV 79\n/XHeight 431\n/CharSet (/one/two)\n/FontFile 23 0 R\n>> endobj\n25 0 obj <<\n/Length1 1449\n/Length2 6397\n/Length3 0\n/Length 7380      \n/Filter /FlateDecode\n>>\nstream\nxڍxT�}�?]���@:HIww��0�� ����! !���%� %-�(���~��~��s����w�����뻝�1���;���*p�O����mh.\0���@��	��\'`3{  p����P�\0�!Q:%;$�QhxB��\0Aч�b�@�(�#��!@���\0��h�a`�\"�����D����	�JH���Ȼ�=  ;@��vCU�A�p���G\nN)g$�������7�����$���� �`���\0��c�����\r`�A�e0�;\"��<�\0�\n�aT�\'��@U�kt�������r��@�_�_��D�J�����n�v0_�	����*Z�H$/����������� P;{�����\0*��\0;�?� �;���@a��5fe��\"��\rC\"~���\0�Ps��s��0�7��o�sp����]�y�	VW��R�[�FD���\"�\0�c\0��,𫀑�;���\Z�!���pD�\0B������������� �B��N�����`ǿd��{@|\0�@��_�=Y��\0�A}�������U�-,x�@��QA����\0�I�����\011@�?��k���ճ����?2���\0��@���7�?����6\\�VЁ��p�����\"@�M����C�������w��	���s������� P�?(>{\"Q��\rGm�]M�-�6�����Vu�jG�aN(��	>�>�KA�@|�z$��/.�}�\ZP�G@~�;�( �l�������~�����g]e��k�DDvv�(�$�� jW�>�)�����\0\nc ��A��`EE\0�T��\0�po{�=5�\r\"(����D@�Y��	������)�j�o���\0��AK�p�d������zyzo��q����$�h$��3g-�ՙ�\n��4��z������ܟ�\'|��Y�P+D�)l)��\r=�fr��9M�e�l��$�3��ZbYr����D��\n��X��k!qp�]�2g�#���1��3�n G��&�����4R7�����p��G��w�2!{����y���gŚ}u����~\Z��)C���y\Z�h�\n\"����I,��n��k��bk�g�;���=��tC��>k�l���K���1�l�\Z} �iM�q��dU`�s@��:���aQ1p\Z�Wn�g��W�Z�-q�O�?N�\\���$\nY�KCŇ><WՃ2��:�.�H�������1u�]6<G���y>\0�6��\n��k}�9�u\ng��H9�d֕s���J]���	��(�As�cÕX�8dPX���ѭ*i!\'�8Œh\"LRdD�`������o�0B>x�����S%��\Zѱgҡ������\'+S��J�G��\r[w�{�b[\'�{�\n�Ykv[8ۖ�ph $AZ�n��gBN���\n~\ZِW<yT��=���E�I��|c�4&�g&h���c��`C�멣�.��]��o�X���#��X�K��-�\"��)c�-�:/Z�<z�[.�\nZ^I>�q��k�9q�^�XA	p��c1BBx�V;�]��0�$H���]\"���P�y?��c�6TVs���В�ik,Y�7U���>����\r\ZC~�+��P��^z«�tE����{\Z>=9ܵ2}L��݆m�`��<����<qn��LO�T�Ж�P۝ڶJ�Z�?� ��-��GO�\'m@�����=F�崳����Y����i[Y�{*�T����0�_0��.��䉂)^[�JWz9�����a<��4yڇ��\Z��� �h�O��A5���\"�I�A��5�t�g���Ľ�}�}���O䬩dv���!O9��UH�r��;������|���Q��b�w���`���� S�L�+zk7%��M֦~)��P���3W���Rd{��I��5H�����n�Ww?b��ڒ�C=mp��e���X�����L@K<+g�[0D5�G��z�*���+�~�g�Q՘�C^�>����	�����;rd8b�����9Q9��� �4n^�Yt,p��&qҲ���\"S��n��a�ZXd�]�5=���+A^�s���M,���ڲ��������b^���+z���-U�T���S����Fq��H\0��~YTX�.WxQ\rPl��q~�*aɷ�������QS�dJΫR����ٛ\n���^. �9�}�6�m�^̾��1��6���s��~D׌�y�+M}��Zn��R�\n�}�W~�F���]67��cL�ef���o�&�f�;B�X_��휟Y��C��_!�����$mnZs�0����cl�|Z�jܠ\n�2d)�L�K��F3�!�9�U�&[)���dm��f\'6Lv�DL_U�[	����GO��f�<eȁ����M�ÆW��f?��W�T���8�!�V�\0��6tJ�B�wjL��\'��z�*s�.�d�x	1���E��,gR��[�h�^�r���F�$C�5��1�����$��6ѫ�7���{=��^�L���d	T�j)��tJ�[�T�c������V5�s��TeY�B��K���\Z2�E�GK\r��X?�j{x���k�+A���^�GM�N=_[�[!4�\0��������UjB�ш:���b-b���K����I8�FMl��Z�v�Ջ���/��xV@��������6�cq?l��\Zq�wMp~�s\\�M6L]V\"\r+�KHd�7�Qb�s���E�_��6��>VY��Sl��wm\\��]78�\\���Zd#b���8r�@�� ه���g�U>���i��\r/��\'HM\\��w���IRI!S�r3(���%������KF�C�b�\Z8\'rIO�i�K��.��h a��\'���f�\"y��qi<����m&s��cU+j�b�����~k�6���UY�9��F�i�8{h��\"Oh�V[��f��,��b�Й�|�\0*����Y~k=�ڈ���n|�A��*�����	�n�P�Qd�f⃘�.f�Ћ�nzW&�9�u�y�.G�0]�	r��U$BX��NBY���?C���Ld!=w��������8ܺ�\Z�ć�5��\r}�ܠ}\\>�8B�|�|���=]��c�(Zq-H���=y +���}�)7�19����Rg|�yI��R�Ώϋ3~�c/X?��3a�z.TI�D�S8�E���<�␚2�Z��	\n\\����q+���t��\\O��R��a�������<��ގ6����O�{��x�x-�L<q@�[��}�{��59q(�|lt�D�a��I̓���7�nDP�	\"+6�#~�2ۤ�J��� At��/�Fpq)\"��fa��3�/�>d(6*:F+�t�,,v���uyT]�G�QW��`ܸ�8�U�]���>�_�,��˶E���^a��/���9?�������%�aJ��߅���שpWW|iX��:�Нu�����`:J�q���=�ҽ+3ԙ�{|M��c<��O\"��.�E��џ���5�,���W��}b�ً�b���dq>&ϸ̅�t9y�qΨ3��/;iEkb�X���l�Z	R�ò��!B*�U���3ŚqԷ�\\���8_EL���c�^��H���~�������!r$>�3%n�r0�8�����p�!S��2G�r�Qל��@\ZĿ/�RAO?�6\n,�@\Z�m��b�0x�	��h{����������>iD����63BnmN�g���7�)�{�L.���J(�S%�H<��T���{c�ِ�_��|r��i|������{$_Q}w������Q�{�צ4��2E�$M}|��H���w�p�P�b���GI�e��7^�;���S_��\\���҇�L��M�K{UA�:٭2���o�I���}��L�~�{���G`��?�@��Sni�i���K�O�]�-���s3�n���#rP*b�[�E���|�w��s��R��y:�Dvi��]�e�\'H����h��K�VWyu�(.j�k���⏷�K�f��x���9�\nn�ơd��\Z�&�\r���\0�����̫n�i�����KU<i �����\'�nG�l��	wf�n�r���/�e:��M\'�Y2��]����΅�d4��d�����u�#л�aD�������9eX�Ĺ��v��V�\n_�7c��V��1j[�D�Jޛm�V%��]�I�����S(GJ��z�,�nd��R�l�:�!�.�\\Y]]Y��Qb��[��Ցv(b�fȝ��ο�t�կ{���1;�~��R������Q��n�iq,��s�d)=�Cr�w���n�	��~�Rs=8!ng[���I��ü�9��~<66B��!����\\��d+��h�\nF\'/���76��}�sn�ٲ-�Wѓ�3w�3�	\0��>m��\n�<5sOO��O,���N�����Y���������\'{� \'�\"���� >�c�Cc��Tc���/-�Ttx���=���E[/H��P����\'\Z�`D��r\\m*>�hw�ª����gs/����a���[ni�m�v���p�ǃ^�-u#W��;�:h-Z�Fo#=O�d*Dg�d��^�S����\"㧙\r*_���X:4\'\"#y�;g̻�b��j��K<�=}�V���+�ě����|IqP�_>I��Q�~���S{���ن�\Z��`j�f�ڐ�wؐ���t-1/�3V��wjJKg&t��g��әmzkl*���C�\nQ8�K�E���z΍Ot�,[��Gl���N����f�w�f3��nB�m�����58:l�g�\r4��!	�]zTL��#��Xlw���\"=h:��8��\\1��Ӟ]�]H���>���ДV����^Ri�٦$v�½��r3�D~�\ruI�Bf��h\0��W�#�Kc��a)��f�?��Hiz����񕮋��\n�W��~bMԅ���h(�r�\\��ߜ�?��Z,f�\n�8+�KeC\"I0.=U�$5�,�O�3I���b�o���j�����5zz�E�I�l�FX�@�\n��1=Pf�gUS6H�22[=-}���v�װ�X�b��}��� y8\Z$BvZl�9Z��SCV�����\r�Xl�1\"4��|����H*�Qa��ȍ��Ӧ1N?��kbTf{@}bsO,ޓ���Uۋ��DEu8�^;�.���u\0���b���\\�	�}�1S���d�h7b���	������SYp)���~r���w\n֒/���Gr\Z�H;(4��p�� {�En���I3�)\n�r`���r��\\..Ϩ&\r0�aw��6�`������֙�Rd^jq�9{��~q	�����t^\n � �Y�a��hv�ąY�����_]e��l/2m1	��Xw4H�\"��fY��ZWL&����kiqeƨYG��O�eTy$��R��/tVĵ�.+�ba�(����t�3��f��<�b\r�:�8x�q��Vgqnm�Q�w?�t,$P�:�y�>5ǈ�1ϸ�y��N~��͜�ܯ�/�\"���w�#��<�e�}㔪�71���)�BR�Z?Q�2U�k����0OX&�u�A��B]�O�w��X_�ۆ�IP����h7��d�\r��7�3�9ocZŖٟ�����8��9������\"=B2�V�[N�5D�j��ԕ+a�NV]�\'B�5/z�E�=�k�ߚ�;�6Q���N���J�8fV��N]��\\#�Z�oۋ\\�\"��Xʛ>^|J�\'(\Z���Պu.�H0�K�ȵs�\\��z�-W-�\Zo��D���s\\�V ��I����=~�\\~��Bt�&͍wm�ِ���n\"1�\rǫ����Uo���F;h���k]�u��p�>��e`,��p��(����W��?%�\r�ʃ���,�?GA������9��Ð�X|ݯ�m�����d���W��R+fh�P���w���^1|��B�;Ӵ��E�yr+�O�7���2��ֵ\\lv�\',��ʩ2�-��X$�^�ٮ�-�Y��q�NB��,���t.���8ᾱ�H/������T��6/�XR�����э�Z���|��>�5{�Hڣ�ɤ�K�&�1��I��ʱ�${��� ��a����}&kya�\Z��M�\\��:�!t/B�o;F�k�F�K�)��_�[���N�̱b�kV\\�D2�l9\"�����}MezN��e�%����}�m3�����/�>5�!�Ʃ����X%���\'��[�2��I:�C�J����#��q��,YAW��F(�eV�����:�[ϽH��������V�;�M�Ԡ�������!޽h��o������?:\nrY������~�m\rY�s���ߌĸ{T�j��Ñ���~&����A\Z^}�gc9��p7�^[z]�B#��I��N���_�G�[�q��Q4�����k������z��e��DK��E�F������\\��EQl������.��Dh�LZ�\ZN�E��\Z2�P�p��xIh�UfX0z�m*I��i��0�_��p��}o�����Ҫ��o�W\'�����d7]^�==�������Ħ��ތ�foY�!��t�w_\Z�7�%�n�[d���f�>�칭�j�ПyT�y9���A�os:�*���R��T��y��~f �Ȳ��_2��c9HW�`ha/@{[-���g�J�p}���ɥ�6�)��_6��n\ZJ�Y��3���]lZ���)�%��ߧ�\"���z��w�I��0\"�˼�N�g�iʄ6�dK`-�`w�e�o7���*���`٪��5�����\nU�#1Y�\n����|ٱ��j�y��c�&�?�ٳ$޼��p�2v���CG{qW^n�Z|�ɏ�q�[i#	n��|�b�cfb���^N.�B���mO\'W���+�\"M��xA)\"G/{w�S>��D��a�<��y��4��Ͼ�G�4�bXq��Ѿ�9���i���[CPs��Y��E��:\'4�s�~X^�ǆ7�Q\'�a�7߰��\0h,7;,�a<�����\r8�M\ZX�;�M���0W���a�ڝ�����`Y��ˢ/t7	44`l��+���z쬕U�N�YI�7��yޖ�kX|q(������{\'�8�c�����Nz�)Ֆ��m[ C�O=��iQ׊�f�Ѣ��}��!Y>����a+�]�ߓq��d��}���[*���Ȁ�F%�o^3�V���0���[��O_��}�¨9窯c��L-�R�w^���|��!�Ċ��9�5�Z����!�Z&���ϫ{B]�`�\'��o�w�f����?�q��J���{�\\3Y�_죳>4TG�yq�z�j�]Ҕ\"���ۖM�pw^=��|Yh���`gf�B椌�$H<��Y���8>\0L^�=�.7��h�=U��1��.qǒ��I��\0��W�\nendstream\nendobj\n26 0 obj <<\n/Type /FontDescriptor\n/FontName /DYGYZZ+CMSY10\n/Flags 4\n/FontBBox [-29 -960 1116 775]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 40\n/XHeight 431\n/CharSet (/A/arrowdblboth/negationslash)\n/FontFile 25 0 R\n>> endobj\n27 0 obj <<\n/Length1 1394\n/Length2 5926\n/Length3 0\n/Length 6875      \n/Filter /FlateDecode\n>>\nstream\nxڍtT�k�.�(�����0-�!\r҂�0�30��HH�H��Rҍ�� ��%��?�����w�Z�Y�������^vV-]^K�TG����r�F�\0~~A>~~\"vv=�����]�t�!���+@	��6y0\n���T]� A\0HD$*�����w )���,�|\0U�L�.�p�@¬mP�6�8!\\\0�Ç�~�d�H��Q6PtG������(�����A�Ł@777>��3i-��\0�C�\0t��P�+��0@�\0������gs�c�EX���H(\0m��A�pgt�����tU�\0��P��`�?\0�\0����_ٿ\n�࿓�������V0{(@SQ��z\0\0�-���|�+f�@��9�(�\r\0�����9����a�� �AOYn)�pp��Q�D��\'CB!�{\0�l��p�{�u���-�~��tq>�Ü\\�*���MD�ج�(�0�C!1\0�	\0u��\0���p��v�~��|��\0+4��\n��#�r�B(����;�}\"�\0�0\n`�������6C�����G��&�h�\0��~�y{���%n��O���5tU4�x� ��OV���	x\n�\0 �CTL\0���2����[����.��OE���������-8����4h.C��Pߔ_��~����;����_U�_���)����vs���n����\04�]PhY�#���w��ա�0������hy�����	����Üa�PK-\nb�H����j!�a��8�,~���U�CU���킢E��\np����E\0`$�Aď&���0����%��7�@>8�N�1�\0�H�_kEs\0舄���D�*\rqA\"����\0t߿ϿU��C!D��ȣ`ۊ���27����Ŧ�8��pa��+/5�t�\'�疥w�R���\r�f��;t7m��KV�Aa(t.���~�8n��2[\"譇DS\"���㵙n?7�1��h0�3D�Mp��Z�U����m���;k2*F&�i+ʈ�m�kdJK�4Iu�Sy:t��=�m����X6�M띝����L<z����Hi(%��*kv_B7u|�j�3���w��Iqw�\nB9�*�@��l�t��\"F�>X8fR��PU}�p�\0G��OO�W��\Z�zI�`,p�(����Q�ߴ�t�T�:?��:�\r6bˊ��>�ӷ��)�3g�t�|KC�2ra�5-α^6��E�������Z����,4:�����\n�;rw�\r�&ҕ��1�e��/��\r2p?��PX7YT7�TV?\n�ky��\\��r̞7��V�B�업��g��Z���}E�T���?czm�9�r��@�Z-��}$�\0�$.ʷ�+kѤ�U�5���_��X�����!-�E�,0߭��!\\iX��^�f6�d4M�[}��g����0�\Z������<\Zϭ�ׄ���?4�_P�&���S�������f�0~���aU�\'=���U�z�q#]Ĺ��AA_[9?zds�	�r�A����] 8j�G��d����b�\"T��Nos)�<?u\'1�J�`�=� d��+��Ūx]�*�F�Vs��)ŏ�{�%+:r�]U� U֋�->x�g�*9^�Տ�N��t0�v/-�U5]��y0_\Z�6���~���E���������P8ou��ឦ��-�lBVX���ˠ_��	��r��k	\'�X�{N�\n��63]^/`�n�	5{���{ΜPT��\0ʝ��p{g,��+�{&��J���V��i�^f͙��2�8��}�$�3\"�f��}4fʻ�����!�&�f��!|Gw�.�!8��Z��{i7������l����E�1B)���$7}���rƤ�?����O�Em���YyzIG>�e ����d7��VE\0#��z�ɚ_��D�\r������>�f%�Rɒ����� }E�#L��#	�1��OIN*\\\Zx�,Z��\'��6���_z��5����\n?���K�K�T����x��O�8��\0�|Li\'���%�:�O �ei�B�9�ݛO?9���}�%J����.��N69g</U���8���0�#�͈%��Q���r[~��������.��%�^vX��	�^^]�A�.}��|aQ�ۥt��Wf��0i��M�����ѕ�y����4,�t�cK���?��\"������q�Ԏ�[�w�1��O-(�8R\r �A�i}�\n��H����9��e�+ҩ�y<n�9Q_�|眜z)@����1�|��z3i����y7��:.��f%����4A�fGs���C����I[m\\{��Md�n4B���U;�%����+q��*CBS��T�W��>-5n�5�P�ڨ���0:�[-E��RH�h�c������S����=e����W���(_$�f�d�O�t��ދd�g����n��<�(�1a��l8�+{l��k|���Wbǖ�CQ�ǕĿ/�r���®��,�{k����\"�\n�����\'����s>Fg�>���p��$Z�ot�U��eqꕩ��¼<�T�ߙ��Y�0�}}c�蛷#�S70Fc��fi(K�sp� ������~��`d�lq�I���DP��{�L�׳B��i�wK(�uՏ\n��,�N[y�\'\Zn������Gf��ߑ�����҄�H�tm�p�n���RD�?Tq�~z���l\'�~)t�i�0�kq��)<D =ܴ���YR��0��v1Nq��oʒe#��D�u���>=��ϛH\'��I%��`�Vإ�sӓ�]��\\Z����=�4����\'��>�_�0%�x}��6k�<���\Z�]`7�R͎!��L�����}\r{�H�1-%��އ���hQ��e7�A���9�����{�r\n����9���S\r\Z�R�\'j疴}.�\Z�!8���/���%	t�_�\r��07T��,�#h��|��H��ȐQ<�*\\bg������$h%�3n�i�S]\'�w��[�8u&�}��Jn��.{�x��17+̕����J%e����L��Mv��Uőri9���m�&�4{�ŭ�2|^�ӕi��P����d�by�ȸ�����Y��2\Z��ºmH���[���;>�E��T@�v�FIq�cP����\'�w�d��\n\r,��,�3�r����_n�齅�Ws;�իq$��	���ذ@]��J����\'f��c�V��<�\\�\Z��~/�S�/X\r�U�����$�V�a��e�lwk�Z�|~�~g�]�����:O�W���$R���vzP�S޽����x~��︐ˉ�Z$U�-�������a�9~��@ڼ�B��Z�,�4��Vg����4�F`�`(w���é��\"�C�қ�4�&a2\\	����	�b\r�9_����צAw�:w�dr�_�=#�)1�	�����r�lP�oWG�1���_�G�}��\ZE����.�����ߠW5J���cK�������^�Q}b�c�|u	�����~���FD��\0��\"�+�\"��x�Mj���\"�r$��u�$\rR$��ܶ5�j��q[(����I;LF{o��A\0�{:9���]�3\Z�������Q$s�܄/;�qt�#�ر�4�?/��쌚�4Z%a��!M�u�A3�<��Ä����;�[�J7h���PǠ�p�Q��L�p�q�B��肳^!5��Bx<|*��<���*�󈰖�f��M�Iiv\"��0i�ݘ\\�,s��\rc�&1Ɇ�5�ƀ����@eC�5s�D�O����w!���LMOƖ*��6�]K-Qi�����DR�\"}��ͩž_z����|sg�_��o�g��];�[����֎�k��t^F�T��TGZo�y�G;���C)QM���S	h�lX�I0���Q�t~�^��f>f�?y�Jⰹh�i����(eL�G�����~�4J�;F\"�&�~}�}�և/���6m��y	%\0רz\'^y��qޣ�ʩj���w�_q��^�_�U�Wh:���ߐ��n�w}{��G޳-c�9�oS�\0�W~���q��D	�i9�[�`}�a�.����b\"t�JYr�S~Yz���(������^{g;�^��av<ʚd��e�W�7�G���J4��R�J8qg����0q�5��_F�� tF�����\0}���fI*�6�w��ի��b���a�a.��.��V�(}��p�1��][�h%�)��;t�Cqzgt���@8�pdShh�mo�H��^�T�fF͔��k�}|�\0�R~Ւ���	������!V�o=v��R�4���T>S�����pk=�aui�8����nw�yM��xu����<$�9��#��Ȓ��J�s�>�Nq5I�=y�5��S���򀟛r,]�+�S����CG~�S����:�&�몘��Mur��ԋ{_�xgHFT08�za��|]��u�s#�z`�7\'=���^�J\nf�Q�D8�}��G&�h�y+>p�_X:Q\r��lE��\r��O���4`\0\'=hi;�I���%���$����fS����n�����]~[NL�h���ܟgÎ�	5T�[7�xw���1����2Զ�ð��=$G3�ҭ��Oj�m��y�� ���)o-��)L�3�I�99�<sB�iE�<�1l����#c:�P߇c�ƚ�#&�AoD#c��~��.d� �4���U�Mc��O�5r�T�#��⍻��i҃j��ƛ��kȫt��>k��e�\'	��d���o��v�j\"�6Vy#y��_���!]�/�u�E��)�\ZV���>��F�_��7N2�yb��	�3��n]��A�\n�t���!v�Qw�t~�\n7��h���{�rߵ���9T�5I\Z�w)�}Iz\0t�	��B��\'/r�cW	�$���.�6`!�-Hʗ\nO�z��/�N_�Y�s聫3	3\r�PRa$�����#h��_��O�^�r��C�VnlaW���l�O�͔\Z��Z��O�~��a��ge�jX//&�� ��L��t;��\"�m�_�BZ@��=����.����]�\\���Yi?�#���Q������p2�l��(�~��=�ƿ���,Ucm���\ZI�,j7����M%/9~Q�B�y֦��λs0�����D�l���aا��/�I�O\n?�@�Tg��xh���Dc��s�G��*Ee�Z��2�2���>�i)K�����	ǟ�O�o��&5ws׻\r�y�\Zp����ST1ʵH�O}�ͦf�ܭ��d���-�����o$��\Z�+�(ʨ3���b�}��ִiF�4�GV��I.F��cR�#����Df��?�T3\'׮2���F�����ǜ�g�\n�z~�%��ׇ�����\"��]6/-���ɻ�N�#�,�˦��Ȼ�4����h;ƺ�r����bLEE���<N��B����s�1�IɄ��D�U(�3ߘ�U~��.%�jSM2�5U��T��q�ʝ�����?K8�Ҟ;�3��ou�/��j�j�\\�b�+*5-g5&5�\\%Er�=��ёf�m��W�{J��d�oX�Y�F^�0yF6���C�#�$�u\n����=�4������Q\'��\\�z�Sg��+/���� �,\rm��<��l/Op�\\����]���\0f�v߯Au��\'C{�_��\r�	:�`8���d�4v�sy��^����.Y���!{STt��{��-Duk��.s�h��\ZM2댁���M��*�kF�fY���և�	4�.�a��ow�����2��+I��UU��aIRI�6\0��\'G���m*+�lך�V��7�˝��S�О����@�L�w��`mv�~�>%~����q瀳�N�Q\n<f���ʼs>,���h�\'��Z�w%�Ϝ�l�f����D�����̲l�}۰ך��]��CЙ(`yЮw��<�2�Kq��Q������3���^�A7��Cr�+hFQl��\"�j�]R���+�Ťh ��h�r`ps������T�OTXFb�\n��&�U��f+�H�������%��I\'r�=&��Yl����}^啅ѣ�*����h�m�Β�*Zw��	Ξ���*Y}f_�����T,�F(���ZbPk�W�h��\'A�a�`_����?��x)Hn|TUU5���lݰ�N.浕X��}�*��.)�n��b֡�Z�?�3� �R��R�xK���@0����wj^ή��M^2Ę����x\Z3ₔ����sFƜ��L�v�q�3=��̽\\˱�r�3�|�x{C���A����!��f�[,��P��H�^8��Qc$eŗ|�M�p�V�{)�����[B�w�<dqZ�m���+���\rk�^��Y�=Q�2��d\rG�x\Z��z��ƴ��n���p{R��Q��\0�a�[7�����N�^����QK�)kUi.�E�����ލ��8��J��|���Jb&��c���-�k���<�4Y��c�;�u@\'�%Dx#�=�X�K�QG^eFG>��7R�{\"���$�]OR�mN�I��u�$2g��w��El��A|��������3��n��ʯ��T��O\r�\'���#8�^�G��.w�Ͻ7�-ɴ�k��z<��Q������{�vB/ֱ&�?�:=1_�j���](����\n\\��{�ϻ݁]��j*m2�Kt1�JO�����<)�R���\'O$�LR\0�7���y����n���J�B-F��.�,?Ta���Lz��R	�V���V;r��_S7�4�\\�2��G�{�/~�7fzHcR%S����H3����Iev\n���a��f2�mw�f� \r+�U���e 3%�;@<B���Lcc;���4RDE��J�z]�{��hЖ^��X��lQջA�tR��J�B0o?�?;�X�\nendstream\nendobj\n28 0 obj <<\n/Type /FontDescriptor\n/FontName /NSJEOL+CMSY7\n/Flags 4\n/FontBBox [-15 -951 1251 782]\n/Ascent 750\n/CapHeight 683\n/Descent -194\n/ItalicAngle -14\n/StemV 49\n/XHeight 431\n/CharSet (/prime)\n/FontFile 27 0 R\n>> endobj\n5 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /JYDSID+CMMI10\n/FontDescriptor 18 0 R\n/FirstChar 59\n/LastChar 120\n/Widths 15 0 R\n>> endobj\n6 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NAZTKW+CMMI7\n/FontDescriptor 20 0 R\n/FirstChar 107\n/LastChar 107\n/Widths 14 0 R\n>> endobj\n4 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DARTBM+CMR10\n/FontDescriptor 22 0 R\n/FirstChar 11\n/LastChar 121\n/Widths 16 0 R\n>> endobj\n8 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /FYGEPU+CMR7\n/FontDescriptor 24 0 R\n/FirstChar 49\n/LastChar 50\n/Widths 12 0 R\n>> endobj\n7 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /DYGYZZ+CMSY10\n/FontDescriptor 26 0 R\n/FirstChar 44\n/LastChar 65\n/Widths 13 0 R\n>> endobj\n9 0 obj <<\n/Type /Font\n/Subtype /Type1\n/BaseFont /NSJEOL+CMSY7\n/FontDescriptor 28 0 R\n/FirstChar 48\n/LastChar 48\n/Widths 11 0 R\n>> endobj\n10 0 obj <<\n/Type /Pages\n/Count 1\n/Kids [2 0 R]\n>> endobj\n29 0 obj <<\n/Type /Catalog\n/Pages 10 0 R\n>> endobj\n30 0 obj <<\n/Producer (MiKTeX pdfTeX-1.40.10)\n/Creator (TeX)\n/CreationDate (D:20120919220656+05\'30\')\n/ModDate (D:20120919220656+05\'30\')\n/Trapped /False\n/PTEX.Fullbanner (This is MiKTeX-pdfTeX 2.8.3759 (1.40.10))\n>> endobj\nxref\n0 31\n0000000000 65535 f \n0000001741 00000 n \n0000001629 00000 n \n0000000015 00000 n \n0000061201 00000 n \n0000060921 00000 n \n0000061061 00000 n \n0000061477 00000 n \n0000061340 00000 n \n0000061616 00000 n \n0000061754 00000 n \n0000001862 00000 n \n0000001886 00000 n \n0000001916 00000 n \n0000002050 00000 n \n0000002074 00000 n \n0000002450 00000 n \n0000003066 00000 n \n0000011328 00000 n \n0000011562 00000 n \n0000018734 00000 n \n0000018952 00000 n \n0000038207 00000 n \n0000038585 00000 n \n0000045736 00000 n \n0000045958 00000 n \n0000053457 00000 n \n0000053704 00000 n \n0000060698 00000 n \n0000061812 00000 n \n0000061863 00000 n \ntrailer\n<< /Size 31\n/Root 29 0 R\n/Info 30 0 R\n/ID [<FBA237106D5FCD3258C201401627AA50> <FBA237106D5FCD3258C201401627AA50>] >>\nstartxref\n62085\n%%EOF\n'),(2,'Approved','PDA',NULL),(3,'Rejected','Project Fund',NULL);
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
