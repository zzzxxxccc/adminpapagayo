CREATE DATABASE  IF NOT EXISTS `adminp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `adminp`;
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: adminp
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.13.10.2

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo_proyecto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cargos_tipo_proyecto1_idx` (`tipo_proyecto_id`),
  CONSTRAINT `fk_cargos_tipo_proyecto1` FOREIGN KEY (`tipo_proyecto_id`) REFERENCES `tipo_proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Desarrollador ',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `rif` varchar(14) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `persona_contacto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_prodcuto_interno`
--

DROP TABLE IF EXISTS `datos_prodcuto_interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_prodcuto_interno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_interno_id` int(11) NOT NULL,
  `web` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `instagram` varchar(45) DEFAULT NULL,
  `user_correo` varchar(45) DEFAULT NULL,
  `correo_password` varchar(45) DEFAULT NULL,
  `user_web` varchar(45) DEFAULT NULL,
  `pass_web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_prodcuto_interno_producto_interno1_idx` (`producto_interno_id`),
  CONSTRAINT `fk_datos_prodcuto_interno_producto_interno1` FOREIGN KEY (`producto_interno_id`) REFERENCES `producto_interno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_prodcuto_interno`
--

LOCK TABLES `datos_prodcuto_interno` WRITE;
/*!40000 ALTER TABLE `datos_prodcuto_interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_prodcuto_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_generada`
--

DROP TABLE IF EXISTS `factura_generada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_generada` (
  `id` int(11) NOT NULL,
  `cliente_rif` varchar(14) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `numero_factura` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_generada_cliente1_idx` (`cliente_rif`),
  KEY `fk_factura_generada_proyecto1_idx` (`proyecto_id`),
  CONSTRAINT `fk_factura_generada_cliente1` FOREIGN KEY (`cliente_rif`) REFERENCES `cliente` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_generada_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_generada`
--

LOCK TABLES `factura_generada` WRITE;
/*!40000 ALTER TABLE `factura_generada` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_generada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_proyecto`
--

DROP TABLE IF EXISTS `pago_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago_proyecto` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_act_proyecto_proyecto1_idx` (`proyecto_id`),
  CONSTRAINT `fk_act_proyecto_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_proyecto`
--

LOCK TABLES `pago_proyecto` WRITE;
/*!40000 ALTER TABLE `pago_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `img_perfil` varchar(200) DEFAULT 'img/default.jpg',
  `cargos_id` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_personal_cargos1_idx` (`cargos_id`),
  CONSTRAINT `fk_personal_cargos1` FOREIGN KEY (`cargos_id`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (19823052,'Alberto','Chirinos','0412.071.10.39','chirinosalbertoj@gmail.com',1,'img/profile/chivo.jpg',1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_interno`
--

DROP TABLE IF EXISTS `producto_interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_interno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `tipo_proyecto_id` int(11) NOT NULL,
  `personal_cedula_responsable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_internos_tipo_proyecto1_idx` (`tipo_proyecto_id`),
  KEY `fk_producto_internos_personal1_idx` (`personal_cedula_responsable`),
  CONSTRAINT `fk_producto_internos_tipo_proyecto1` FOREIGN KEY (`tipo_proyecto_id`) REFERENCES `tipo_proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_internos_personal1` FOREIGN KEY (`personal_cedula_responsable`) REFERENCES `personal` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_interno`
--

LOCK TABLES `producto_interno` WRITE;
/*!40000 ALTER TABLE `producto_interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_rif` varchar(14) NOT NULL,
  `nombre_proyecto` varchar(45) NOT NULL,
  `tipo_proyecto_id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `status_proyecto_id` int(11) NOT NULL,
  `precio_total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proyecto_tipo_proyecto1_idx` (`tipo_proyecto_id`),
  KEY `fk_proyecto_cliente1_idx` (`cliente_rif`),
  KEY `fk_proyecto_status_proyecto1_idx` (`status_proyecto_id`),
  CONSTRAINT `fk_proyecto_tipo_proyecto1` FOREIGN KEY (`tipo_proyecto_id`) REFERENCES `tipo_proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyecto_cliente1` FOREIGN KEY (`cliente_rif`) REFERENCES `cliente` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyecto_status_proyecto1` FOREIGN KEY (`status_proyecto_id`) REFERENCES `status_proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_proyecto`
--

DROP TABLE IF EXISTS `status_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_proyecto`
--

LOCK TABLES `status_proyecto` WRITE;
/*!40000 ALTER TABLE `status_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_proyecto`
--

DROP TABLE IF EXISTS `tipo_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `nombre_corto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_proyecto`
--

LOCK TABLES `tipo_proyecto` WRITE;
/*!40000 ALTER TABLE `tipo_proyecto` DISABLE KEYS */;
INSERT INTO `tipo_proyecto` VALUES (1,'Aplicación Movil','APP');
/*!40000 ALTER TABLE `tipo_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `cedula_empleado` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'a','202cb962ac59075b964b07152d234b70',1,NULL),(2,'b','92eb5ffee6ae2fec3ad71c777531578f',1,'19823052');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-28 16:41:11
