-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: wkpedidos
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `uf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Leandra Soares','Birigui','SP'),(2,'Ian Teles','Piracicaba','SP'),(3,'Liberty Sousa','Bragança','PA'),(4,'Lillian Castro','São João de Meriti','RJ'),(5,'Jessica Teixeira','Londrina','PR'),(6,'Signe de Almeida','Blumenau','SC'),(7,'Rudyard Vasconcelos','Bayeux','PB'),(8,'Alexander Felix','Cametá','PA'),(9,'Nehru Carvalho','Piracicaba','SP'),(10,'Fatima Messias','Valparaíso de Goiás','GO'),(11,'Bevis Rezende','São José','SC'),(12,'Elizabeth Alves','Niterói','RJ'),(13,'Michael Fonseca','São Gonçalo','RJ'),(14,'Stacy de Almeida','Camaçari','BA'),(15,'Henry Moraes','Salvador','BA'),(16,'Chava Aguiar','São João de Meriti','RJ'),(17,'Gray Costa','Sobral','CE'),(18,'Tatyana Nogueira','Luziânia','GO'),(19,'Isaiah Chaves','Águas Lindas de Goiás','GO'),(20,'Brennan Santana','Nova Iguaçu','RJ'),(21,'Holly de Melo','Betim','MG'),(22,'Piper de Paula','Castanhal','PA'),(23,'Ebony Brandao','Lauro de Freitas','BA'),(24,'Jolie Aparecido','São José','SC'),(25,'Brent Garcia','Bayeux','PB'),(26,'Germane Rosa','Novo Hamburgo','RS'),(27,'Beck Andrade','Recife','PE'),(28,'Noelle Campos','Bragança','PA'),(29,'Denton da Rocha','Belford Roxo','RJ'),(30,'Alice Dias','Juazeiro','BA'),(31,'Alexis Teixeira','Bacabal','MA'),(32,'Lydia da Cruz','Montes Claros','MG'),(33,'Rama Alves','Bragança','PA'),(34,'Jocelyn Felix','Pelotas','RS'),(35,'Fritz Firmino','Crato','CE'),(36,'Graham Gonçalves','Ilhéus','BA'),(37,'Avram Leal','Patos','PB'),(38,'Kyla Sampaio','Nova Iguaçu','RJ'),(39,'Shelly Cabral','Cajazeiras','PB'),(40,'Burton Barboza','Duque de Caxias','RJ'),(41,'Meghan Moura','Recife','PE'),(42,'Stella Teixeira','Duque de Caxias','RJ'),(43,'Mechelle Domingos','Vitória da Conquista','BA'),(44,'Rinah do Carmo','Gravataí','RS'),(45,'Herrod Sousa','Cajazeiras','PB'),(46,'Hedda Mendonca','Ribeirão Preto','SP'),(47,'Ishmael Moura','Joinville','SC'),(48,'Uma de Paula','Ribeirão das Neves','MG'),(49,'Avye de Brito','Caxias do Sul','RS'),(50,'Piper Brandao','Cajazeiras','PB'),(51,'Jelani de Lourdes','Divinópolis','MG'),(52,'Patricia Vaz','Uberaba','MG'),(53,'MacKensie Mendes','Bragança','PA'),(54,'Forrest da Cunha','Ilhéus','BA'),(55,'Teagan Mota','Cascavel','PR'),(56,'Vaughan Carvalho','Rio Verde','GO'),(57,'Darius Teixeira','Joinville','SC'),(58,'Channing Barreto','Bayeux','PB'),(59,'Norman Rodrigues','Lauro de Freitas','BA'),(60,'Macey Pinto','Guarapuava','PR'),(61,'William de Sousa','Lauro de Freitas','BA'),(62,'Hu Moura','Cascavel','PR'),(63,'Levi Brito','Lauro de Freitas','BA'),(64,'Keiko da Silva','Chapadinha','MA'),(65,'Donovan Pinheiro','Montes Claros','MG'),(66,'Moana Oliveira','Bayeux','PB'),(67,'Phyllis Sales','Niterói','RJ'),(68,'Maisie Gomes','Cabo de Santo Agostinho','PE'),(69,'Mannix Das Gracas','Foz do Iguaçu','PR'),(70,'Riley Das Dores','Petrolina','PE'),(71,'Kelly Marques','Castanhal','PA'),(72,'William Rosa','Crato','CE'),(73,'Marcia Bueno','São José','SC'),(74,'Marshall Diniz','Valparaíso de Goiás','GO'),(75,'Isabelle Tavares','Ponta Grossa','PR'),(76,'Gray de Lima','Jaboatão dos Guararapes','PE'),(77,'Abbot Candido','Rio de Janeiro','RJ'),(78,'Keegan de Souza','Ipatinga','MG'),(79,'Katell Santos','Açailândia','MA'),(80,'Kenneth Aguiar','Salvador','BA'),(81,'Travis Sousa','Maranguape','CE'),(82,'Callum Messias','Rio Grande','RS'),(83,'Quinlan da Luz','Camaçari','BA'),(84,'Cassidy da Cruz','Santa Inês','MA'),(85,'Iona de Morais','Feira de Santana','BA'),(86,'Hadassah Barros','Ipatinga','MG'),(87,'Alvin Torres','Betim','MG'),(88,'Chantale Fernandes','São João de Meriti','RJ'),(89,'MacKenzie Andrade','Gravataí','RS'),(90,'Simone Galdino','Vitória da Conquista','BA'),(91,'Acton Nogueira','Contagem','MG'),(92,'Abel Bezerra','Ilhéus','BA'),(93,'Hope Moura','Caucaia','CE'),(94,'Catherine Das Gracas','Blumenau','SC'),(95,'Maite Viana','Belém','PA'),(96,'Sage dos Reis','Petrolina','PE'),(97,'Murphy Araujo','Recife','PE'),(98,'Yardley de Almeida','Campinas','SP'),(99,'Cain Medeiros','Cascavel','PR'),(100,'Maia Barboza','Cabo de Santo Agostinho','PE'),(101,'Rawgleison','Birigui','SP'),(102,'Rawgleison','Birigui','SP'),(103,'Rawgleison','Birigui','SP'),(104,'Amanda','Birigui','SP'),(105,'Rawgleison','Birigui','SP'),(106,'Rawgleison','Birigui','SP'),(107,'Rawgleison','Birigui','SP'),(108,'Rawgleison','Birigui','SP'),(109,'Rawgleison','Birigui','SP'),(110,'Paulo V. Parra Brito','Mirandopolis','XX'),(111,'Paulo Brito','Penapolis','SP'),(112,'Rawgleison','Birigui','SP'),(113,'João Batista Amaral','Buritama','SP'),(114,'Ilda','Contagem','MG');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_itens`
--

