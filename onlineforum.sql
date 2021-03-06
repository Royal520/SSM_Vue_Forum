/*
 Navicat Premium Data Transfer

 Source Server         : 3306
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : onlineforum

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 28/05/2021 09:47:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2006 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2005, 'root', 'root', '2021-04-21 11:31:18', '192.168.6.6');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `authorid` int(20) NULL DEFAULT NULL,
  `plateid` int(20) NULL DEFAULT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `likenumber` int(20) NULL DEFAULT NULL,
  `browse` int(20) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plateid_id`(`plateid`) USING BTREE,
  INDEX `authorid_id`(`authorid`) USING BTREE,
  CONSTRAINT `authorid_id` FOREIGN KEY (`authorid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plateid_id` FOREIGN KEY (`plateid`) REFERENCES `plate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 1, '<p><b>SSM??????</b></p><p><b><br/></b></p><p><b>spring,spring mvc mybatis</b></p><p><b><br/></b></p><p><img src=\"https://forum.javcdn.net/i.imgur.com/IkYgSQY.jpg\" style=\"max-width:100%;\" width=\"50%\"/><br/></p>', '2021-04-28 13:35:33', 3, 5, 'C???????????????', '[{??????}???{C??????}]');
INSERT INTO `article` VALUES (2, 1, 1, 'cnm aflsdkjf;laksjdlfk;jasd', '2021-04-27 11:45:43', 2, 5, 'C???????????????', '[{?????????}]');
INSERT INTO `article` VALUES (8, 1, 14, '<p><h1 id=\"z802d\">????????????</h1>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>?????????????????????Python??????????????????????????????????????????????????????<br/><br/><h2 id=\"y69sv\">??????????????????</h2><u style=\"background-color: rgb(70, 172, 200);\">??????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>?????????????????????????????????????????????<br/>??????????????????????????????<br/>??????????????????????????????????????????????????????????????????????????????<br/>??????????????????????????????????????????<br/>??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>????????????????????????????????????????????????????????????grab?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>??????????????????????????????????????????????????????Python???????????????????????????????????????????????????????????????????????????????????????</u><br/><br/><h2 id=\"yxr6n\">??????????????????</h2>???????????????????????????imbox??????????????????????????????<br/><br/><code>pip install imbox</code><br/><br/></p>', '2021-04-28 21:44:04', NULL, NULL, 'Python???????????????????????????????????????', '????????????,Python');
INSERT INTO `article` VALUES (9, 1, 4, '<p>asdf asd</p><p><u>asdhfalksjdflk</u></p><p><u>aj;sdklfjalsd&nbsp;</u></p><p><u>asdfa s</u></p>', '2021-04-28 22:03:14', NULL, NULL, 'java', 'java');
INSERT INTO `article` VALUES (10, 1, 14, '<p>Python???????????????????????????????????? [PC?????????]<br/>??????????????????<br/>?????????????????????Python3.6???????????????pycharm???????????????QT Designer???Navicat??????????????????????????????MySQL?????????????????????????????????????????????OpenCV???<br/><br/>?????????????????????????????????<br/><br/>--------------------------------------------------------------------<br/>?????????????????????????????????<br/>1?????????????????????????????????????????????<br/><br/>?????????????????????<br/>1??????????????????????????????8????????????????????????<br/>2????????????????????????????????????/??????/???????????????<br/>3??????????????????<br/>      2.1 ???????????????????????????????????????/??????/??????/????????????<br/>      2.2 ????????????????????????????????????/??????/???-??????????????????6??????<br/>4??????????????????<br/>      3.1 ??????????????????????????????<br/>      3.2 ?????????????????????\"????????????\"??????????????????<br/>5???\"??????\"?????????<br/>      5.1 ????????????/??????/??????????????????????????????????????????????????????????????????<br/>      5.1 ??????????????????????????????????????????????????????????????????????????????????????????<br/>      5.2 ????????????????????????????????????????????????<br/>      5.2 ??????Lcd/???????????????????????????/?????????/????????????????????????<br/>      5.3 ??????????????????????????????????????????????????????<br/>      5.4 ???????????????????????????????????????????????????<br/>6????????????????????????<br/>      6.1 ???????????????????????????????????????????????????<br/>      6.2 ?????????????????????????????????????????????<br/>      6.3 ????????????:---&gt;?????????????????????????????????????????????<br/><br/>?????????????????????<br/>1???????????????????????????????????????????????????/??????????????????<br/>     1.1 ??????????????????2?????????-????????????-???????????????<br/>     1.2 ??????/?????????????????????-2?????????-??????-???????????????<br/>2???Lcd?????????\"??????/??????/??????\"?????????<br/><br/>?????????????????????<br/>1????????????????????????<br/>       1.1 Qlabel????????????????????????<br/>       1.2 ????????????---&gt;???????????????????????????---&gt;???15?????????????????????????????????---&gt;????????????????????????---&gt;?????????????????????????????????---&gt;??????????????????????????????/????????????/LCD??????---&gt;???????????????<br/>       1.3 ????????????????????????---&gt;??????\"??????????????????\"????????????????????????????????????????????????????????????????????????---???????????????????????????-???0????????????-???1????????????-???2????????????-???3??????<br/>2????????????????????????<br/>       1.1 Qlabel????????????????????????<br/>       1.2 ????????????---&gt;???????????????????????????---&gt;???15?????????????????????????????????---&gt;????????????????????????---&gt;?????????????????????????????????---&gt;??????????????????????????????/????????????/LCD??????---&gt;???????????????<br/>       1.3 ????????????????????????---&gt;??????\"??????????????????\"????????????????????????????????????????????????????????????????????????---???????????????????????????-???0????????????-???1????????????-???2?????????-???3??????<br/>3????????????/?????????---&gt;??????????????????/??????????????????<br/>4?????????????????????---&gt;???????????????????????????<br/><br/>??????????????????????????????????????????????????????????????????QDialog??????<br/>1??????????????????????????????<br/>2????????????????????????????????????????????????<br/>3????????????<br/>     3.1 ??????????????????????????????????????????????????????????????????<br/>     3.2 ???????????????????????????????????????????????????<br/>4????????????????????????????????????????????????<br/><br/><br/>--------------------------------------------------------------------<br/>??????????????????????????????----&gt;(????????????\\????????????)<br/>1??????????????????????????????????????????????????????????????????????????????<br/>2???????????????????????????????????????????????????????????????????????????????????????<br/>3???????????????????????????????????????????????????????????????????????????<br/><br/>?????????????????????<br/>1?????????????????????????????????????????????<br/>2??????????????????????????????6-10???????????????????????????????????????????????????<br/>3?????????????????????<br/>     3.1 ??????????????????<br/>     3.2 ???????????????????????????????????????????????????????????????????????????<br/>     3.3 ??????.pkl??????????????????????????????????????????<br/>     3.4 ???????????????????????????????????????????????????????????????<br/>4??????????????????<br/>      4.1 ??????????????????????????????????????????????????????<br/>      4.2 ???????????????????????????????????????????????????????????????????????????????????????<br/>      4.3 ??????.pkl??????????????????????????????????????????????????????<br/>      4.4???????????????????????????????????????????????????????????????<br/>5??????????????????<br/>      4.1???????????????????????????????????????????????????????????????<br/>      4.2  ????????????????????????????????????????????? <br/>6?????????????????????---&gt;????????????????????????<br/>7??????????????????<br/>     7.1 ???????????????????????????????????????????????????<br/>     7.2 ?????????????????????????????????????????????<br/>           7.2.1 ?????????8???????????????<br/>                   A. ?????????????????????????????????????????????????????????????????????<br/>	      a. ????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/>	      b. ?????????????????????????????????????????????????????????<br/>           7.2.2 ???????????????????????????????????????????????????????????????<br/><br/>?????????????????????<br/>1?????????ID???????????????????????????<br/>2??????????????????<br/>     2.1 ???????????????6???10????????????????????????????????????<br/>     2.2 ?????????????????????????????????????????????????????????<br/>3??????????????????<br/>     3.1 ?????????????????????????????????????????????????????????<br/>     3.2 ???????????????????????????????????????????????????????????????????????????????????????????????????<br/>           3.2.1 ????????????6???10??????<br/>           3.2.2 ???????????????????????????<br/>4?????????????????????????????????<br/>5????????????????????????????????????????????????????????????????????????????????????<br/>6??????????????????/???????????????????????????<br/>7???????????????????????????????????????????????????????????????<br/>8??????????????????<br/>     8.1 ???????????????ID??????8???????????????????????????<br/>     8.2 ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/>     8.3 ?????????????????????????????????????????????????????????????????????????????????<br/>     8.4 ???????????????????????????????????????????????????????????????????????????????????????<br/><br/>--------------------------------------------------------------------<br/>???????????????????????????----&gt;(????????????\\????????????\\????????????)<br/>1????????????????????????????????????????????????<br/>2???????????????????????????????????????<br/><br/>???????????????????????????????????????????????????<br/>1?????????????????????????????????????????????????????????????????????<br/>2?????????????????????????????????????????????2????????????+?????????4?????????<br/>3??????????????????????????????8???????????????<br/>4????????????????????????????????????3?????????<br/>5?????????ID-Num?????????????????????<br/>     5.1 ????????????ID??????????????????????????????8???????????????????????????????????????<br/>     5.2 ?????????ID-Num????????????????????????????????????????????????????????????????????????<br/>6????????????????????????????????????????????????????????????20\\15\\10????????????<br/>7????????????????????????????????????????????????????????????5\\0????????????<br/>8?????????????????????<br/>     8.1 ??????????????????????????????????????????lessontable?????????????????????????????????????????????????????????<br/>     8.2 ?????????????????????????????????????????????????????????????????????????????????????????????????????????<br/>9???????????????????????????????????????<br/>     9.1 ???????????????????????????<br/>     9.2 ???????????????????????????????????????????????????????????????????????????<br/>                                  ???Id????????????????????????????????????????????????????????????<br/>     9.3 ????????????????????????????????????????????????????????????<br/>     9.4 ?????????????????????????????????????????????????????????????????????<br/>     9.5 ???????????????????????????????????????????????????Excel?????????Excel?????????---&gt;???classtable??????<br/>     9.6 ????????????????????????????????????????????????????????????????????????<br/>     ????????????????????????????????????????????????????????????????????????<br/><br/>???????????????????????????????????????????????????<br/>1????????????????????????????????????/??????/?????????<br/>2??????????????????????????????8???????????????<br/>3??????????????????????????????????????????????????????????????????????????????????????????<br/>4??????????????????????????????????????????????????????????????????????????????????????????<br/>5???????????????????????????????????????????????????/??????/??????/??????/??????/??????/????????????<br/>6?????????????????????????????????????????????????????????????????????????????????????????????<br/>     6.1 ??????????????????????????????????????????lessontable?????????????????????????????????????????????????????????<br/>7???????????????????????????????????????<br/>      7.1 ????????????????????????<br/>      7.2 ?????????????????????????????????????????????????????????????????????????????????????????????<br/>                                   ?????????????????????????????????????????????????????????<br/>      7.3 ????????????????????????????????????????????????????????????????????????????????????<br/>      7.3 ?????????????????????????????????????????????????????????????????????<br/>      7.4 ???????????????????????????????????????????????????Excel?????????Excel?????????---&gt;???lessontable??????<br/>      7.5 ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>???????????????????????????????????????????????????<br/>1??????????????????-????????????<br/>       1.1 ???????????????8???????????????<br/>       1.2 ??????????????????????????????????????????????????????<br/>2??????????????????-??????????????????????????????/??????/?????????12??????<br/>3??????????????????-????????????<br/>       3.1 ???????????????2000/1/1???????????????????????????2000/1/1???????????????<br/>4??????????????????????????????????????????????????????????????????????????????????????????<br/>5?????????????????????<br/>     5.1 ?????????????????????QQ???????????????????????????SMTP???????????????<br/>     5.2 ??????????????????????????????TXT????????????????????????-16??????????????????<br/>     5.3 ???????????????\"\" ?????????????????????????????????./autoLoginFile??????????????????QMailSMTP.txt?????????<br/>     5.4 ????????????????????????????????????????????????????????????????????????QMailSMTP.pkl??????????????????????????????QMailSMTP.txt????????????<br/><br/>--------------------------------------------------------------------<br/>????????????????????????----&gt;(????????????\\????????????\\????????????)<br/>1?????????????????????????????????????????????????????????????????????????????????<br/>2???????????????????????????????????????<br/><br/>???????????????????????????????????????????????????<br/>1????????????????????????????????????????????????????????????????????????<br/>2????????????????????????????????????????????????????????????????????????<br/>3?????????ID?????????????????????????????????????????????????????????<br/>4??????????????????<br/>     4.1 ??????1???????????????????????????????????????????????????????????????<br/>     4.2 ??????2???????????????????????????<br/>     4.3 ????????????????????????????????????????????????????????????6-10??????????????????????????????????????????<br/>     4.4 ???????????????????????????????????????????????????????????????????????????<br/>     4.5 ??????1|2???????????????????????????????????????????????????????????????<br/>5??????????????????????????????????????????????????????????????????????????????<br/>     5.1 ????????????????????????????????????????????????<br/>     5.2 ???????????????????????????????????????<br/>6????????????????????????<br/>      6.1 ???????????????????????????????????????30?????????????????????????????????<br/>      6.2 ????????????????????????????????????????????????????????????????????????checked??????????????????<br/>      6.3 ?????????????????????????????????????????????????????????<br/>8??????????????????<br/>      8.1 ???????????????????????????????????????????????????????????????<br/>      8.2 ??????????????????????????????????????????<br/>      8.3 ???????????????????????????????????????QLabel?????????<br/><br/>???????????????????????????????????????????????????<br/>1?????????????????????????????????????????????????????????<br/>2??????????????????<br/>      2.1 ???????????????????????????????????????????????????????????????????????????????????????<br/>                                   ?????????????????????????????????????????????????????????<br/>      2.2 ???????????????????????????lessontable???????????????      <br/>      2.3 ?????????????????????????????????Excel???Excel?????????---&gt;???????????????_lessontable??????<br/>3??????????????????????????????????????????<br/><br/>?????????????????????????????????????????????<br/>1?????????????????????????????????????????????????????????<br/>2???LCD???????????????????????????????????????????????????????????????????????????????????????<br/>3????????????????????????????????????Excel???Excel?????????---&gt;???????????????__signdata??????<br/>3????????????????????????????????????<br/><br/></p>', '2021-05-04 01:51:28', NULL, NULL, '???Python???????????????????????????????????? [PC?????????]', '????????????,OpenCV');

-- ----------------------------
-- Table structure for browse
-- ----------------------------
DROP TABLE IF EXISTS `browse`;
CREATE TABLE `browse`  (
  `userid` int(20) NOT NULL,
  `articleid` int(20) NOT NULL,
  `like` int(1) NOT NULL,
  `collect` int(1) NOT NULL,
  PRIMARY KEY (`articleid`, `userid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `articleid` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE RESTRICT,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of browse
-- ----------------------------
INSERT INTO `browse` VALUES (1, 1, 1, 1);
INSERT INTO `browse` VALUES (2, 1, 1, 0);
INSERT INTO `browse` VALUES (3, 1, 0, 1);
INSERT INTO `browse` VALUES (4, 1, 1, 1);
INSERT INTO `browse` VALUES (1, 2, 1, 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `articleid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `commentid` int(20) NOT NULL AUTO_INCREMENT,
  `fatherid` int(20) NOT NULL,
  `replyid` int(20) UNSIGNED NULL DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `likenumber` int(10) UNSIGNED NULL DEFAULT NULL,
  `sort` int(20) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commentid`) USING BTREE,
  INDEX `articleid_id`(`articleid`) USING BTREE,
  INDEX `userid_id`(`userid`) USING BTREE,
  CONSTRAINT `articleid_id` FOREIGN KEY (`articleid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid_id` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 2, 0, 0, '2021-05-07 21:35:20', 0, NULL, '???????????????');
INSERT INTO `comment` VALUES (1, 2, 3, 2, 0, '2021-05-07 22:44:50', 2, NULL, '??????');
INSERT INTO `comment` VALUES (1, 3, 4, 2, 3, '2021-05-07 21:33:48', 0, NULL, '??????');

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `bloggerid` int(20) NOT NULL DEFAULT 0,
  `fansid` int(20) NOT NULL DEFAULT 0,
  `status` int(11) NULL DEFAULT NULL,
  `sort` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`bloggerid`, `fansid`) USING BTREE,
  INDEX `fansid`(`fansid`) USING BTREE,
  CONSTRAINT `focus_ibfk_1` FOREIGN KEY (`bloggerid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `focus_ibfk_2` FOREIGN KEY (`fansid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES (1, 2, 1, NULL);
INSERT INTO `focus` VALUES (1, 3, 1, NULL);
INSERT INTO `focus` VALUES (1, 5, 0, NULL);

-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(20) NULL DEFAULT NULL,
  `statu` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plate
-- ----------------------------
INSERT INTO `plate` VALUES (1, 'C??????', '????????????', NULL, 0);
INSERT INTO `plate` VALUES (2, 'C++', '???????????????C', 4, 0);
INSERT INTO `plate` VALUES (3, 'C#', '?????????C', 4, 0);
INSERT INTO `plate` VALUES (4, 'Java', '???????????????', NULL, 0);
INSERT INTO `plate` VALUES (5, 'JavaEE', NULL, NULL, 0);
INSERT INTO `plate` VALUES (6, 'ASP.Net', NULL, NULL, 0);
INSERT INTO `plate` VALUES (7, '????????????', NULL, NULL, 0);
INSERT INTO `plate` VALUES (8, 'MySql', NULL, NULL, 0);
INSERT INTO `plate` VALUES (9, 'Spring', NULL, NULL, -1);
INSERT INTO `plate` VALUES (13, 'Mybatis', NULL, 4, 0);
INSERT INTO `plate` VALUES (14, 'Python', NULL, 2, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `levelid` int(11) NULL DEFAULT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stateid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `stateid`(`stateid`) USING BTREE,
  INDEX `levelid`(`levelid`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`stateid`) REFERENCES `userstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`levelid`) REFERENCES `userlevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Royal', '12345678', '', '', 8, NULL, '2021-05-28 09:47:08', 1);
INSERT INTO `user` VALUES (2, '?????????', '200702', NULL, NULL, 1, NULL, '2021-04-21 11:42:24', 1);
INSERT INTO `user` VALUES (3, '??????', '200703', NULL, NULL, 2, NULL, '2021-04-21 11:42:53', 0);
INSERT INTO `user` VALUES (4, '?????????', '200703Lsk', NULL, NULL, 1, NULL, '2021-04-26 14:08:20', 1);
INSERT INTO `user` VALUES (5, '?????????', '200705', NULL, NULL, 1, NULL, '2021-04-26 14:08:34', 1);
INSERT INTO `user` VALUES (8, 'Royall', '1314521Gl@', NULL, NULL, 1, NULL, '2021-04-24 13:07:39', 1);
INSERT INTO `user` VALUES (9, 'Royalll', '1314521Gl@', NULL, NULL, 1, NULL, '2021-04-25 12:23:43', 1);

-- ----------------------------
-- Table structure for userlevel
-- ----------------------------
DROP TABLE IF EXISTS `userlevel`;
CREATE TABLE `userlevel`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userlevel
-- ----------------------------
INSERT INTO `userlevel` VALUES (1, '?????????');
INSERT INTO `userlevel` VALUES (2, '?????????');
INSERT INTO `userlevel` VALUES (3, '?????????');
INSERT INTO `userlevel` VALUES (4, '?????????');
INSERT INTO `userlevel` VALUES (5, '?????????');
INSERT INTO `userlevel` VALUES (6, '?????????');
INSERT INTO `userlevel` VALUES (7, '?????????');
INSERT INTO `userlevel` VALUES (8, '??????');

-- ----------------------------
-- Table structure for userstatus
-- ----------------------------
DROP TABLE IF EXISTS `userstatus`;
CREATE TABLE `userstatus`  (
  `id` int(20) NOT NULL,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userstatus
-- ----------------------------
INSERT INTO `userstatus` VALUES (0, '????????????');
INSERT INTO `userstatus` VALUES (1, '????????????');

SET FOREIGN_KEY_CHECKS = 1;
