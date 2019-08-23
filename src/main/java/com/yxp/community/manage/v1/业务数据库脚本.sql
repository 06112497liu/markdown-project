SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_invoke_log
-- ----------------------------
DROP TABLE IF EXISTS `app_invoke_log`;
CREATE TABLE `app_invoke_log` (
    `id`            BIGINT(20)   NOT NULL COMMENT '主键',
    `app_code`      VARCHAR(20)  NOT NULL COMMENT '第三方应用code',
    `uri`           VARCHAR(100) NOT NULL COMMENT '调用的uri',
    `operation`     VARCHAR(20) DEFAULT NULL COMMENT '具体操作',
    `ip`            VARCHAR(64)  NOT NULL COMMENT '调用者ip',
    `request_time`  DATETIME     NOT NULL COMMENT '请求时间',
    `return_time`   DATETIME     NOT NULL COMMENT '返回时间',
    `expend_time`   BIGINT(20)   NOT NULL COMMENT '调用消耗时间',
    `request_body`  TEXT COMMENT '请求体',
    `response_body` TEXT COMMENT '响应体',
    `success`       TINYINT(1)  DEFAULT NULL COMMENT '是否成功',
    `error_msg`     TEXT COMMENT '错误信息',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='接入平台接口调用日志记录表';

-- ----------------------------
-- Table structure for app_module
-- ----------------------------
DROP TABLE IF EXISTS `app_module`;
CREATE TABLE `app_module` (
    `id`          BIGINT(20)  NOT NULL COMMENT '主键',
    `name`        VARCHAR(30) NOT NULL COMMENT '模块名称',
    `code`        VARCHAR(50) NOT NULL COMMENT '模块编码',
    `parent_code` VARCHAR(50) NOT NULL DEFAULT '-1' COMMENT '父模块code',
    `app_code`    VARCHAR(50) NOT NULL COMMENT '所属第三方应用code',
    `route_url`   VARCHAR(100)         DEFAULT NULL COMMENT '模块路由地址',
    `created`     DATETIME    NOT NULL COMMENT '创建时间',
    `updated`     DATETIME    NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_appCode_code` (`app_code`, `code`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='应用模块表';

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role` (
    `id`       BIGINT(20)  NOT NULL COMMENT '主键',
    `name`     VARCHAR(20) NOT NULL COMMENT '角色名称',
    `code`     VARCHAR(20) NOT NULL COMMENT '角色编码',
    `app_code` VARCHAR(50) NOT NULL COMMENT '所属第三方应用code',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_appCode_code` (`app_code`, `code`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='平台角色表';

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
    `id`         BIGINT(20)  NOT NULL COMMENT '主键',
    `name`       VARCHAR(30) NOT NULL COMMENT '用户姓名',
    `account`    VARCHAR(30) NOT NULL COMMENT '用户账号',
    `org_id`     BIGINT(20)  NOT NULL COMMENT '用户所属组织id',
    `org_name`   VARCHAR(50) DEFAULT NULL COMMENT '用户所属组织名称',
    `class_info` VARCHAR(50) DEFAULT NULL COMMENT '用户所属班级信息',
    `app_code`   VARCHAR(50) NOT NULL COMMENT '用户所属平台code',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_appCode_account` (`app_code`, `account`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='第三方应用用户表';

-- ----------------------------
-- Table structure for audit_data_record
-- ----------------------------
DROP TABLE IF EXISTS `audit_data_record`;
CREATE TABLE `audit_data_record` (
    `id`                BIGINT(20)  NOT NULL COMMENT '主键',
    `source_id`         BIGINT(20)  NOT NULL COMMENT '数据源id',
    `source_parent_id`  BIGINT(20)           DEFAULT '-1' COMMENT '所属父数据源id',
    `module_code`       VARCHAR(50) NOT NULL COMMENT '所属模块code',
    `top_module_code`   VARCHAR(50) NOT NULL COMMENT '所属顶层模块code',
    `publisher_id`      BIGINT(20)  NOT NULL COMMENT '发布人id',
    `publisher_role_id` BIGINT(20)  NOT NULL COMMENT '发布人角色id',
    `publisher_org_id`  BIGINT(20)  NOT NULL COMMENT '发布人组织id',
    `publish_date`      DATETIME    NOT NULL COMMENT '发布时间',
    `audit_status`      TINYINT(1)  NOT NULL DEFAULT '1' COMMENT '审核状态（1-未审核，2-已通过，3-已屏蔽）',
    `reason`            TINYINT(1)           DEFAULT NULL COMMENT '原因（1-正常，2-色情暴恐，3-政治敏感，4-违法乱纪，5-低俗恶意，6-灌水刷屏，7-不合板块规定））',
    `audit_time`        DATETIME             DEFAULT NULL COMMENT '审核时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_sourceId_moduleCode` (`source_id`, `module_code`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='审核数据记录表';

-- ----------------------------
-- Table structure for data_detail
-- ----------------------------
DROP TABLE IF EXISTS `data_detail`;
CREATE TABLE `data_detail` (
    `id`                   BIGINT(20) NOT NULL COMMENT '主键',
    `audit_data_record_id` BIGINT(20) NOT NULL COMMENT '数据信息id',
    `title`                VARCHAR(50)  DEFAULT NULL COMMENT '标题',
    `summary`              VARCHAR(255) DEFAULT NULL COMMENT '摘要',
    `text_content`         TEXT COMMENT '文本内容',
    `other_content`        TEXT COMMENT '其它格式内容',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_auditDataRecordId` (`audit_data_record_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='数据详情';

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS `dict_item`;
CREATE TABLE `dict_item` (
    `id`              BIGINT(20)  NOT NULL COMMENT '主键',
    `code`            VARCHAR(20) NOT NULL COMMENT '字典项code',
    `name`            VARCHAR(20) NOT NULL COMMENT '字典项名称',
    `dict_title_code` VARCHAR(20) NOT NULL COMMENT '所属字典code',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='字典项表';

-- ----------------------------
-- Table structure for dict_title
-- ----------------------------
DROP TABLE IF EXISTS `dict_title`;
CREATE TABLE `dict_title` (
    `id`   BIGINT(20)  NOT NULL COMMENT '主键',
    `code` VARCHAR(20) NOT NULL COMMENT '字典code',
    `name` VARCHAR(20) NOT NULL COMMENT '字典名称',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='字典标题表';

-- ----------------------------
-- Table structure for forbid_voice
-- ----------------------------
DROP TABLE IF EXISTS `forbid_voice`;
CREATE TABLE `forbid_voice` (
    `id`           BIGINT(20)  NOT NULL COMMENT '主键',
    `user_id`      BIGINT(20)  NOT NULL COMMENT '用户id',
    `reason`       VARCHAR(50) NOT NULL COMMENT '原因',
    `start_date`   DATETIME    NOT NULL COMMENT '开始时间',
    `days`         INT(11)     NOT NULL COMMENT '天数',
    `end_date`     DATETIME    NOT NULL COMMENT '结束时间',
    `other_reason` VARCHAR(255) DEFAULT NULL COMMENT '其它原因',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_userId` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='用户禁言表';

-- ----------------------------
-- Table structure for forbid_voice_log
-- ----------------------------
DROP TABLE IF EXISTS `forbid_voice_log`;
CREATE TABLE `forbid_voice_log` (
    `id`           BIGINT(20)  NOT NULL COMMENT '主键',
    `user_id`      BIGINT(20)  NOT NULL COMMENT '用户id',
    `reason`       VARCHAR(50) NOT NULL COMMENT '原因',
    `start_date`   DATETIME    NOT NULL COMMENT '开始时间',
    `days`         INT(11)     NOT NULL COMMENT '天数',
    `end_date`     DATETIME    NOT NULL COMMENT '结束时间',
    `created`      DATETIME    NOT NULL COMMENT '数据创建时间',
    `updated`      DATETIME    NOT NULL COMMENT '数据更新时间',
    `other_reason` VARCHAR(255) DEFAULT NULL COMMENT '其它原因',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='禁言历史表';

-- ----------------------------
-- Table structure for forbid_voice_setting
-- ----------------------------
DROP TABLE IF EXISTS `forbid_voice_setting`;
CREATE TABLE `forbid_voice_setting` (
    `id`      BIGINT(20) NOT NULL COMMENT '主键',
    `num`     INT(11)    NOT NULL COMMENT '违规上限次数',
    `days`    INT(11)    NOT NULL COMMENT '自动禁言天数',
    `created` DATETIME   NOT NULL COMMENT '创建时间',
    `updated` DATETIME   NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='禁言配置表';

-- ----------------------------
-- Table structure for sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word` (
    `id`          BIGINT(20)  NOT NULL COMMENT '主键',
    `word`        VARCHAR(10) NOT NULL COMMENT '敏感词',
    `type`        TINYINT(1)  NOT NULL COMMENT '所属类型',
    `operator_id` BIGINT(20) DEFAULT NULL COMMENT '操作人id',
    `created`     DATETIME    NOT NULL COMMENT '创建时间',
    `updated`     DATETIME    NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_word` (`word`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='敏感词表';

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
    `id`           BIGINT(20)  NOT NULL COMMENT '主键',
    `name`         VARCHAR(50) NOT NULL COMMENT '名称',
    `code`         VARCHAR(50) NOT NULL COMMENT '编码',
    `callback_url` VARCHAR(50) DEFAULT NULL COMMENT '回调地址',
    `http_method`  VARCHAR(10) DEFAULT NULL COMMENT '回调请求方法名',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_code` (`code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='第三方应用表';

-- ----------------------------
-- Table structure for user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `user_role_rel`;
CREATE TABLE `user_role_rel` (
    `id`      BIGINT(20) NOT NULL COMMENT '主键',
    `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
    `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_roleId_userId` (`user_id`, `role_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='用户角色关系表';

SET FOREIGN_KEY_CHECKS = 1;
