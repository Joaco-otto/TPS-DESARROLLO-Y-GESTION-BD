-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pubs
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `au_id` int DEFAULT NULL,
  `au_lname` varchar(40) NOT NULL,
  `au_fname` varchar(20) NOT NULL,
  `phone` char(12) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `contract` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (409,'Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705',0x01),(213,'Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94618',0x01),(238,'Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',0x01),(998,'Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',0x01),(899,'Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',0x01),(722,'DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403',0x01),(807,'Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853',0x01),(893,'McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688',0x00),(724,'Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609',0x00),(274,'Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609',0x01),(756,'Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609',0x01),(724,'MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612',0x01),(427,'Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',0x01),(672,'Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595',0x01),(267,'O\'Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128',0x01),(472,'Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428',0x01),(527,'Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215',0x00),(172,'White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',0x01),(712,'del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105',0x01),(846,'Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',0x01),(486,'Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130',0x01),(648,'Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330',0x01),(341,'Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044',0x00);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `minit` char(1) DEFAULT NULL,
  `lname` varchar(30) NOT NULL,
  `job_id` smallint NOT NULL,
  `job_lvl` tinyint DEFAULT NULL,
  `pub_id` char(4) NOT NULL,
  `hire_date` datetime NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Philip','T','Cramer',2,127,'9952','1990-09-03 00:00:00'),(2,'Ann','M','Devon',3,127,'9952','1991-12-07 00:00:00'),(3,'Francisco','','Chang',4,90,'9952','1992-01-15 00:00:00'),(4,'Laurence','A','Lebihan',5,50,'0736','1991-04-10 00:00:00'),(5,'Paul','X','Henriot',5,45,'0877','1993-07-01 00:00:00'),(6,'Sven','K','Ottlieb',5,80,'1389','1990-08-14 00:00:00'),(7,'Rita','B','Muller',5,100,'1622','1994-02-23 00:00:00'),(8,'Maria','J','Pontes',5,40,'1756','1994-03-12 00:00:00'),(9,'Janine','Y','Labrune',5,60,'9901','1993-09-07 00:00:00'),(10,'Carlos','F','Hernadez',5,30,'9999','1995-10-21 00:00:00'),(11,'Victoria','P','Ashworth',6,127,'0877','1992-01-30 00:00:00'),(12,'Lesley','','Brown',7,120,'0877','1993-11-02 00:00:00'),(13,'Anabela','R','Domingues',8,100,'0877','1990-12-04 00:00:00'),(14,'Martine','','Rance',9,75,'0877','1992-12-31 00:00:00'),(15,'Peter','H','Franken',10,75,'0877','1990-11-09 00:00:00'),(16,'Daniel','B','Tonini',11,75,'0877','1994-10-22 00:00:00'),(17,'Helen','','Bennett',12,35,'0877','1990-06-11 00:00:00'),(18,'Paolo','M','Accorti',13,35,'0877','1994-05-27 00:00:00'),(19,'Elizabeth','N','Lincoln',14,35,'0877','1992-03-25 00:00:00'),(20,'Matti','G','Karttunen',6,58,'0736','1993-01-16 00:00:00'),(21,'Palle','D','Ibsen',7,60,'0736','1990-01-19 00:00:00'),(22,'Mary','M','Saveley',8,98,'0736','1990-12-02 00:00:00'),(23,'Gary','H','Thomas',9,122,'0736','1992-12-26 00:00:00'),(24,'Martin','F','Sommer',10,127,'0736','1990-05-28 00:00:00'),(25,'Roland','','Mendel',11,127,'0736','1991-07-11 00:00:00'),(26,'Howard','A','Snyder',12,100,'0736','1994-04-16 00:00:00'),(27,'Timothy','P','O\'Rourke',13,30,'0736','1992-03-20 00:00:00'),(28,'Karin','F','Josephs',14,43,'0736','1995-12-25 00:00:00'),(29,'Diego','W','Roel',6,127,'1389','1991-11-18 00:00:00'),(30,'Maria','','Larsson',7,127,'1389','1995-12-11 00:00:00'),(31,'Paula','S','Parente',8,125,'1389','1993-10-03 00:00:00'),(32,'Margaret','A','Smith',9,78,'1389','1991-05-30 00:00:00'),(33,'Aria','','Cruz',10,87,'1389','1994-05-09 00:00:00'),(34,'Miguel','A','Paolino',11,112,'1389','1991-12-20 00:00:00'),(35,'Yoshi','','Latimer',12,32,'1389','1995-10-24 00:00:00'),(36,'Carine','G','Schmitt',13,64,'1389','1994-03-01 00:00:00'),(37,'Pedro','S','Afonso',14,89,'1389','1995-04-30 00:00:00'),(38,'Annette','','Roulet',6,127,'9999','1990-06-28 00:00:00'),(39,'Helvetius','A','Nagy',7,120,'9999','1988-10-09 00:00:00'),(40,'Manuel','','Pereira',8,101,'9999','1991-06-18 00:00:00'),(41,'Karla','J','Jablonski',9,127,'9999','1997-01-12 00:00:00'),(42,'Pirkko','O','Koskitalo',10,80,'9999','1998-06-01 00:00:00'),(43,'Patricia','C','McKenna',11,127,'9999','1991-11-02 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` smallint NOT NULL AUTO_INCREMENT,
  `job_desc` varchar(50) NOT NULL,
  `min_lvl` tinyint NOT NULL,
  `max_lvl` tinyint NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'New Hire - Job not specified',10,90),(2,'Chief Executive Officer',60,90),(3,'Business Operations Manager',50,127),(4,'Chief Financial Officier',45,127),(5,'Publisher',35,127),(6,'Managing Editor',30,127),(7,'Marketing Manager',70,127),(8,'Public Relations Manager',100,127),(9,'Acquisitions Manager',75,127),(10,'Productions Manager',75,127),(11,'Operations Manager',47,127),(12,'Editor',25,100),(13,'Sales Representative',25,100),(14,'Designer',25,100);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `pub_id` char(4) NOT NULL,
  `pub_name` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES ('0736','New Moon Books','Boston','MA','USA'),('0877','Binnet & Hardley','Washington','DC','USA'),('1389','Algodata Infosystems','Berkeley','CA','USA'),('9952','Scootney Books','New York','NY','USA'),('1622','Five Lakes Publishing','Chicago','IL','USA'),('1756','Ramona Publishers','Dallas','TX','USA'),('9901','GGG&G','Munchen',NULL,'Germany'),('9999','Lucerne Publishing','Paris',NULL,'France');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `stor_id` char(4) NOT NULL,
  `ord_num` varchar(20) NOT NULL,
  `ord_date` datetime NOT NULL,
  `qty` smallint NOT NULL,
  `payterms` varchar(12) NOT NULL,
  `title_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stor_id`,`ord_num`,`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('6380','6871','1990-09-00 00:00:00',5,'Net 60',2),('6380','722a','1990-08-14 00:00:00',3,'Net 60',3),('7066','A2976','1990-11-09 00:00:00',50,'Net 30',7),('7066','QA7442.3','1990-12-04 00:00:00',75,'ON invoice',12),('7067','D4482','1990-11-09 00:00:00',10,'Net 60',1),('7131','N914008','1992-03-20 00:00:00',20,'Net 30',1),('7131','N914014','1994-03-01 00:00:00',25,'Net 30',3),('7131','P3087a','1998-06-01 00:00:00',20,'Net 60',5),('7896','QQ2299','1997-01-12 00:00:00',15,'Net 60',4),('7896','TQ456','1991-11-02 00:00:00',10,'Net 60',8),('7896','X999','1994-05-27 00:00:00',35,'ON invoice',7),('8042','423LL922','1992-03-25 00:00:00',15,'ON invoice',7),('8042','423LL930','1993-01-16 00:00:00',10,'ON invoice',15),('8042','P723','1990-01-19 00:00:00',25,'Net 30',12),('8042','QA879.1','1994-05-27 00:00:00',30,'Net 30',11);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `stor_id` char(4) NOT NULL,
  `stor_name` varchar(40) DEFAULT NULL,
  `stor_address` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES ('7066','Barnum\'s','567 Pasadena Ave.','Tustin','CA','92789'),('7067','News & Brews','577 First St.','Los Gatos','CA','96745'),('7131','Doc-U-Mat: Quality Laundry and Books','24-A Avogadro Way','Remulade','WA','98014'),('8042','Bookbeat','679 Carson St.','Portland','OR','89076'),('6380','Eric the Read Books','788 Catamaugus Ave.','Seattle','WA','98056'),('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

--
-- Table structure for table `titleauthor`
--

DROP TABLE IF EXISTS `titleauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titleauthor` (
  `au_id` int NOT NULL DEFAULT '0',
  `title_id` int NOT NULL DEFAULT '0',
  `au_ord` tinyint DEFAULT NULL,
  `royaltyper` int DEFAULT NULL,
  PRIMARY KEY (`au_id`,`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titleauthor`
--

/*!40000 ALTER TABLE `titleauthor` DISABLE KEYS */;
INSERT INTO `titleauthor` VALUES (172,1,1,100),(213,3,2,40),(238,4,1,100),(409,5,1,60),(486,6,1,100),(712,8,1,100),(724,9,2,25),(756,9,1,75);
/*!40000 ALTER TABLE `titleauthor` ENABLE KEYS */;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `title_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `type` char(12) NOT NULL,
  `pub_id` char(4) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `advance` float DEFAULT NULL,
  `royalty` int DEFAULT NULL,
  `ytd_sales` int DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'Secrets of Silicon Valley','popular_comp','1389',20,8000,10,4095,'Muckraking reporting on the world\'s largest computer hardware and software manufacturers.','1990-09-00 00:00:00'),(2,'The Busy Executive\'s Database Guide','business','1389',19.99,5000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1990-08-14 00:00:00'),(3,'Emotional Security: A New Algorithm','psychology','0736',7.99,4000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1990-11-09 00:00:00'),(4,'Prolonged Data Deprivation: Four Case Studies','psychology','0736',19.99,2000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1990-12-04 00:00:00'),(5,'Cooking with Computers: Surreptitious Balance Sheets','business','1389',11.95,5000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1990-11-09 00:00:00'),(6,'Silicon Valley Gastronomic Treats','mod_cook','0877',19.99,0,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1992-03-20 00:00:00'),(7,'Sushi, Anyone?','trad_cook','0877',14.99,8000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1994-03-01 00:00:00'),(8,'Fifty Years in Buckingham Palace Kitchens','trad_cook','0877',11.95,4000,14,15096,'More anecdotes from the Queen\'s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1998-06-01 00:00:00'),(9,'But Is It User Friendly?','popular_comp','1389',22.95,7000,16,8780,'A survey of software for the naive user, focusing on the \'friendliness\' of each.','1997-01-12 00:00:00'),(10,'You Can Combat Computer Stress!','business','0736',2.99,10125,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-11-02 00:00:00'),(11,'Is Anger the Enemy?','psychology','0736',10.95,2275,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1994-05-27 00:00:00'),(12,'Life Without Fear','psychology','0736',7,6000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1992-03-25 00:00:00'),(13,'The Gourmet Microwave','mod_cook','0877',2.99,15000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1993-01-16 00:00:00'),(14,'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook','0877',20.95,7000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1990-01-19 00:00:00'),(15,'The Psychology of Computer Cooking','','0877',NULL,NULL,NULL,NULL,NULL,'1992-03-25 00:00:00'),(16,'Straight Talk About Computers','business','1389',19.99,5000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1994-05-27 00:00:00'),(17,'Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology','0877',21.59,7000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don\'t.','1993-01-16 00:00:00'),(18,'Net Etiquette','popular_comp','1389',NULL,NULL,NULL,NULL,'A must-read for computer conferencing.','1990-12-02 00:00:00'),(19,'','',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;

--
-- Dumping routines for database 'pubs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-04 21:50:35
-- Queries
-- Table structure for table `authors`
--  Ejercicio 1: Crea una vista que muestre el título, el autor y el precio de todos los libros de la tabla titles.

CREATE VIEW v_ej1 AS
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;

select * from v_ej1;

-- Ejercicio 2: Crea una vista que muestre el título, el autor, el precio y el tipo de todos los libros de la tabla titles
CREATE VIEW v_ej2 AS
SELECT t.title, a.au_fname, a.au_lname, t.price, t.type
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;
select * from v_ej2;
--  Ejercicio 3: Crea una vista que muestre el título, el autor, el precio y la fecha de publicación de
--  todos los libros de la tabla titles
CREATE VIEW v_ej3 AS
SELECT t.title, a.au_fname, a.au_lname, t.price, t.pubdate
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;

-- Ejercicio 4: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales.
CREATE VIEW v_ej4 AS
SELECT t.title, a.au_fname, a.au_lname, t.price, s.qty
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN sales s ON t.title_id = s.title_id;

-- Ejercicio 5: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda.

CREATE VIEW v_ej5 AS
SELECT st.stor_name, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.title, a.au_fname, a.au_lname, t.price;

-- Ejercicio 6: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tipo de libro.


 CREATE VIEW v_ej6 AS
SELECT t.type, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY t.type, t.title, a.au_fname, a.au_lname, t.price;

-- Ejercicio 7: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda y tipo de libro.
CREATE VIEW v_ej7 AS
SELECT st.stor_name, t.type, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.type, t.title, a.au_fname, a.au_lname, t.price;


 -- Ejercicio 8: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda y año de publicación.
 
CREATE VIEW v_ej8 AS
SELECT st.stor_name, t.title, a.au_fname, a.au_lname, t.price,
       YEAR(t.pubdate) AS anio_publicacion,
       SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.title, a.au_fname, a.au_lname, t.price, anio_publicacion;


 -- Ejercicio 9: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación.

CREATE VIEW v_ej9 AS
SELECT st.stor_name, t.type, YEAR(t.pubdate) AS anio_publicacion,
       t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.type, anio_publicacion, t.title, a.au_fname, a.au_lname, t.price;

 -- Ejercicio 10: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda, tipo de libro, año de publicación y mes de publicación.

CREATE VIEW v_ej10 AS
SELECT st.stor_name, t.type,
       YEAR(t.pubdate) AS anio_publicacion,
       MONTH(t.pubdate) AS mes_publicacion,
       t.title, a.au_fname, a.au_lname, t.price,
       SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.type, anio_publicacion, mes_publicacion, t.title, a.au_fname, a.au_lname, t.price;
-- Ejercicio 11: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que superaron los 10 libros
CREATE VIEW v_ej11 AS
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.price > 15;


-- Ejercicio 12: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron en el año 1990.
CREATE VIEW v_ej12 AS
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.price BETWEEN 10 AND 20;

-- Ejercicio 13: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron entre 1990 y 1994.
CREATE VIEW v_ej13 AS
SELECT t.title, a.au_fname, a.au_lname, t.type, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.type IN ('business', 'psychology');



-- Ejercicio 14: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron en la tienda con el ID 7066.
CREATE VIEW v_ej14 AS
SELECT t.title, a.au_fname, a.au_lname, t.price, t.pubdate
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE YEAR(t.pubdate) > 1990;

-- Ejercicio 15: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron por el autor con el ID 172
CREATE VIEW v_ej15 AS
SELECT st.stor_name, t.title, a.au_fname, a.au_lname, s.qty
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE st.stor_name = 'Bookbeat';
-- Ejercicio 16: Crea una vista que permita actualizar el precio de un libro en la tabla titles.
CREATE VIEW v_ej16 AS
SELECT t.title, a.au_fname, a.au_lname, SUM(s.qty) AS total_vendido
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY t.title, a.au_fname, a.au_lname
HAVING SUM(s.qty) > 50;

-- Ejercicio 17: Crea una vista que permita actualizar el nombre de un autor en la tabla authors.

CREATE VIEW v_ej17 AS
SELECT t.title, a.au_fname, a.au_lname
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
WHERE s.title_id IS NULL;


-- Ejercicio 18: Crea una vista que permita actualizar la cantidad vendida de un libro en la tabla sales.
CREATE VIEW v_ej18 AS
SELECT t.title, a.au_fname, a.au_lname, p.pub_name
FROM titles t
JOIN publishers p ON t.pub_id = p.pub_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;



-- Ejercicio 19: Crea una vista que permita actualizar la fecha de publicación de un libro en la tabla
-- titles.
CREATE VIEW v_ej19 AS
SELECT p.pub_name, t.title, t.price
FROM titles t
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY p.pub_name, t.price DESC;



-- Ejercicio 20: Crea una vista que permita actualizar el tipo de un libro en la tabla titles
CREATE VIEW v_ej20 AS
SELECT a.au_fname, a.au_lname, COUNT(t.title_id) AS cantidad_libros
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_fname, a.au_lname
HAVING COUNT(t.title_id) > 1;
