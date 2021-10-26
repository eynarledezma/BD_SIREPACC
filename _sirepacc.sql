-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.31-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sirepacc
CREATE DATABASE IF NOT EXISTS `sirepacc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sirepacc`;

-- Volcando estructura para tabla sirepacc.diagnosticos
CREATE TABLE IF NOT EXISTS `diagnosticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tcitas
CREATE TABLE IF NOT EXISTS `tcitas` (
  `idcita` int(11) NOT NULL AUTO_INCREMENT,
  `idpaciente` int(11) DEFAULT NULL,
  `Columna 3` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fechaconsulta` datetime DEFAULT NULL,
  `idespecialidad` int(11) DEFAULT NULL,
  `idmedico` int(11) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `userelimina` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tconsulta
CREATE TABLE IF NOT EXISTS `tconsulta` (
  `idconsulta` int(11) NOT NULL AUTO_INCREMENT,
  `idcita` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`idconsulta`),
  KEY `FK__tcitas` (`idcita`),
  CONSTRAINT `FK__tcitas` FOREIGN KEY (`idcita`) REFERENCES `tcitas` (`idcita`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tconsultasigvitales
CREATE TABLE IF NOT EXISTS `tconsultasigvitales` (
  `idconsigvital` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL DEFAULT 0,
  `idsignovital` int(11) DEFAULT NULL,
  `dato` double DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idconsigvital`),
  KEY `FK_tconsultasigvitales_tconsulta` (`idconsulta`),
  KEY `FK_tconsultasigvitales_tsignosvitales` (`idsignovital`),
  KEY `FK_tconsultasigvitales_tusuario` (`idusuario`),
  CONSTRAINT `FK_tconsultasigvitales_tconsulta` FOREIGN KEY (`idconsulta`) REFERENCES `tconsulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tconsultasigvitales_tsignosvitales` FOREIGN KEY (`idsignovital`) REFERENCES `tsignosvitales` (`idsignosvitales`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tconsultasigvitales_tusuario` FOREIGN KEY (`idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tconsultasintomas
CREATE TABLE IF NOT EXISTS `tconsultasintomas` (
  `idconsultasintomas` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL DEFAULT 0,
  `idsintomas` int(11) NOT NULL DEFAULT 0,
  `fecha` datetime DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `eliminado` int(11) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`idconsultasintomas`),
  KEY `FK__tconsulta` (`idconsulta`),
  KEY `FK_tconsultasintomas_tsintomas` (`idsintomas`),
  KEY `FK_tconsultasintomas_tusuario` (`idusuario`),
  CONSTRAINT `FK__tconsulta` FOREIGN KEY (`idconsulta`) REFERENCES `tconsulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tconsultasintomas_tsintomas` FOREIGN KEY (`idsintomas`) REFERENCES `tsintomas` (`idsintomas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tconsultasintomas_tusuario` FOREIGN KEY (`idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tentidad
CREATE TABLE IF NOT EXISTS `tentidad` (
  `identidad` int(5) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tespecialidades
CREATE TABLE IF NOT EXISTS `tespecialidades` (
  `idespecialidad` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idespecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.testados
CREATE TABLE IF NOT EXISTS `testados` (
  `idestado` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) NOT NULL DEFAULT '0',
  `entidad` int(5) NOT NULL DEFAULT 0,
  `eliminado` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tmodulo
CREATE TABLE IF NOT EXISTS `tmodulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tprivilegios
CREATE TABLE IF NOT EXISTS `tprivilegios` (
  `idprivilegio` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL DEFAULT 0,
  `idmodulo` int(11) NOT NULL DEFAULT 0,
  `lectura` int(11) NOT NULL DEFAULT 0,
  `insertar` int(11) NOT NULL DEFAULT 0,
  `modifica` int(11) NOT NULL DEFAULT 0,
  `eliminar` int(11) NOT NULL DEFAULT 0,
  `imprimir` int(11) NOT NULL DEFAULT 0,
  `abrir` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idprivilegio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tsignosvitales
CREATE TABLE IF NOT EXISTS `tsignosvitales` (
  `idsignosvitales` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsignosvitales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tsintomas
CREATE TABLE IF NOT EXISTS `tsintomas` (
  `idsintomas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idsintomas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.ttipousuario
CREATE TABLE IF NOT EXISTS `ttipousuario` (
  `idtipousuario` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` int(10) DEFAULT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tusuario
CREATE TABLE IF NOT EXISTS `tusuario` (
  `idusuario` int(10) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(18) DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(19) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `celular` varchar(8) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tusuarioespecialidad
CREATE TABLE IF NOT EXISTS `tusuarioespecialidad` (
  `idusuesp` int(11) NOT NULL AUTO_INCREMENT,
  `idespecialidad` int(11) NOT NULL DEFAULT 0,
  `idusuario` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idusuesp`),
  KEY `FK__tespecialidades` (`idespecialidad`),
  KEY `FK__tusuariotipos` (`idusuario`),
  CONSTRAINT `FK__tespecialidades` FOREIGN KEY (`idespecialidad`) REFERENCES `tespecialidades` (`idespecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__tusuariotipos` FOREIGN KEY (`idusuario`) REFERENCES `tusuariotipos` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sirepacc.tusuariotipos
CREATE TABLE IF NOT EXISTS `tusuariotipos` (
  `idusuariotipo` int(5) NOT NULL AUTO_INCREMENT,
  `idusuario` int(5) NOT NULL DEFAULT 0,
  `idtipo` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idusuariotipo`),
  KEY `FK_tusuariotipos_ttipousuario` (`idtipo`),
  KEY `FK_tusuariotipos_tusuario` (`idusuario`),
  CONSTRAINT `FK_tusuariotipos_ttipousuario` FOREIGN KEY (`idtipo`) REFERENCES `ttipousuario` (`idtipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tusuariotipos_tusuario` FOREIGN KEY (`idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
