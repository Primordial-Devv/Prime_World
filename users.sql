-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for primeworld
CREATE DATABASE IF NOT EXISTS `primeworld` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `primeworld`;

-- Dumping structure for table primeworld.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.addon_account: ~2 rows (approximately)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0);

-- Dumping structure for table primeworld.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.addon_account_data: ~2 rows (approximately)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(9, 'bank_savings', 0, '525fa2ba075115294b0606735621fca0282600d0'),
	(10, 'caution', 0, '525fa2ba075115294b0606735621fca0282600d0');

-- Dumping structure for table primeworld.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.datastore: ~5 rows (approximately)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dumping structure for table primeworld.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.datastore_data: ~5 rows (approximately)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(6, 'property', '525fa2ba075115294b0606735621fca0282600d0', '{}'),
	(7, 'user_glasses', '525fa2ba075115294b0606735621fca0282600d0', '{}'),
	(8, 'user_ears', '525fa2ba075115294b0606735621fca0282600d0', '{}'),
	(9, 'user_mask', '525fa2ba075115294b0606735621fca0282600d0', '{}'),
	(10, 'user_helmet', '525fa2ba075115294b0606735621fca0282600d0', '{}');

-- Dumping structure for table primeworld.inventory_clothes
CREATE TABLE IF NOT EXISTS `inventory_clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `items` text DEFAULT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.inventory_clothes: ~0 rows (approximately)
INSERT INTO `inventory_clothes` (`id`, `identifier`, `items`) VALUES
	(6, '525fa2ba075115294b0606735621fca0282600d0', '[{"amount":1,"image":"helmet.png","useable":true,"name":"helmet","weight":0,"slot":1,"label":"Helmet","description":"A nice piece of clothing","info":{"quality":100,"accessories2":0,"accessories":19},"unique":true,"type":"item"},null,{"amount":1,"image":"torso.png","useable":true,"name":"torso","weight":0,"slot":3,"label":"Torso","description":"A nice piece of clothing","info":{"quality":100,"accessories2":0,"accessories":0},"unique":true,"type":"item"},{"amount":1,"image":"arms.png","useable":true,"name":"arms","weight":0,"slot":4,"label":"Arms","description":"A nice piece of clothing","info":{"accessories":0,"accessories2":0},"unique":true,"type":"item"},{"amount":1,"image":"tshirt.png","useable":true,"name":"tshirt","weight":0,"slot":5,"label":"T-shirt","description":"A nice piece of clothing","info":{"accessories":0,"accessories2":0},"unique":true,"type":"item"},{"amount":1,"image":"jeans.png","useable":true,"name":"jeans","weight":0,"slot":6,"label":"Jeans","description":"A nice piece of clothing","info":{"accessories":0,"accessories2":0},"unique":true,"type":"item"},{"amount":1,"image":"shoes.png","useable":true,"name":"shoes","weight":0,"slot":7,"label":"Shoes","description":"A nice piece of clothing","info":{"accessories":0,"accessories2":0},"unique":true,"type":"item"}]');

-- Dumping structure for table primeworld.inventory_glovebox
CREATE TABLE IF NOT EXISTS `inventory_glovebox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table primeworld.inventory_glovebox: ~0 rows (approximately)

-- Dumping structure for table primeworld.inventory_metadata
CREATE TABLE IF NOT EXISTS `inventory_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table primeworld.inventory_metadata: ~0 rows (approximately)

-- Dumping structure for table primeworld.inventory_stash
CREATE TABLE IF NOT EXISTS `inventory_stash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table primeworld.inventory_stash: ~0 rows (approximately)