DROP TABLE IF EXISTS `pedido_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_itens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` int unsigned NOT NULL,
  `id_produto` int unsigned NOT NULL,
  `quantidade` decimal(10,0) DEFAULT '0',
  `valor_unit` decimal(10,0) DEFAULT '0',
  `valor_total` decimal(10,0) DEFAULT '0',
  `item` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_item` (`id_pedido`,`item`),
  KEY `fk_order_item_idx` (`id_pedido`),
  KEY `fk_item_product_idx` (`id_produto`),
  CONSTRAINT `fk_item_product` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`),
  CONSTRAINT `fk_order_item` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_itens`
--

LOCK TABLES `pedido_itens` WRITE;
/*!40000 ALTER TABLE `pedido_itens` DISABLE KEYS */;
INSERT INTO `pedido_itens` VALUES (2,1,3,4,5,20,1),(3,1,6,10,15,150,2),(4,5,54,9,700,6300,1),(5,5,32,2,600,1200,2),(6,5,29,4,100,400,3),(7,6,54,9,700,6300,1),(8,6,32,2,600,1200,2),(9,6,29,4,100,400,3),(10,7,54,9,700,6300,1),(11,7,32,2,600,1200,2),(12,7,29,4,100,400,3),(13,8,54,9,700,6300,1),(14,8,32,2,600,1200,2),(15,8,29,4,100,400,3),(16,9,54,9,700,6300,1),(17,9,32,2,600,1200,2),(18,9,29,4,100,400,3),(19,10,54,1,700,700,1),(21,10,32,1,632,632,4),(22,11,54,9,700,6300,1),(23,11,32,2,600,1200,2),(24,11,29,4,100,400,3),(25,12,54,9,700,6300,1),(26,12,32,2,600,1200,2),(27,12,29,4,100,400,3),(28,13,54,9,700,6300,1),(29,13,32,2,600,1200,2),(30,13,29,4,100,400,3),(31,14,54,9,700,6300,1),(32,14,32,2,600,1200,2),(33,14,29,4,100,400,3),(34,15,54,9,700,6300,1),(35,15,32,2,600,1200,2),(36,15,29,4,100,400,3),(43,18,21,8,145,1160,1),(44,18,14,16,19,304,2),(48,10,21,2,150,300,5),(49,10,84,4,16,64,6),(50,18,28,4,300,1200,3),(51,19,68,12,3,36,1),(52,19,68,18,4,72,2),(53,19,49,17,11,187,3),(54,18,25,3,548,1644,4),(55,22,21,3,165,495,1),(56,22,22,3,150,450,2),(57,22,21,9,150,1350,3),(58,22,23,1,4,4,4),(59,23,25,1,700,700,1),(60,23,32,1,600,600,2),(61,23,24,6,14,84,3),(62,23,49,1,12,12,4),(63,24,32,1,600,600,1),(64,24,25,1,700,700,2),(65,24,20,2,150,300,3),(66,24,25,1,700,700,4),(67,6,54,1,700,700,4);
/*!40000 ALTER TABLE `pedido_itens` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Tgr_ItensVenda_Insert` BEFORE INSERT ON `pedido_itens` FOR EACH ROW BEGIN
	SET NEW.valor_total = NEW.valor_unit * NEW.quantidade;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_items_AFTER_INSERT` AFTER INSERT ON `pedido_itens` FOR EACH ROW BEGIN
	CALL pr_update_order_amount(NEW.id_pedido);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_items_AFTER_UPDATE` AFTER UPDATE ON `pedido_itens` FOR EACH ROW BEGIN
	CALL pr_update_order_amount(NEW.id_pedido);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_items_AFTER_DELETE` AFTER DELETE ON `pedido_itens` FOR EACH ROW BEGIN
	CALL pr_update_order_amount(OLD.id_pedido);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `id_cliente` int unsigned NOT NULL,
  `valor_total` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order_customer_idx` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2022-11-08 23:00:00',2,170),(2,'2022-11-08 23:05:00',5,0),(5,'2022-11-09 22:13:05',110,7900),(6,'2022-11-11 02:12:21',28,8600),(7,'2022-11-09 22:16:52',110,7900),(8,'2022-11-11 00:00:52',4,7900),(9,'2022-11-09 22:21:29',110,7900),(10,'2022-11-11 00:03:29',23,1696),(11,'2022-11-09 22:29:35',110,7900),(12,'2022-11-11 00:02:29',19,7900),(13,'2022-11-09 22:30:26',110,7900),(14,'2022-11-09 22:30:33',110,7900),(15,'2022-11-10 23:32:03',15,7900),(18,'2022-11-10 14:02:35',25,4308),(19,'2022-11-10 20:06:06',25,295),(20,'2022-11-10 23:42:14',21,0),(21,'2022-11-10 23:42:39',21,0),(22,'2022-11-11 00:08:38',101,2299),(23,'2022-11-11 02:00:45',114,1396),(24,'2022-11-11 02:05:49',25,2300);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(4,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Bose SoundSport Headphones',100),(2,'Google Phone',600),(3,'Wired Headphones',12),(4,'Wired Headphones',12),(5,'USB-C Charging Cable',12),(6,'Bose SoundSport Headphones',100),(7,'USB-C Charging Cable',12),(8,'Macbook Pro Laptop',1700),(9,'Wired Headphones',12),(10,'Google Phone',600),(11,'Cabo carregador de lanterna',17),(12,'27in 4K Gaming Monitor',390),(13,'AA Batteries (4-pack)',4),(14,'Lightning Charging Cable',15),(15,'Apple Airpods Headphones',150),(16,'USB-C Charging Cable',12),(17,'Google Phone',600),(18,'USB-C Charging Cable',12),(19,'AAA Batteries (4-pack)',3),(20,'Apple Airpods Headphones',150),(21,'Apple Airpods Headphones',150),(22,'Apple Airpods Headphones',150),(23,'AA Batteries (4-pack)',4),(24,'USB-C Charging Cable',12),(25,'iPhone',700),(26,'Bose SoundSport Headphones',100),(27,'AAA Batteries (4-pack)',3),(28,'Flatscreen TV',300),(29,'Bose SoundSport Headphones',100),(30,'Bose SoundSport Headphones',100),(31,'AAA Batteries (4-pack)',3),(32,'Google Phone',600),(33,'27in FHD Monitor',150),(34,'20in Monitor',110),(35,'Lightning Charging Cable',15),(36,'Google Phone',600),(37,'Apple Airpods Headphones',150),(38,'USB-C Charging Cable',12),(39,'Lightning Charging Cable',15),(40,'Wired Headphones',12),(41,'Wired Headphones',12),(42,'Apple Airpods Headphones',150),(43,'USB-C Charging Cable',12),(44,'AAA Batteries (4-pack)',3),(45,'Lightning Charging Cable',15),(46,'27in 4K Gaming Monitor',390),(47,'USB-C Charging Cable',12),(48,'Lightning Charging Cable',15),(49,'USB-C Charging Cable',12),(50,'USB-C Charging Cable',12),(51,'USB-C Charging Cable',12),(52,'LG Dryer',600),(53,'AAA Batteries (4-pack)',3),(54,'iPhone',700),(55,'Apple Airpods Headphones',150),(56,'AAA Batteries (4-pack)',3),(57,'Bose SoundSport Headphones',100),(58,'Apple Airpods Headphones',150),(59,'USB-C Charging Cable',12),(60,'AA Batteries (4-pack)',4),(61,'Lightning Charging Cable',15),(62,'USB-C Charging Cable',12),(63,'Apple Airpods Headphones',150),(64,'Lightning Charging Cable',15),(65,'Flatscreen TV',300),(66,'USB-C Charging Cable',12),(67,'Lightning Charging Cable',15),(68,'AA Batteries (4-pack)',4),(69,'27in FHD Monitor',150),(70,'AA Batteries (4-pack)',4),(71,'AAA Batteries (4-pack)',3),(72,'Bose SoundSport Headphones',100),(73,'Wired Headphones',12),(74,'Lightning Charging Cable',15),(75,'USB-C Charging Cable',12),(76,'Google Phone',600),(77,'USB-C Charging Cable',12),(78,'AAA Batteries (4-pack)',3),(79,'ThinkPad Laptop',1000),(80,'Lightning Charging Cable',15),(81,'Vareebadd Phone',400),(82,'AA Batteries (4-pack)',4),(83,'AAA Batteries (4-pack)',3),(84,'USB-C Charging Cable',12),(85,'Macbook Pro Laptop',1700),(86,'Wired Headphones',12),(87,'Lightning Charging Cable',15),(88,'AA Batteries (4-pack)',4),(89,'Macbook Pro Laptop',1700),(90,'USB-C Charging Cable',12),(91,'AAA Batteries (4-pack)',3),(92,'Macbook Pro Laptop',1700),(93,'Google Phone',600),(94,'27in FHD Monitor',150),(95,'USB-C Charging Cable',12),(96,'Lightning Charging Cable',15),(97,'iPhone',700),(98,'LG Washing Machine',600),(99,'AA Batteries (4-pack)',4),(100,'USB-C Charging Cable',12),(101,'Apple Airpods Headphones',150),(102,'Google Phone',600),(103,'ThinkPad Laptop',1000),(104,'AAA Batteries (4-pack)',3),(105,'20in Monitor',110),(106,'AA Batteries (4-pack)',4),(107,'Wired Headphones',12),(108,'34in Ultrawide Monitor',380),(109,'Bose SoundSport Headphones',100),(110,'AAA Batteries (4-pack)',3),(111,'ThinkPad Laptop',1000),(112,'Wired Headphones',12),(113,'27in 4K Gaming Monitor',390),(114,'AA Batteries (4-pack)',4),(115,'27in FHD Monitor',150),(116,'Apple Airpods Headphones',150),(117,'AAA Batteries (4-pack)',3),(118,'Lightning Charging Cable',15),(119,'USB-C Charging Cable',12),(120,'20in Monitor',110),(121,'AAA Batteries (4-pack)',3),(122,'AAA Batteries (4-pack)',3),(123,'LG Dryer',600),(124,'34in Ultrawide Monitor',380),(125,'AA Batteries (4-pack)',4),(126,'Apple Airpods Headphones',150),(127,'USB-C Charging Cable',12),(128,'Apple Airpods Headphones',150),(129,'ThinkPad Laptop',1000),(130,'Lightning Charging Cable',15),(131,'AA Batteries (4-pack)',4),(132,'USB-C Charging Cable',12),(133,'34in Ultrawide Monitor',380),(134,'Wired Headphones',12),(135,'Macbook Pro Laptop',1700),(136,'Flatscreen TV',300),(137,'Bose SoundSport Headphones',100),(138,'AAA Batteries (4-pack)',3),(139,'20in Monitor',110),(140,'AAA Batteries (4-pack)',3),(141,'Wired Headphones',12),(142,'AA Batteries (4-pack)',4),(143,'USB-C Charging Cable',12),(144,'AA Batteries (4-pack)',4),(145,'iPhone',700),(146,'Wired Headphones',12),(147,'Bose SoundSport Headphones',100),(148,'Bose SoundSport Headphones',100),(149,'34in Ultrawide Monitor',380),(150,'USB-C Charging Cable',12),(151,'AA Batteries (4-pack)',4),(152,'20in Monitor',110),(153,'AA Batteries (4-pack)',4),(154,'Lightning Charging Cable',15),(155,'Lightning Charging Cable',15),(156,'Apple Airpods Headphones',150),(157,'Wired Headphones',12),(158,'AA Batteries (4-pack)',4),(159,'20in Monitor',110),(160,'Flatscreen TV',300),(161,'Google Phone',600),(162,'Wired Headphones',12),(163,'USB-C Charging Cable',12),(164,'Apple Airpods Headphones',150),(165,'Wired Headphones',12),(166,'Apple Airpods Headphones',150),(167,'Lightning Charging Cable',15),(168,'Flatscreen TV',300),(169,'Lightning Charging Cable',15),(170,'AAA Batteries (4-pack)',3),(171,'27in 4K Gaming Monitor',390),(172,'27in 4K Gaming Monitor',390),(173,'Lightning Charging Cable',15),(174,'AA Batteries (4-pack)',4),(175,'USB-C Charging Cable',12),(176,'Lightning Charging Cable',15),(177,'Lightning Charging Cable',15),(178,'USB-C Charging Cable',12),(179,'Bose SoundSport Headphones',100),(180,'AAA Batteries (4-pack)',3),(181,'iPhone',700),(182,'20in Monitor',110),(183,'Apple Airpods Headphones',150),(184,'27in FHD Monitor',150),(185,'AA Batteries (4-pack)',4),(186,'Apple Airpods Headphones',150),(187,'AA Batteries (4-pack)',4),(188,'34in Ultrawide Monitor',380),(189,'Google Phone',600),(190,'Bose SoundSport Headphones',100),(191,'USB-C Charging Cable',12),(192,'Wired Headphones',12),(193,'27in 4K Gaming Monitor',390),(194,'Lightning Charging Cable',15),(195,'Wired Headphones',12),(196,'27in 4K Gaming Monitor',390),(197,'Macbook Pro Laptop',1700),(198,'Flatscreen TV',300),(199,'ThinkPad Laptop',1000),(200,'AA Batteries (4-pack)',4),(201,'AAA Batteries (4-pack)',3),(202,'AA Batteries (4-pack)',4),(203,'USB-C Charging Cable',12),(204,'34in Ultrawide Monitor',380),(205,'27in 4K Gaming Monitor',390),(206,'27in FHD Monitor',150),(207,'AA Batteries (4-pack)',4),(208,'34in Ultrawide Monitor',380),(209,'Lightning Charging Cable',15),(210,'Wired Headphones',12),(211,'Apple Airpods Headphones',150),(212,'AA Batteries (4-pack)',4),(213,'USB-C Charging Cable',12),(214,'Wired Headphones',12),(215,'USB-C Charging Cable',12),(216,'AA Batteries (4-pack)',4),(217,'27in 4K Gaming Monitor',390),(218,'Wired Headphones',12),(219,'AA Batteries (4-pack)',4),(220,'Wired Headphones',12),(221,'Lightning Charging Cable',15),(222,'AA Batteries (4-pack)',4),(223,'AAA Batteries (4-pack)',3),(224,'Lightning Charging Cable',15),(225,'USB-C Charging Cable',12),(226,'USB-C Charging Cable',12),(227,'Bose SoundSport Headphones',100),(228,'Apple Airpods Headphones',150),(229,'34in Ultrawide Monitor',380),(230,'27in FHD Monitor',150),(231,'Lightning Charging Cable',15),(232,'iPhone',700),(233,'Lightning Charging Cable',15),(234,'Apple Airpods Headphones',150),(235,'Apple Airpods Headphones',150),(236,'AAA Batteries (4-pack)',3),(237,'Bose SoundSport Headphones',100),(238,'20in Monitor',110),(239,'Google Phone',600),(240,'Bose SoundSport Headphones',100),(241,'Lightning Charging Cable',15),(242,'AAA Batteries (4-pack)',3),(243,'Google Phone',600),(244,'27in 4K Gaming Monitor',390),(245,'Wired Headphones',12),(246,'Lightning Charging Cable',15),(247,'Wired Headphones',12),(248,'Bose SoundSport Headphones',100),(249,'Google Phone',600),(250,'Bose SoundSport Headphones',100),(251,'Wired Headphones',12),(252,'iPhone',700),(253,'Wired Headphones',12),(254,'Lightning Charging Cable',15),(255,'Vareebadd Phone',400),(256,'AA Batteries (4-pack)',4),(257,'AA Batteries (4-pack)',4),(258,'Bose SoundSport Headphones',100),(259,'Google Phone',600),(260,'USB-C Charging Cable',12),(261,'Macbook Pro Laptop',1700),(262,'USB-C Charging Cable',12),(263,'Google Phone',600),(264,'Wired Headphones',12),(265,'Bose SoundSport Headphones',100),(266,'AAA Batteries (4-pack)',3),(267,'AA Batteries (4-pack)',4),(268,'Wired Headphones',12),(269,'Google Phone',600),(270,'Wired Headphones',12),(271,'Lightning Charging Cable',15),(272,'AAA Batteries (4-pack)',3),(273,'27in 4K Gaming Monitor',390),(274,'Lightning Charging Cable',15),(275,'Wired Headphones',12),(276,'AA Batteries (4-pack)',4),(277,'USB-C Charging Cable',12),(278,'34in Ultrawide Monitor',380),(279,'AAA Batteries (4-pack)',3),(280,'Wired Headphones',12),(281,'USB-C Charging Cable',12),(282,'LG Washing Machine',600),(283,'Bose SoundSport Headphones',100),(284,'AAA Batteries (4-pack)',3),(285,'iPhone',700),(286,'Wired Headphones',12),(287,'Wired Headphones',12),(288,'USB-C Charging Cable',12),(289,'Apple Airpods Headphones',150),(290,'Wired Headphones',12),(291,'Lightning Charging Cable',15),(292,'USB-C Charging Cable',12),(293,'USB-C Charging Cable',12),(294,'Lightning Charging Cable',15),(295,'Lightning Charging Cable',15),(296,'20in Monitor',110),(297,'USB-C Charging Cable',12),(298,'AAA Batteries (4-pack)',3),(299,'AA Batteries (4-pack)',4),(300,'34in Ultrawide Monitor',380),(301,'AA Batteries (4-pack)',4),(302,'USB-C Charging Cable',12),(303,'USB-C Charging Cable',12),(304,'AA Batteries (4-pack)',4),(305,'27in FHD Monitor',150),(306,'34in Ultrawide Monitor',380),(307,'AA Batteries (4-pack)',4),(308,'AA Batteries (4-pack)',4),(309,'AA Batteries (4-pack)',4),(310,'AA Batteries (4-pack)',4),(311,'AA Batteries (4-pack)',4),(312,'Wired Headphones',12),(313,'Lightning Charging Cable',15),(314,'Bose SoundSport Headphones',100),(315,'AAA Batteries (4-pack)',3),(316,'AA Batteries (4-pack)',4),(317,'USB-C Charging Cable',12),(318,'Bose SoundSport Headphones',100),(319,'AAA Batteries (4-pack)',3),(320,'27in FHD Monitor',150),(321,'AAA Batteries (4-pack)',3),(322,'AA Batteries (4-pack)',4),(323,'ThinkPad Laptop',1000),(324,'AAA Batteries (4-pack)',3),(325,'20in Monitor',110),(326,'Apple Airpods Headphones',150),(327,'AAA Batteries (4-pack)',3),(328,'AA Batteries (4-pack)',4),(329,'AA Batteries (4-pack)',4),(330,'AA Batteries (4-pack)',4),(331,'AAA Batteries (4-pack)',3),(332,'27in 4K Gaming Monitor',390),(333,'Bose SoundSport Headphones',100),(334,'Lightning Charging Cable',15),(335,'ThinkPad Laptop',1000),(336,'Flatscreen TV',300),(337,'27in FHD Monitor',150),(338,'Wired Headphones',12),(339,'Wired Headphones',12),(340,'Wired Headphones',12),(341,'USB-C Charging Cable',12),(342,'34in Ultrawide Monitor',380),(343,'Flatscreen TV',300),(344,'AAA Batteries (4-pack)',3),(345,'Wired Headphones',12),(346,'AAA Batteries (4-pack)',3),(347,'USB-C Charging Cable',12),(348,'AAA Batteries (4-pack)',3),(349,'AAA Batteries (4-pack)',3),(350,'AAA Batteries (4-pack)',3),(351,'Flatscreen TV',300),(352,'Apple Airpods Headphones',150),(353,'AAA Batteries (4-pack)',3),(354,'Apple Airpods Headphones',150),(355,'SAPATO RETO TOP',23),(356,'SAPATO MANCO',13),(357,'Fone de Ouvido',23);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_pedidos_cliente`
--

DROP TABLE IF EXISTS `vw_pedidos_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_cliente` AS SELECT 
 1 AS `id`,
 1 AS `data`,
 1 AS `id_cliente`,
 1 AS `valor_total`,
 1 AS `nome`,
 1 AS `cidade`,
 1 AS `uf`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'wkpedidos'
--

--
-- Dumping routines for database 'wkpedidos'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_update_order_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_update_order_amount`(IN id_pedido int)
BEGIN
  declare val decimal(10,2) default 0;
	select sum(ite.valor_total) into val 
	from pedido_itens ite
    where ite.id_pedido = id_pedido;
    
    if val > 0 then
      update pedidos set valor_total = val where id = id_pedido;    
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_pedidos_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wktechnology`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_cliente` AS select `p`.`id` AS `id`,`p`.`data` AS `data`,`p`.`id_cliente` AS `id_cliente`,`p`.`valor_total` AS `valor_total`,`c`.`nome` AS `nome`,`c`.`cidade` AS `cidade`,`c`.`uf` AS `uf` from (`pedidos` `p` join `clientes` `c` on((`c`.`id` = `p`.`id_cliente`))) */;
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

-- Dump completed on 2022-11-11  2:23:29
