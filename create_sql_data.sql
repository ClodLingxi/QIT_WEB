/*
 Navicat Premium Dump SQL

 Source Server         : Learning
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : qit

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 09/09/2024 17:26:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_applicant
-- ----------------------------
DROP TABLE IF EXISTS `tb_applicant`;
CREATE TABLE `tb_applicant`  (
  `APPLICANT_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `APPLICANT_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `APPLICANT_PWD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `APPLICANT_REGISTDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APPLICANT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_applicant
-- ----------------------------
INSERT INTO `tb_applicant` VALUES (1, 'qst@itoffer.cn', '123456', '2011-01-01 13:14:20');
INSERT INTO `tb_applicant` VALUES (2, '123@qq.com', '123', '2018-11-19 11:40:17');

-- ----------------------------
-- Table structure for tb_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_apply`;
CREATE TABLE `tb_apply`  (
  `apply_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_userId` int NOT NULL,
  `apply_jobId` int NOT NULL,
  `apply_state` tinyint NOT NULL,
  `apply_date` date NOT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_apply
-- ----------------------------
INSERT INTO `tb_apply` VALUES (13, 11, 1, 1, '2024-09-06');

-- ----------------------------
-- Table structure for tb_company
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company`  (
  `COMPANY_ID` int NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMPANY_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMPANY_SIZE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMPANY_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMPANY_BRIEF` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMPANY_STATE` int NULL DEFAULT NULL,
  `COMPANY_SORT` int NULL DEFAULT NULL,
  `COMPANY_VIEWNUM` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `COMPANY_PIC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES (1, '凌志软件股份有限公司', '苏州市', '3000人以上', '股份制企业', '<p>凌志软件股份有限公司成立于2003年1月，是一家致力于为各行业提供软件产品研发，软件外包开发及IT系统集成服务。业务范围包括证券，银行，保险，电子商务，物流等。金融行业产品研发及软件外包服务的专业性及稳定性，已成为企业的核心竞争力。公司在日本东京、上海、北京、深圳等地均设有分支机构。凌志软件经过10年多的发展，得到现有海内外客户高度认可，并在中国和日本形成了一定的品牌知名度，海外业务以日本市场为核心，已成为国际知名企业的核心供应商，在2011年软件出口企业排行榜中名列第10名，并获得2011-2012年国家规划布局内重点软件企业称号。凌志软件在稳步扩大高端软件外包业务的同时，自主研发国内高端金融产品，现已申请多项发明专利并开发了多款拥有自主知识产权的金融软件产品，投入商业应用并得到客户的高度评价，逐步在国内市场上崭露头角。</p>', 0, 1, NULL, 'fff2b99f-2d18-4823-a85e-be7ce4dc17a2.png');
INSERT INTO `tb_company` VALUES (2, '苏州大宇宙信息创造有限公司', '苏州市', '100-200人', '外资企业', '<p>苏州大宇宙信息创造有限公司成立于2008年10月，是大宇宙信息创造（中国）有限公司全资子公司，注册资金为1600万元。公司位于风景优美的中国新加坡合作苏州工业园区独墅湖高教区，拥有自己的办公及研发大楼，是园区重点引进的软件服务外包企业。公司是一家专业从事国际和国内企事业信息化解决方案、软件外包的高科技企业，为国内外企业提供一流的软件开发、系统集成及维护、客户支持等综合的信息服务。公司拥有一支高素质的管理与开发团队，具有良好的外语能力和丰富的软件设计开发经验，同时具备与国内外客户的良好商务沟通能力。公司成立至今，保持着稳健发展的势头，事业日益发展和壮大，目前已与国内外多家企业建立了长期稳定的客户关系。公司于2009年7月份顺利通过ISO27001信息安全管理的国际认证，2010年6月顺利通过CMMI3级认证。公司具备完善的管理、教育培训和薪酬福利体系以及健全的规章制度，为员工的工作和学习提供了广阔、自由的发展空间。</p>', 0, 2, NULL, '1163c36b-68ec-460d-8d1b-4d2451d96980.jpg');
INSERT INTO `tb_company` VALUES (3, '北京日立华胜信息系统有限公司', '东城区', '200-500人', '合资企业', '<p>北京日立华胜信息系统有限公司（简称BHH）是世界五百强之一的HITACHI日立集团和信息产业部电子六所共同投资设立的高新技术企业。公司主要从事对日软件开发,自成立以来，我们承接了日本各大银行?证券交易所相关系统、日本新干线铁路座位预约系统、面向日本政府机关的财务会计系统/税金管理系统/居民信息管理系统、纳税系统、生产管理系统、销售管理系统、日本各大汽车厂商的ECU软件、信息终端设备软件等各种大型软件开发项目。业务领域涵盖：金融、产业/流通、公共政府、ATM以及嵌入式五大领域。从1996年起，公司便已经开始从事汽车引擎控制、变速器控制、自动巡航控制等领域的嵌入式软件开发，积累了丰富的嵌入式软件的开发经验。公司十分注重对员工的外语及业务技能培训，提供多次出国工作机会和充分的发展空间；公司员工均享有良好的薪资和完备的福利保险待遇（&ldquo;五险一金&rdquo;和补充医疗/意外伤害保险，以及多项补贴）。诚挚邀请有志于从事对日软件开发、德才兼备的毕业生加盟，开辟属于自己的崭新生活。欢迎各位有识之士的加盟。</p>', 0, 3, NULL, 'df13a1c2-136d-4166-a234-1c9da0844806.jpg');
INSERT INTO `tb_company` VALUES (4, '222', '3333', '444', '555', '<p>0000</p>', 2, 7, NULL, '266fdc59-4e1b-4761-898f-6a249cb0e7b2.jpg');

-- ----------------------------
-- Table structure for tb_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job`  (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_companyId` int NOT NULL,
  `job_hiringNum` int NOT NULL,
  `job_applicantNum` int NOT NULL,
  `job_endDate` date NOT NULL,
  `job_state` tinyint NOT NULL,
  `job_salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_job
-- ----------------------------
INSERT INTO `tb_job` VALUES (1, '啊实打实', 1, 34, 22, '2024-08-02', 1, '1000-2000元');
INSERT INTO `tb_job` VALUES (2, '啊实s', 1, 44, 12, '2024-08-02', 1, '3000-4000元');
INSERT INTO `tb_job` VALUES (3, '啊', 1, 54, 1, '2024-08-02', 1, '111000-222000元');
INSERT INTO `tb_job` VALUES (4, '啊实打实', 2, 64, 222, '2024-08-02', 1, '12000-22000元');

-- ----------------------------
-- Table structure for tb_resume
-- ----------------------------
DROP TABLE IF EXISTS `tb_resume`;
CREATE TABLE `tb_resume`  (
  `resume_id` int NOT NULL AUTO_INCREMENT,
  `resume_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resume_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resume_birthday` date NOT NULL,
  `resume_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_registration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户口',
  `resume_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resume_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resume_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '求职意向',
  `resume_experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作经验',
  `resume_userId` int NOT NULL,
  PRIMARY KEY (`resume_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_resume
-- ----------------------------
INSERT INTO `tb_resume` VALUES (4, 'asdasd', '59982ed5-4966-47cb-bad6-c514e72a2d14.jpg', '男', '2024-09-05', '', '', 'asdasd', '啊实打实d', 'asdasd', 'asdasd', 11);
INSERT INTO `tb_resume` VALUES (5, '', '', '', '2024-09-06', '', '', '', '', '', '', 46);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `USER_ID` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USER_LOGNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名',
  `USER_PWD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `USER_REALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实名',
  `USER_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `USER_ROLE` int NOT NULL COMMENT '权限',
  `USER_STATE` int NOT NULL COMMENT '状态',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `TB_USERS_FK1`(`USER_ID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (11, 'user', '123456', '是否', '123456@163.com', 3, 1);
INSERT INTO `tb_users` VALUES (18, 'hern123456', 'hern123456', '宋兆恒', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (19, '2233', '4567789', '2233', '2233', 3, 1);
INSERT INTO `tb_users` VALUES (23, 'admin123456', 'admin1234567', 'admin123456', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (24, 'hern123456', 'hern123456', '宋兆恒', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (25, 'hern1234567', 'hern123456', '宋兆恒', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (26, 'hern12345678', 'hern123456', '宋兆恒', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (27, 'hern123456789', 'hern123456', '宋兆恒', '2336909208@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (28, '测试用例1', '123456', '测试用户1', '2336909208@qq.com', 1, 1);
INSERT INTO `tb_users` VALUES (29, 'admin789', '123456', '青软实训', '463512238@qq.com', 1, 1);
INSERT INTO `tb_users` VALUES (30, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (31, 'root', '123456', 'LI', '2336909206@qq.com', 1, 1);
INSERT INTO `tb_users` VALUES (33, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (34, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (35, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (36, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (37, 'amdin123456', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (38, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (39, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (40, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (41, 'amdin12345678910asdas', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (42, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (43, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (44, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (45, 'amdin12345678910', 'amdin12345678910', 'amdin12345678910', '2336909206@qq.com', 3, 1);
INSERT INTO `tb_users` VALUES (46, 'USE2', '123456', '', '', 3, 1);

SET FOREIGN_KEY_CHECKS = 1;
