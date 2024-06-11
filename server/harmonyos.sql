/*
 Navicat Premium Data Transfer

 Source Server         : Harmonyos
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : harmonyos

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 10/06/2024 13:15:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chess
-- ----------------------------
DROP TABLE IF EXISTS `chess`;
CREATE TABLE `chess`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `gz1` int NOT NULL DEFAULT 0,
  `gz2` int NOT NULL DEFAULT 0,
  `gz3` int NOT NULL DEFAULT 0,
  `gz4` int NOT NULL DEFAULT 0,
  `gz5` int NOT NULL DEFAULT 0,
  `gz6` int NOT NULL DEFAULT 0,
  `gz7` int NOT NULL DEFAULT 0,
  `gz8` int NOT NULL DEFAULT 0,
  `gz9` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chess
-- ----------------------------
INSERT INTO `chess` VALUES (1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `yh1` int NULL DEFAULT NULL,
  `yh2` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
