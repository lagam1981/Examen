/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : examen

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 25/12/2022 03:47:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tblusuarios
-- ----------------------------
DROP TABLE IF EXISTS `tblusuarios`;
CREATE TABLE `tblusuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblusuarios
-- ----------------------------
INSERT INTO `tblusuarios` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for tblventas
-- ----------------------------
DROP TABLE IF EXISTS `tblventas`;
CREATE TABLE `tblventas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` int NULL DEFAULT NULL,
  `producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `piezas` int NULL DEFAULT NULL,
  `precioUnitario` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblventas
-- ----------------------------
INSERT INTO `tblventas` VALUES (1, 1, 'SHAMPOO REGIO', 2, 2.5);
INSERT INTO `tblventas` VALUES (2, 2, 'SHAMPOO REGIO', 5, 2.5);
INSERT INTO `tblventas` VALUES (3, 1, 'SHAMPOO REGIO', 5, 2.5);
INSERT INTO `tblventas` VALUES (4, 1, 'PASTA DENTAL', 1, 20);
INSERT INTO `tblventas` VALUES (5, 1, 'SOPA MARUCHAN', 5, 15);
INSERT INTO `tblventas` VALUES (6, 1, 'SOPA MARUCHAN', 2, 15);
INSERT INTO `tblventas` VALUES (7, 2, 'SOPA MARUCHAN', 1, 15);

-- ----------------------------
-- Table structure for tblventastemp
-- ----------------------------
DROP TABLE IF EXISTS `tblventastemp`;
CREATE TABLE `tblventastemp`  (
  `producto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `piezas` int NULL DEFAULT NULL,
  `precioUnitario` float NULL DEFAULT NULL,
  `totalPago` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblventastemp
-- ----------------------------

-- ----------------------------
-- Procedure structure for obtenDatosAcceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `obtenDatosAcceso`;
delimiter ;;
CREATE PROCEDURE `obtenDatosAcceso`(_usuario varchar(100), _password varchar(500))
BEGIN
	
	SELECT 
				count(*) as acceso			
	FROM
		tblusuarios
	WHERE	
				usuario = _usuario
		and password = _password;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for obtenVentasFactura
-- ----------------------------
DROP PROCEDURE IF EXISTS `obtenVentasFactura`;
delimiter ;;
CREATE PROCEDURE `obtenVentasFactura`(_factura INT)
BEGIN
	
DROP TABLE if exists tblventasTemp;

	CREATE TABLE tblVentasTemp ( 
		  producto VARCHAR (100)
		, piezas INT
		, precioUnitario FLOAT
		, totalPago FLOAT 
	);
	
	insert into tblventasTemp
	SELECT 
        
			 producto
			,	sum(piezas)
			, precioUnitario
			,	sum(piezas * precioUnitario)
			
	FROM
		tblventas 
	WHERE	
		folio = _factura
	GROUP BY 
			precioUnitario, producto, folio;
			
			
select 
		ROW_NUMBER() OVER() as id
	, producto
	, piezas
	, precioUnitario
	, totalPago
from tblVentasTemp	;
	
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
