CREATE DATABASE  IF NOT EXISTS `echomusica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `echomusica`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: echomusica
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'Happier Than Ever','2021-07-30','https://i.imgur.com/WrXv0O3.jpg','2025-12-03 14:00:15','2025-12-03 14:00:15'),(2,2,'After Hours','2020-03-20','https://i.imgur.com/1JZVmtl.jpg','2025-12-03 14:00:15','2025-12-03 14:00:15'),(3,3,'Evolve','2017-06-23','https://i.imgur.com/rLpDrmi.jpg','2025-12-03 14:00:15','2025-12-03 14:00:15'),(4,4,'A Head Full of Dreams','2015-12-04','https://i.imgur.com/9fKNYpu.jpg','2025-12-03 14:00:15','2025-12-03 14:00:15'),(5,5,'1989','2014-10-27','https://i.imgur.com/jpXMc7E.jpg','2025-12-03 14:00:15','2025-12-03 14:00:15'),(6,2,'Starboy','2016-11-25','http://localhost:3000/img/album_starboy.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(7,6,'Tim Maia','1970-01-01','http://localhost:3000/img/timmaia1970.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(8,6,'O Descobridor dos Sete Mares','1983-01-01','http://localhost:3000/img/descobridor7mares.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(9,7,'O Que Você Quer Saber de Verdade','2011-09-30','http://localhost:3000/img/marisa_album2.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(10,8,'Imunidade Musical','2005-06-14','http://localhost:3000/img/charlie_album1.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(11,8,'Camisa 10 Joga Bola Até na Chuva','2009-07-07','http://localhost:3000/img/charlie_album2.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(12,9,'Toxicity','2001-09-04','https://i.imgur.com/soad_album.jpg','2025-12-03 14:00:21','2025-12-03 14:00:21'),(13,10,'Djavan','1976-01-01','https://i.imgur.com/djavan_album.jpg','2025-12-03 14:00:21','2025-12-03 14:00:21'),(14,11,'OK Computer','1997-05-21','http://localhost:3000/img/foto41.jpeg','2025-12-03 14:00:21','2025-12-03 14:00:21'),(15,12,'Tribalistas','2002-10-07','http://localhost:3000/img/foto44.jpeg','2025-12-03 14:00:21','2025-12-03 14:00:21'),(16,13,'Oproprio','2025-11-30','http://localhost:3000/img/foto46.jpeg','2025-12-03 14:00:21','2025-12-03 14:00:21'),(17,14,'Californication','1999-06-08','http://localhost:3000/img/foto49.jpeg','2025-12-03 14:00:21','2025-12-03 14:00:21');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Billie Eilish','Cantora e compositora norte-americana de música alternativa.','https://i.imgur.com/WrXv0O3.jpg','2025-12-03 14:00:14','2025-12-03 14:00:14'),(2,'The Weeknd','Cantor canadense de R&B e pop.','https://i.imgur.com/Y9E7eDL.jpg','2025-12-03 14:00:14','2025-12-03 14:00:14'),(3,'Imagine Dragons','Banda de pop rock dos Estados Unidos.','https://i.imgur.com/rLpDrmi.jpg','2025-12-03 14:00:14','2025-12-03 14:00:14'),(4,'Coldplay','Banda britânica de rock alternativo.','https://i.imgur.com/9fKNYpu.jpg','2025-12-03 14:00:14','2025-12-03 14:00:14'),(5,'Taylor Swift','Cantora e compositora norte-americana de pop e country.','https://i.imgur.com/jpXMc7E.jpg','2025-12-03 14:00:14','2025-12-03 14:00:14'),(6,'Tim Maia','Cantor e compositor brasileiro, referência da soul music no Brasil.','http://localhost:3000/img/timmaia.jpeg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(7,'Marisa Monte','Cantora e compositora brasileira de MPB.','https://i.imgur.com/MarisaMonte.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(8,'Charlie Brown Jr','Banda brasileira de rock, rap rock e punk rock de Santos, SP.','https://i.imgur.com/CharlieBrownJR.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(9,'System of a Down','Banda norte-americana de metal alternativo formada em 1994.','https://i.imgur.com/soad.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(10,'Djavan','Cantor e compositor brasileiro de MPB e jazz.','https://i.imgur.com/djavan.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(11,'Radiohead','Banda britânica de rock alternativo e experimental.','https://i.imgur.com/radiohead.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(12,'Tribalistas','Grupo brasileiro formado por Marisa Monte, Arnaldo Antunes e Carlinhos Brown.','https://i.imgur.com/fotoTribalistas.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(13,'Yago Oproprio','Artista independente.','https://i.imgur.com/fotoYago.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20'),(14,'Red Hot Chili Peppers','Banda americana de rock formada em Los Angeles em 1983.','https://i.imgur.com/fotoRCHP.jpg','2025-12-03 14:00:20','2025-12-03 14:00:20');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `track_id` int DEFAULT NULL,
  `comunidade_id` int DEFAULT NULL,
  `conteudo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  KEY `comunidade_id` (`comunidade_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`comunidade_id`) REFERENCES `comunidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidades`
--

DROP TABLE IF EXISTS `comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `admin_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `comunidades_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (1,'Minha Comunidade','Descrição teste',1,'2025-12-03 14:00:16','2025-12-03 14:00:16');
/*!40000 ALTER TABLE `comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `track_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`track_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,'2025-12-03 14:00:16'),(1,4,'2025-12-03 14:00:16'),(1,7,'2025-12-03 14:00:16'),(1,10,'2025-12-03 14:00:16'),(1,13,'2025-12-03 14:00:16');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Pop','Música popular contemporânea.'),(2,'R&B','Rhythm and Blues moderno.'),(3,'Rock Alternativo','Mistura de rock com estilos experimentais.'),(4,'Indie','Música independente com sonoridade experimental.'),(5,'Eletrônico','Batidas e produção digital.');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros_comunidade`
--

DROP TABLE IF EXISTS `membros_comunidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros_comunidade` (
  `user_id` int NOT NULL,
  `comunidades_id` int NOT NULL,
  `joined_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`comunidades_id`),
  KEY `comunidades_id` (`comunidades_id`),
  CONSTRAINT `membros_comunidade_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `membros_comunidade_ibfk_2` FOREIGN KEY (`comunidades_id`) REFERENCES `comunidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros_comunidade`
--

LOCK TABLES `membros_comunidade` WRITE;
/*!40000 ALTER TABLE `membros_comunidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `membros_comunidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_history`
--

DROP TABLE IF EXISTS `play_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `track_id` int NOT NULL,
  `played_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `play_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `play_history_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_history`
--

LOCK TABLES `play_history` WRITE;
/*!40000 ALTER TABLE `play_history` DISABLE KEYS */;
INSERT INTO `play_history` VALUES (1,1,4,'2025-12-01 14:00:16'),(2,1,1,'2025-12-02 14:00:16'),(3,1,10,'2025-12-03 11:00:16'),(4,1,7,'2025-12-03 12:00:16'),(5,1,13,'2025-12-03 13:30:16');
/*!40000 ALTER TABLE `play_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_tracks`
--

DROP TABLE IF EXISTS `playlist_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_tracks` (
  `playlist_id` int NOT NULL,
  `track_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `playlist_tracks_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlist_tracks_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_tracks`
--

LOCK TABLES `playlist_tracks` WRITE;
/*!40000 ALTER TABLE `playlist_tracks` DISABLE KEYS */;
INSERT INTO `playlist_tracks` VALUES (1,1,1),(1,4,2),(1,5,5),(1,13,3),(1,14,4),(2,2,1),(2,3,4),(2,10,2),(2,11,3),(3,7,1),(3,8,2),(3,9,3),(3,15,4);
/*!40000 ALTER TABLE `playlist_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'Hits Pop 2020+','Playlist com os maiores hits pop dos últimos anos.',1,'2025-12-03 14:00:15','2025-12-03 14:00:15'),(2,1,'Relax & Chill','Músicas suaves para relaxar.',1,'2025-12-03 14:00:15','2025-12-03 14:00:15'),(3,1,'Treino ?','Faixas animadas para treinar com energia.',0,'2025-12-03 14:00:15','2025-12-03 14:00:15');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_genres`
--

DROP TABLE IF EXISTS `track_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_genres` (
  `track_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `track_genres_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `track_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_genres`
--

LOCK TABLES `track_genres` WRITE;
/*!40000 ALTER TABLE `track_genres` DISABLE KEYS */;
INSERT INTO `track_genres` VALUES (1,1),(2,1),(3,1),(13,1),(14,1),(15,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,4),(11,4),(12,4);
/*!40000 ALTER TABLE `track_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `album_id` int DEFAULT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lyrics` text COLLATE utf8mb4_unicode_ci,
  `release_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,1,'Happier Than Ever','http://localhost:3000/img/foto1.jpeg',298,'http://localhost:3000/audio/audio1.mp3','When I’m away from you...','2021-07-30','2025-12-03 14:00:15'),(2,1,'Getting Older','http://localhost:3000/img/foto1.jpeg',240,'http://localhost:3000/audio/audio2.mp3','Things I once enjoyed...','2021-07-30','2025-12-03 14:00:15'),(3,1,'Therefore I Am','http://localhost:3000/img/foto1.jpeg',174,'http://localhost:3000/audio/audio3.mp3','Stop, what the hell are you talking about?','2020-11-12','2025-12-03 14:00:15'),(4,2,'Blinding Lights','http://localhost:3000/img/foto4.jpeg',200,'http://localhost:3000/audio/audio4.mp3','I said, ooh, I’m blinded by the lights...','2019-11-29','2025-12-03 14:00:15'),(5,2,'Save Your Tears','http://localhost:3000/img/foto4.jpeg',215,'http://localhost:3000/audio/audio5.mp3','I saw you dancing in a crowded room...','2020-08-09','2025-12-03 14:00:15'),(6,2,'In Your Eyes','http://localhost:3000/img/foto4.jpeg',239,'http://localhost:3000/audio/audio6.mp3','I just pretend that I’m in the dark...','2020-03-20','2025-12-03 14:00:15'),(7,3,'Believer','http://localhost:3000/img/foto7.jpeg',204,'http://localhost:3000/audio/audio7.mp3','First things first...','2017-02-01','2025-12-03 14:00:15'),(8,3,'Thunder','http://localhost:3000/img/foto7.jpeg',187,'http://localhost:3000/audio/audio8.mp3','Just a young gun...','2017-04-27','2025-12-03 14:00:15'),(9,3,'Whatever It Takes','http://localhost:3000/img/foto7.jpeg',201,'http://localhost:3000/audio/audio9.mp3','Falling too fast...','2017-05-08','2025-12-03 14:00:15'),(10,4,'Adventure of a Lifetime','http://localhost:3000/img/foto10.jpeg',270,'http://localhost:3000/audio/audio10.mp3','Turn your magic on...','2015-11-06','2025-12-03 14:00:15'),(11,4,'Up&Up','http://localhost:3000/img/foto10.jpeg',390,'http://localhost:3000/audio/audio11.mp3','We’re gonna get it together right now...','2016-05-16','2025-12-03 14:00:15'),(12,4,'Hymn for the Weekend','http://localhost:3000/img/foto10.jpeg',260,'http://localhost:3000/audio/audio12.mp3','Oh angel sent from up above...','2016-01-25','2025-12-03 14:00:15'),(13,5,'Blank Space','http://localhost:3000/img/foto13.jpeg',231,'http://localhost:3000/audio/audio13.mp3','Got a long list of ex-lovers...','2014-10-27','2025-12-03 14:00:15'),(14,5,'Style','http://localhost:3000/img/foto13.jpeg',231,'http://localhost:3000/audio/audio14.mp3','Midnight, you come and pick me up...','2015-02-09','2025-12-03 14:00:15'),(15,5,'Shake It Off','http://localhost:3000/img/foto13.jpeg',242,'http://localhost:3000/audio/audio15.mp3','Cause the players gonna play...','2014-08-18','2025-12-03 14:00:15'),(16,6,'Starboy','http://localhost:3000/img/foto16.jpeg',230,'http://localhost:3000/audio/audio16.mp3','I am a Starboy...','2016-09-22','2025-12-03 14:00:21'),(17,6,'Die For You','http://localhost:3000/img/foto16.jpeg',210,'http://localhost:3000/audio/audio17.mp3','I would die for you...','2016-11-18','2025-12-03 14:00:21'),(18,6,'I Feel It Coming','http://localhost:3000/img/foto16.jpeg',245,'http://localhost:3000/audio/audio18.mp3','Tell me what you really like...','2016-11-18','2025-12-03 14:00:21'),(19,7,'Primavera','http://localhost:3000/img/foto19.jpg',250,'http://localhost:3000/audio/audio19.mp3','Letra da música Primavera...','1970-01-01','2025-12-03 14:00:21'),(20,7,'Azul da Cor do Mar','http://localhost:3000/img/foto19.jpg',200,'http://localhost:3000/audio/audio20.mp3','Letra da música Azul da Cor do Mar...','1970-01-01','2025-12-03 14:00:21'),(21,7,'Não Quero Dinheiro (Só Quero Amar)','http://localhost:3000/img/foto19.jpg',210,'http://localhost:3000/audio/audio21.mp3','Letra da música Não Quero Dinheiro...','1970-01-01','2025-12-03 14:00:21'),(22,8,'O Descobridor dos 7 Mares','http://localhost:3000/img/foto22.jpeg',220,'http://localhost:3000/audio/audio22.mp3','Letra da música O Descobridor dos 7 Mares...','1983-01-01','2025-12-03 14:00:21'),(23,8,'Sossego','http://localhost:3000/img/foto22.jpeg',210,'http://localhost:3000/audio/audio23.mp3','Letra da música Sossego...','1983-01-01','2025-12-03 14:00:21'),(24,8,'Gostava Tanto de Você','http://localhost:3000/img/foto22.jpeg',230,'http://localhost:3000/audio/audio24.mp3','Letra da música Gostava Tanto de Você...','1983-01-01','2025-12-03 14:00:21'),(25,9,'Ainda Bem','http://localhost:3000/img/foto25.jpeg',250,'http://localhost:3000/audio/audio25.mp3','Letra da música Ainda Bem...','2011-09-30','2025-12-03 14:00:21'),(26,9,'Depois','http://localhost:3000/img/foto25.jpeg',230,'http://localhost:3000/audio/audio26.mp3','Letra da música Depois...','2011-09-30','2025-12-03 14:00:21'),(27,9,'Bem Aqui','http://localhost:3000/img/foto25.jpeg',240,'http://localhost:3000/audio/audio27.mp3','Letra da música Bem Aqui...','2011-09-30','2025-12-03 14:00:21'),(28,10,'É Quente','http://localhost:3000/img/foto28.jpeg',210,'http://localhost:3000/audio/audio28.mp3','Letra da música É Quente...','2005-06-14','2025-12-03 14:00:21'),(29,10,'Lutar Pelo Que É Meu','http://localhost:3000/img/foto28.jpeg',220,'http://localhost:3000/audio/audio29.mp3','Letra da música Lutar Pelo Que É Meu...','2005-06-14','2025-12-03 14:00:21'),(30,10,'I Feel So Good Today','http://localhost:3000/img/foto28.jpeg',230,'http://localhost:3000/audio/audio30.mp3','Letra da música I Feel So Good Today...','2005-06-14','2025-12-03 14:00:21'),(31,11,'Dona do Meu Pensamento','http://localhost:3000/img/foto31.jpeg',200,'http://localhost:3000/audio/audio31.mp3','Letra da música Dona do Meu Pensamento...','2009-07-07','2025-12-03 14:00:21'),(32,11,'Só Os Loucos Sabem','http://localhost:3000/img/foto31.jpeg',210,'http://localhost:3000/audio/audio32.mp3','Letra da música Só Os Loucos Sabem...','2009-07-07','2025-12-03 14:00:21'),(33,11,'Me Encontra','http://localhost:3000/img/foto31.jpeg',220,'http://localhost:3000/audio/audio33.mp3','Letra da música Me Encontra...','2009-07-07','2025-12-03 14:00:21'),(34,12,'Deer Dance','http://localhost:3000/img/foto34.jpeg',210,'http://localhost:3000/audio/audio34.mp3','Lyrics da música Deer Dance...','2001-09-04','2025-12-03 14:00:21'),(35,12,'Chop Suey!','http://localhost:3000/img/foto34.jpeg',215,'http://localhost:3000/audio/audio35.mp3','Lyrics da música Chop Suey!...','2001-09-04','2025-12-03 14:00:21'),(36,12,'Aerials','http://localhost:3000/img/foto34.jpeg',240,'http://localhost:3000/audio/audio36.mp3','Lyrics da música Aerials...','2001-09-04','2025-12-03 14:00:21'),(37,13,'Oceano','http://localhost:3000/img/foto37.jpeg',300,'http://localhost:3000/audio/audio37.mp3','Lyrics da música Oceano...','1976-01-01','2025-12-03 14:00:21'),(38,13,'Você Bem Sabe','http://localhost:3000/img/foto37.jpeg',270,'http://localhost:3000/audio/audio38.mp3','Lyrics da música Você Bem Sabe...','1976-01-01','2025-12-03 14:00:21'),(39,13,'Avião','http://localhost:3000/img/foto37.jpeg',250,'http://localhost:3000/audio/audio39.mp3','Lyrics da música Avião...','1976-01-01','2025-12-03 14:00:21'),(40,14,'No Surprises','http://localhost:3000/img/foto40.jpeg',230,'http://localhost:3000/audio/audio40.mp3','Lyrics da música No Surprises...','1997-05-21','2025-12-03 14:00:21'),(41,14,'Let Down','http://localhost:3000/img/foto40.jpeg',270,'http://localhost:3000/audio/audio41.mp3','Lyrics da música Let Down...','1997-05-21','2025-12-03 14:00:21'),(42,14,'Karma Police','http://localhost:3000/img/foto40.jpeg',260,'http://localhost:3000/audio/audio42.mp3','Lyrics da música Karma Police...','1997-05-21','2025-12-03 14:00:21'),(43,15,'Velha Infância','http://localhost:3000/img/foto43.jpeg',240,'http://localhost:3000/audio/audio43.mp3','Lyrics da música Velha Infância...','2002-10-07','2025-12-03 14:00:21'),(44,15,'Já Sei Namorar','http://localhost:3000/img/foto43.jpeg',230,'http://localhost:3000/audio/audio44.mp3','Lyrics da música Já Sei Namorar...','2002-10-07','2025-12-03 14:00:21'),(45,15,'É Você','http://localhost:3000/img/foto43.jpeg',220,'http://localhost:3000/audio/audio45.mp3','Lyrics da música É Você...','2002-10-07','2025-12-03 14:00:21'),(46,16,'Papoulas','http://localhost:3000/img/foto47.jpeg',210,'http://localhost:3000/audio/audio46.mp3','Lyrics da música Papoulas...','2025-11-30','2025-12-03 14:00:21'),(47,16,'Enigma','http://localhost:3000/img/foto47.jpeg',220,'http://localhost:3000/audio/audio47.mp3','Lyrics da música Enigma...','2025-11-30','2025-12-03 14:00:21'),(48,16,'La Noche','http://localhost:3000/img/foto47.jpeg',230,'http://localhost:3000/audio/audio48.mp3','Lyrics da música La Noche...','2025-11-30','2025-12-03 14:00:21'),(49,17,'Otherside','http://localhost:3000/img/foto49.jpeg',250,'http://localhost:3000/audio/audio49.mp3','Lyrics da música Otherside...','1999-06-08','2025-12-03 14:00:21'),(50,17,'Scar Tissue','http://localhost:3000/img/foto49.jpeg',230,'http://localhost:3000/audio/audio50.mp3','Lyrics da música Scar Tissue...','1999-06-08','2025-12-03 14:00:21'),(51,17,'Californication','http://localhost:3000/img/foto49.jpeg',260,'http://localhost:3000/audio/audio51.mp3','Lyrics da música Californication...','1999-06-08','2025-12-03 14:00:21');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_token` (`session_token`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (1,1,'abc123sessiontoken','2025-12-10 14:00:16','2025-12-03 14:00:16');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auth_provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'local',
  `bio` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ka_hina','ka@hina.com','123456',NULL,1,'2025-12-03 14:00:14','2025-12-03 14:00:14','local',NULL),(2,'Camy','camytx@hotmail.com','$2b$10$WHAq6Yp83fF7r86y4AqLouLfJD0sjU4ipIkfuyfc4lZZGNAbyTIte','blob:http://localhost:5173/6a58ccd4-a303-43d3-967e-5bb74aa1d38d',1,'2025-12-03 17:00:52','2025-12-03 17:01:21','local','a vida sem música seria um erro ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'echomusica'
--

--
-- Dumping routines for database 'echomusica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 14:12:37
