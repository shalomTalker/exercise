-- ----------------------------
-- Table structure for series
-- ----------------------------
CREATE TABLE `series`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` date NULL DEFAULT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `genre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of series
-- ----------------------------
INSERT INTO `series` VALUES (1, 'Game of Phones', '2010-01-01', 'James Hamron', 'Fantasy');
INSERT INTO `series` VALUES (2, 'House of Cars', '2013-06-01', 'Christopher Polan', 'Drama');
INSERT INTO `series` VALUES (3, 'Weirder Things', '2018-01-17', 'Quentin Barantino', 'Thriller');

-- ----------------------------
-- Table structure for seasons
-- ----------------------------
CREATE TABLE `seasons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seriesID` int(11) NULL DEFAULT NULL,
  `seasonNumber` int(11) NULL DEFAULT NULL,
  `airDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `series_if_fk`(`seriesID`) USING BTREE,
  CONSTRAINT `series_if_fk` FOREIGN KEY (`seriesID`) REFERENCES `series` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of seasons
-- ----------------------------
INSERT INTO `seasons` VALUES (1, 1, 1, '2010-01-01 19:58:46');
INSERT INTO `seasons` VALUES (2, 1, 2, '2011-06-01 19:58:58');
INSERT INTO `seasons` VALUES (3, 1, 3, '2012-06-17 19:59:10');
INSERT INTO `seasons` VALUES (4, 2, 1, '2013-06-01 19:59:32');
INSERT INTO `seasons` VALUES (5, 2, 2, '2014-06-01 20:00:06');
INSERT INTO `seasons` VALUES (6, 3, 1, '2018-01-01 20:00:19');

-- ----------------------------
-- Table structure for episodes
-- ----------------------------
CREATE TABLE `episodes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seasonID` int(11) NULL DEFAULT NULL,
  `episodeNumber` int(11) NULL DEFAULT NULL,
  `airDate` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `season_id_fk`(`seasonID`) USING BTREE,
  CONSTRAINT `season_id_fk` FOREIGN KEY (`seasonID`) REFERENCES `seasons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of episodes
-- ----------------------------
INSERT INTO `episodes` VALUES (1, 1, 1, '2010-01-01 20:00:37.000');
INSERT INTO `episodes` VALUES (2, 1, 2, '2010-01-12 20:00:37.000');
INSERT INTO `episodes` VALUES (3, 1, 3, '2010-01-22 20:00:37.000');
INSERT INTO `episodes` VALUES (4, 1, 4, '2010-02-05 20:00:37.000');
INSERT INTO `episodes` VALUES (5, 1, 5, '2010-02-20 20:00:37.000');
INSERT INTO `episodes` VALUES (6, 2, 1, '2011-06-01 19:58:58.000');
INSERT INTO `episodes` VALUES (7, 2, 2, '2011-06-15 19:58:58.000');
INSERT INTO `episodes` VALUES (8, 2, 3, '2011-07-01 19:58:58.000');
INSERT INTO `episodes` VALUES (9, 2, 4, '2011-07-15 19:58:58.000');
INSERT INTO `episodes` VALUES (10, 2, 5, '2011-08-01 19:58:58.000');
INSERT INTO `episodes` VALUES (11, 3, 1, '2012-06-17 19:59:10.000');
INSERT INTO `episodes` VALUES (12, 3, 2, '2012-06-30 19:59:10.000');
INSERT INTO `episodes` VALUES (13, 3, 3, '2012-07-12 19:59:10.000');
INSERT INTO `episodes` VALUES (14, 3, 4, '2012-07-30 19:59:10.000');
INSERT INTO `episodes` VALUES (15, 3, 5, '2012-07-12 19:59:10.000');
INSERT INTO `episodes` VALUES (16, 4, 1, '2013-06-01 19:59:32.000');
INSERT INTO `episodes` VALUES (17, 4, 2, '2013-06-07 19:59:32.000');
INSERT INTO `episodes` VALUES (18, 4, 3, '2013-06-14 19:59:32.000');
INSERT INTO `episodes` VALUES (19, 4, 4, '2013-06-21 19:59:32.000');
INSERT INTO `episodes` VALUES (20, 4, 5, '2013-06-30 19:59:32.000');
INSERT INTO `episodes` VALUES (21, 5, 1, '2014-06-01 20:00:06.000');
INSERT INTO `episodes` VALUES (22, 5, 2, '2014-06-07 20:00:06.000');
INSERT INTO `episodes` VALUES (23, 5, 3, '2014-06-14 20:00:06.000');
INSERT INTO `episodes` VALUES (24, 5, 4, '2014-06-21 20:00:06.000');
INSERT INTO `episodes` VALUES (25, 5, 5, '2014-06-30 20:00:06.000');
INSERT INTO `episodes` VALUES (26, 6, 1, '2018-01-01 20:00:19.000');
INSERT INTO `episodes` VALUES (27, 6, 2, '2018-02-01 20:00:19.000');
INSERT INTO `episodes` VALUES (28, 6, 3, '2018-03-01 20:00:19.000');
INSERT INTO `episodes` VALUES (29, 6, 4, '2018-04-01 20:00:19.000');
INSERT INTO `episodes` VALUES (30, 6, 5, '2018-05-01 20:00:19.000');

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'User1', '050000000');
INSERT INTO `users` VALUES (2, 'User2', '051111111');
INSERT INTO `users` VALUES (3, 'User3', '052222222');