/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : sharemusic

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 07/01/2021 11:03:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` int NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `commentator`(`commentator`) USING BTREE,
  CONSTRAINT `commentator` FOREIGN KEY (`commentator`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `music` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '太好听了！', 'cjt', 3, '2021-01-05 16:17:27');
INSERT INTO `comment` VALUES (2, '很喜欢的歌', 'chen', 3, '2021-01-05 19:29:04');
INSERT INTO `comment` VALUES (3, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', '取了一个十分长的名字', 3, '2020-10-14 20:11:10');
INSERT INTO `comment` VALUES (4, '还不错', '陈佳涛', 3, '2020-12-03 20:30:10');
INSERT INTO `comment` VALUES (5, '有木有其他歌推荐', 'cjt', 3, '2021-01-05 21:56:46');
INSERT INTO `comment` VALUES (6, '云烟成雨也很好听', 'chen', 3, '2021-01-05 21:57:20');
INSERT INTO `comment` VALUES (7, '边听边写作业，太带感了', '取了一个十分长的名字', 3, '2021-01-03 21:58:15');
INSERT INTO `comment` VALUES (8, '针不戳', '陈佳涛', 3, '2021-01-05 22:24:24');
INSERT INTO `comment` VALUES (9, '刷评论', 'cjt', 3, '2021-01-05 22:27:25');
INSERT INTO `comment` VALUES (10, '刷爆', 'cjt', 2, '2021-01-01 22:29:34');
INSERT INTO `comment` VALUES (11, '厉害', 'chen', 2, '2021-01-03 22:29:59');
INSERT INTO `comment` VALUES (12, '很不错', '取了一个十分长的名字', 2, '2021-01-04 22:30:43');
INSERT INTO `comment` VALUES (13, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', 'chen', 2, '2021-01-04 22:36:57');
INSERT INTO `comment` VALUES (14, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', 'cjt', 2, '2021-01-05 22:37:24');
INSERT INTO `comment` VALUES (15, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', 'chen', 2, '2021-01-05 22:39:16');
INSERT INTO `comment` VALUES (16, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', 'cjt', 2, '2021-01-05 22:39:47');
INSERT INTO `comment` VALUES (17, '太棒了，超级喜欢的歌，听起来太有感觉了，听了很久了！', 'cjt', 2, '2021-01-05 22:40:31');
INSERT INTO `comment` VALUES (18, '挺好的', 'cjt', 5, '2021-01-05 23:31:58');
INSERT INTO `comment` VALUES (19, '真不错', 'cjt', 5, '2021-01-05 23:34:12');
INSERT INTO `comment` VALUES (20, '测试', 'cjt', 5, '2021-01-05 23:34:53');
INSERT INTO `comment` VALUES (21, '太好了', 'cjt', 5, '2021-01-05 23:35:33');
INSERT INTO `comment` VALUES (22, '完成', 'cjt', 5, '2021-01-05 23:36:46');
INSERT INTO `comment` VALUES (23, '留下脚印', 'cjt', 6, '2021-01-05 23:37:09');
INSERT INTO `comment` VALUES (24, '好听', 'cjt', 17, '2021-01-06 00:18:24');
INSERT INTO `comment` VALUES (25, '好', 'cjt', 3, '2021-01-06 01:04:50');
INSERT INTO `comment` VALUES (26, '不好', 'cjt', 3, '2021-01-06 01:05:12');
INSERT INTO `comment` VALUES (27, '真不错', 'cjt', 3, '2021-01-06 01:06:19');
INSERT INTO `comment` VALUES (28, '好', 'cjt', 3, '2021-01-06 01:07:30');
INSERT INTO `comment` VALUES (29, '好', 'cjt', 3, '2021-01-06 01:25:52');
INSERT INTO `comment` VALUES (30, '一般', 'cjt', 3, '2021-01-06 01:27:00');
INSERT INTO `comment` VALUES (31, '三分', 'cjt', 3, '2021-01-06 01:28:14');
INSERT INTO `comment` VALUES (32, '太好听了', 'cjt', 6, '2021-01-06 02:06:31');
INSERT INTO `comment` VALUES (33, '第二天了', 'cjt', 5, '2021-01-06 02:22:51');
INSERT INTO `comment` VALUES (34, '不好听', 'cjt', 3, '2021-01-06 08:01:12');
INSERT INTO `comment` VALUES (35, '听了很久', '陈', 6, '2021-01-06 08:33:10');
INSERT INTO `comment` VALUES (36, '不好听', '陈', 7, '2021-01-06 08:45:15');

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `singer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `playCount` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `type` (`typeName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES (1, '雪の華', '中岛美嘉', 'https://webfs.yun.kugou.com/202101051553/3c74184cf80db68805bd1b4aed52ed56/G125/M05/11/03/HYcBAFxRRdiAaFE5AFNheklYR8g119.mp3', '2021-01-07 00:00:00', '日本', 4);
INSERT INTO `music` VALUES (2, 'butterflies', 'nohidea', 'https://webfs.yun.kugou.com/202101051555/20602794a1877b9d722d4edb2f83155b/G111/M07/0C/17/D4cBAFmi-1OACruiABrhzmGrzbc706.mp3', '2021-01-14 00:00:00', '欧美', 2);
INSERT INTO `music` VALUES (3, '冬眠', '司南', 'https://webfs.yun.kugou.com/202101051552/e61683acca6e5468c2bccf7301ca1812/G173/M07/1F/08/TYcBAF2y052AJ8TSAEHU69hU-QU049.mp3', '2020-12-31 18:18:22', '华语', 22);
INSERT INTO `music` VALUES (4, 'Gee', '少女时代', 'https://webfs.yun.kugou.com/202101051554/87d861c23393f55305b9ef8507f94d30/part/0/961135/G202/M01/19/15/qpQEAF5VbTWAHBAlADFmXrcRcb8875.mp3', '2021-01-08 18:18:41', '韩国', 1);
INSERT INTO `music` VALUES (5, '大鱼', '周深', 'https://webfs.yun.kugou.com/202101051554/4485757f66a943282c9fb8e66a0e9728/G063/M08/05/11/H5QEAFc-bc6AfD3uAEycKVKAkaw783.mp3', '2020-12-31 20:00:26', '华语', 6);
INSERT INTO `music` VALUES (6, '云烟成雨', '房东的猫', 'https://webfs.yun.kugou.com/202101051558/b6b34d40be89a722f5f4b23c86d6e1a2/G109/M05/05/13/rQ0DAFnpY2SAAvIbADrNO6PRQ7A835.mp3', '2021-01-14 14:54:55', '华语', 8);
INSERT INTO `music` VALUES (7, '追光者', '岑宁儿', 'https://webfs.yun.kugou.com/202101051559/8da4dfe7af9ed040efcdff965d64f807/KGTX/CLTX001/e75c7ba9f396e61d2b8450a86bbaa27e.mp3', '2021-01-07 15:04:29', '华语', 4);
INSERT INTO `music` VALUES (8, '光年之外', 'G.E.M.邓紫棋', 'https://webfs.yun.kugou.com/202101051555/4f84bfa17d4e5c7028e80a8ca8f4369b/G079/M05/17/18/74YBAFhnqFuAbHr6ADmDwsWIOhE648.mp3', '2020-12-09 15:05:27', '华语', 4);
INSERT INTO `music` VALUES (9, 'Chain Reaction', '少女时代', 'https://webfs.yun.kugou.com/202101051557/88e94ecef8c99be292b2a46349b38b73/G206/M00/17/10/Dg4DAF5OlWGAeLTpAC3UPaelie0579.mp3', '2021-01-04 15:08:59', '韩国', 1);
INSERT INTO `music` VALUES (10, 'Holiday', '\r\n少女时代', 'https://webfs.yun.kugou.com/202101051557/e8a6e1569fab2a74c6fbd78d9563b22b/part/0/962376/G114/M02/17/15/UpQEAFmGcN-APisgADC9p5nUfYE574.mp3', '2020-11-18 15:09:35', '韩国', 4);
INSERT INTO `music` VALUES (11, '搁浅', '周杰伦', 'https://webfs.yun.kugou.com/202101051555/9c37c58945df0cbbd3bb7a4d3650a211/part/0/960739/G205/M01/0F/01/bYcBAF5wBwOAR9mRADqkKrbvPXg119.mp3', '2021-01-04 15:11:36', '华语', 1);
INSERT INTO `music` VALUES (12, '后来', '刘若英', 'https://webfs.yun.kugou.com/202101051558/eb92e33223106bbdc7d38a3761a3390c/G145/M05/1B/01/0Q0DAFwd73-AWud_AFN-3cy6si0576.mp3', '2020-11-04 15:13:55', '华语', 1);
INSERT INTO `music` VALUES (13, '小幸运', '田馥甄', 'https://webfs.yun.kugou.com/202101051557/db8307fe312759309f6096069b507f81/G131/M06/00/1D/Y5QEAFrHZ9yAZdb_AEDXW3yZBEo336.mp3', '2020-09-23 15:16:04', '华语', 1);
INSERT INTO `music` VALUES (14, '无人之岛', '任然', 'https://webfs.yun.kugou.com/202101051557/f1a0fdfff3bd7294b6b0905065eb923e/G107/M0B/02/11/S5QEAFmneO-AZi7GAEWooMaaGsw961.mp3', '2020-12-15 15:17:56', '华语', 1);
INSERT INTO `music` VALUES (15, '处处吻', '杨千嬅', 'https://webfs.yun.kugou.com/202101051600/5c056f335f5a98ff1fa3aae77c363576/part/0/960131/KGTX/CLTX001/efaabfcbbdfc21996a00f5fcd484969e.mp3', '2020-12-16 15:18:46', '华语', 2);
INSERT INTO `music` VALUES (16, '董小姐', '宋冬野', 'https://webfs.yun.kugou.com/202101051601/8278361b3b07d6cdc922d3a5aaf125b7/G202/M07/0F/1F/aocBAF5iS6KACWRGAEyBTpaf7qs946.mp3', '2020-11-03 15:22:17', '华语', 2);
INSERT INTO `music` VALUES (17, '安和桥', '宋冬野', 'https://webfs.yun.kugou.com/202101051600/a9eefb675bfc0df2f7e5f0142390d5a2/G202/M06/0C/10/Cg4DAF5trh6ALfzXAD1JyzTgRHo016.mp3', '2019-06-05 15:23:23', '华语', 3);
INSERT INTO `music` VALUES (18, '岁月神偷', '金玟岐', 'https://webfs.yun.kugou.com/202101051557/61333093ba1daf877e5af7977d55bf1b/G197/M03/19/01/BQ4DAF5PDPOAcK-EAChLgMDVxOg843.mp3', '2020-04-05 15:24:32', '华语', 2);
INSERT INTO `music` VALUES (19, '星月神话', '金莎', 'https://webfs.yun.kugou.com/202101051633/432ae485877a73de8bb4093a530cdea6/G200/M0B/1E/17/qJQEAF5lhj2ACyjgAB7A0ChJG2M382.mp3', '2020-11-19 15:27:37', '华语', 1);
INSERT INTO `music` VALUES (20, '再见', '张震岳', 'https://webfs.yun.kugou.com/202101051558/9b4479ecbdc5b46c55d6d6d458644d35/G198/M00/05/0D/Bg4DAF5mpN-AepcEACzl3zpLy-Q999.mp3', '2020-11-02 15:28:53', '华语', 0);
INSERT INTO `music` VALUES (21, '红尘客栈', '周杰伦', 'https://webfs.yun.kugou.com/202101051603/b7c6b89b49a13183538676d0f4e6c1b4/part/0/972182/G192/M0A/0A/01/YIcBAF5zQPaAXn0OAEMdfqb9VGU800.mp3', '2020-08-11 15:30:40', '华语', 0);
INSERT INTO `music` VALUES (22, '只要平凡', '张杰', 'https://webfs.yun.kugou.com/202101060600/db91cfebf5f6ce9b9cce34325021e3b3/KGTX/CLTX001/f468a1c551900996b5fa2daca27f5b74.mp3', '2019-05-05 15:47:02', '华语', 0);

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `musicid`(`mid`) USING BTREE,
  INDEX `username`(`userName`) USING BTREE,
  CONSTRAINT `musicid` FOREIGN KEY (`mid`) REFERENCES `music` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `username` FOREIGN KEY (`userName`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES (1, 3, 'cjt', 1);
INSERT INTO `point` VALUES (2, 6, 'cjt', 5);
INSERT INTO `point` VALUES (3, 5, 'cjt', 5);
INSERT INTO `point` VALUES (4, 6, '陈', 4);
INSERT INTO `point` VALUES (5, 7, '陈', 1);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeName`(`typeName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '华语');
INSERT INTO `type` VALUES (4, '日本');
INSERT INTO `type` VALUES (2, '欧美');
INSERT INTO `type` VALUES (3, '韩国');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('chen', '123');
INSERT INTO `user` VALUES ('cjt', '123');
INSERT INTO `user` VALUES ('取了一个十分长的名字', '123');
INSERT INTO `user` VALUES ('耀华', '123');
INSERT INTO `user` VALUES ('陈', '123');
INSERT INTO `user` VALUES ('陈佳涛', '123');

SET FOREIGN_KEY_CHECKS = 1;