-- Dumping structure for table primeworld.inventory_trunk
CREATE TABLE IF NOT EXISTS `inventory_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table primeworld.inventory_trunk: ~0 rows (approximately)

-- Dumping structure for table primeworld.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.items: ~0 rows (approximately)

-- Dumping structure for table primeworld.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.jobs: ~1 rows (approximately)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('unemployed', 'Unemployed', 0);

-- Dumping structure for table primeworld.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.job_grades: ~1 rows (approximately)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');

-- Dumping structure for table primeworld.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.licenses: ~5 rows (approximately)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License');

-- Dumping structure for table primeworld.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.management_outfits: ~0 rows (approximately)

-- Dumping structure for table primeworld.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(60) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.owned_vehicles: ~0 rows (approximately)

-- Dumping structure for table primeworld.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table primeworld.playerskins: ~0 rows (approximately)

-- Dumping structure for table primeworld.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.player_outfits: ~0 rows (approximately)

-- Dumping structure for table primeworld.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table primeworld.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.society_moneywash: ~0 rows (approximately)

-- Dumping structure for table primeworld.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.users: ~1 rows (approximately)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`) VALUES
	('525fa2ba075115294b0606735621fca0282600d0', '{"bank":65600,"black_money":10000,"money":10000}', 'admin', '[{"useable":false,"count":1,"amount":1,"label":"Walther P99","type":"weapon","weight":1000,"slot":1,"info":{"ammo":0,"quality":89.00000000000066,"serie":"0vGw31V9Jd"},"image":"weapon_pistol.png","created":1705502425,"description":"A small firearm designed to be held in one hand","name":"weapon_pistol","unique":true},{"useable":false,"count":1,"amount":1,"label":"Assault Rifle","type":"weapon","weight":1000,"slot":2,"info":{"ammo":0,"quality":100,"serie":"COqFV37u8N"},"image":"weapon_assaultrifle.png","created":1705507017,"description":"A rapid-fire, magazine-fed automatic rifle designed for infantry use","name":"weapon_assaultrifle","unique":true},{"shouldClose":true,"useable":true,"count":10000,"amount":10000,"label":"Money","type":"item","weight":0,"slot":3,"info":{"quality":100},"image":"cash.png","description":"Cash","created":1705520140,"name":"money","unique":false},{"shouldClose":true,"useable":true,"count":10000,"amount":10000,"label":"Black Money","type":"item","weight":0,"slot":4,"info":{"quality":100},"image":"black_money.png","description":"Black Money","created":1705520149,"name":"black_money","unique":false},{"shouldClose":true,"useable":true,"type":"item","amount":1,"created":1705520904,"count":1,"label":"Helmet","slot":5,"info":{"accessories":38,"quality":100,"accessories2":0},"image":"helmet.png","description":"A nice piece of clothing","name":"helmet","weight":0,"unique":true},null,null,null,null,null,{"shouldClose":true,"useable":true,"count":10,"amount":10,"label":"Pistol ammo","type":"item","weight":200,"slot":11,"info":{"quality":100},"image":"pistol_ammo.png","description":"Ammo for Pistols","created":1705507029,"name":"pistol_ammo","unique":false},{"shouldClose":true,"useable":true,"count":10,"amount":10,"label":"Rifle ammo","type":"item","weight":1000,"slot":12,"info":{"quality":100},"image":"rifle_ammo.png","description":"Ammo for Rifles","created":1705507036,"name":"rifle_ammo","unique":false}]', 'unemployed', 0, '[]', '{"armor":0,"health":0}', '{"z":0.0,"y":-0.0,"x":0.0}', 'Prime', 'Dev', '22/08/1990', 'm', 190, '{"hair":{"style":0,"color":0,"highlight":0,"texture":0},"eyeColor":0,"tattoos":[],"headBlend":{"shapeThird":0,"skinThird":0,"thirdMix":0,"skinFirst":0,"shapeSecond":0,"skinMix":0,"skinSecond":0,"shapeMix":0,"shapeFirst":0},"faceFeatures":{"nosePeakLowering":0,"chinBoneSize":0,"noseBoneTwist":0,"neckThickness":0,"nosePeakHigh":0,"lipsThickness":0,"cheeksBoneWidth":0,"nosePeakSize":0,"eyesOpening":0,"cheeksWidth":0,"noseBoneHigh":0,"chinBoneLowering":0,"chinBoneLenght":0,"jawBoneWidth":0,"eyeBrownHigh":0,"chinHole":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"noseWidth":0,"eyeBrownForward":0},"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"model":"mp_m_freemode_01","components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"headOverlays":{"blush":{"style":0,"color":0,"opacity":0,"secondColor":0},"complexion":{"style":0,"color":0,"opacity":0,"secondColor":0},"makeUp":{"style":0,"color":0,"opacity":0,"secondColor":0},"beard":{"style":0,"color":0,"opacity":0,"secondColor":0},"eyebrows":{"style":0,"color":0,"opacity":0,"secondColor":0},"sunDamage":{"style":0,"color":0,"opacity":0,"secondColor":0},"lipstick":{"style":0,"color":0,"opacity":0,"secondColor":0},"bodyBlemishes":{"style":0,"color":0,"opacity":0,"secondColor":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0,"secondColor":0},"blemishes":{"style":0,"color":0,"opacity":0,"secondColor":0},"ageing":{"style":0,"color":0,"opacity":0,"secondColor":0},"chestHair":{"style":0,"color":0,"opacity":0,"secondColor":0}}}', '[{"name":"drunk","percent":0.0,"val":0},{"name":"hunger","percent":0.0,"val":0},{"name":"thirst","percent":0.0,"val":0}]', 0, 7, 0, NULL, '2024-01-17 13:33:06', '2024-01-18 03:24:46', NULL, NULL);

-- Dumping structure for table primeworld.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table primeworld.user_licenses: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
