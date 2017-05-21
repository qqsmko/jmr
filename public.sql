/*
Navicat PGSQL Data Transfer

Source Server         : postgresql
Source Server Version : 90602
Source Host           : localhost:5432
Source Database       : postgres
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90602
File Encoding         : 65001

Date: 2017-05-21 21:41:41
*/


-- ----------------------------
-- Sequence structure for t_attendance_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_attendance_id_seq";
CREATE SEQUENCE "public"."t_attendance_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."t_attendance_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for t_class_classid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_class_classid_seq";
CREATE SEQUENCE "public"."t_class_classid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
SELECT setval('"public"."t_class_classid_seq"', 8, true);

-- ----------------------------
-- Sequence structure for t_classseries_classseriesid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_classseries_classseriesid_seq";
CREATE SEQUENCE "public"."t_classseries_classseriesid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for t_device_deviceid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_device_deviceid_seq";
CREATE SEQUENCE "public"."t_device_deviceid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."t_device_deviceid_seq"', 3, true);

-- ----------------------------
-- Sequence structure for t_institutions_institutionsid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_institutions_institutionsid_seq";
CREATE SEQUENCE "public"."t_institutions_institutionsid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 38
 CACHE 1;
SELECT setval('"public"."t_institutions_institutionsid_seq"', 38, true);

-- ----------------------------
-- Sequence structure for t_institutions_regionid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_institutions_regionid_seq";
CREATE SEQUENCE "public"."t_institutions_regionid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 6
 CACHE 1;
SELECT setval('"public"."t_institutions_regionid_seq"', 6, true);

-- ----------------------------
-- Sequence structure for t_region_regionid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_region_regionid_seq";
CREATE SEQUENCE "public"."t_region_regionid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."t_region_regionid_seq"', 10, true);

-- ----------------------------
-- Sequence structure for T_Student_StudentID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."T_Student_StudentID_seq";
CREATE SEQUENCE "public"."T_Student_StudentID_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 22
 CACHE 1;
SELECT setval('"public"."T_Student_StudentID_seq"', 22, true);

-- ----------------------------
-- Sequence structure for t_teacher_teacherid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_teacher_teacherid_seq";
CREATE SEQUENCE "public"."t_teacher_teacherid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 12
 CACHE 1;
SELECT setval('"public"."t_teacher_teacherid_seq"', 12, true);

