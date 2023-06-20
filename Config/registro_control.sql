-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para registro_control
DROP DATABASE IF EXISTS `registro_control`;
CREATE DATABASE IF NOT EXISTS `registro_control` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `registro_control`;

-- Volcando estructura para tabla registro_control.accesorios
DROP TABLE IF EXISTS `accesorios`;
CREATE TABLE IF NOT EXISTS `accesorios` (
  `id_accesorios` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcon` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_accesorios`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.accesorios: ~0 rows (aproximadamente)
INSERT INTO `accesorios` (`id_accesorios`, `nombre`, `descripcon`) VALUES
	(1, 'Cargador', NULL),
	(2, 'Mouse', NULL),
	(3, 'Teclado', NULL);

-- Volcando estructura para tabla registro_control.color
DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.color: ~0 rows (aproximadamente)
INSERT INTO `color` (`id_color`, `nombre`, `descripcion`) VALUES
	(1, 'Blanco', NULL),
	(2, 'Gris', NULL),
	(3, 'Negro', NULL);

-- Volcando estructura para tabla registro_control.dispositivos
DROP TABLE IF EXISTS `dispositivos`;
CREATE TABLE IF NOT EXISTS `dispositivos` (
  `id_dispositivo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint unsigned NOT NULL,
  `id_tipo_dispositivo` bigint unsigned NOT NULL,
  `id_marca` bigint unsigned NOT NULL,
  `id_color` bigint unsigned NOT NULL,
  `id_accesorios` bigint unsigned NOT NULL,
  `serie` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_dispositivo`) USING BTREE,
  KEY `FK_dispositivos_tipo_dispositivos` (`id_tipo_dispositivo`),
  KEY `FK_dispositivos_marcas` (`id_marca`),
  KEY `FK_dispositivos_color` (`id_color`),
  KEY `id_persona` (`id_persona`),
  KEY `FK_dispositivos_accesorios` (`id_accesorios`) USING BTREE,
  CONSTRAINT `FK_dispositivo_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `FK_dispositivos_accesorios` FOREIGN KEY (`id_accesorios`) REFERENCES `accesorio` (`id_accesorios`),
  CONSTRAINT `FK_dispositivos_color` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  CONSTRAINT `FK_dispositivos_marcas` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `FK_dispositivos_tipo_dispositivos` FOREIGN KEY (`id_tipo_dispositivo`) REFERENCES `tipo_dispositivos` (`id_tipo_dispositivo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.dispositivos: ~0 rows (aproximadamente)
INSERT INTO `dispositivos` (`id_dispositivo`, `id_persona`, `id_tipo_dispositivo`, `id_marca`, `id_color`, `id_accesorios`, `serie`, `descripcion`) VALUES
	(1, 40, 2, 1, 3, 0, 'CR57', 'PORTATIL ROJO CON NEGRO 32GB DE RAM 2.5TB M.2'),
	(2, 0, 1, 8, 3, 5, 'SFDSA', NULL),
	(3, 0, 1, 6, 3, 4, 'dadsadsadsa', NULL);

-- Volcando estructura para tabla registro_control.info_vigilantes
DROP TABLE IF EXISTS `info_vigilantes`;
CREATE TABLE IF NOT EXISTS `info_vigilantes` (
  `id_vigilante` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint unsigned NOT NULL,
  `pass` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `inicio_contrato` date NOT NULL,
  `fin_contrato` date NOT NULL,
  `estado` tinyint DEFAULT '1' COMMENT '1 =activo, 0=inactivo',
  PRIMARY KEY (`id_vigilante`) USING BTREE,
  KEY `FK_vigilantes_personas` (`id_persona`),
  CONSTRAINT `FK_vigilantes_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.info_vigilantes: ~6 rows (aproximadamente)
INSERT INTO `info_vigilantes` (`id_vigilante`, `id_persona`, `pass`, `inicio_contrato`, `fin_contrato`, `estado`) VALUES
	(1, 46, '123457', '2023-01-01', '2025-05-01', 1),
	(2, 45, '5564245', '2023-01-01', '2025-05-12', 0),
	(3, 40, '5435435435', '2023-01-30', '2026-11-19', 0),
	(4, 45, '487464', '2023-04-02', '2024-05-02', 1),
	(5, 40, '35151', '2023-02-03', '2024-02-20', 1),
	(6, 1, '123456', '2023-02-22', '2024-02-22', 1);

-- Volcando estructura para tabla registro_control.ingresar
DROP TABLE IF EXISTS `ingresar`;
CREATE TABLE IF NOT EXISTS `ingresar` (
  `id_ingresar` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint unsigned NOT NULL,
  `id_dispositivo` bigint unsigned NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL,
  PRIMARY KEY (`id_ingresar`),
  KEY `FK_ingresar_personas` (`id_persona`),
  KEY `FK_ingresar_dispositivos` (`id_dispositivo`) USING BTREE,
  CONSTRAINT `FK_ingresar_dispositivos` FOREIGN KEY (`id_dispositivo`) REFERENCES `dispositivos` (`id_dispositivo`),
  CONSTRAINT `FK_ingresar_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.ingresar: ~0 rows (aproximadamente)

-- Volcando estructura para tabla registro_control.marcas
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marca` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.marcas: ~0 rows (aproximadamente)
INSERT INTO `marcas` (`id_marca`, `nombre`, `descripcion`) VALUES
	(1, 'Acer', NULL),
	(2, 'Apple', NULL),
	(3, 'Asus', NULL),
	(4, 'Dell', NULL),
	(5, 'HP', NULL),
	(6, 'Lenovo', NULL),
	(7, 'Microsoft Surface', NULL),
	(8, 'Razer', NULL),
	(9, 'Samsung', NULL);

-- Volcando estructura para tabla registro_control.personas
DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_identificacion` bigint unsigned NOT NULL,
  `numero_identificacion` varchar(10) NOT NULL,
  `primer_nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `segundo_nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `primer_apellido` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `segundo_apellido` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_sexo` bigint unsigned NOT NULL COMMENT '1 F, 2 M',
  `id_rol` bigint unsigned NOT NULL,
  `foto` longtext,
  PRIMARY KEY (`id_persona`),
  KEY `FK_personas_roles` (`id_rol`),
  KEY `FK_personas_tipo_identificacion` (`id_tipo_identificacion`),
  KEY `FK_personas_sexo` (`id_sexo`),
  CONSTRAINT `FK_personas_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `FK_personas_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_sexo`),
  CONSTRAINT `FK_personas_tipo_identificacion` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.personas: ~4 rows (aproximadamente)
INSERT INTO `personas` (`id_persona`, `id_tipo_identificacion`, `numero_identificacion`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `telefono`, `email`, `direccion`, `id_sexo`, `id_rol`, `foto`) VALUES
	(1, 35, '12345078', 'pepito', '', 'perez', '', '13245620', 'perezpepito@gmail.com', 'CARRERA#0', 2, 4, NULL),
	(2, 32, '1256555454', 'el', '', 'guachiman', '', '5151561516', 'elwachi@gmail.com', 'cll20.', 2, 4, NULL),
	(3, 33, '1123324555', 'carlos', 'antonio ', 'locura', '', '3123456896', 'locuraantonio@gmail.com', 'calle#1234', 2, 4, NULL),
	(4, 32, '1354365136', 'norma', 'suley', 'suarez', '', '3126854365', 'suarez@gmail.com', '', 1, 1, NULL);

-- Volcando estructura para tabla registro_control.posiciones
DROP TABLE IF EXISTS `posiciones`;
CREATE TABLE IF NOT EXISTS `posiciones` (
  `id_posicion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_posicion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Sectores de vigilancia';

-- Volcando datos para la tabla registro_control.posiciones: ~0 rows (aproximadamente)
INSERT INTO `posiciones` (`id_posicion`, `nombre`, `descripcion`) VALUES
	(1, 'PARQUEADERO', NULL);

-- Volcando estructura para tabla registro_control.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.roles: ~6 rows (aproximadamente)
INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
	(1, 'Administrador'),
	(2, 'Aprendiz'),
	(3, 'Instructor'),
	(4, 'Vigilante'),
	(5, 'Visitante'),
	(6, 'Supervisor');

-- Volcando estructura para tabla registro_control.sedes
DROP TABLE IF EXISTS `sedes`;
CREATE TABLE IF NOT EXISTS `sedes` (
  `id_sede` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.sedes: ~0 rows (aproximadamente)
INSERT INTO `sedes` (`id_sede`, `nombre`, `descripcion`) VALUES
	(1, 'SEDE MODELO', NULL);

-- Volcando estructura para tabla registro_control.sexo
DROP TABLE IF EXISTS `sexo`;
CREATE TABLE IF NOT EXISTS `sexo` (
  `id_sexo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 F, 2 M',
  PRIMARY KEY (`id_sexo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla registro_control.sexo: ~2 rows (aproximadamente)
INSERT INTO `sexo` (`id_sexo`, `nombre`) VALUES
	(1, 'Femenino'),
	(2, 'Masculino');

-- Volcando estructura para tabla registro_control.supervisores
DROP TABLE IF EXISTS `supervisores`;
CREATE TABLE IF NOT EXISTS `supervisores` (
  `id_supervisor` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint unsigned NOT NULL,
  `password` varchar(45) NOT NULL,
  `estado` tinyint(1) DEFAULT '1' COMMENT '1=activo, 0=inactivo',
  PRIMARY KEY (`id_supervisor`),
  KEY `FK_supervisores_personas` (`id_persona`),
  CONSTRAINT `FK_supervisores_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.supervisores: ~0 rows (aproximadamente)
INSERT INTO `supervisores` (`id_supervisor`, `id_persona`, `password`, `estado`) VALUES
	(1, 40, '12345', 1);

-- Volcando estructura para tabla registro_control.tipo_dispositivos
DROP TABLE IF EXISTS `tipo_dispositivos`;
CREATE TABLE IF NOT EXISTS `tipo_dispositivos` (
  `id_tipo_dispositivo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_dispositivo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.tipo_dispositivos: ~0 rows (aproximadamente)
INSERT INTO `tipo_dispositivos` (`id_tipo_dispositivo`, `nombre`, `descripcion`) VALUES
	(1, 'Computador', NULL),
	(2, 'Portátil', NULL),
	(3, 'Tablets', NULL);

-- Volcando estructura para tabla registro_control.tipo_identificacion
DROP TABLE IF EXISTS `tipo_identificacion`;
CREATE TABLE IF NOT EXISTS `tipo_identificacion` (
  `id_tipo_identificacion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id_tipo_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.tipo_identificacion: ~5 rows (aproximadamente)
INSERT INTO `tipo_identificacion` (`id_tipo_identificacion`, `nombre`) VALUES
	(1, 'Cédula de Ciudadanía'),
	(2, 'Tarjeta de Identidad'),
	(3, 'Cédula de Extranjería'),
	(4, 'Tarjeta de Extranjería'),
	(5, 'Pasaporte');

-- Volcando estructura para tabla registro_control.turnos
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE IF NOT EXISTS `turnos` (
  `id_turno` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_vigilante` bigint unsigned NOT NULL,
  `id_sede` bigint unsigned NOT NULL,
  `id_posicion` bigint unsigned NOT NULL,
  `id_supervisor` bigint unsigned NOT NULL,
  `fecha_inicial` date NOT NULL,
  `hora_inicial` time NOT NULL,
  `fecha_final` date NOT NULL,
  `hora_final` time NOT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `FK_turnos_vigilantes` (`id_vigilante`),
  KEY `FK_turnos_sedes` (`id_sede`),
  KEY `FK_turnos_posiciones` (`id_posicion`),
  KEY `FK_turnos_supervisores` (`id_supervisor`),
  CONSTRAINT `FK_turnos_posiciones` FOREIGN KEY (`id_posicion`) REFERENCES `posiciones` (`id_posicion`),
  CONSTRAINT `FK_turnos_sedes` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`),
  CONSTRAINT `FK_turnos_supervisores` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id_supervisor`),
  CONSTRAINT `FK_turnos_vigilantes` FOREIGN KEY (`id_vigilante`) REFERENCES `info_vigilantes` (`id_vigilante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla registro_control.turnos: ~0 rows (aproximadamente)
INSERT INTO `turnos` (`id_turno`, `id_vigilante`, `id_sede`, `id_posicion`, `id_supervisor`, `fecha_inicial`, `hora_inicial`, `fecha_final`, `hora_final`) VALUES
	(1, 17, 1, 1, 1, '2023-06-01', '06:00:00', '2023-06-15', '12:00:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
