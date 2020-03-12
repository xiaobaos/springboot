/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : xiaobaoplus

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 12/03/2020 09:18:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (31, 0, 'Swagger', NULL, NULL, 0, 'fa fa-cog', 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (32, 31, '在线API', 'swagger/index.html', NULL, 1, 'fa fa-file-text-o', 1, NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (4, '管理员', NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (2, 4, 2, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (3, 4, 15, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (4, 4, 16, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (10, 4, 21, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (11, 4, 22, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (12, 5, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (13, 5, 3, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (14, 5, 19, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (15, 5, 20, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (16, 5, 21, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (17, 5, 22, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (18, 5, 4, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (19, 5, 23, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (20, 5, 24, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (21, 5, 25, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (22, 5, 26, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (23, 6, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (24, 6, 3, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (25, 6, 19, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (26, 6, 20, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (27, 6, 21, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (28, 6, 22, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (29, 7, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (30, 7, 2, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (31, 7, 15, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (32, 7, 16, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (33, 7, 17, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (34, 7, 18, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (35, 8, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (36, 8, 2, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (37, 8, 15, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (38, 8, 16, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (39, 8, 17, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (40, 8, 18, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (41, 9, 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (42, 9, 6, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (43, 9, 7, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (44, 9, 8, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (45, 9, 9, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (46, 9, 10, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (47, 9, 11, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (48, 9, 12, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (49, 9, 13, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_role_menu` VALUES (50, 9, 14, NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123', 'YzcmCZNvbXocrsz9dm8e', 'yzcheng90@qq.com', '13612345678', 1, NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 4, NULL, NULL, NULL, NULL, NULL, '0');

SET FOREIGN_KEY_CHECKS = 1;