-- ----------------------------
-- Table structure for t_attendance
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_attendance";
CREATE TABLE "public"."t_attendance" (
"id" int4 DEFAULT nextval('t_attendance_id_seq'::regclass) NOT NULL,
"deviceid" int4,
"carno" varchar(20) COLLATE "default",
"datatime" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
INSERT INTO "public"."t_attendance" VALUES ('1', '1', '#999', '2017-04-25 16:00:00');
INSERT INTO "public"."t_attendance" VALUES ('2', '2', '#333', '2015-06-07 13:24:35');
INSERT INTO "public"."t_attendance" VALUES ('3', '3', '#999', '2017-05-11 18:58:41');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_class";
CREATE TABLE "public"."t_class" (
"classid" int4 DEFAULT nextval('t_class_classid_seq'::regclass) NOT NULL,
"classseriesid" int4,
"classname" varchar(50) COLLATE "default",
"applynumber" int4,
"startdate" date,
"enddate" date,
"remark" text COLLATE "default",
"applyperson" varchar(20) COLLATE "default",
"applystate" int4 DEFAULT 1
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO "public"."t_class" VALUES ('1', '327355', '蓝翔1班', '87', '2017-03-15', '2017-04-16', '这里写备注', '王老师', '1');
INSERT INTO "public"."t_class" VALUES ('2', '381755', '计算机4班', '22', '2017-04-11', '2018-05-06', null, '刘老师', '3');
INSERT INTO "public"."t_class" VALUES ('3', '381755', '123', '123', '2017-05-01', '2017-05-17', '123', '123', '1');
INSERT INTO "public"."t_class" VALUES ('4', '381755', '3245', '454', '2017-05-16', '2017-05-18', '214123412', 'kjjkh', '1');
INSERT INTO "public"."t_class" VALUES ('5', '327355', 'sadf', '33333', '2017-05-10', '2017-05-09', 's fgsdefg', 'ds g', '2');
INSERT INTO "public"."t_class" VALUES ('6', '327355', '12312', '21321', '2017-05-15', '2017-05-17', 'dwedwq', 'qwer12', '1');
INSERT INTO "public"."t_class" VALUES ('7', '381755', '2', '20', '2017-05-16', '2017-05-31', '123', '李老师', '1');
INSERT INTO "public"."t_class" VALUES ('8', '327355', '画画2班', '20', '2017-05-10', '2017-05-08', '无', '刘老师', '2');

-- ----------------------------
-- Table structure for t_classseries
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_classseries";
CREATE TABLE "public"."t_classseries" (
"classseriesid" int4 DEFAULT nextval('t_classseries_classseriesid_seq'::regclass) NOT NULL,
"courseid" int4,
"classseriesname" varchar(50) COLLATE "default",
"coursetype" int4,
"times" int4,
"state" int4,
"isdeleted" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_classseries
-- ----------------------------
INSERT INTO "public"."t_classseries" VALUES ('327355', '342', '挖掘技术', '1', '3', '1', '0');
INSERT INTO "public"."t_classseries" VALUES ('381755', '512', '现场模拟', '2', '72', '2', '0');

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_device";
CREATE TABLE "public"."t_device" (
"deviceid" int4 DEFAULT nextval('t_device_deviceid_seq'::regclass) NOT NULL,
"institutionsid" int4,
"devicecode" varchar(20) COLLATE "default",
"description" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO "public"."t_device" VALUES ('1', '1', '#333', '打卡器');
INSERT INTO "public"."t_device" VALUES ('2', '1', '#444', '台式机');
INSERT INTO "public"."t_device" VALUES ('3', '2', '#123', '笔记本');

-- ----------------------------
-- Table structure for t_institutions
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_institutions";
CREATE TABLE "public"."t_institutions" (
"institutionsid" int4 DEFAULT nextval('t_institutions_institutionsid_seq'::regclass) NOT NULL,
"regionid" int4 DEFAULT nextval('t_institutions_regionid_seq'::regclass) NOT NULL,
"institutionsname" varchar(50) COLLATE "default",
"institutionscode" varchar(20) COLLATE "default",
"responsible" varchar(20) COLLATE "default",
"telephone" varchar(18) COLLATE "default",
"address" varchar(50) COLLATE "default",
"employeecount" int4,
"applydate" timestamp(6),
"approvaldate" timestamp(6),
"state" int4,
"isdeleted" int4 DEFAULT 0,
"applyemail" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_institutions"."applyemail" IS '申请人邮箱';

-- ----------------------------
-- Records of t_institutions
-- ----------------------------
INSERT INTO "public"."t_institutions" VALUES ('1', '2', '武汉学院', '#123', '马老师', '027-87654321', '武汉路10号', '80', '2015-07-03 16:00:00', null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('2', '1', '荆门专业学校', '#345', '王老师', '18877776666', '荆门路10号', '40', '2016-04-03 23:59:59', '2016-04-04 15:47:23', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('3', '10', '测试用2', '#2222', '测试', '19999999999', '测试路10号', '99', '2017-03-28 10:19:57', null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('4', '10', '测试用', '#2222', '测试', '19999999999', '测试路10号', '99', '2017-03-28 10:19:57', null, '1', '1', null);
INSERT INTO "public"."t_institutions" VALUES ('5', '10', '测试用', '#2222', '测试', '19999999999', '测试路10号', '99', '2017-03-28 10:19:57', null, '1', '1', null);
INSERT INTO "public"."t_institutions" VALUES ('6', '10', '测试用', '#2222', '测试', '19999999999', '测试路10号', '99', '2017-03-28 10:19:57', null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('7', '10', '测试用', '#2222', '测试', '19999999999', '测试路10号', '99', '2017-03-28 10:19:57', null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('8', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('9', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('10', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('11', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('12', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('13', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('14', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('15', '10', '321321', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('16', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('17', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('18', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('19', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('20', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('21', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('22', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('23', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('24', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('25', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '1', null);
INSERT INTO "public"."t_institutions" VALUES ('26', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('27', '10', '测试用', '#233', '李老师', '19999999999', '占地方', '98', '2017-08-08 16:00:44', '2017-08-08 16:00:44', '1', '1', null);
INSERT INTO "public"."t_institutions" VALUES ('29', '2', '你好机构', null, '你好', null, '武汉市10号', '10', null, null, null, '1', null);
INSERT INTO "public"."t_institutions" VALUES ('30', '2', '你好机构', null, '你好', null, '武汉市10号', '10', null, null, null, '1', null);
INSERT INTO "public"."t_institutions" VALUES ('31', '2', '你好机构', null, '你好', null, '武汉市10号', '10', null, null, null, '1', null);
INSERT INTO "public"."t_institutions" VALUES ('33', '10', '你好机构', null, '你好', null, '武汉市10号', '15', null, null, '2', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('34', '10', '你好机构', null, '你好', null, '武汉市10号', '15', null, null, '2', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('35', '10', '蓝翔', null, 'cc', null, '兰翔路10号', '322', null, null, '2', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('36', '1', '123', null, 'cc', null, '123', '123', null, null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('37', '1', '123', null, 'cc', null, '123', '123', null, null, '1', '0', null);
INSERT INTO "public"."t_institutions" VALUES ('38', '1', '123', null, 'cc', null, '123', '123', null, null, '2', '1', 'ceshi2123.com');

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_region";
CREATE TABLE "public"."t_region" (
"regionid" int4 DEFAULT nextval('t_region_regionid_seq'::regclass) NOT NULL,
"regionname" varchar(50) COLLATE "default",
"parentregion" int4,
"isdeleted" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_region
-- ----------------------------
INSERT INTO "public"."t_region" VALUES ('1', '荆门', null, '0');
INSERT INTO "public"."t_region" VALUES ('2', '武汉', null, '0');
INSERT INTO "public"."t_region" VALUES ('10', 'ceshi', '333', '1');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_student";
CREATE TABLE "public"."t_student" (
"studentid" int4 DEFAULT nextval('"T_Student_StudentID_seq"'::regclass) NOT NULL,
"name" varchar(20) COLLATE "default",
"gender" int2,
"birthday" date,
"telephone" varchar(18) COLLATE "default",
"email" varchar(30) COLLATE "default",
"address" varchar(50) COLLATE "default",
"nation" varchar(20) COLLATE "default",
"education" int4,
"insuredstate" int4,
"state" int4,
"isdeleted" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO "public"."t_student" VALUES ('1', '张三', '1', '1995-05-05', '13800001111', 'zhangsan@123.com', '张家庄', '汉族', '1', '2', '2', '0');
INSERT INTO "public"."t_student" VALUES ('4', '王少女', '2', '1996-06-06', '13911110000', 'wang@321.com', '王家湾10号', '汉族', '2', '1', '1', '0');
INSERT INTO "public"."t_student" VALUES ('19', '测试', '1', '2017-05-24', '13261713023', 'buptai@126.com', '王家湾10号', '333', '1', '1', '1', '0');
INSERT INTO "public"."t_student" VALUES ('21', '123', '1', '2017-05-01', '13261713023', '704095787@qq.com', '王家湾10号', '333', '1', '1', '1', '0');
INSERT INTO "public"."t_student" VALUES ('22', '测试', '1', '2017-05-10', '13422223333', 'gg@123.com', 'hhh', 'jjj', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_teacher";
CREATE TABLE "public"."t_teacher" (
"teacherid" int4 DEFAULT nextval('t_teacher_teacherid_seq'::regclass) NOT NULL,
"name" varchar(50) COLLATE "default",
"isdeleted" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO "public"."t_teacher" VALUES ('1', '王老师', '0');
INSERT INTO "public"."t_teacher" VALUES ('2', '李老师', '0');
INSERT INTO "public"."t_teacher" VALUES ('9', 'ccc', '1');
INSERT INTO "public"."t_teacher" VALUES ('10', 'ccc', '0');
INSERT INTO "public"."t_teacher" VALUES ('11', 'fff', '1');
INSERT INTO "public"."t_teacher" VALUES ('12', '李老师', '0');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."t_attendance_id_seq" OWNED BY "t_attendance"."id";
ALTER SEQUENCE "public"."t_class_classid_seq" OWNED BY "t_class"."classid";
ALTER SEQUENCE "public"."t_classseries_classseriesid_seq" OWNED BY "t_classseries"."classseriesid";
ALTER SEQUENCE "public"."t_device_deviceid_seq" OWNED BY "t_device"."deviceid";
ALTER SEQUENCE "public"."t_institutions_institutionsid_seq" OWNED BY "t_institutions"."institutionsid";
ALTER SEQUENCE "public"."t_institutions_regionid_seq" OWNED BY "t_institutions"."regionid";
ALTER SEQUENCE "public"."t_region_regionid_seq" OWNED BY "t_region"."regionid";
ALTER SEQUENCE "public"."T_Student_StudentID_seq" OWNED BY "t_student"."studentid";
ALTER SEQUENCE "public"."t_teacher_teacherid_seq" OWNED BY "t_teacher"."teacherid";

-- ----------------------------
-- Primary Key structure for table t_attendance
-- ----------------------------
ALTER TABLE "public"."t_attendance" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_class
-- ----------------------------
ALTER TABLE "public"."t_class" ADD PRIMARY KEY ("classid");

-- ----------------------------
-- Primary Key structure for table t_classseries
-- ----------------------------
ALTER TABLE "public"."t_classseries" ADD PRIMARY KEY ("classseriesid");

-- ----------------------------
-- Primary Key structure for table t_device
-- ----------------------------
ALTER TABLE "public"."t_device" ADD PRIMARY KEY ("deviceid");

-- ----------------------------
-- Primary Key structure for table t_institutions
-- ----------------------------
ALTER TABLE "public"."t_institutions" ADD PRIMARY KEY ("institutionsid");

-- ----------------------------
-- Primary Key structure for table t_region
-- ----------------------------
ALTER TABLE "public"."t_region" ADD PRIMARY KEY ("regionid");

-- ----------------------------
-- Primary Key structure for table t_student
-- ----------------------------
ALTER TABLE "public"."t_student" ADD PRIMARY KEY ("studentid");

-- ----------------------------
-- Primary Key structure for table t_teacher
-- ----------------------------
ALTER TABLE "public"."t_teacher" ADD PRIMARY KEY ("teacherid");

-- ----------------------------
-- Foreign Key structure for table "public"."t_attendance"
-- ----------------------------
ALTER TABLE "public"."t_attendance" ADD FOREIGN KEY ("deviceid") REFERENCES "public"."t_device" ("deviceid") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."t_class"
-- ----------------------------
ALTER TABLE "public"."t_class" ADD FOREIGN KEY ("classseriesid") REFERENCES "public"."t_classseries" ("classseriesid") ON DELETE CASCADE ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Key structure for table "public"."t_device"
-- ----------------------------
ALTER TABLE "public"."t_device" ADD FOREIGN KEY ("institutionsid") REFERENCES "public"."t_institutions" ("institutionsid") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."t_institutions"
-- ----------------------------
ALTER TABLE "public"."t_institutions" ADD FOREIGN KEY ("regionid") REFERENCES "public"."t_region" ("regionid") ON DELETE SET NULL ON UPDATE CASCADE;
