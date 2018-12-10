/*
Navicat MySQL Data Transfer

Source Server         : kyr1eee
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : kyr1e

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-07-20 09:46:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gethome`
-- ----------------------------
DROP TABLE IF EXISTS `gethome`;
CREATE TABLE `gethome` (
  `date` varchar(20) DEFAULT NULL,
  `mood` varchar(22) DEFAULT NULL,
  `home_away` int(2) DEFAULT NULL,
  `id` int(2) DEFAULT NULL,
  `mom` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gethome
-- ----------------------------
INSERT INTO `gethome` VALUES ('7-11', '....', '10', '1', 'health');
INSERT INTO `gethome` VALUES ('7-10', 'boring', '11', '2', 'health');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 NOT NULL,
  `goods_pin` varchar(255) CHARACTER SET utf8 NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `vip_account` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '111', '小米手机', '1999', '#FASDADQ', '0.9', '手机', '0.8');
INSERT INTO `goods` VALUES ('2', '112', 'ThinkPad T460s', '8888', 'ASDADWQW', '0.97', '笔记本电脑', '0.9');
INSERT INTO `goods` VALUES ('3', '123', '统一阿萨姆', '100', '64363535352', '0.8', '奶茶', '0.5');
INSERT INTO `goods` VALUES ('4', '1232', '统一阿萨姆2', '1001', '643635353522', '0.81', '奶茶', '0.51');
INSERT INTO `goods` VALUES ('5', '12322', '统一阿萨姆22', '1002', '64363535352', '0.82', '奶茶', '0.52');
INSERT INTO `goods` VALUES ('6', '12322', '统一阿萨姆1212', '1001', '64363535352', '0.82', '奶茶', '0.52');
INSERT INTO `goods` VALUES ('7', '123', '统一阿萨姆22211', '1001', '64363535121352', '0.8', '奶茶', '0.5');
INSERT INTO `goods` VALUES ('8', '1232', '统一1阿萨姆', '1010', '6436353125121352', '0.8', '奶茶', '0.5');
INSERT INTO `goods` VALUES ('9', '122132', '统一阿12萨姆', '100', '64363531125121352', '0.8', '奶茶', '0.5');
INSERT INTO `goods` VALUES ('10', '2122', '统一1阿萨1姆', '10101', '643635311125121352', '0.8', '奶茶', '0.5');
INSERT INTO `goods` VALUES ('11', '122132', '统1一1阿萨1姆', '1010', '6436353111125121352', '0.18', '奶茶', '0.512');

-- ----------------------------
-- Table structure for `goodsandsupply_link`
-- ----------------------------
DROP TABLE IF EXISTS `goodsandsupply_link`;
CREATE TABLE `goodsandsupply_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supply_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `goods_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodsandsupply_link
-- ----------------------------
INSERT INTO `goodsandsupply_link` VALUES ('1', '1111', '111');

-- ----------------------------
-- Table structure for `h_member`
-- ----------------------------
DROP TABLE IF EXISTS `h_member`;
CREATE TABLE `h_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of h_member
-- ----------------------------
INSERT INTO `h_member` VALUES ('1', 'K111', '20180714', '非会员', 'K1112', '你妈妈', '13452321311');
INSERT INTO `h_member` VALUES ('2', 'k22', '20180401', '会员', 'K22', '你爸爸', '12313151231');
INSERT INTO `h_member` VALUES ('7', 'KASDAB', '20001001', null, null, '江泽民', '1765879282374');
INSERT INTO `h_member` VALUES ('8', 'KASDAB', '20001001', null, null, '毛泽东', '1765879228374');
INSERT INTO `h_member` VALUES ('9', 'KASDAA', '20190711', null, null, '习近平', '1765879228374');
INSERT INTO `h_member` VALUES ('10', 'KASDAAA', '201901111', null, null, '蒋介石', '17658792283724');
INSERT INTO `h_member` VALUES ('11', 'KASDA', '20001001', null, null, '习近平2', '11111232132131');
INSERT INTO `h_member` VALUES ('12', '122', '20001001', null, null, '习近平2', '11111232132131');
INSERT INTO `h_member` VALUES ('13', '111122', '20001001', null, null, '习近1平', '11111232132131');
INSERT INTO `h_member` VALUES ('14', '111122', '20001001', null, null, '习11近1平', '111112321321131');
INSERT INTO `h_member` VALUES ('15', '111122', '20001001', null, null, '习11近1平1', '111112321321131');

-- ----------------------------
-- Table structure for `kyr1ee`
-- ----------------------------
DROP TABLE IF EXISTS `kyr1ee`;
CREATE TABLE `kyr1ee` (
  `id` int(3) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kyr1ee
-- ----------------------------

-- ----------------------------
-- Table structure for `link_member`
-- ----------------------------
DROP TABLE IF EXISTS `link_member`;
CREATE TABLE `link_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of link_member
-- ----------------------------
INSERT INTO `link_member` VALUES ('1', '22', '33', '非会员');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2', '2323232', 'hhhhh', '女', '1232112124141');
INSERT INTO `member` VALUES ('3', '251642', '你妈妈', '女', '2222222222');
INSERT INTO `member` VALUES ('5', '1231', '你爸爸', '男', '1237187321421');
INSERT INTO `member` VALUES ('6', '1231', '你爸爸666', '男', '12371873214212');
INSERT INTO `member` VALUES ('7', '1231', '你爸爸222', '男', '12371873214212');
INSERT INTO `member` VALUES ('8', '12312', '你爸爸6662', '男', '12371873214211');
INSERT INTO `member` VALUES ('9', '2516422', '你妈妈1', '女', '222222222222');
INSERT INTO `member` VALUES ('10', '2516422', '熊猫', '女', '22222212222');
INSERT INTO `member` VALUES ('11', '23415', '你妈妈的腿', '女', '22222222212');
INSERT INTO `member` VALUES ('12', '2213112', '爸爸', '男', '222221122222');
INSERT INTO `member` VALUES ('13', '2123211', '马化腾', '男', '22222122222');

-- ----------------------------
-- Table structure for `m_list`
-- ----------------------------
DROP TABLE IF EXISTS `m_list`;
CREATE TABLE `m_list` (
  `mi_d` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`mi_d`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_list
-- ----------------------------
INSERT INTO `m_list` VALUES ('26', '习近平炸鸡店', '杭州', '111112321321131');
INSERT INTO `m_list` VALUES ('37', '淘宝美宜佳', '广州', '啊啊啊啊');
INSERT INTO `m_list` VALUES ('39', '麦辣鸡', '广州', '13997776865');
INSERT INTO `m_list` VALUES ('41', '肯麦鸡', '广州北', '啊啊啊啊');
INSERT INTO `m_list` VALUES ('43', '一品一', '广州', '1399777686522');
INSERT INTO `m_list` VALUES ('44', '你爷爷', '杭州', '11111232132131');
INSERT INTO `m_list` VALUES ('45', '肯德基1', '广州', '2222');
INSERT INTO `m_list` VALUES ('46', '麦辣鸡2', '广州', '13997776865');
INSERT INTO `m_list` VALUES ('47', '淘宝美宜佳2', '广州', '13997776865');
INSERT INTO `m_list` VALUES ('54', '天猫', '杭州', '11111232132131');
INSERT INTO `m_list` VALUES ('56', '江泽民薯条店', '北京天安门', '28231731312321');

-- ----------------------------
-- Table structure for `nba_playoff`
-- ----------------------------
DROP TABLE IF EXISTS `nba_playoff`;
CREATE TABLE `nba_playoff` (
  `id` int(6) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `team` varchar(15) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `rebound` float DEFAULT NULL,
  `assist` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nba_playoff
-- ----------------------------
INSERT INTO `nba_playoff` VALUES ('1', 'Lebron James', 'Lakers', '34.2', '9.1', '9');
INSERT INTO `nba_playoff` VALUES ('2', 'Anthony Davis', 'Pelican', '30.1', '13.4', '1.7');
INSERT INTO `nba_playoff` VALUES ('3', 'Westbrook', 'Thunders', '29.3', '12', '7.5');
INSERT INTO `nba_playoff` VALUES ('4', 'Kevin Durant', 'Warriors', '29', '7.8', '4.7');
INSERT INTO `nba_playoff` VALUES ('5', 'James Harden', 'Rockets', '28.6', '5.2', '6.8');

-- ----------------------------
-- Table structure for `nba_regular`
-- ----------------------------
DROP TABLE IF EXISTS `nba_regular`;
CREATE TABLE `nba_regular` (
  `id` int(6) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `rebound` float DEFAULT NULL,
  `assist` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nba_regular
-- ----------------------------
INSERT INTO `nba_regular` VALUES ('3', 'Westbrook', 'Thunders', '25.4', '10.1', '10.2');
INSERT INTO `nba_regular` VALUES ('4', 'Kevin Durant', 'Warriors', '26.4', '6.8', '5.4');
INSERT INTO `nba_regular` VALUES ('5', 'James Harden', 'Rockets', '30.4', '5.4', '8.8');
INSERT INTO `nba_regular` VALUES ('2', 'Anthony Davis', 'Pelican', '28.1', '11.1', '2.3');
INSERT INTO `nba_regular` VALUES ('1', 'Lebron James', 'Lakers', '27.5', '8.6', '9.1');

-- ----------------------------
-- Table structure for `supply`
-- ----------------------------
DROP TABLE IF EXISTS `supply`;
CREATE TABLE `supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supply_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `supply_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supply
-- ----------------------------
INSERT INTO `supply` VALUES ('1', '2029', '天地一号');
INSERT INTO `supply` VALUES ('2', '222221', '天地二号');
INSERT INTO `supply` VALUES ('3', '3333', '天地三号');
INSERT INTO `supply` VALUES ('5', '222222', '宠物店');
INSERT INTO `supply` VALUES ('6', '2003', '麦当劳');
INSERT INTO `supply` VALUES ('7', '20031', '麦当劳1');
INSERT INTO `supply` VALUES ('8', '200312', '麦当劳12');
INSERT INTO `supply` VALUES ('9', '20031', '麦当劳22');
INSERT INTO `supply` VALUES ('10', '2003121', '麦当劳2221');
INSERT INTO `supply` VALUES ('11', '1111', '麦当劳231');
INSERT INTO `supply` VALUES ('12', '2022', '累死了');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', null);
INSERT INTO `user` VALUES (null, 'å¿?è??å®¢', '123456', '7666666666@11.com');
INSERT INTO `user` VALUES (null, 'kyr1eeee2123', '123456', '2222222222222@11.com');
INSERT INTO `user` VALUES (null, 'thisisatest', 'aaaaaaaa', '787628@qq.com');
INSERT INTO `user` VALUES (null, 'login1111', '123456', '1231231@qq.com');
