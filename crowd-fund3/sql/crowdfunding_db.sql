/*
 Navicat Premium Dump SQL

 Source Server         : wyt
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : crowdfunding_db

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 27/09/2024 11:19:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'medical');
INSERT INTO `category` VALUES (2, 'education');
INSERT INTO `category` VALUES (3, 'social impact');
INSERT INTO `category` VALUES (4, 'crisis relief');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `fundraiser_id` int NOT NULL,
  `organizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `target_funding` decimal(20, 2) NOT NULL,
  `current_funding` decimal(20, 2) NOT NULL,
  `city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`fundraiser_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Kevin Harris', 'Create Educational Workshops for Underprivileged Youth!', 10000.00, 3022.00, 'LanZhou', 1, 2);
INSERT INTO `fundraiser` VALUES (2, 'Jessica Taylor', 'Revitalize Our Neighborhood Park: Join Us!', 50000.00, 40000.00, 'LaSa', 1, 3);
INSERT INTO `fundraiser` VALUES (3, 'Thomas Lee', 'Support Our Mission to Rescue Endangered Species!', 20000.00, 18500.99, 'HuBei', 1, 4);
INSERT INTO `fundraiser` VALUES (4, 'Emma Wilson', 'Help Us Build an Accessible Community Center!', 20000.00, 1000.01, 'BeiJing', 1, 3);
INSERT INTO `fundraiser` VALUES (5, 'Lucas Brown', 'Fund Our Art Therapy Program for Children!', 5000.00, 22.50, 'GuangZhou', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
