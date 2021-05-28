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
INSERT INTO `article` VALUES (1, 1, 1, '<p><b>SSM框架</b></p><p><b><br/></b></p><p><b>spring,spring mvc mybatis</b></p><p><b><br/></b></p><p><img src=\"https://forum.javcdn.net/i.imgur.com/IkYgSQY.jpg\" style=\"max-width:100%;\" width=\"50%\"/><br/></p>', '2021-04-28 13:35:33', 3, 5, 'C语言的输出', '[{输出}，{C语言}]');
INSERT INTO `article` VALUES (2, 1, 1, 'cnm aflsdkjf;laksjdlfk;jasd', '2021-04-27 11:45:43', 2, 5, 'C语言结构体', '[{结构体}]');
INSERT INTO `article` VALUES (8, 1, 14, '<p><h1 id=\"z802d\">一、前言</h1>很多时候，我们都有远程控制电脑的需求。比如正在下载某样东西，需要让电脑在下载完后关机。或者你需要监控一个程序的运行状况等。<br/><br/>今天我们就来用Python实现一个远程监控并控制电脑的小程序。<br/><br/><h2 id=\"y69sv\">二、实现原理</h2><u style=\"background-color: rgb(70, 172, 200);\">听起来远程控制电脑好像很高级的样子，但是实现起来其实非常简单。实现原理如下：<br/><br/>运行程序，让程序不停地读取邮件<br/>用手机给电脑发送邮件<br/>判断是否读取到指定主题的邮件，如果有，则获取邮件内容<br/>根据邮件内容，执行预设的函数<br/>与其说是学习如何远程控制电脑，还不如说是学习如何读取邮件。当然，上面的的流程只实现了远程控制电脑，而没实现对电脑的监控。而监控的操作可以以截图的方式来进行。<br/><br/>我们可以预设一个指令，当读取到邮件内容为grab时，我们就发送电脑截图。如何将电脑截图发送给手机邮箱，这样就达到了监控的效果。<br/><br/>关于如何发送邮件可以参考博客：如何用Python发送邮件？。这里就不再详细说了。下面我们看看如何读取邮件。</u><br/><br/><h2 id=\"yxr6n\">三、读取邮件</h2>读取邮件需要使用到imbox模块，安装语句如下：<br/><br/><code>pip install imbox</code><br/><br/></p>', '2021-04-28 21:44:04', NULL, NULL, 'Python实现用手机监控远程控制电脑', '远程控制,Python');
INSERT INTO `article` VALUES (9, 1, 4, '<p>asdf asd</p><p><u>asdhfalksjdflk</u></p><p><u>aj;sdklfjalsd&nbsp;</u></p><p><u>asdfa s</u></p>', '2021-04-28 22:03:14', NULL, NULL, 'java', 'java');
INSERT INTO `article` VALUES (10, 1, 14, '<p>Python】基于人脸识别的考勤系统 [PC端部分]<br/>一、项目简介<br/>本项目编程语言Python3.6，编程工具pycharm，其他工具QT Designer、Navicat，表单信息保存在本地MySQL数据库中，人脸识别算法主要用的OpenCV。<br/><br/>目前，已实现以下功能：<br/><br/>--------------------------------------------------------------------<br/>一、【管理系统主界面】<br/>1、管理系统主界面实现相对布局。<br/><br/>（一）输入部分<br/>1、考勤班级：限制输入8位考勤班级编号。<br/>2、考勤课程：限制输入中文/数字/大写字母。<br/>3、考勤地点：<br/>      2.1 教学楼：限制四选一：“仁智/同和/浦江/厚学”。<br/>      2.2 教室号：限制输入大写字母/数字/“-”，最大长度6位。<br/>4、禁止请假：<br/>      3.1 单选框，默认不选中。<br/>      3.2 选中且确定后，\"个人请假\"按钮不开放。<br/>5、\"确定\"按钮：<br/>      5.1 确认班级/课程/地点的输入合法性。不合法，则清空输入框内容。<br/>      5.1 确认该班级当天是否有该课程的教学计划。不存在，则弹出提示框。<br/>      5.2 检测“禁止请假”复选框选中状态。<br/>      5.2 刷新Lcd/“已签到人员”表格/“迟到/请假人员”表格。<br/>      5.3 锁定输入框和复选框，解锁前禁止编辑。<br/>      5.4 开放“考勤签到”“个人请假”功能。<br/>6、“解锁”按钮：<br/>      6.1 “确认”前，“解锁”按钮无法点击。<br/>      6.2 “确认”后，“解锁”按钮开放。<br/>      6.3 点击事件:---&gt;跳转至“管理员权限验证页面”。<br/><br/>（二）显示部分<br/>1、表格控件：“已签到人员”和“迟到/请假人员”。<br/>     1.1 已签到人员：2位学号-中文姓名-签到时间。<br/>     1.2 迟到/请假人员：状态-2位学号-姓名-签到时间。<br/>2、Lcd控件：\"应到/已到/请假\"人数。<br/><br/>（三）按钮部分<br/>1、“考勤签到”：<br/>       1.1 Qlabel显示摄像头视频。<br/>       1.2 人脸检测---&gt;框出人脸，打印身份---&gt;每15帧人脸检测图像保存一次---&gt;三次检测结果一致---&gt;二次验证，用户本人确认---&gt;通过后刷新数据库表单/界面表格/LCD控件---&gt;关闭窗口。<br/>       1.3 数据库：录入信息---&gt;执行\"签到状态判别\"函数：判别当天该课程所有的签到时间对应的签到状态---（签到状态：未验证-“0”，成功-“1”，迟到-“2”，请假-“3”）<br/>2、“个人请假”：<br/>       1.1 Qlabel显示摄像头视频。<br/>       1.2 人脸检测---&gt;框出人脸，打印身份---&gt;每15帧人脸检测图像保存一次---&gt;三次检测结果一致---&gt;二次验证，用户本人确认---&gt;通过后刷新数据库表单/界面表格/LCD控件---&gt;关闭窗口。<br/>       1.3 数据库：录入信息---&gt;执行\"签到状态判别\"函数：判别当天该课程所有的签到时间对应的签到状态---（签到状态：未验证-“0”，成功-“1”，迟到-“2”请假-“3”）<br/>3、“登录/注册”---&gt;跳转至“登录/注册”页面。<br/>4、“退出程序”---&gt;关闭整个系统页面。<br/><br/>（四）【管理员权限验证页面】【一级子页面】【QDialog类】<br/>1、页面采用绝对布局。<br/>2、账号、密码输入框：输入无限制。<br/>3、登录：<br/>     3.1 验证通过，解锁成功，关闭本窗口，返回主界面。<br/>     3.2 验证失败，关闭本窗口，返回主界面。<br/>4、退出：关闭本窗口，返回主界面。<br/><br/><br/>--------------------------------------------------------------------<br/>二、【登录注册界面】----&gt;(登录页面\\注册页面)<br/>1、登录注册页面均采用绝对布局，禁止用户放缩界面大小。<br/>2、登录界面初次加载时，加载上次登录时的选框状态和用户信息。<br/>3、登录注册页面输入框均设置提示信息，优化用户体验。<br/><br/>（一）登录界面<br/>1、用户名：限制输入数字和英文。<br/>2、密码：限制输入长度6-10位，首字母大写，密码组成字母数字。<br/>3、记住用户名：<br/>     3.1 可单独勾选。<br/>     3.2 勾选时，下次加载登录页面时自动加载上次登录用户名。<br/>     3.3 本地.pkl文件保存上次登录“用户名”。<br/>     3.4 “登录”按钮被点击时，保存选项框选中状态。<br/>4、记住密码：<br/>      4.1 勾选时，“记住用户名”也被标记勾选。<br/>      4.2 勾选时，下次加载登录页面时自动加载上次登录的用户名和密码。<br/>      4.3 本地.pkl文件保存上次登录的“用户名和密码”。<br/>      4.4“登录”按钮被点击时，保存选项框选中状态。<br/>5、自动登录：<br/>      4.1“登录”按钮被点击时，保存选项框选中状态。<br/>      4.2  弹出登录页面时，自动加载信息。 <br/>6、“注册”按钮---&gt;跳转至注册界面。<br/>7、登录按钮：<br/>     7.1 验证管理员身份，跳转至管理员界面。<br/>     7.2 验证用户身份，跳转至用户界面。<br/>           7.2.1 检索前8位班级编号<br/>                   A. 未检索到该“班级编号”表单，检索班级管理表单。<br/>	      a. 班级管理表单中存在该班级词条，则新建该“班级编号”的表单，提示前往注册。<br/>	      b. 班级管理表单中不存在，提示联系管理员。<br/>           7.2.2 存在该班级编号的表单，验证用户设置的密码。<br/><br/>（二）注册界面<br/>1、用户ID：输入限制为数字。<br/>2、用户密码：<br/>     2.1 输入限制为6到10位数字字母，首字母大写。<br/>     2.2 首次输入明文显示，焦点转移后掩码显示。<br/>3、重复密码：<br/>     3.1 首次输入明文显示，焦点转移后掩码显示。<br/>     3.2 焦点转移后验证两次输入密码的合法性，不合法则清空密码输入框内内容。<br/>           3.2.1 密码长度6到10位。<br/>           3.2.2 两次密码的一致性。<br/>4、姓名：限制输入中文。<br/>5、英文名：限制输入英文，用于人脸识别打印出身份判定结果。<br/>6、性别：“男/女”二选一选项框。<br/>7、以上表单均填入信息后，开放“注册”按钮。<br/>8、注册功能：<br/>     8.1 检索“用户ID”前8位班级编号的表单。<br/>     8.2 不存在，则检索班级管理表单，存在词条，则新建该“班级编号”表单（某班级的首位注册用户）。<br/>     8.3 存在，则验证“班级管理”内设定的该班级用户的信息格式。<br/>     8.4 格式合法，则用户信息录入该“班级编号”表单，提示注册成功。<br/><br/>--------------------------------------------------------------------<br/>三、【管理员界面】----&gt;(班级管理\\课表管理\\统计分析)<br/>1、目前仅设置单一管理员权限账号。<br/>2、全页面实现支持相对布局。<br/><br/>（一）班级管理页面：【一级子页面】<br/>1、表单未全部填写时，“保存设置”按钮无法点击。<br/>2、所带班级：限制输入专业简称（2位中文）+数字（4位）。<br/>3、班级编号：限制输入8位纯数字。<br/>4、班级人数：限制输入长度3位数。<br/>5、用户ID-Num：限制二选一。<br/>     5.1 “仅固定ID”：用户注册时限制前8位班级编号，尾号数字不限。<br/>     5.2 “固定ID-Num”：用户注册时限制尾号数字小于等于“班级人数”。<br/>6、签到开始时间：开放三选一设置，上课“前20\\15\\10分钟”。<br/>7、签到结束时间：开放二选一设置，下课“前5\\0分钟”。<br/>8、保存设置时：<br/>     8.1 点击后，检索数据库是否存在‘lessontable’，不存在，则新建该表单并完成初始化。<br/>     8.2 检查是否存在同编号班级数据，如无（有）班级数据，新建（覆盖）表单数据。<br/>9、查看班级：【二级子页面】<br/>     9.1 页面支持相对布局。<br/>     9.2 表格显示字段：“班级编号”“班级名称”“班级人数”<br/>                                  “Id格式”“签到开始时间”“签到结束时间”。<br/>     9.3 表格数据以“班级编号”为主键，升序排列。<br/>     9.4 页面弹出时刷新一次，支持“手动刷新”表格数据。<br/>     9.5 支持班级管理表单“导出表格”至本地Excel文件，Excel文件名---&gt;“classtable”。<br/>     9.6 支持以“班级编号”为索引，删除表格中的整行数据。<br/>     【注】以上功能数据处理均基于数据库表单操作实现。<br/><br/>（二）课表管理页面：【一级子页面】<br/>1、课程名称限制输入：中文/英文/数字。<br/>2、班级编号限制输入：8位纯数字。<br/>3、开课结课时间限制：开课时间不得晚于结课时间。日历弹出显示。<br/>4、上课下课时间限制：上课时间不得早于下课时间。日历弹出显示。<br/>5、课程设置周课表：开放多选框“周一/周二/周三/周四/周五/周六/周日”。<br/>6、输入框、复选框未全部有数据填写时，“保存设置”按钮无法点击。<br/>     6.1 点击后，检索数据库是否存在‘lessontable’，不存在，则新建该表单并完成初始化。<br/>7、查看课表：【二级子页面】<br/>      7.1 页面支持相对布局<br/>      7.2 表格显示字段：“班级编号”“课程名称”“开课日期”“结课日期”<br/>                                   “一周课表”“上课时间”“下课日期”。<br/>      7.3 表格数据以“班级编号”“课程名称”为联合主键，升序排列。<br/>      7.3 页面弹出时刷新一次，支持“手动刷新”表格数据。<br/>      7.4 支持班级管理表单“导出表格”至本地Excel文件，Excel文件名---&gt;“lessontable”。<br/>      7.5 支持以“‘班级编号课程名称’”为联合主键，删除表格中的整行数据，并同步修改到数据库。<br/><br/>（三）统计分析页面：【一级子页面】<br/>1、“查询班级-必填”：<br/>       1.1 限制输入：8位出数字。<br/>       1.2 有输入时，开放“查询”“刷新”按钮。<br/>2、“查询课程-选填”限制输入：中文/英文/数字，12位。<br/>3、“查询日期-选填”：<br/>       3.1 初始显示“2000/1/1”，输入日期不为“2000/1/1”时有效。<br/>4、邮箱地址：正则表达式匹配，能覆盖大部分邮箱地址格式的检测。<br/>5、发送至邮箱：<br/>     5.1 发件邮箱默认为QQ邮箱，需要邮箱开启SMTP服务设置。<br/>     5.2 支持自动导入用户本地TXT文件保存的“账号-16位授权码”。<br/>     5.3 “发件邮箱\"\" 授权码”各单行保存到“./autoLoginFile”文件下的“QMailSMTP.txt”内。<br/>     5.4 单击执行一次“发送至邮箱”后，上述文件夹内生成“QMailSMTP.pkl”文件后，即可删除“QMailSMTP.txt”文件。<br/><br/>--------------------------------------------------------------------<br/>四、【用户界面】----&gt;(个人信息\\班级课表\\签到日志)<br/>1、实现用户身份判别，根据登录用户加载不同表单数据功能。<br/>2、全页面实现支持相对布局。<br/><br/>（一）个人信息页面：【一级子页面】<br/>1、班级编号：弹出页面时，自动加载，用户不可修改。<br/>2、班级人数：弹出页面时，自动加载，用户不可修改。<br/>3、个人ID：弹出页面时，自动加载，用户不可修改。<br/>4、重置密码：<br/>     4.1 密码1：输入时明文显示，鼠标焦点转移后掩码显示。<br/>     4.2 密码2：输入时掩码显示。<br/>     4.3 密码输入限制：首位限制大写字母，限制长度6-10位，密码组成限制英文、数字。<br/>     4.4 密码输入框未全部填写时，“重置密码”按钮无法点击。<br/>     4.5 密码1|2提示框警告场合：长度非法，两次输入不一致。<br/>5、注销账号：支持用户注销账号，删除账号所有签到记录。<br/>     5.1 删除关联的签到记录【功能未激活】<br/>     5.2 注销操作前用户须再次确定。<br/>6、更新面部数据：<br/>      6.1 打开摄像头，检测人脸，拍摄30张图片后关闭摄像窗口。<br/>      6.2 该“班级编号”表单内该用户的面部数据录入标志位“checked”置“是”。<br/>      6.3 自动重新训练该班级的“人脸检测样本”。<br/>8、更换头像：<br/>      8.1 打开摄像头，空格键按下时拍摄用户面部图像。<br/>      8.2 文本框内居中显示，彩色图像。<br/>      8.3 关闭摄像头后，立即更新头像QLabel内容。<br/><br/>（二）班级课表页面：【一级子页面】<br/>1、班级编号：初次加载页面时，自动加载。<br/>2、课表表格：<br/>      2.1 显示字段：“班级编号”“课程名称”“开课日期”“结课日期”<br/>                                   “一周课表”“上课时间”“下课日期”。<br/>      2.2 同步显示数据库数据lessontable表单内容。      <br/>      2.3 支持“导出表格”到本地Excel，Excel文件名---&gt;“班级编号_lessontable”。<br/>3、支持“手动刷新”表格数据。<br/><br/>（三）签到日志：【一级子页面】<br/>1、表格控件：“签到日志”“迟到记录”。<br/>2、LCD显示控件：“出勤次数”“迟到次数”“请假次数”“出勤率”。<br/>3、支持“导出表格”到本地Excel，Excel文件名---&gt;“用户学号__signdata”。<br/>3、支持手动刷新表格数据。<br/><br/></p>', '2021-05-04 01:51:28', NULL, NULL, '【Python】基于人脸识别的考勤系统 [PC端部分]', '人脸识别,OpenCV');

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
INSERT INTO `comment` VALUES (1, 1, 2, 0, 0, '2021-05-07 21:35:20', 0, NULL, '一号说的对');
INSERT INTO `comment` VALUES (1, 2, 3, 2, 0, '2021-05-07 22:44:50', 2, NULL, '占楼');
INSERT INTO `comment` VALUES (1, 3, 4, 2, 3, '2021-05-07 21:33:48', 0, NULL, '沙发');

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
INSERT INTO `plate` VALUES (1, 'C语言', '入门首选', NULL, 0);
INSERT INTO `plate` VALUES (2, 'C++', '面向对象的C', 4, 0);
INSERT INTO `plate` VALUES (3, 'C#', '安全的C', 4, 0);
INSERT INTO `plate` VALUES (4, 'Java', '优雅的语言', NULL, 0);
INSERT INTO `plate` VALUES (5, 'JavaEE', NULL, NULL, 0);
INSERT INTO `plate` VALUES (6, 'ASP.Net', NULL, NULL, 0);
INSERT INTO `plate` VALUES (7, '汇编语言', NULL, NULL, 0);
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
INSERT INTO `user` VALUES (2, '汤臣是', '200702', NULL, NULL, 1, NULL, '2021-04-21 11:42:24', 1);
INSERT INTO `user` VALUES (3, '文来', '200703', NULL, NULL, 2, NULL, '2021-04-21 11:42:53', 0);
INSERT INTO `user` VALUES (4, '刘世凯', '200703Lsk', NULL, NULL, 1, NULL, '2021-04-26 14:08:20', 1);
INSERT INTO `user` VALUES (5, '刘静怡', '200705', NULL, NULL, 1, NULL, '2021-04-26 14:08:34', 1);
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
INSERT INTO `userlevel` VALUES (1, '幼儿园');
INSERT INTO `userlevel` VALUES (2, '小学生');
INSERT INTO `userlevel` VALUES (3, '初中生');
INSERT INTO `userlevel` VALUES (4, '高中生');
INSERT INTO `userlevel` VALUES (5, '大学生');
INSERT INTO `userlevel` VALUES (6, '硕士生');
INSERT INTO `userlevel` VALUES (7, '博士生');
INSERT INTO `userlevel` VALUES (8, '院士');

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
INSERT INTO `userstatus` VALUES (0, '用户禁止');
INSERT INTO `userstatus` VALUES (1, '用户正常');

SET FOREIGN_KEY_CHECKS = 1;
