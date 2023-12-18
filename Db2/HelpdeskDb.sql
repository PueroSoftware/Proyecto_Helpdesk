/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 11.2.2-MariaDB : Database - helpdesk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`helpdesk` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci */;

USE `helpdesk`;

/*Table structure for table `facturareparacion` */

DROP TABLE IF EXISTS `facturareparacion`;

CREATE TABLE `facturareparacion` (
  `Id_reparacion` int(11) DEFAULT NULL,
  `Id_factura_repare` int(11) NOT NULL AUTO_INCREMENT,
  `monto_total` float DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_factura_repare`),
  KEY `Id_reparacion` (`Id_reparacion`),
  CONSTRAINT `facturareparacion_ibfk_1` FOREIGN KEY (`Id_reparacion`) REFERENCES `reparados` (`Id_reparado`),
  CONSTRAINT `facturareparacion_ibfk_2` FOREIGN KEY (`Id_reparacion`) REFERENCES `reparacion` (`Id_reparado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Table structure for table `ingresoequipo` */

DROP TABLE IF EXISTS `ingresoequipo`;

CREATE TABLE `ingresoequipo` (
  `Id_Equipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura_repare` int(11) DEFAULT NULL,
  `id_reparado` int(11) DEFAULT NULL,
  `Id_empleado` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `modelo` varchar(15) NOT NULL,
  `serie` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_Equipo`),
  KEY `Id_empleado` (`Id_empleado`),
  KEY `Id_cliente` (`Id_cliente`),
  KEY `factura_cliente_id` (`id_factura_repare`),
  KEY `reparados_id` (`id_reparado`),
  CONSTRAINT `ingresoequipo_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `reparacionhardware` (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Table structure for table `reparacion` */

DROP TABLE IF EXISTS `reparacion`;

CREATE TABLE `reparacion` (
  `Id_reparado` int(11) NOT NULL AUTO_INCREMENT,
  `Id_rep_hard` int(11) DEFAULT NULL,
  `Id_rep_soft` int(11) DEFAULT NULL,
  `ruta_archivo` text DEFAULT NULL,
  PRIMARY KEY (`Id_reparado`),
  KEY `Id_rep_hard` (`Id_rep_hard`),
  KEY `Id_rep_soft` (`Id_rep_soft`),
  CONSTRAINT `reparacion_ibfk_1` FOREIGN KEY (`Id_rep_hard`) REFERENCES `reparacionhardware` (`Id_rep_hard`),
  CONSTRAINT `reparacion_ibfk_2` FOREIGN KEY (`Id_rep_soft`) REFERENCES `reparacionsoftware` (`Id_rep_soft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Table structure for table `reparacionhardware` */

DROP TABLE IF EXISTS `reparacionhardware`;

CREATE TABLE `reparacionhardware` (
  `Id_rep_hard` int(11) NOT NULL,
  `Id_empleado` int(11) DEFAULT NULL,
  `Id_cliente` int(11) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `descripcion_problema` varchar(200) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `falla` varchar(50) DEFAULT NULL,
  `origen` varchar(50) DEFAULT NULL,
  `Id_foto_reparacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_rep_hard`),
  UNIQUE KEY `Id_rep_hard` (`Id_rep_hard`),
  KEY `Id_cliente` (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Table structure for table `reparacionsoftware` */

DROP TABLE IF EXISTS `reparacionsoftware`;

CREATE TABLE `reparacionsoftware` (
  `Id_rep_soft` int(11) NOT NULL AUTO_INCREMENT,
  `Id_empleado` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `descripcion_problema` varchar(200) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `modelo` varchar(15) NOT NULL,
  `falla` varchar(30) NOT NULL,
  `origen` varchar(200) NOT NULL,
  `Id_foto_reparacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_rep_soft`),
  KEY `Id_cliente` (`Id_cliente`),
  CONSTRAINT `reparacionsoftware_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `ingresoequipo` (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

/*Table structure for table `reparados` */

DROP TABLE IF EXISTS `reparados`;

CREATE TABLE `reparados` (
  `Id_reparado` int(11) NOT NULL,
  `Id_RepUsados` int(11) NOT NULL,
  `fecha_reparacion` datetime NOT NULL,
  PRIMARY KEY (`Id_reparado`),
  KEY `Id_RepUsados` (`Id_RepUsados`),
  CONSTRAINT `reparados_ibfk_2` FOREIGN KEY (`Id_reparado`) REFERENCES `fotoreparacion` (`Id_rep_hard`),
  CONSTRAINT `reparados_ibfk_3` FOREIGN KEY (`Id_RepUsados`) REFERENCES `repuestousados` (`Id_RepUsados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
