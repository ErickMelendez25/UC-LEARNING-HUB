CREATE DATABASE  IF NOT EXISTS `universidad_continental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad_continental`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad_continental
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `asesores`
--

DROP TABLE IF EXISTS `asesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(255) DEFAULT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre_asesor` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `fk_asesores_correo` FOREIGN KEY (`correo`) REFERENCES `usuarios` (`correo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesores`
--

LOCK TABLES `asesores` WRITE;
/*!40000 ALTER TABLE `asesores` DISABLE KEYS */;
INSERT INTO `asesores` VALUES (1,'Ingeniera Mecatrónica','2024-12-06 16:32:25','Juliana','Bartolo','Ibaber','12345678','asesor3@gmail.com'),(2,'Ingeniero de Sistemas','2024-12-13 05:38:00','Renzo','Balta','Milan','12345678901','asesor4@gmail.com');
/*!40000 ALTER TABLE `asesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atencioncitas`
--

DROP TABLE IF EXISTS `atencioncitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atencioncitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int NOT NULL,
  `areaDerivacion` enum('tutoria','mentoria','tópico','personal','CAS','Defensoría') NOT NULL,
  `diagnosticoPresuntivo` enum('Familiar','Académico','agresivo_pasivo','ansiedad','antisocial') NOT NULL,
  `medioContacto` enum('boca_a_boca','protocolo_de_salud_mental','entrevistas') NOT NULL,
  `recomendacion` text,
  `observaciones` text,
  `creadoEn` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citaId` (`citaId`),
  CONSTRAINT `atencioncitas_ibfk_1` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencioncitas`
--

LOCK TABLES `atencioncitas` WRITE;
/*!40000 ALTER TABLE `atencioncitas` DISABLE KEYS */;
INSERT INTO `atencioncitas` VALUES (221,91,'tutoria','Académico','boca_a_boca','Fortalecer habilidades de estudio','Paciente requiere orientación.','2025-03-04 14:17:09','2025-03-04 14:17:09'),(222,92,'mentoria','ansiedad','entrevistas','Manejo de ansiedad generalizada','Se sugiere incorporar técnicas de relajación y meditación diaria.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(223,93,'tópico','Familiar','boca_a_boca','Asesoramiento familiar en gestión de conflictos','Es necesario fomentar una mejor comunicación dentro del hogar.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(224,94,'Defensoría','antisocial','entrevistas','Terapia cognitiva-conductual para conductas antisociales','Se recomienda trabajo constante sobre el control de impulsos y resolución de conflictos.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(225,95,'CAS','ansiedad','protocolo_de_salud_mental','Terapia para manejo de ansiedad','El paciente muestra signos de ansiedad severa, requiere seguimiento psicológico.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(226,96,'tutoria','Académico','boca_a_boca','Asesoramiento sobre orientación vocacional','Se sugiere tomar decisiones más informadas sobre el futuro académico.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(227,97,'mentoria','Familiar','protocolo_de_salud_mental','Fortalecer la comunicación familiar','Se recomienda fomentar la empatía y paciencia entre los miembros de la familia.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(228,98,'tópico','agresivo_pasivo','entrevistas','Terapia para mejorar la agresividad pasiva','El paciente necesita identificar y cambiar patrones de comportamiento agresivo pasivo.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(229,99,'Defensoría','antisocial','boca_a_boca','Evaluación de la conducta antisocial','El paciente ha demostrado resistencia a la interacción social, se recomienda terapia grupal.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(230,100,'CAS','ansiedad','entrevistas','Terapia cognitiva conductual','Se sugiere terapia semanal para aprender a manejar los episodios de ansiedad.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(231,101,'tutoria','Académico','protocolo_de_salud_mental','Ayuda con organización académica','Paciente tiene dificultades para organizar su tiempo de estudio.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(232,102,'mentoria','ansiedad','boca_a_boca','Recomendación de técnicas de relajación para ansiedad','Paciente ha mostrado interés en técnicas de respiración profunda.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(233,103,'tópico','Familiar','protocolo_de_salud_mental','Manejo de estrés en la familia','Paciente necesita técnicas de manejo de estrés familiar para mejorar la convivencia.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(234,104,'Defensoría','ansiedad','entrevistas','Orientación en manejo de ansiedad','Se recomienda tomar medicación junto con terapia psicológica.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(235,105,'CAS','Familiar','boca_a_boca','Asesoría para resolución de conflictos familiares','Paciente muestra dificultades en la relación con los padres.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(236,106,'tutoria','Académico','protocolo_de_salud_mental','Revisión de hábitos de estudio','El paciente debe mejorar la regularidad en su rutina académica.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(237,107,'mentoria','agresivo_pasivo','entrevistas','Terapia para reducir agresividad pasiva','Se requiere trabajar en la comunicación asertiva del paciente.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(238,108,'tópico','ansiedad','protocolo_de_salud_mental','Terapia de relajación para ansiedad','Paciente necesita aprender a controlar sus pensamientos ansiosos.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(239,109,'Defensoría','Académico','boca_a_boca','Asesoría para problemas académicos','El paciente muestra falta de interés y motivación para estudiar.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(240,110,'CAS','Familiar','entrevistas','Consejería para mejorar la relación con los padres','Requiere estrategias para mejorar la relación con los miembros de la familia.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(241,111,'tutoria','antisocial','protocolo_de_salud_mental','Evaluación y tratamiento de conductas antisociales','Se sugiere terapia individual y familiar para mejorar la interacción social.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(242,112,'mentoria','Familiar','boca_a_boca','Mejorar la dinámica familiar','Paciente presenta dificultades para compartir con sus hermanos.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(243,113,'tópico','ansiedad','entrevistas','Terapia cognitiva para ansiedad','Paciente se beneficia de las sesiones de terapia cognitiva para reducir los síntomas de ansiedad.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(244,114,'Defensoría','ansiedad','protocolo_de_salud_mental','Terapia conductual para ansiedad','Se recomienda mantener el seguimiento semanal.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(245,115,'CAS','Familiar','entrevistas','Terapia familiar para mejorar la comunicación','Paciente y sus padres deben trabajar en su forma de comunicarse.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(246,116,'tutoria','Académico','boca_a_boca','Asesoría para mejorar la concentración en estudios','Paciente presenta dificultades para mantenerse concentrado en clases.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(247,117,'mentoria','ansiedad','protocolo_de_salud_mental','Terapia cognitiva para controlar la ansiedad','Paciente debe aprender a manejar situaciones que generan ansiedad.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(248,118,'tópico','Familiar','entrevistas','Consejería en relaciones familiares','El paciente debe establecer mejores límites y respeto con los padres.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(249,119,'Defensoría','ansiedad','boca_a_boca','Sesión de orientación para ansiedad','Se recomienda incorporar técnicas de manejo de emociones en la vida diaria.','2025-03-04 14:17:55','2025-03-04 14:17:55'),(250,120,'CAS','Familiar','protocolo_de_salud_mental','Asesoría psicológica para conflictos familiares','El paciente necesita desarrollar habilidades de comunicación para resolver conflictos.','2025-03-04 14:17:55','2025-03-04 14:17:55');
/*!40000 ALTER TABLE `atencioncitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificados`
--

DROP TABLE IF EXISTS `certificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_informe_final` int DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `firma_decano` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_informe_final` (`id_informe_final`),
  CONSTRAINT `certificados_ibfk_2` FOREIGN KEY (`id_informe_final`) REFERENCES `informes_final` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificados`
--

LOCK TABLES `certificados` WRITE;
/*!40000 ALTER TABLE `certificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificados_practicas`
--

DROP TABLE IF EXISTS `certificados_practicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificados_practicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `correo` varchar(255) NOT NULL,
  `certificado_practicas` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificados_practicas`
--

LOCK TABLES `certificados_practicas` WRITE;
/*!40000 ALTER TABLE `certificados_practicas` DISABLE KEYS */;
INSERT INTO `certificados_practicas` VALUES (1,7,'estudiante3@gmail.com','C:\\REACT\\CampusUC\\uploads\\1734651417957.pdf','2024-12-19 23:36:57'),(2,9,'estudiante4@gmail.com','C:\\REACT\\CampusUC\\uploads\\1734651443171.pdf','2024-12-19 23:37:23'),(3,7,'estudiante3@gmail.com','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736051841202.pdf','2025-01-05 04:37:21'),(4,9,'estudiante4@gmail.com','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736109797085.pdf','2025-01-05 20:43:17'),(5,7,'estudiante3@gmail.com','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736111317584.pdf','2025-01-05 21:08:37'),(6,7,'estudiante3@gmail.com','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736137718557.pdf','2025-01-06 04:28:38'),(7,9,'estudiante4@gmail.com','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736137775456.pdf','2025-01-06 04:29:35'),(8,7,'estudiante3@gmail.com','1736139532979.pdf','2025-01-06 04:58:53'),(9,10,'marana@continental.edu.pe','1736141724386.pdf','2025-01-06 05:35:24'),(10,7,'erickmelval3@gmail.com','1737394845206.pdf','2025-01-20 17:40:45'),(11,7,'erickmelval3@gmail.com','1737394887986.pdf','2025-01-20 17:41:28'),(12,31,'estudiante4@gmail.com','1748922416032.pdf','2025-06-03 03:46:56'),(13,31,'estudiante4@gmail.com','1748922507979.pdf','2025-06-03 03:48:28');
/*!40000 ALTER TABLE `certificados_practicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `psicologo_id` int NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` enum('virtual','presencial') NOT NULL,
  `estado` enum('agendada','confirmada','realizada','cancelada') NOT NULL,
  `meetlink` varchar(255) DEFAULT NULL,
  `citaPreviaId` int DEFAULT NULL,
  `creadoEn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `psicologo_id` (`psicologo_id`),
  KEY `citaPreviaId` (`citaPreviaId`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`psicologo_id`) REFERENCES `psicologos` (`id`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`citaPreviaId`) REFERENCES `citas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (91,1,4,'Consulta de orientación académica','2025-04-01','10:00:00','virtual','agendada','https://meet.google.com/abc-def-ghi',NULL,'2025-04-01 09:30:00'),(92,2,4,'Asesoría psicológica','2025-04-02','14:00:00','presencial','confirmada',NULL,NULL,'2025-04-02 13:30:00'),(93,3,5,'Terapia de ansiedad','2025-04-03','08:00:00','virtual','realizada','https://meet.google.com/xyz-uvw-lmn',NULL,'2025-04-03 07:30:00'),(94,4,4,'Asesoría de carrera','2025-04-04','11:00:00','presencial','cancelada',NULL,NULL,'2025-04-04 10:30:00'),(95,5,5,'Evaluación psicológica','2025-04-05','09:00:00','virtual','agendada','https://meet.google.com/ghi-jkl-mno',NULL,'2025-04-05 08:30:00'),(96,6,5,'Seguimiento académico','2025-04-06','13:00:00','presencial','realizada',NULL,NULL,'2025-04-06 12:30:00'),(97,7,5,'Terapia para ansiedad','2025-04-07','10:00:00','virtual','agendada','https://meet.google.com/lmn-opq-rst',NULL,'2025-04-07 09:30:00'),(98,8,5,'Asesoría sobre conducta','2025-04-08','15:00:00','presencial','confirmada',NULL,NULL,'2025-04-08 14:30:00'),(99,9,5,'Consulta emocional','2025-04-09','09:30:00','virtual','realizada','https://meet.google.com/uvw-def-hjk',NULL,'2025-04-09 09:00:00'),(100,10,4,'Terapia de grupo','2025-04-10','16:00:00','presencial','cancelada',NULL,NULL,'2025-04-10 15:30:00'),(101,11,6,'Sesión de diagnóstico','2025-04-11','10:30:00','virtual','agendada','https://meet.google.com/def-jkl-mno',NULL,'2025-04-11 10:00:00'),(102,12,6,'Asesoría profesional','2025-04-12','14:30:00','presencial','confirmada',NULL,NULL,'2025-04-12 14:00:00'),(103,13,6,'Terapia cognitiva','2025-04-13','11:00:00','virtual','realizada','https://meet.google.com/xyz-lmn-opq',NULL,'2025-04-13 10:30:00'),(104,14,6,'Orientación académica','2025-04-14','13:00:00','presencial','cancelada',NULL,NULL,'2025-04-14 12:30:00'),(105,15,6,'Terapia para estrés','2025-04-15','09:00:00','virtual','agendada','https://meet.google.com/jkl-pqr-stu',NULL,'2025-04-15 08:30:00'),(106,16,4,'Sesión sobre motivación','2025-04-16','14:00:00','presencial','confirmada',NULL,NULL,'2025-04-16 13:30:00'),(107,17,5,'Consulta familiar','2025-04-17','09:00:00','virtual','realizada','https://meet.google.com/uvw-jkl-opq',NULL,'2025-04-17 08:30:00'),(108,18,4,'Asesoría para toma de decisiones','2025-04-18','10:30:00','presencial','cancelada',NULL,NULL,'2025-04-18 10:00:00'),(109,19,4,'Terapia de apoyo emocional','2025-04-19','12:00:00','virtual','agendada','https://meet.google.com/abc-ghi-jkl',NULL,'2025-04-19 11:30:00'),(110,20,4,'Atención psicológica','2025-04-20','13:30:00','presencial','confirmada',NULL,NULL,'2025-04-20 13:00:00'),(111,21,4,'Terapia emocional','2025-04-21','15:00:00','virtual','realizada','https://meet.google.com/lmn-jkl-pqr',NULL,'2025-04-21 14:30:00'),(112,22,4,'Orientación en salud mental','2025-04-22','10:00:00','presencial','cancelada',NULL,NULL,'2025-04-22 09:30:00'),(113,1,4,'Asesoría vocacional','2025-04-23','12:00:00','virtual','agendada','https://meet.google.com/pqr-def-lmn',NULL,'2025-04-23 11:30:00'),(114,1,4,'Atención grupal','2025-04-24','14:00:00','presencial','confirmada',NULL,NULL,'2025-04-24 13:30:00'),(115,1,4,'Terapia cognitiva-conductual','2025-04-25','13:00:00','virtual','realizada','https://meet.google.com/jkl-pqr-stu',NULL,'2025-04-25 12:30:00'),(116,26,4,'Evaluación psicológica','2025-04-26','09:00:00','presencial','cancelada',NULL,NULL,'2025-04-26 08:30:00'),(117,26,6,'Consejería educativa','2025-04-27','11:00:00','virtual','agendada','https://meet.google.com/mno-jkl-pqr',NULL,'2025-04-27 10:30:00'),(118,2,5,'Consulta para mejora personal','2025-04-28','12:30:00','presencial','confirmada',NULL,NULL,'2025-04-28 12:00:00'),(119,20,6,'Terapia para manejo de emociones','2025-04-29','10:30:00','virtual','realizada','https://meet.google.com/ghi-lmn-opq',NULL,'2025-04-29 10:00:00'),(120,2,6,'Atención psicológica integral','2025-04-30','14:00:00','presencial','cancelada',NULL,NULL,'2025-04-30 13:30:00');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios_secretaria`
--

DROP TABLE IF EXISTS `comentarios_secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_secretaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_practica` int DEFAULT NULL,
  `comentario` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_practica` (`id_practica`),
  CONSTRAINT `comentarios_secretaria_ibfk_1` FOREIGN KEY (`id_practica`) REFERENCES `practicas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios_secretaria`
--

LOCK TABLES `comentarios_secretaria` WRITE;
/*!40000 ALTER TABLE `comentarios_secretaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunicacion_evaluacion`
--

DROP TABLE IF EXISTS `comunicacion_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunicacion_evaluacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_comision` int DEFAULT NULL,
  `comentario_comision` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_comision` (`id_comision`),
  CONSTRAINT `comunicacion_evaluacion_ibfk_2` FOREIGN KEY (`id_comision`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicacion_evaluacion`
--

LOCK TABLES `comunicacion_evaluacion` WRITE;
/*!40000 ALTER TABLE `comunicacion_evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicacion_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_avance`
--

DROP TABLE IF EXISTS `control_avance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_avance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `informe_revision_avance` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_avance`
--

LOCK TABLES `control_avance` WRITE;
/*!40000 ALTER TABLE `control_avance` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_avance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convalidaciones_experiencias`
--

DROP TABLE IF EXISTS `convalidaciones_experiencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convalidaciones_experiencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `solicitud_inscripcion` varchar(255) DEFAULT NULL,
  `estado_solicitud_inscripcion` enum('Aprobado','Rechazado') DEFAULT NULL,
  `plan_convalidacion` varchar(255) DEFAULT NULL,
  `estado_plan_convalidacion` enum('Aprobado','Rechazado') DEFAULT NULL,
  `estado_inscripcion` enum('Derivar a Comisión','Rechazado') DEFAULT NULL,
  `comentario_inscripcion` text,
  `observacion_comision` text,
  `id_revisor` int DEFAULT NULL,
  `informe_convalidacion` varchar(255) DEFAULT NULL,
  `estado_informe_convalidacion` enum('Aprobado','Rechazado') DEFAULT NULL,
  `solicitud_revision` varchar(255) DEFAULT NULL,
  `estado_revision` enum('Derivar a Comisión','Rechazado') DEFAULT NULL,
  `comentario_revision` text,
  `estado_remitir` enum('Remitir','Rechazar') DEFAULT NULL,
  `comentario_notificacion` text,
  `comentario_convalidacion` text,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_revisor` (`id_revisor`),
  CONSTRAINT `convalidaciones_experiencias_ibfk_2` FOREIGN KEY (`id_revisor`) REFERENCES `revisores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convalidaciones_experiencias`
--

LOCK TABLES `convalidaciones_experiencias` WRITE;
/*!40000 ALTER TABLE `convalidaciones_experiencias` DISABLE KEYS */;
INSERT INTO `convalidaciones_experiencias` VALUES (9,7,'D:\\CAMP PROYECT\\CampusUNCP\\uploads\\1737394686076.pdf','Aprobado','D:\\CAMP PROYECT\\CampusUNCP\\uploads\\1737394686138.pdf','Aprobado','Derivar a Comisión','jeje','cds',1,'D:\\CAMP PROYECT\\CampusUC\\uploads\\1736744980352.pdf','Aprobado','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736744980373.pdf','Derivar a Comisión','','Remitir','El Resultado de Informe Final fue realizado con el siguiente estado: Informe Final: Pendiente, Asesoría: Pendiente.','excelente trabajo'),(10,9,'D:\\CAMP PROYECT\\CampusUC\\uploads\\1736652514759.pdf','Aprobado','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736652514806.pdf','Aprobado','Rechazado','cs,cjwa','du',2,'D:\\CAMP PROYECT\\CampusUC\\uploads\\1736738927599.pdf','Aprobado','D:\\CAMP PROYECT\\CampusUC\\uploads\\1736738927627.pdf','Derivar a Comisión','','Remitir','El Resultado de Informe Final fue realizado con el siguiente estado: Informe Final: Pendiente, Asesoría: Pendiente.','excelente'),(11,10,'D:\\CAMP PROYECT\\CampusUNCP\\uploads\\1737482146631.pdf','Aprobado','D:\\CAMP PROYECT\\CampusUNCP\\uploads\\1737482146692.pdf','Aprobado','Derivar a Comisión','excelente trabajo','Excelente',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `convalidaciones_experiencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `nombre_docente` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,21,'Lucas','Perez','Lopez','Ingeniería de Sistemas','2024-12-03 18:16:04'),(2,24,'Cesar','K','d',NULL,'2024-12-03 18:59:39');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes_revisores`
--

DROP TABLE IF EXISTS `docentes_revisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_revisores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_docente` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes_revisores`
--

LOCK TABLES `docentes_revisores` WRITE;
/*!40000 ALTER TABLE `docentes_revisores` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes_revisores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `dni` char(8) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `codigo` varchar(100) NOT NULL,
  `sede` enum('Huancayo','Los Olivos','Cusco','Arequipa','CUF') NOT NULL,
  `ciclo` int DEFAULT NULL,
  `carrera` varchar(255) DEFAULT NULL,
  `modalidad` enum('presencial','semipresencial','a_distancia') NOT NULL,
  `calendar_fecha` varchar(100) DEFAULT NULL,
  `calendar` datetime DEFAULT NULL,
  `creadoEn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Juan','Pérez','Gómez','12345678','juan.perez@mail.com','987654321','foto1.jpg','COD001','Huancayo',2,'Ingeniería de Sistemas','presencial','2025-04-01','2025-04-01 10:00:00','2025-03-04 13:41:28'),(2,'Ana','Ramírez','López','23456789','ana.ramirez@mail.com','987654322','foto2.jpg','COD002','Los Olivos',3,'Arquitectura','semipresencial','2025-05-01','2025-05-01 14:00:00','2025-03-04 13:41:28'),(3,'Carlos','García','Martínez','34567890','carlos.garcia@mail.com','987654323','foto3.jpg','COD003','Cusco',1,'Derecho','a_distancia','2025-06-01','2025-06-01 08:00:00','2025-03-04 13:41:28'),(4,'Luisa','Fernández','Sánchez','45678901','luisa.fernandez@mail.com','987654324','foto4.jpg','COD004','Arequipa',4,'Medicina','presencial','2025-07-01','2025-07-01 11:00:00','2025-03-04 13:41:28'),(5,'Jorge','Martínez','Hernández','56789012','jorge.martinez@mail.com','987654325','foto5.jpg','COD005','CUF',5,'Psicología','semipresencial','2025-08-01','2025-08-01 09:00:00','2025-03-04 13:41:28'),(6,'Marta','González','Díaz','67890123','marta.gonzalez@mail.com','987654326','foto6.jpg','COD006','Los Olivos',6,'Ingeniería Civil','a_distancia','2025-09-01','2025-09-01 16:00:00','2025-03-04 13:41:28'),(7,'Luis','Sánchez','Cordero','78901234','luis.sanchez@mail.com','987654327','foto7.jpg','COD007','Huancayo',3,'Economía','presencial','2025-10-01','2025-10-01 12:00:00','2025-03-04 13:41:28'),(8,'Patricia','Hernández','Paredes','89012345','patricia.hernandez@mail.com','987654328','foto8.jpg','COD008','Arequipa',2,'Ingeniería Industrial','semipresencial','2025-11-01','2025-11-01 10:00:00','2025-03-04 13:41:28'),(9,'Pedro','López','Vásquez','90123456','pedro.lopez@mail.com','987654329','foto9.jpg','COD009','Cusco',5,'Filosofía','a_distancia','2025-12-01','2025-12-01 09:00:00','2025-03-04 13:41:28'),(10,'Lucía','García','Ramírez','12346789','lucia.garcia@mail.com','987654330','foto10.jpg','COD010','Los Olivos',1,'Biología','presencial','2025-01-01','2025-01-01 08:00:00','2025-03-04 13:41:28'),(11,'Eduardo','Mora','Cruz','23457890','eduardo.mora@mail.com','987654331','foto11.jpg','COD011','Arequipa',4,'Derecho','semipresencial','2025-02-01','2025-02-01 14:00:00','2025-03-04 13:41:28'),(12,'Raúl','Morales','Flores','34568901','raul.morales@mail.com','987654332','foto12.jpg','COD012','Cusco',3,'Ingeniería de Software','a_distancia','2025-03-01','2025-03-01 10:00:00','2025-03-04 13:41:28'),(13,'Beatriz','Alvarez','Soto','45679012','beatriz.alvarez@mail.com','987654333','foto13.jpg','COD013','Los Olivos',2,'Arquitectura','presencial','2025-04-01','2025-04-01 16:00:00','2025-03-04 13:41:28'),(14,'Miguel','Vega','Guzmán','56780123','miguel.vega@mail.com','987654334','foto14.jpg','COD014','Huancayo',1,'Medicina','semipresencial','2025-05-01','2025-05-01 12:00:00','2025-03-04 13:41:28'),(15,'Raquel','Ríos','Moreno','67891234','raquel.rios@mail.com','987654335','foto15.jpg','COD015','Arequipa',4,'Psicología','a_distancia','2025-06-01','2025-06-01 14:00:00','2025-03-04 13:41:28'),(16,'Julio','Pérez','Castro','78902345','julio.perez@mail.com','987654336','foto16.jpg','COD016','Cusco',3,'Filosofía','presencial','2025-07-01','2025-07-01 09:00:00','2025-03-04 13:41:28'),(17,'Sofía','Martínez','Álvarez','89013456','sofia.martinez@mail.com','987654337','foto17.jpg','COD017','Los Olivos',5,'Ingeniería Mecánica','semipresencial','2025-08-01','2025-08-01 11:00:00','2025-03-04 13:41:28'),(18,'Federico','Gómez','Ramírez','90124567','federico.gomez@mail.com','987654338','foto18.jpg','COD018','Huancayo',2,'Derecho','presencial','2025-09-01','2025-09-01 13:00:00','2025-03-04 13:41:28'),(19,'Carolina','Hernández','Sierra','11234567','carolina.hernandez@mail.com','987654339','foto19.jpg','COD019','Arequipa',3,'Economía','a_distancia','2025-10-01','2025-10-01 14:00:00','2025-03-04 13:41:28'),(20,'Tomás','Ruiz','Vásquez','22345678','tomas.ruiz@mail.com','987654340','foto20.jpg','COD020','Cusco',4,'Ingeniería Civil','semipresencial','2025-11-01','2025-11-01 08:00:00','2025-03-04 13:41:28'),(21,'Laura','Fernández','Morales','33456789','laura.fernandez@mail.com','987654341','foto21.jpg','COD021','Los Olivos',2,'Arquitectura','presencial','2025-12-01','2025-12-01 15:00:00','2025-03-04 13:41:28'),(22,'Ricardo','Jiménez','Gómez','44567890','ricardo.jimenez@mail.com','987654342','foto22.jpg','COD022','Huancayo',5,'Psicología','a_distancia','2025-01-01','2025-01-01 16:00:00','2025-03-04 13:41:28'),(23,'Gabriela','Cordero','Sánchez','55678901','gabriela.cordero@mail.com','987654343','foto23.jpg','COD023','Arequipa',3,'Ingeniería Industrial','presencial','2025-02-01','2025-02-01 10:00:00','2025-03-04 13:41:28'),(24,'José','Moreno','López','66789012','jose.moreno@mail.com','987654344','foto24.jpg','COD024','Cusco',4,'Derecho','semipresencial','2025-03-01','2025-03-01 13:00:00','2025-03-04 13:41:28'),(25,'Mercedes','Ramírez','Martín','77890123','mercedes.ramirez@mail.com','987654345','foto25.jpg','COD025','Los Olivos',2,'Medicina','a_distancia','2025-04-01','2025-04-01 14:00:00','2025-03-04 13:41:28'),(26,'Santiago','Mendoza','Ríos','98765432','santiago.mendoza@mail.com','987654367','foto50.jpg','COD050','Los Olivos',2,'Ingeniería Ambiental','a_distancia','2025-05-15','2025-05-15 13:00:00','2025-03-04 13:41:28'),(30,'Juan','Pérez','Pérez','12345689','estudiante3@gmail.com','987633321',NULL,'C001','Huancayo',NULL,NULL,'presencial',NULL,NULL,'2025-06-02 11:27:12'),(31,'María','García','Pérez','12345088','estudiante4@gmail.com','911654322',NULL,'C002','Huancayo',NULL,NULL,'presencial',NULL,NULL,'2025-06-02 11:27:12'),(32,'Luis','Ramírez','Pérez','12345699','estudiante5@gmail.com','987600323',NULL,'C003','Huancayo',NULL,NULL,'presencial',NULL,NULL,'2025-06-02 11:27:12');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_revision`
--

DROP TABLE IF EXISTS `ficha_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_revision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_docente` int DEFAULT NULL,
  `comentario_revisor` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `ficha_revision_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_revision`
--

LOCK TABLES `ficha_revision` WRITE;
/*!40000 ALTER TABLE `ficha_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_citas`
--

DROP TABLE IF EXISTS `historial_citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cita` int NOT NULL,
  `estado` enum('pendiente','confirmada','rechazada','finalizada') NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_cita` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_citas`
--

LOCK TABLES `historial_citas` WRITE;
/*!40000 ALTER TABLE `historial_citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_psicologos`
--

DROP TABLE IF EXISTS `horarios_psicologos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_psicologos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_psicologo` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `disponibilidad` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_psicologo` (`id_psicologo`),
  CONSTRAINT `horarios_psicologos_ibfk_1` FOREIGN KEY (`id_psicologo`) REFERENCES `psicologos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_psicologos`
--

LOCK TABLES `horarios_psicologos` WRITE;
/*!40000 ALTER TABLE `horarios_psicologos` DISABLE KEYS */;
INSERT INTO `horarios_psicologos` VALUES (5,4,'2025-02-01','09:00:00',1),(6,4,'2025-02-01','10:00:00',1),(7,4,'2025-02-02','14:00:00',1),(8,4,'2025-02-02','15:00:00',1),(9,5,'2025-02-01','08:00:00',1),(10,5,'2025-02-01','11:00:00',1),(11,5,'2025-02-02','13:00:00',1),(12,5,'2025-02-02','16:00:00',1),(13,6,'2025-02-01','09:30:00',1),(14,6,'2025-02-01','14:30:00',1),(15,6,'2025-02-02','10:30:00',1),(16,6,'2025-02-02','16:30:00',1),(17,6,'2025-02-05','07:30:00',1);
/*!40000 ALTER TABLE `horarios_psicologos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes_asesoria`
--

DROP TABLE IF EXISTS `informes_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes_asesoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `informe_asesoria` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_informe_asesoria` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `id_asesor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `fk_asesor` (`id_asesor`),
  CONSTRAINT `fk_asesor` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes_asesoria`
--

LOCK TABLES `informes_asesoria` WRITE;
/*!40000 ALTER TABLE `informes_asesoria` DISABLE KEYS */;
INSERT INTO `informes_asesoria` VALUES (2,7,'1733508490712.pdf','2024-12-06 18:08:10','Rechazado',1),(6,7,'1733850924735.png','2024-12-10 17:15:24','Rechazado',1),(20,7,'1734067717650.pdf','2024-12-13 05:28:37','Rechazado',1),(25,7,'1734072136970.pdf','2024-12-13 06:42:16','Rechazado',1),(26,7,'1734072268431.pdf','2024-12-13 06:44:28','Rechazado',1),(27,7,'1734072273771.pdf','2024-12-13 06:44:33','Rechazado',1),(28,7,'1734072277670.pdf','2024-12-13 06:44:37','Rechazado',1),(29,7,'1734072481145.pdf','2024-12-13 06:48:01','Rechazado',1),(31,7,'1734114121544.pdf','2024-12-13 18:22:01','Rechazado',1),(32,7,'1734114163442.pdf','2024-12-13 18:22:43','Rechazado',1),(35,7,'1734114257834.pdf','2024-12-13 18:24:17','Rechazado',1),(36,7,'1734117169155.pdf','2024-12-13 19:12:49','Rechazado',1),(41,7,'1734156840230.pdf','2024-12-14 06:14:00','Rechazado',1),(43,7,'1734196598511.pdf','2024-12-14 17:16:38','Rechazado',1),(44,7,'1734196624674.pdf','2024-12-14 17:17:04','Rechazado',1),(45,7,'1734196710174.pdf','2024-12-14 17:18:30','Rechazado',1),(46,7,'1734196759071.pdf','2024-12-14 17:19:19','Rechazado',1),(47,7,'1734198712176.pdf','2024-12-14 17:51:52','Rechazado',1),(50,7,'1734200621072.pdf','2024-12-14 18:23:41','Rechazado',1),(51,7,'1734216830001.pdf','2024-12-14 22:53:50','Rechazado',1),(53,7,'1734217247707.pdf','2024-12-14 23:00:47','Rechazado',1),(54,7,'1734217289663.pdf','2024-12-14 23:01:29','Rechazado',1),(55,7,'1734217294902.pdf','2024-12-14 23:01:34','Rechazado',1),(58,7,'1734217314622.pdf','2024-12-14 23:01:54','Rechazado',1),(63,7,'1734219514454.pdf','2024-12-14 23:38:34','Rechazado',1),(64,9,'1734219604684.pdf','2024-12-14 23:40:04','Aprobado',2),(65,10,'1734565632122.pdf','2024-12-18 23:47:12','Aprobado',1);
/*!40000 ALTER TABLE `informes_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes_avance`
--

DROP TABLE IF EXISTS `informes_avance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes_avance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `solicitud_revision_avance` varchar(255) DEFAULT NULL,
  `informe_avance` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_revision_avance` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `id_asesor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `fk_asesor_id` (`id_asesor`),
  CONSTRAINT `fk_asesor_id` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes_avance`
--

LOCK TABLES `informes_avance` WRITE;
/*!40000 ALTER TABLE `informes_avance` DISABLE KEYS */;
INSERT INTO `informes_avance` VALUES (1,7,NULL,'1733500938914.pdf','2024-12-06 16:02:18','Rechazado',1),(2,7,NULL,'1733504576895.pdf','2024-12-06 17:02:56','Rechazado',1),(3,7,NULL,'1733507054276.pdf','2024-12-06 17:44:14','Rechazado',1),(4,7,NULL,'1733507241769.pdf','2024-12-06 17:47:21','Rechazado',1),(5,7,NULL,'1733507287928.pdf','2024-12-06 17:48:07','Rechazado',1),(6,7,NULL,'1733508321957.pdf','2024-12-06 18:05:21','Rechazado',1),(7,7,NULL,'1733508519257.pdf','2024-12-06 18:08:39','Rechazado',1),(8,7,NULL,'1733508587759.pdf','2024-12-06 18:09:47','Rechazado',1),(9,7,NULL,'1733508628546.pdf','2024-12-06 18:10:28','Rechazado',1),(10,7,NULL,'1733508735833.pdf','2024-12-06 18:12:15','Rechazado',1),(11,7,NULL,'1733508920872.pdf','2024-12-06 18:15:20','Rechazado',1),(12,7,NULL,'1733509165295.pdf','2024-12-06 18:19:25','Rechazado',1),(13,7,NULL,'1733509761587.jpeg','2024-12-06 18:29:21','Rechazado',1),(14,7,NULL,'1733509795196.jpeg','2024-12-06 18:29:55','Rechazado',1),(15,7,NULL,'1733510069580.pdf','2024-12-06 18:34:29','Rechazado',1),(16,7,NULL,'1733510374757.pdf','2024-12-06 18:39:34','Rechazado',1),(17,7,NULL,'1733510497161.pdf','2024-12-06 18:41:37','Rechazado',1),(18,7,NULL,'1733510514834.pdf','2024-12-06 18:41:54','Rechazado',1),(19,7,NULL,'1733510853732.pdf','2024-12-06 18:47:33','Rechazado',1),(20,7,NULL,'1733511639782.pdf','2024-12-06 19:00:39','Rechazado',1),(21,7,NULL,'1733511801929.pdf','2024-12-06 19:03:21','Rechazado',1),(22,7,NULL,'1733511816538.png','2024-12-06 19:03:36','Rechazado',1),(23,7,NULL,'1733513815340.pdf','2024-12-06 19:36:55','Rechazado',1),(24,7,NULL,'1733517648482.pdf','2024-12-06 20:40:48','Rechazado',1),(25,7,NULL,'1733854594239.png','2024-12-10 18:16:34','Rechazado',1),(26,7,NULL,'1733855116706.pdf','2024-12-10 18:25:17','Rechazado',1),(27,7,NULL,'1733855435720.pdf','2024-12-10 18:30:36','Rechazado',1),(28,7,NULL,'1733855826119.pdf','2024-12-10 18:37:06','Rechazado',1),(29,7,NULL,'1733855841833.png','2024-12-10 18:37:21','Rechazado',1),(30,7,NULL,'1733858509263.pdf','2024-12-10 19:21:49','Rechazado',1),(31,7,NULL,'1733862659296.pdf','2024-12-10 20:30:59','Rechazado',1),(32,7,NULL,'1733862735837.pdf','2024-12-10 20:32:15','Rechazado',1),(33,7,NULL,'1733862793867.pdf','2024-12-10 20:33:13','Rechazado',1),(34,7,NULL,'1733863268627.pdf','2024-12-10 20:41:08','Rechazado',1),(35,7,NULL,'1733864058938.pdf','2024-12-10 20:54:19','Rechazado',1),(36,7,NULL,'1733864274719.pdf','2024-12-10 20:57:55','Rechazado',1),(37,7,NULL,'1733864422845.pdf','2024-12-10 21:00:23','Rechazado',1),(38,7,NULL,'1733864809755.pdf','2024-12-10 21:06:49','Rechazado',1),(39,7,NULL,'1733864959853.pdf','2024-12-10 21:09:20','Rechazado',1),(40,7,NULL,'1733865122459.pdf','2024-12-10 21:12:02','Rechazado',1),(41,7,NULL,'1733865122483.pdf','2024-12-10 21:12:02','Rechazado',1),(42,7,NULL,'1733865122616.pdf','2024-12-10 21:12:02','Rechazado',1),(43,7,NULL,'1733865159624.pdf','2024-12-10 21:12:39','Rechazado',1),(44,7,NULL,'1733865625359.pdf','2024-12-10 21:20:25','Rechazado',1),(45,7,NULL,'1733865871694.pdf','2024-12-10 21:24:31','Rechazado',1),(46,7,NULL,'1733866208453.pdf','2024-12-10 21:30:08','Rechazado',1),(47,7,NULL,'1733866228104.pdf','2024-12-10 21:30:28','Rechazado',1),(48,7,NULL,'1733866609244.pdf','2024-12-10 21:36:49','Rechazado',1),(49,7,NULL,'1733866663365.pdf','2024-12-10 21:37:43','Rechazado',1),(50,7,NULL,'1733868166129.pdf','2024-12-10 22:02:46','Rechazado',1),(51,7,NULL,'1733868278428.pdf','2024-12-10 22:04:38','Rechazado',1),(52,7,NULL,'1734061265247.pdf','2024-12-13 03:41:05','Rechazado',1),(53,7,NULL,'1734061762749.pdf','2024-12-13 03:49:22','Rechazado',1),(54,7,NULL,'1734062562525.pdf','2024-12-13 04:02:42','Rechazado',1),(55,7,NULL,'1734063258918.pdf','2024-12-13 04:14:18','Rechazado',1),(56,7,NULL,'1734064152297.pdf','2024-12-13 04:29:12','Rechazado',1),(57,7,NULL,'1734064206638.pdf','2024-12-13 04:30:06','Rechazado',1),(58,7,NULL,'1734065176333.pdf','2024-12-13 04:46:16','Rechazado',1),(59,7,NULL,'1734067230753.pdf','2024-12-13 05:20:30','Rechazado',1),(60,7,NULL,'1734067730422.pdf','2024-12-13 05:28:50','Rechazado',1),(61,7,NULL,'1734067887988.pdf','2024-12-13 05:31:28','Rechazado',1),(62,7,NULL,'1734067894059.pdf','2024-12-13 05:31:34','Rechazado',1),(63,7,NULL,'1734068367662.pdf','2024-12-13 05:39:27','Rechazado',1),(64,7,NULL,'1734070360251.pdf','2024-12-13 06:12:40','Rechazado',1),(65,7,NULL,'1734071767907.pdf','2024-12-13 06:36:07','Rechazado',1),(66,7,NULL,'1734072477099.pdf','2024-12-13 06:47:57','Rechazado',1),(67,7,NULL,'1734106864532.pdf','2024-12-13 16:21:04','Rechazado',1),(68,7,NULL,'1734106919949.pdf','2024-12-13 16:21:59','Rechazado',1),(69,7,NULL,'1734106924232.pdf','2024-12-13 16:22:04','Rechazado',1),(70,7,NULL,'1734114299357.pdf','2024-12-13 18:24:59','Rechazado',1),(71,7,NULL,'1734114350052.pdf','2024-12-13 18:25:50','Rechazado',1),(72,7,NULL,'1734114372121.pdf','2024-12-13 18:26:12','Rechazado',1),(73,7,NULL,'1734154576680.pdf','2024-12-14 05:36:16','Rechazado',1),(74,7,NULL,'1734154587839.pdf','2024-12-14 05:36:27','Rechazado',1),(75,7,NULL,'1734156672758.pdf','2024-12-14 06:11:12','Rechazado',1),(76,7,NULL,'1734156903883.pdf','2024-12-14 06:15:03','Rechazado',1),(77,7,NULL,'1734159671812.pdf','2024-12-14 07:01:11','Rechazado',1),(78,7,NULL,'1734196634837.pdf','2024-12-14 17:17:14','Rechazado',1),(79,7,NULL,'1734196642067.pdf','2024-12-14 17:17:22','Rechazado',1),(80,7,NULL,'1734196689579.pdf','2024-12-14 17:18:09','Rechazado',1),(81,7,NULL,'1734196717376.pdf','2024-12-14 17:18:37','Rechazado',1),(82,7,NULL,'1734196722201.pdf','2024-12-14 17:18:42','Rechazado',1),(83,7,NULL,'1734198733612.pdf','2024-12-14 17:52:13','Rechazado',1),(84,7,NULL,'1734200593238.pdf','2024-12-14 18:23:13','Rechazado',1),(85,7,NULL,'1734200600807.pdf','2024-12-14 18:23:20','Rechazado',1),(86,7,NULL,'1734216837609.pdf','2024-12-14 22:53:57','Rechazado',1),(87,7,NULL,'1734216844735.pdf','2024-12-14 22:54:04','Rechazado',1),(88,7,NULL,'1734218303883.pdf','2024-12-14 23:18:23','Rechazado',1),(89,7,NULL,'1734218314642.pdf','2024-12-14 23:18:34','Rechazado',1),(90,7,NULL,'1734219494397.pdf','2024-12-14 23:38:14','Rechazado',1),(91,9,NULL,'1734219586930.pdf','2024-12-14 23:39:46','Aprobado',2),(92,9,NULL,'1734221110668.pdf','2024-12-15 00:05:10','Aprobado',2),(93,9,NULL,'1734237826775.pdf','2024-12-15 04:43:46','Aprobado',2),(94,9,NULL,'1734238251450.pdf','2024-12-15 04:50:51','Aprobado',2),(95,9,NULL,'1734301243112.pdf','2024-12-15 22:20:43','Aprobado',2),(96,9,NULL,'1734329624102.pdf','2024-12-16 06:13:44','Aprobado',2),(97,9,NULL,'1734329678804.pdf','2024-12-16 06:14:38','Aprobado',2),(98,9,NULL,'1734329747002.pdf','2024-12-16 06:15:47','Aprobado',2),(99,9,NULL,'1734329806706.pdf','2024-12-16 06:16:46','Aprobado',2),(100,10,NULL,'1734565590863.pdf','2024-12-18 23:46:30','Aprobado',1),(101,9,NULL,'1737480636552.pdf','2025-01-21 17:30:36','Aprobado',2),(102,31,NULL,'1748921935027.pdf','2025-06-03 03:38:55','Pendiente',1),(103,31,NULL,'1748921965493.pdf','2025-06-03 03:39:25','Pendiente',1),(104,31,NULL,'1748922582645.pdf','2025-06-03 03:49:42','Pendiente',2);
/*!40000 ALTER TABLE `informes_avance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes_final`
--

DROP TABLE IF EXISTS `informes_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes_final` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `solicitud_ampliacion_plazo` varchar(255) DEFAULT NULL,
  `solicitud_revision_informe_final` varchar(255) DEFAULT NULL,
  `informe_final` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_certificado` enum('Pendiente','Emitido','Rechazado') DEFAULT 'Pendiente',
  `tipo_informe` enum('Normal','Convalidación') DEFAULT 'Normal',
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes_final`
--

LOCK TABLES `informes_final` WRITE;
/*!40000 ALTER TABLE `informes_final` DISABLE KEYS */;
INSERT INTO `informes_final` VALUES (1,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:38:44','Pendiente','Normal','Pendiente'),(2,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:38:57','Pendiente','Normal','Pendiente'),(3,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:43:53','Pendiente','Normal','Pendiente'),(4,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:44:23','Pendiente','Normal','Pendiente'),(5,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:44:30','Pendiente','Normal','Pendiente'),(6,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:50:20','Pendiente','Normal','Pendiente'),(7,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:50:31','Pendiente','Normal','Pendiente'),(8,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:50:42','Pendiente','Normal','Pendiente'),(9,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:51:04','Pendiente','Normal','Pendiente'),(10,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:56:53','Pendiente','Normal','Pendiente'),(11,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:57:05','Pendiente','Normal','Pendiente'),(12,9,NULL,NULL,'1734237524872.pdf','2024-12-15 04:57:15','Pendiente','Normal','Pendiente'),(13,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:00:07','Pendiente','Normal','Pendiente'),(14,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:01:53','Pendiente','Normal','Pendiente'),(15,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:06:39','Pendiente','Normal','Pendiente'),(16,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:07:25','Pendiente','Normal','Pendiente'),(17,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:36:46','Pendiente','Normal','Pendiente'),(18,9,NULL,NULL,'1734237524872.pdf','2024-12-15 05:38:40','Pendiente','Normal','Pendiente'),(19,9,NULL,NULL,'1734237524872.pdf','2024-12-15 06:16:39','Pendiente','Normal','Pendiente'),(20,9,NULL,NULL,'1734237524872.pdf','2024-12-15 06:43:56','Pendiente','Normal','Pendiente'),(21,9,NULL,NULL,'1734237524872.pdf','2024-12-16 03:55:00','Pendiente','Normal','Pendiente'),(22,9,NULL,NULL,'1734237524872.pdf','2024-12-16 03:55:06','Pendiente','Normal','Pendiente'),(23,9,NULL,NULL,'1734237524872.pdf','2024-12-16 03:59:02','Pendiente','Normal','Pendiente'),(24,9,NULL,NULL,'1734237524872.pdf','2024-12-16 03:59:08','Pendiente','Normal','Pendiente'),(25,9,NULL,NULL,'1734237524872.pdf','2024-12-16 04:00:34','Pendiente','Normal','Pendiente'),(26,9,NULL,NULL,'1734237524872.pdf','2024-12-16 04:05:04','Pendiente','Normal','Pendiente'),(27,9,NULL,NULL,'1734237524872.pdf','2024-12-16 04:05:11','Pendiente','Normal','Pendiente'),(28,9,NULL,NULL,'1734237524872.pdf','2024-12-16 04:15:32','Pendiente','Normal','Pendiente'),(29,9,NULL,NULL,'1734237524872.pdf','2024-12-16 04:19:02','Pendiente','Normal','Pendiente'),(30,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:00:06','Pendiente','Normal','Pendiente'),(31,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:07:32','Pendiente','Normal','Pendiente'),(32,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:08:51','Pendiente','Normal','Pendiente'),(33,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:09:15','Pendiente','Normal','Pendiente'),(34,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:10:34','Pendiente','Normal','Pendiente'),(35,9,NULL,NULL,'1734237524872.pdf','2024-12-16 06:11:35','Pendiente','Normal','Pendiente'),(36,7,NULL,NULL,'1734401949126.pdf','2024-12-16 07:42:13','Pendiente','Normal','Pendiente'),(37,7,NULL,NULL,'1734401949126.pdf','2024-12-17 02:19:09','Pendiente','Normal','Pendiente'),(38,10,NULL,NULL,'1736049704725.pdf','2025-01-05 04:01:44','Pendiente','Normal','Pendiente'),(39,9,NULL,NULL,'1737480825244.pdf','2025-01-21 17:33:45','Pendiente','Normal','Pendiente');
/*!40000 ALTER TABLE `informes_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes_finalasesoria`
--

DROP TABLE IF EXISTS `informes_finalasesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes_finalasesoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_asesor` int DEFAULT NULL,
  `solicitud_ampliacion_plazo` varchar(255) DEFAULT NULL,
  `solicitud_revision_informe_final` varchar(255) DEFAULT NULL,
  `informe_final_asesoria` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_certificado` enum('Pendiente','Emitido','Rechazado') DEFAULT 'Pendiente',
  `tipo_informe` enum('Normal','Convalidación') DEFAULT 'Normal',
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `id_asesor` (`id_asesor`),
  CONSTRAINT `informes_finalasesoria_ibfk_1` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes_finalasesoria`
--

LOCK TABLES `informes_finalasesoria` WRITE;
/*!40000 ALTER TABLE `informes_finalasesoria` DISABLE KEYS */;
INSERT INTO `informes_finalasesoria` VALUES (1,2,NULL,NULL,'1734245045810.pdf','2024-12-15 06:44:05','Pendiente','Normal','Pendiente'),(2,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:47:16','Pendiente','Normal','Pendiente'),(3,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:48:19','Pendiente','Normal','Pendiente'),(4,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:48:32','Pendiente','Normal','Pendiente'),(5,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:51:49','Pendiente','Normal','Pendiente'),(6,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:53:36','Pendiente','Normal','Pendiente'),(7,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:53:49','Pendiente','Normal','Pendiente'),(8,1,NULL,NULL,'1748922013388.pdf','2024-12-16 03:55:50','Pendiente','Normal','Pendiente'),(9,1,NULL,NULL,'1748922013388.pdf','2024-12-16 04:18:43','Pendiente','Normal','Pendiente'),(10,1,NULL,NULL,'1748922013388.pdf','2024-12-16 06:12:05','Pendiente','Normal','Pendiente'),(11,1,NULL,NULL,'1748922013388.pdf','2024-12-17 02:18:39','Pendiente','Normal','Pendiente'),(12,1,NULL,NULL,'1748922013388.pdf','2025-06-03 03:40:13','Pendiente','Normal','Pendiente');
/*!40000 ALTER TABLE `informes_finalasesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes_revisados`
--

DROP TABLE IF EXISTS `informes_revisados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes_revisados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_asesor` int NOT NULL,
  `informe_final` varchar(255) NOT NULL,
  `informe_final_asesoria` varchar(255) NOT NULL,
  `estado_final_informe` enum('Aprobado','Rechazado','Pendiente') NOT NULL,
  `estado_final_asesoria` enum('Aprobado','Rechazado','Pendiente') NOT NULL,
  `id_revisor` int NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_informe_avance` enum('Aprobado','Rechazado','Pendiente') NOT NULL,
  `estado_informe_asesoria` enum('Aprobado','Rechazado','Pendiente') NOT NULL,
  `estado_comision` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_asesor` (`id_asesor`),
  KEY `id_revisor` (`id_revisor`),
  CONSTRAINT `informes_revisados_ibfk_2` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id`),
  CONSTRAINT `informes_revisados_ibfk_3` FOREIGN KEY (`id_revisor`) REFERENCES `revisores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes_revisados`
--

LOCK TABLES `informes_revisados` WRITE;
/*!40000 ALTER TABLE `informes_revisados` DISABLE KEYS */;
INSERT INTO `informes_revisados` VALUES (1,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 08:10:43','Aprobado','Aprobado','A Comisión'),(2,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2024-12-16 08:10:49','Aprobado','Aprobado','A Comisión'),(3,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 08:13:55','Aprobado','Aprobado','A Comisión'),(4,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 08:13:59','Aprobado','Aprobado','A Comisión'),(5,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 18:48:42','Aprobado','Aprobado','A Comisión'),(6,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 21:48:58','Aprobado','Aprobado','A Comisión'),(7,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2024-12-16 21:49:05','Aprobado','Aprobado','A Comisión'),(8,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',2,'2024-12-16 21:50:00','Aprobado','Aprobado','A Comisión'),(9,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',2,'2024-12-16 21:50:06','Aprobado','Aprobado','A Comisión'),(10,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2024-12-16 21:50:15','Aprobado','Aprobado','A Comisión'),(11,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:25:31','Aprobado','Aprobado','A Comisión'),(12,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2024-12-16 22:25:42','Aprobado','Aprobado','A Comisión'),(13,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:25:46','Aprobado','Aprobado','A Comisión'),(14,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:25:53','Aprobado','Aprobado','A Comisión'),(15,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:05','Aprobado','Aprobado','A Comisión'),(16,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:12','Aprobado','Aprobado','A Comisión'),(17,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:16','Aprobado','Aprobado','A Comisión'),(18,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:21','Aprobado','Aprobado','A Comisión'),(19,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:37','Aprobado','Aprobado','A Comisión'),(20,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:26:54','Aprobado','Aprobado','A Comisión'),(21,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:01','Aprobado','Aprobado','A Comisión'),(22,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:09','Aprobado','Aprobado','A Comisión'),(23,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:31','Aprobado','Aprobado','A Comisión'),(24,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:37','Aprobado','Aprobado','A Comisión'),(25,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:41','Aprobado','Aprobado','A Comisión'),(26,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 22:27:43','Aprobado','Aprobado','A Comisión'),(27,7,1,'1734334933101.pdf','1734320836457.pdf','Aprobado','Aprobado',1,'2024-12-16 23:45:06','Aprobado','Aprobado','A Comisión'),(28,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-16 23:45:10','Aprobado','Aprobado','A Comisión'),(29,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-17 02:19:46','Aprobado','Aprobado','A Comisión'),(30,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2024-12-27 23:11:51','Aprobado','Aprobado','A Comisión'),(31,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-29 17:10:52','Aprobado','Aprobado','A Comisión'),(32,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-29 17:11:28','Aprobado','Aprobado','A Comisión'),(33,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2024-12-29 17:12:40','Aprobado','Aprobado','A Comisión'),(34,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2024-12-29 18:03:01','Aprobado','Aprobado','A Comisión'),(35,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-29 18:23:10','Aprobado','Aprobado','A Comisión'),(36,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-31 19:35:18','Aprobado','Aprobado','A Comisión'),(37,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2024-12-31 21:17:32','Aprobado','Aprobado','A Comisión'),(38,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-01 17:36:56','Aprobado','Aprobado','A Comisión'),(39,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-01 17:37:04','Aprobado','Aprobado','A Comisión'),(40,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-01 17:42:58','Aprobado','Aprobado','A Comisión'),(41,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-01 18:32:54','Aprobado','Aprobado','A Comisión'),(42,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-01 18:33:02','Aprobado','Aprobado','A Comisión'),(43,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-01 18:39:21','Aprobado','Aprobado','A Comisión'),(44,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-01 18:48:27','Aprobado','Aprobado','A Comisión'),(45,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-01 18:48:39','Aprobado','Aprobado','A Comisión'),(46,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-01 18:48:41','Aprobado','Aprobado','A Comisión'),(47,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-01 18:49:24','Aprobado','Aprobado','A Comisión'),(48,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-01 18:49:26','Aprobado','Aprobado','A Comisión'),(49,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-01 18:55:06','Aprobado','Aprobado','A Comisión'),(50,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-01 18:55:20','Aprobado','Aprobado','A Comisión'),(51,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-02 19:11:45','Aprobado','Aprobado','A Comisión'),(52,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-03 18:29:33','Aprobado','Aprobado','A Comisión'),(53,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-03 18:29:35','Aprobado','Aprobado','A Comisión'),(54,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 15:29:54','Aprobado','Aprobado','A Comisión'),(55,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 16:38:55','Aprobado','Aprobado','A Comisión'),(56,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 16:38:58','Aprobado','Aprobado','A Comisión'),(57,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 16:42:05','Aprobado','Aprobado','A Comisión'),(58,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 16:42:06','Aprobado','Aprobado','A Comisión'),(59,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 16:44:57','Aprobado','Aprobado','A Comisión'),(60,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 16:45:01','Aprobado','Aprobado','A Comisión'),(61,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 16:50:17','Aprobado','Aprobado','A Comisión'),(62,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 16:50:20','Aprobado','Aprobado','A Comisión'),(63,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 17:12:53','Aprobado','Aprobado','A Comisión'),(64,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 17:12:55','Aprobado','Aprobado','A Comisión'),(65,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 17:33:13','Aprobado','Aprobado','A Comisión'),(66,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 17:56:04','Aprobado','Aprobado','A Comisión'),(67,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 17:56:19','Aprobado','Aprobado','A Comisión'),(68,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 17:56:22','Aprobado','Aprobado','A Comisión'),(69,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 17:56:35','Aprobado','Aprobado','A Comisión'),(70,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 17:56:41','Aprobado','Aprobado','A Comisión'),(71,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 17:56:54','Aprobado','Aprobado','A Comisión'),(72,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 17:56:56','Aprobado','Aprobado','A Comisión'),(73,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 17:59:49','Aprobado','Aprobado','A Comisión'),(74,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 17:59:55','Aprobado','Aprobado','A Comisión'),(75,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 18:00:02','Aprobado','Aprobado','A Comisión'),(76,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 18:00:07','Aprobado','Aprobado','A Comisión'),(77,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 18:00:11','Aprobado','Aprobado','A Comisión'),(78,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 18:00:20','Aprobado','Aprobado','A Comisión'),(79,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 18:00:25','Aprobado','Aprobado','A Comisión'),(80,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 18:01:10','Aprobado','Aprobado','A Comisión'),(81,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 18:01:14','Aprobado','Aprobado','A Comisión'),(82,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 18:01:20','Aprobado','Aprobado','A Comisión'),(83,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 18:02:59','Aprobado','Aprobado','A Comisión'),(84,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 18:03:06','Aprobado','Aprobado','A Comisión'),(85,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 18:41:15','Aprobado','Aprobado','A Comisión'),(86,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 18:41:31','Aprobado','Aprobado','A Comisión'),(87,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 18:41:38','Aprobado','Aprobado','A Comisión'),(88,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 18:47:44','Aprobado','Aprobado','A Comisión'),(89,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-04 18:47:57','Aprobado','Aprobado','A Comisión'),(90,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-04 18:48:14','Aprobado','Aprobado','A Comisión'),(91,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',2,'2025-01-04 18:49:18','Aprobado','Aprobado','A Comisión'),(92,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-04 18:50:03','Aprobado','Aprobado','A Comisión'),(93,7,1,'1734401949126.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-05 03:48:36','Aprobado','Aprobado','A Comisión'),(94,10,1,'1736049704725.pdf','1734401919289.pdf','Aprobado','Aprobado',1,'2025-01-05 04:01:52','Aprobado','Aprobado','A Comisión'),(95,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',1,'2025-01-17 18:07:22','Aprobado','Aprobado','A Comisión'),(96,9,2,'1734237524872.pdf','1734245045810.pdf','Aprobado','Aprobado',2,'2025-01-17 18:18:24','Aprobado','Aprobado','A Comisión'),(97,10,1,'1736049704725.pdf','1734401919289.pdf','Pendiente','Pendiente',2,'2025-01-17 18:33:21','Aprobado','Aprobado',NULL),(98,7,1,'1734401949126.pdf','1748922013388.pdf','Pendiente','Pendiente',1,'2025-06-03 03:44:08','Aprobado','Aprobado',NULL),(99,7,1,'1734401949126.pdf','1748922013388.pdf','Pendiente','Pendiente',1,'2025-06-03 03:44:16','Aprobado','Aprobado',NULL);
/*!40000 ALTER TABLE `informes_revisados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones_emisiones`
--

DROP TABLE IF EXISTS `inscripciones_emisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones_emisiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_proceso` int DEFAULT NULL,
  `solicitud_inscripcion_emision` varchar(255) DEFAULT NULL,
  `ficha_revision` varchar(255) DEFAULT NULL,
  `informe_final` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado_proceso` varchar(255) DEFAULT NULL,
  `comentarios` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_secretaria` enum('Pendiente','Aprobada','Derivada a Comisión','Rechazada') DEFAULT NULL,
  `inscripcion_completa` tinyint DEFAULT NULL,
  `comentarios_comision` text,
  `respuesta_comision` varchar(20) DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_proceso` (`id_proceso`),
  CONSTRAINT `inscripciones_emisiones_ibfk_2` FOREIGN KEY (`id_proceso`) REFERENCES `procesos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones_emisiones`
--

LOCK TABLES `inscripciones_emisiones` WRITE;
/*!40000 ALTER TABLE `inscripciones_emisiones` DISABLE KEYS */;
INSERT INTO `inscripciones_emisiones` VALUES (1,7,NULL,'1734633066884.pdf','1734633066884.pdf','1734633066885.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 18:31:06',NULL,NULL,NULL,'Pendiente'),(2,7,NULL,'1734633128421.pdf','1734633128422.pdf','1734633128422.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 18:32:08',NULL,NULL,NULL,'Pendiente'),(3,7,NULL,'1734633873343.pdf','1734633873345.pdf','1734633873346.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 18:44:33',NULL,NULL,NULL,'Pendiente'),(4,7,NULL,'1734636272036.pdf','1734636272038.pdf','1734636272038.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 19:24:32',NULL,NULL,NULL,'Pendiente'),(5,9,NULL,'1734648315484.pdf','1734648315486.pdf','1734648315486.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 22:45:15',NULL,NULL,NULL,'Pendiente'),(6,7,NULL,'1734649896609.pdf','1734649896613.pdf','1734649896614.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-19 23:11:36',NULL,NULL,NULL,'Pendiente'),(7,7,NULL,'1734651662155.pdf','1734651662159.pdf','1734651662160.pdf',NULL,NULL,'Rechazada',NULL,'2024-12-19 23:41:02',NULL,NULL,NULL,'Rechazada'),(8,10,NULL,'1734666164712.pdf','1734666164716.pdf','1734666164717.pdf',NULL,NULL,'Derivada a Comisión',NULL,'2024-12-20 03:42:44',NULL,NULL,NULL,'Derivada a Comisión'),(9,9,NULL,'1736052496607.pdf','1736052496610.pdf','1736052496611.pdf',NULL,NULL,'Aprobada',NULL,'2025-01-05 04:48:16',NULL,NULL,NULL,'Aprobada'),(10,10,NULL,'1736113271138.pdf','1736113271139.pdf','1736113271139.pdf',NULL,NULL,'Aprobada',NULL,'2025-01-05 21:41:11',NULL,NULL,NULL,'Aprobada'),(11,31,NULL,'1748922305227.pdf','1748922305238.pdf','1748922305295.pdf',NULL,NULL,'Aprobada',NULL,'2025-06-03 03:45:05',NULL,NULL,NULL,'Aprobada');
/*!40000 ALTER TABLE `inscripciones_emisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_inscripcion`
--

DROP TABLE IF EXISTS `libro_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_inscripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_practica` int DEFAULT NULL,
  `estado` enum('Pendiente','Aprobada','Derivada a Comisión','Rechazada','Inscrita') DEFAULT NULL,
  `comentarios` text,
  `fecha_inscripcion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_practica` (`id_practica`),
  CONSTRAINT `libro_inscripcion_ibfk_2` FOREIGN KEY (`id_practica`) REFERENCES `practicas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_inscripcion`
--

LOCK TABLES `libro_inscripcion` WRITE;
/*!40000 ALTER TABLE `libro_inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macroprocesos`
--

DROP TABLE IF EXISTS `macroprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macroprocesos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macroprocesos`
--

LOCK TABLES `macroprocesos` WRITE;
/*!40000 ALTER TABLE `macroprocesos` DISABLE KEYS */;
INSERT INTO `macroprocesos` VALUES (1,'Prácticas Preprofesionales',NULL,'2024-11-25 21:22:49');
/*!40000 ALTER TABLE `macroprocesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `mensaje` text,
  `leida` tinyint(1) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (36,7,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-06 03:37:31'),(37,7,'El estado de tu práctica ha cambiado a: Aprobada',0,'2024-12-06 03:38:02'),(38,7,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-07 00:48:14'),(39,7,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-10 17:09:38'),(40,7,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-10 17:10:50'),(41,7,'El estado de tu práctica ha cambiado a: Aprobada',0,'2024-12-10 17:21:39'),(42,7,'El estado de tu práctica ha cambiado a: Aprobada',0,'2024-12-13 19:13:39'),(45,7,'El estado de tu práctica ha cambiado a: Rechazada',0,'2024-12-16 21:53:20'),(46,10,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-18 23:43:33'),(47,10,'El estado de tu práctica ha cambiado a: Aprobada',0,'2024-12-18 23:45:11'),(48,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 18:53:22'),(49,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 18:54:05'),(50,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 18:55:20'),(51,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 18:55:22'),(52,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 18:55:26'),(53,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 19:25:33'),(54,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 19:25:33'),(55,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 19:59:03'),(56,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 19:59:15'),(57,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 19:59:15'),(58,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 19:59:21'),(59,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 20:00:08'),(60,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 20:00:10'),(61,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 20:11:37'),(62,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:18:18'),(63,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:23:00'),(64,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:26:41'),(65,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:26:48'),(66,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:28:25'),(67,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 20:28:29'),(68,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:30:35'),(69,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 20:30:40'),(70,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:30:56'),(71,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:31:00'),(72,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 20:32:49'),(73,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:32:54'),(74,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:33:00'),(75,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:35:51'),(76,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:35:56'),(77,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:36:13'),(78,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 20:36:26'),(79,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:37:09'),(80,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:42:17'),(81,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:42:22'),(82,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:42:27'),(83,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:42:44'),(84,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:43:20'),(85,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:43:27'),(86,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:45:33'),(87,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:45:37'),(88,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:45:43'),(89,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:45:53'),(90,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:45:55'),(91,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:45:58'),(92,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:46:03'),(93,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:46:05'),(94,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:50:53'),(95,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:51:02'),(96,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:51:16'),(97,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:51:18'),(98,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:51:20'),(99,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:51:21'),(100,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:51:26'),(101,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:53:45'),(102,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:53:52'),(103,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:54:27'),(104,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:54:35'),(105,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:54:38'),(106,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:54:42'),(107,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 20:54:44'),(108,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 20:59:13'),(109,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:00:40'),(110,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:00:56'),(111,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:01:00'),(112,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:01:03'),(113,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:01:08'),(114,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:01:22'),(115,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:04:16'),(116,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:04:24'),(117,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:10:19'),(118,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:10:23'),(119,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:10:27'),(120,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:10:55'),(121,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:11:21'),(122,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:11:41'),(123,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:11:41'),(124,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:13:10'),(125,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:13:19'),(126,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:18:51'),(127,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:19:01'),(128,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:21:25'),(129,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:21:37'),(130,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:22:19'),(131,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:22:21'),(132,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:22:22'),(133,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:22:24'),(134,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:22:42'),(135,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:25:10'),(136,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:25:17'),(137,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:25:21'),(138,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:25:23'),(139,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:27:46'),(140,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:27:49'),(141,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:27:52'),(142,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:29:49'),(143,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:29:52'),(144,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:29:55'),(145,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:29:59'),(146,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:30:02'),(147,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:30:05'),(148,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:33:54'),(149,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:33:56'),(150,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:34:01'),(151,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:34:05'),(152,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:34:08'),(153,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:34:11'),(154,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:59:37'),(155,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:59:42'),(156,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:59:45'),(157,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 21:59:49'),(158,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 21:59:53'),(159,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:02:14'),(160,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:02:23'),(161,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 22:02:50'),(162,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:05:14'),(163,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:05:22'),(164,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:11:23'),(165,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:11:32'),(166,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:11:36'),(167,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:11:40'),(168,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:11:47'),(169,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:11:57'),(170,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:12:36'),(171,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:17:17'),(172,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:17:28'),(173,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:17:29'),(174,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:17:33'),(175,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:17:37'),(176,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:17:43'),(177,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:18:31'),(178,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:23:30'),(179,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:23:42'),(180,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:24:44'),(181,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:25:03'),(182,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:27:59'),(183,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:28:06'),(184,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:28:16'),(185,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2024-12-19 22:28:27'),(186,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:28:40'),(187,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:28:45'),(188,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:28:50'),(189,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:28:54'),(190,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:28:56'),(191,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:29:00'),(192,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:29:02'),(193,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:29:03'),(194,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:29:27'),(195,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:29:29'),(196,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:29:30'),(197,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:29:33'),(198,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:29:37'),(199,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:33:50'),(200,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:33:52'),(201,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:34:24'),(202,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:34:36'),(203,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:34:42'),(204,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:04'),(205,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:05'),(206,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:06'),(207,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:09'),(208,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:09'),(209,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:10'),(210,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:10'),(211,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:10'),(212,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:11'),(213,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:13'),(214,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:14'),(215,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:42:16'),(216,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:45:45'),(217,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:45:49'),(218,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:46:50'),(219,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:50:55'),(220,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:51:01'),(221,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:51:05'),(222,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:51:07'),(223,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:51:12'),(224,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:51:15'),(225,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:51:19'),(226,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:51:30'),(227,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:51:48'),(228,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 22:59:44'),(229,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 22:59:53'),(230,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:00:03'),(231,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:00:06'),(232,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:00:10'),(233,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:00:16'),(234,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:05:01'),(235,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:08:29'),(236,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:08:43'),(237,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:08:46'),(238,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:08:50'),(239,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:08:55'),(240,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:41:50'),(241,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2024-12-19 23:42:00'),(242,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:10'),(243,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:21'),(244,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:23'),(245,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:24'),(246,9,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:26'),(247,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:28'),(248,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:29'),(249,9,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:31'),(250,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:33'),(251,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2024-12-19 23:42:35'),(252,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2024-12-19 23:51:47'),(253,7,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-27 23:12:57'),(254,10,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2024-12-27 23:13:07'),(256,7,'El estado de tu práctica ha cambiado a: Aprobada',0,'2025-01-05 04:14:37'),(257,10,'El estado de tu práctica ha cambiado a: Aprobada',0,'2025-01-05 04:16:48'),(259,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:45:40'),(260,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:45:44'),(261,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:45:49'),(262,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:45:53'),(263,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:47:10'),(264,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:48:23'),(265,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:48:40'),(266,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:48:44'),(267,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:49:04'),(268,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:57:27'),(269,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 04:58:00'),(270,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 04:58:03'),(271,9,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 04:58:39'),(272,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:00:32'),(273,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:00:35'),(274,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:03:25'),(275,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:03:30'),(276,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:04:34'),(277,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:04:37'),(278,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:04:42'),(279,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:07:04'),(280,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:10:04'),(281,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:10:11'),(282,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:12:34'),(283,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:12:37'),(284,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 05:15:44'),(285,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 05:22:29'),(286,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:22:31'),(287,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 05:24:59'),(288,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:26:15'),(289,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:27:22'),(290,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:27:28'),(291,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:27:59'),(292,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:28:03'),(293,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:28:07'),(294,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:28:11'),(295,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:28:12'),(296,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:28:14'),(297,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:29:07'),(298,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:29:43'),(299,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:29:47'),(300,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:30:05'),(301,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:30:08'),(302,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:30:14'),(303,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:30:17'),(304,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 05:30:18'),(305,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:33:42'),(306,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:33:45'),(307,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:34:33'),(308,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:34:36'),(309,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:34:39'),(310,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:34:44'),(311,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:34:45'),(312,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:34:48'),(313,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:37:02'),(314,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:37:03'),(315,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:37:03'),(316,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:37:10'),(317,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:37:14'),(318,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:43:36'),(319,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:43:38'),(320,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:50:17'),(321,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:50:28'),(322,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:51:22'),(323,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:51:33'),(324,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:51:35'),(325,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:51:37'),(326,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:51:40'),(327,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:51:44'),(328,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:52:09'),(329,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:52:13'),(330,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:54:48'),(331,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:55:07'),(332,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 05:56:20'),(333,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 05:58:15'),(334,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 17:24:51'),(335,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:26:36'),(336,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:26:45'),(337,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:26:47'),(338,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 17:26:54'),(339,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:46:42'),(340,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:53:46'),(341,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 17:53:51'),(342,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 17:55:26'),(343,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 18:11:41'),(344,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 18:11:47'),(345,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 18:11:47'),(346,9,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-05 18:11:54'),(347,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 18:11:58'),(348,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 18:12:02'),(349,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 18:12:09'),(350,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:33:15'),(351,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:33:19'),(352,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:33:22'),(353,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:36:56'),(354,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:37:01'),(355,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:41:04'),(356,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:41:06'),(357,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:41:07'),(358,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:41:13'),(359,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:41:35'),(360,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:41:41'),(361,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:42:03'),(362,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:42:46'),(363,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 20:43:05'),(364,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:50:42'),(365,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:51:41'),(366,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 20:51:58'),(367,9,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-05 20:55:16'),(368,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:08:25'),(369,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 21:13:56'),(370,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:28:04'),(371,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:36:35'),(372,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 21:36:41'),(373,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:41:35'),(374,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 21:43:24'),(375,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:43:31'),(376,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:43:36'),(377,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:43:37'),(378,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-05 21:58:41'),(379,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-05 21:58:50'),(380,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-05 21:59:02'),(381,7,'El estado de tu inscripción ha cambiado a: Pendiente',0,'2025-01-05 21:59:11'),(382,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-05 21:59:46'),(383,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 03:56:49'),(384,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 03:57:10'),(385,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 03:57:12'),(386,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 03:57:14'),(387,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 03:57:50'),(388,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 03:57:51'),(389,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 03:57:53'),(390,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:01:39'),(391,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:11:45'),(392,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:14:38'),(393,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:15:00'),(394,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:16:04'),(395,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-06 04:16:13'),(396,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 04:16:17'),(397,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 04:16:50'),(398,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 05:24:07'),(399,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-06 05:24:17'),(400,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 05:24:28'),(401,9,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 05:25:43'),(402,10,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-06 05:25:48'),(403,10,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-06 05:33:59'),(404,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-20 17:39:02'),(405,9,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-20 17:40:04'),(406,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-20 17:41:06'),(407,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-01-20 17:41:11'),(408,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-01-20 17:41:17'),(409,7,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-01-20 17:41:20'),(410,7,'El estado de tu práctica ha cambiado a: Aprobada',0,'2025-06-02 16:15:54'),(411,10,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2025-06-02 16:16:11'),(412,7,'El estado de tu práctica ha cambiado a: Rechazada',0,'2025-06-02 16:16:21'),(413,7,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-06-02 16:16:41'),(414,7,'El estado de tu inscripción ha cambiado a: Rechazada',0,'2025-06-02 16:16:54'),(415,31,'El estado de tu práctica ha cambiado a: Derivada a Comisión',0,'2025-06-02 17:08:57'),(416,31,'El estado de tu inscripción ha cambiado a: Derivada a Comisión',0,'2025-06-03 03:45:41'),(417,31,'El estado de tu inscripción ha cambiado a: Aprobada',0,'2025-06-03 03:46:22');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones_informes`
--

DROP TABLE IF EXISTS `notificaciones_informes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones_informes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_asesor` int DEFAULT NULL,
  `estado_avance` varchar(255) DEFAULT NULL,
  `estado_asesoria` varchar(255) DEFAULT NULL,
  `mensaje` text,
  `leida` tinyint(1) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_asesor` (`id_asesor`),
  KEY `idx_estudiante_asesor` (`id_estudiante`,`id_asesor`),
  CONSTRAINT `notificaciones_informes_ibfk_2` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_informes`
--

LOCK TABLES `notificaciones_informes` WRITE;
/*!40000 ALTER TABLE `notificaciones_informes` DISABLE KEYS */;
INSERT INTO `notificaciones_informes` VALUES (1,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:21:18'),(2,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:21:21'),(3,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:23:11'),(4,7,NULL,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 05:23:40'),(5,7,NULL,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 05:23:57'),(6,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:26:47'),(7,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:26:49'),(8,7,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:33:09'),(9,7,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:33:13'),(10,7,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:33:15'),(11,7,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:33:18'),(12,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:38:20'),(13,7,NULL,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 05:46:38'),(14,7,NULL,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 05:46:50'),(15,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:47:08'),(16,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:47:12'),(17,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:47:43'),(18,7,NULL,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:47:47'),(19,7,NULL,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:47:50'),(20,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:47:53'),(21,7,NULL,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:48:00'),(22,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:56:51'),(23,7,NULL,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:56:56'),(24,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 05:57:01'),(25,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:57:06'),(26,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 05:57:09'),(27,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:00:37'),(28,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:01:12'),(29,7,NULL,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 06:01:17'),(30,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:06:43'),(31,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:07:45'),(32,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:07:49'),(33,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:07:52'),(34,7,NULL,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:07:54'),(35,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:07:57'),(36,7,NULL,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:07:59'),(37,7,NULL,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:15:21'),(38,7,NULL,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:15:27'),(39,7,NULL,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:15:48'),(40,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:17:29'),(41,7,NULL,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:17:30'),(42,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:24:09'),(43,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:24:11'),(44,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:29:27'),(45,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:29:29'),(46,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:29:33'),(47,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:29:34'),(48,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:50:27'),(49,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:50:29'),(50,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:50:43'),(51,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 06:50:44'),(52,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 06:57:04'),(53,7,1,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 06:59:32'),(54,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:01:45'),(55,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:12:50'),(56,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:13:03'),(57,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:24:16'),(58,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:35:40'),(59,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:10'),(60,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:16'),(61,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:17'),(62,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:18'),(63,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:18'),(64,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:19'),(65,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 07:39:20'),(66,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:27'),(67,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:29'),(68,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:29'),(69,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:31'),(70,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:33'),(71,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 07:39:37'),(72,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:03'),(73,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:09'),(74,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:14'),(75,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:52'),(76,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:55'),(77,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:56'),(78,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:57'),(79,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:57'),(80,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:41:57'),(81,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:07'),(82,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:11'),(83,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:15'),(84,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:18'),(85,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:18'),(86,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:18'),(87,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:18'),(88,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:42:18'),(89,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:43:11'),(90,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:43:25'),(91,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 15:46:08'),(92,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 15:52:52'),(93,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 15:58:51'),(94,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 15:58:52'),(95,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 15:58:53'),(96,7,1,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 15:59:11'),(97,7,1,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 15:59:55'),(98,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:01:42'),(99,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:01:46'),(100,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 16:02:34'),(101,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 16:02:36'),(102,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:04:25'),(103,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:04:29'),(104,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:04:34'),(105,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 16:04:40'),(106,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:06:12'),(107,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:06:27'),(108,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 16:06:32'),(109,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:10:04'),(110,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 16:10:20'),(111,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 16:12:03'),(112,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 16:12:10'),(113,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 17:00:32'),(114,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 17:14:24'),(115,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 17:15:14'),(116,7,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 17:17:50'),(117,7,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 17:18:00'),(118,7,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 17:31:41'),(119,7,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 17:31:43'),(120,7,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 17:50:56'),(121,7,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 17:51:08'),(122,7,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 17:51:23'),(123,7,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 17:57:05'),(124,7,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-14 18:12:06'),(125,7,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 18:14:23'),(126,7,2,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 18:14:31'),(127,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 18:49:58'),(128,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-14 23:01:27'),(129,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:02:21'),(130,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:11:36'),(131,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:11:40'),(132,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:11:59'),(133,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:12:07'),(134,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:12:50'),(135,9,2,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:40:32'),(136,7,1,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-14 23:41:08'),(137,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 00:05:23'),(138,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 00:12:56'),(139,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 00:12:58'),(140,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 00:13:11'),(141,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 00:27:08'),(142,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 00:35:32'),(143,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 00:36:00'),(144,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 00:38:10'),(145,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 00:55:36'),(146,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 00:55:48'),(147,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 00:56:10'),(148,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 01:44:58'),(149,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 01:45:27'),(150,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 01:45:36'),(151,7,1,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 01:45:38'),(152,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 01:45:41'),(153,7,1,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 01:46:09'),(154,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 01:47:46'),(155,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 01:47:51'),(156,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:14:09'),(157,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:14:11'),(158,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:17:20'),(159,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:17:22'),(160,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:17:27'),(161,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:26:20'),(162,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:26:24'),(163,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:27:43'),(164,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:27:48'),(165,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 04:51:19'),(166,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:51:24'),(167,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:57:35'),(168,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:57:40'),(169,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:59:02'),(170,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:59:10'),(171,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 04:59:21'),(172,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:59:39'),(173,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 04:59:46'),(174,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:06:48'),(175,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:06:56'),(176,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:07:04'),(177,9,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:07:16'),(178,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:08:00'),(179,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:21:50'),(180,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 05:32:09'),(181,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 05:38:07'),(182,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 05:38:36'),(183,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 06:25:12'),(184,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:25:18'),(185,9,2,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:25:39'),(186,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:25:44'),(187,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:27:45'),(188,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:27:49'),(189,9,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:37:15'),(190,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:37:21'),(191,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:37:41'),(192,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:37:46'),(193,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:37:49'),(194,9,2,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 06:37:58'),(195,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:38:01'),(196,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 06:38:05'),(197,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 06:38:08'),(198,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:38:13'),(199,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 06:38:16'),(200,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 07:30:09'),(201,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 07:30:15'),(202,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 07:54:49'),(203,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 07:54:54'),(204,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 07:55:03'),(205,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 07:55:07'),(206,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:07:55'),(207,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 08:08:03'),(208,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:08:09'),(209,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 08:27:00'),(210,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:27:04'),(211,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:27:11'),(212,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:34:54'),(213,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 08:34:56'),(214,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 08:54:09'),(215,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 21:03:49'),(216,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 21:04:47'),(217,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 21:07:05'),(218,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 21:07:23'),(219,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 21:07:58'),(220,9,2,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-15 21:08:34'),(221,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 21:09:15'),(222,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-15 21:09:41'),(223,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 21:10:07'),(224,9,2,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 21:11:12'),(225,9,2,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-15 21:11:23'),(226,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 03:38:38'),(227,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 03:38:40'),(228,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 03:38:48'),(229,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 03:38:55'),(230,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:25:39'),(231,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:25:44'),(232,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:26:00'),(233,9,2,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:26:05'),(234,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:26:51'),(235,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:27:04'),(236,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:28:01'),(237,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:28:04'),(238,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:28:16'),(239,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:28:21'),(240,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:28:38'),(241,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:30:32'),(242,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:30:33'),(243,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:33:17'),(244,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:33:19'),(245,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-16 06:33:29'),(246,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:33:37'),(247,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:33:41'),(248,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:33:44'),(249,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:34:35'),(250,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 06:34:37'),(251,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 06:34:44'),(252,9,2,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-16 06:34:48'),(253,9,2,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-16 06:34:52'),(254,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 18:36:05'),(255,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 18:36:12'),(256,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 18:36:19'),(257,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 18:36:22'),(258,7,1,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-16 18:48:24'),(259,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 18:48:35'),(260,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 19:09:19'),(261,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 19:09:24'),(262,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 19:09:29'),(263,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-16 21:48:33'),(264,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-16 21:48:43'),(265,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 21:50:24'),(266,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-16 21:50:26'),(267,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-17 02:17:51'),(268,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-17 02:17:52'),(269,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-17 02:17:54'),(270,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-17 02:18:19'),(271,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-29 17:11:32'),(272,10,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2024-12-29 17:12:04'),(273,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-29 19:22:13'),(274,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-29 19:22:22'),(275,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-29 19:23:37'),(276,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2024-12-29 19:24:04'),(277,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2024-12-31 19:35:25'),(278,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-01 17:38:57'),(279,9,2,'Pendiente','Pendiente','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-01 17:38:58'),(280,10,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-01 17:39:00'),(281,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-01 18:33:09'),(282,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-01 18:55:04'),(283,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-01 18:55:18'),(284,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-02 19:11:48'),(285,10,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-03 18:29:25'),(286,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-03 18:29:50'),(287,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-03 18:29:52'),(288,10,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-03 18:29:53'),(289,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-03 19:07:48'),(290,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-03 19:07:50'),(291,10,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-03 19:07:53'),(292,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-04 15:48:58'),(293,9,2,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-04 15:52:37'),(294,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-04 15:53:38'),(295,9,2,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-04 15:53:39'),(296,7,1,'Rechazado','Pendiente','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-04 17:12:32'),(297,7,1,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-04 17:33:11'),(298,7,1,'Aprobado','Pendiente','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Pendiente.',0,'2025-01-04 19:00:06'),(299,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-04 19:01:16'),(300,10,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:37:51'),(301,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:37:57'),(302,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:38:08'),(303,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:38:12'),(304,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:38:45'),(305,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:39:09'),(306,10,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:39:22'),(307,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:39:30'),(308,10,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:39:36'),(309,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:39:42'),(310,7,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:44:17'),(311,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:44:26'),(312,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:44:41'),(313,7,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:44:47'),(314,10,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:44:50'),(315,10,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:48:48'),(316,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:49:02'),(317,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:52:00'),(318,7,1,'Pendiente','Rechazado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:52:58'),(319,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:53:04'),(320,7,1,'Aprobado','Rechazado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:53:10'),(321,10,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:58:28'),(322,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:58:35'),(323,7,1,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 03:58:41'),(324,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-05 03:59:00'),(325,10,1,'Pendiente','Aprobado','El estado de su informe de avance es: Pendiente. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 04:01:27'),(326,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 04:01:32'),(327,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-05 04:01:57'),(328,7,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:56:50'),(329,7,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:11'),(330,9,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:13'),(331,10,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:15'),(332,7,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:51'),(333,9,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:52'),(334,10,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 03:57:54'),(335,7,NULL,NULL,NULL,'El estado de su informe de avance es: undefined. El estado de su informe de asesoría es: undefined.',0,'2025-01-06 04:01:42'),(336,7,1,'Rechazado','Rechazado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Rechazado.',0,'2025-01-06 05:42:33'),(337,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-17 18:07:27'),(338,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-17 18:18:27'),(339,9,2,'Rechazado','Aprobado','El estado de su informe de avance es: Rechazado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-17 18:18:34'),(340,10,1,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-17 18:33:24'),(341,9,2,'Aprobado','Aprobado','El estado de su informe de avance es: Aprobado. El estado de su informe de asesoría es: Aprobado.',0,'2025-01-21 17:33:33');
/*!40000 ALTER TABLE `notificaciones_informes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones_inscripciones`
--

DROP TABLE IF EXISTS `notificaciones_inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones_inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `leida` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_inscripciones`
--

LOCK TABLES `notificaciones_inscripciones` WRITE;
/*!40000 ALTER TABLE `notificaciones_inscripciones` DISABLE KEYS */;
INSERT INTO `notificaciones_inscripciones` VALUES (1,7,'Secretaria cambió el estado a: Aprobada',0,'2025-01-06 04:14:39'),(2,9,'Secretaria cambió el estado a: Aprobada',0,'2025-01-06 04:15:01'),(3,7,'Secretaria cambió el estado a: Aprobada',0,'2025-01-06 04:16:05'),(4,7,'Secretaria cambió el estado a: Rechazada',0,'2025-01-06 04:16:14'),(5,7,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-06 04:16:18'),(6,7,'Comisión cambió el estado a: Aprobada',0,'2025-01-06 04:16:51'),(7,7,'Secretaria cambió el estado a: Aprobada',0,'2025-01-06 05:24:08'),(8,7,'Secretaria cambió el estado a: Rechazada',0,'2025-01-06 05:24:18'),(9,7,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-06 05:24:29'),(10,9,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-06 05:25:44'),(11,10,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-06 05:25:48'),(12,10,'Comisión cambió el estado a: Aprobada',0,'2025-01-06 05:34:00'),(13,7,'Comisión cambió el estado a: Aprobada',0,'2025-01-20 17:39:04'),(14,9,'Comisión cambió el estado a: Aprobada',0,'2025-01-20 17:40:05'),(15,7,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-20 17:41:08'),(16,7,'Secretaria cambió el estado a: Rechazada',0,'2025-01-20 17:41:13'),(17,7,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-01-20 17:41:17'),(18,7,'Comisión cambió el estado a: Aprobada',0,'2025-01-20 17:41:20'),(19,7,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-06-02 16:16:42'),(20,7,'Secretaria cambió el estado a: Rechazada',0,'2025-06-02 16:16:55'),(21,11,'Secretaria cambió el estado a: Derivada a Comisión',0,'2025-06-03 03:45:42'),(22,11,'Comisión cambió el estado a: Aprobada',0,'2025-06-03 03:46:23');
/*!40000 ALTER TABLE `notificaciones_inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practicas`
--

DROP TABLE IF EXISTS `practicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_proceso` int DEFAULT NULL,
  `solicitud_inscripcion` varchar(255) DEFAULT NULL,
  `plan_practicas` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado_proceso` varchar(255) DEFAULT NULL,
  `comentarios` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_secretaria` enum('Pendiente','Aprobada','Derivada a Comisión','Rechazada') DEFAULT 'Pendiente',
  `inscripcion_completa` tinyint(1) DEFAULT '0',
  `comentarios_comision` text,
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_proceso` (`id_proceso`),
  CONSTRAINT `practicas_ibfk_2` FOREIGN KEY (`id_proceso`) REFERENCES `procesos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicas`
--

LOCK TABLES `practicas` WRITE;
/*!40000 ALTER TABLE `practicas` DISABLE KEYS */;
INSERT INTO `practicas` VALUES (9,NULL,NULL,'uploads\\1732582703471.jpeg','uploads\\1732582703473.jpeg',NULL,NULL,'pendiente','lnkbhj','2024-11-26 00:58:23','Pendiente',0,NULL),(10,NULL,NULL,'uploads\\1732582813929.pdf','uploads\\1732582813933.jpeg',NULL,NULL,'pendiente','ñjlhkbj','2024-11-26 01:00:13','Pendiente',0,NULL),(11,NULL,NULL,'uploads\\1732583558299.pdf','uploads\\1732583558305.jpeg',NULL,NULL,'pendiente','ñjlhkbj','2024-11-26 01:12:38','Pendiente',0,NULL),(12,NULL,NULL,'uploads\\1732583624049.pdf','uploads\\1732583624054.jpeg',NULL,NULL,'pendiente','ñjlhkbj','2024-11-26 01:13:44','Pendiente',0,NULL),(14,NULL,NULL,'uploads\\1732592292467.jpeg','uploads\\1732592292468.jpeg',NULL,NULL,'pendiente','lo subio Jose','2024-11-26 03:38:12','Pendiente',0,NULL),(15,NULL,NULL,'uploads\\1732592890647.jpeg','uploads\\1732592890649.jpeg',NULL,NULL,'pendiente','lo subio Jose','2024-11-26 03:48:10','Pendiente',0,NULL),(63,7,NULL,'1733456236876.pdf','1733456236889.pdf',NULL,NULL,'Aprobada','Excelente estudiante','2024-12-06 03:37:16','Pendiente',0,NULL),(64,7,NULL,'1733511628790.pdf','1733511628796.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-06 19:00:28','Pendiente',0,NULL),(65,7,NULL,'1733517813844.pdf','1733517813854.pdf',NULL,NULL,'Rechazada',NULL,'2024-12-06 20:43:33','Pendiente',0,NULL),(66,7,NULL,'1733532435735.pdf','1733532435749.pdf',NULL,NULL,'Aprobada','Hola buenas tardes','2024-12-07 00:47:15','Pendiente',0,NULL),(67,7,NULL,'1733850572323.pdf','1733850572369.png',NULL,NULL,'Aprobada','hola','2024-12-10 17:09:32','Pendiente',0,NULL),(68,7,NULL,'1734072752021.pdf','1734072752023.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-13 06:52:32','Pendiente',0,NULL),(69,7,NULL,'1734401367463.pdf','1734401367465.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-17 02:09:27','Pendiente',0,NULL),(70,7,NULL,'1734401369807.pdf','1734401369807.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-17 02:09:42','Pendiente',0,NULL),(71,7,NULL,'1734401373179.pdf','1734401373179.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-17 02:09:43','Pendiente',0,NULL),(72,7,NULL,'1734547938572.pdf','1734547938574.pdf',NULL,NULL,'Pendiente',NULL,'2024-12-18 18:52:18','Pendiente',0,NULL),(73,10,NULL,'1734565310723.pdf','1734565310726.pdf',NULL,NULL,'Derivada a Comisión','Buen trabajo','2024-12-18 23:41:50','Pendiente',0,NULL),(74,7,NULL,'1734627321039.pdf','1734627321041.pdf',NULL,NULL,'Aprobada',NULL,'2024-12-19 16:55:21','Pendiente',0,NULL),(75,7,NULL,'1737394587777.pdf','1737394588039.pdf',NULL,NULL,'Rechazada',NULL,'2025-01-20 17:36:28','Pendiente',0,NULL),(76,31,NULL,'1748883559374.pdf','1748883559424.pdf',NULL,NULL,'Derivada a Comisión',NULL,'2025-06-02 16:59:19','Pendiente',0,NULL);
/*!40000 ALTER TABLE `practicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_macroproceso` int DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_macroproceso` (`id_macroproceso`),
  CONSTRAINT `procesos_ibfk_1` FOREIGN KEY (`id_macroproceso`) REFERENCES `macroprocesos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES (1,1,'Proceso de Inscripción',NULL,'2024-11-25 21:25:14');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psicologos`
--

DROP TABLE IF EXISTS `psicologos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psicologos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `celular` (`celular`),
  KEY `correo` (`correo`),
  CONSTRAINT `psicologos_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuarios` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psicologos`
--

LOCK TABLES `psicologos` WRITE;
/*!40000 ALTER TABLE `psicologos` DISABLE KEYS */;
INSERT INTO `psicologos` VALUES (4,'Juan','Pérez','González','12345678','987654321','juan.perez@ejemplo.com'),(5,'María','López','Sánchez','87654321','912345678','maria.lopez@ejemplo.com'),(6,'Carlos','Martínez','Rodríguez','13579246','934567890','carlos.martinez@ejemplo.com');
/*!40000 ALTER TABLE `psicologos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisores`
--

DROP TABLE IF EXISTS `revisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_revisor` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `fk_revisor_correo` FOREIGN KEY (`correo`) REFERENCES `usuarios` (`correo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisores`
--

LOCK TABLES `revisores` WRITE;
/*!40000 ALTER TABLE `revisores` DISABLE KEYS */;
INSERT INTO `revisores` VALUES (1,'Daniel','Valerio','Gómez','12345678A','revisor1@gmail.com',NULL,'2024-12-14 15:00:00'),(2,'Ana','López','Martínez','87654321B','revisor2@gmail.com',NULL,'2024-12-14 15:00:00');
/*!40000 ALTER TABLE `revisores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','estudiante','secretaria','comision','asesor','otro','revisor','psicologo') NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (17,'secretaria2@gmail.com','$2a$10$PkMB8Z5zu3H0n1vXT6yE4u7B/4Q4fyqWhnk4TyRtvFVl98HMgYrEq','secretaria','2024-11-25 23:46:12'),(21,'asesor1@gamil.com','$2a$10$PW9C7vnG4/6wt58ygdtA3eul.rahT.grpMncDUI9otJwbX.Vaqx02','asesor','2024-12-03 18:14:26'),(23,'secretaria3@gmail.com','$2a$10$W/WN5rkeRV7.5ckt/R8wj.qWGwi0EpU6Hk7oB7qXzHEdyqiuHZ7zC','secretaria','2024-12-03 18:55:51'),(24,'asesor3@gmail.com','$2a$10$GyRMCGo9giMTf9wuDg01Lu2./LHg2W0xoeTK1a.rg.UwcoDZMk12W','asesor','2024-12-03 18:57:37'),(25,'erickmelval3@gmail.com','$2a$10$019omi3KXXtmaIc2AWl7beSrhB9b5KvF6kbrE14XyxlonJrvplwjC','estudiante','2024-12-03 18:59:59'),(26,'comision3@gmail.com','$2a$10$qiWTQQT0xaStV4jrn9bDdOtQqd.Kq1KmAc1PIUszTDu76/yMve6YK','comision','2024-12-03 19:03:56'),(27,'asesor4@gmail.com','$2a$10$z.SG5cRXoYzFcEkntm0rCuPrd3DuHSeI4D/bEOpIr6dXk0gTIoxO2','asesor','2024-12-13 05:37:07'),(28,'estudiante4@gmail.com','$2a$10$TpzTRBwSbOnIOXgv0UUBbeK4epQELbSPuCWMWH/TRnAufm5XZEE5.','estudiante','2024-12-14 23:30:50'),(29,'revisor1@gmail.com','$2a$10$5wenXbPlkstGMH.5e/ErH.NArFSJL.F6LVspI7ogoQr54S7bjFHEm','revisor','2024-12-16 08:47:26'),(30,'revisor2@gmail.com','$2a$10$oYyjhfJg5LQ8bl9c/SFPK.iLYpRd1NcHGytYVW8yyOo6PeNMo3fdq','revisor','2024-12-16 08:47:26'),(31,'marana@continental.edu.pe','$2a$10$uqnFGAz/MnfpyhVxWUOoDu2OkQKJoIt.b0yTK7MCw.sUyrmZrHd.G','estudiante','2024-12-18 23:34:45'),(76,'nilo@gmail.com','$2a$10$yG7CO5Vd8i7zflX0kkFMO.9yEPX4TUOHbR8K9YssYMmUA6CexSPh.','estudiante','2025-01-08 16:20:48'),(82,'juan.perez@ejemplo.com','$2a$10$jGSKt3MJlHB9D7vt/q/1RO0yxodMquTxiE9bfYAGDRoUkBagcHKte','psicologo','2025-02-03 17:56:29'),(83,'maria.lopez@ejemplo.com','$2a$10$Pvqy/HBVQYmhTDFwbfR1TOB8gEfDefufiesmwpl7LwSrB85L8GKR6','psicologo','2025-02-03 17:56:29'),(84,'carlos.martinez@ejemplo.com','$2a$10$9z11MSvBklCL.mb/ncDN3.HOkV0nv.6i9m446s8a18gxQNwpJd3AK','psicologo','2025-02-03 17:56:29'),(85,'admin@gmail.com','$2a$10$7xPrOxPszzK87PP8SKhiseFpQGNZpbPynwwLkXFu0kGW81X0Ytk6q','admin','2025-02-06 17:09:28');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 10:21:15
