/********************************************************************************
 * Copyright (c) 2021 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 ********************************************************************************/
drop database if exists jifa;

create database jifa;

use jifa;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = active_job   */
/******************************************/
CREATE TABLE `active_job` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `target` varchar(128) NOT NULL COMMENT 'Target',
  `estimated_load` bigint(20) unsigned NOT NULL COMMENT 'Estimated load',
  `host_ip` varchar(64) DEFAULT NULL COMMENT 'Host IP',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `state` varchar(64) NOT NULL COMMENT 'State: Pending or IN_PROCESS',
  `user_id` varchar(64) NOT NULL COMMENT 'User ID',
  `access_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Last access time',
  `attachment` varchar(2048) DEFAULT NULL COMMENT 'Attachment',
  `keep_alive` tinyint(4) NOT NULL COMMENT 'Keep alive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_type_and_target` (`type`,`target`)
) ENGINE=InnoDB AUTO_INCREMENT=1628 DEFAULT CHARSET=utf8 COMMENT='Active job'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = admin   */
/******************************************/
CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `user_id` varchar(64) NOT NULL DEFAULT 'CURRENT_TIMESTAMP' COMMENT 'User ID',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Admin'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = config   */
/******************************************/
CREATE TABLE `config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `value` varchar(128) NOT NULL COMMENT 'Value',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Config'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = file   */
/******************************************/
CREATE TABLE `file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `user_id` varchar(64) NOT NULL COMMENT 'User ID',
  `original_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'File original name',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'File name',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'File type',
  `size` bigint(20) unsigned NOT NULL COMMENT 'File size',
  `transfer_state` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Transfer state',
  `shared` tinyint(4) NOT NULL COMMENT 'Is shared',
  `downloadable` tinyint(4) NOT NULL COMMENT 'Is downloadable',
  `in_shared_disk` tinyint(4) NOT NULL COMMENT 'Is in shared disk',
  `host_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host IP',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `deleted` tinyint(4) NOT NULL COMMENT 'Is deleted',
  `deleted_time` datetime DEFAULT NULL COMMENT 'Deleted time',
  `deleter` varchar(64) DEFAULT NULL COMMENT 'Deleter',
  `cas_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'CAS state',
  `display_name` varchar(128) DEFAULT NULL COMMENT 'File display name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=866 DEFAULT CHARSET=utf8 COMMENT='File'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = global_lock   */
/******************************************/
CREATE TABLE `global_lock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Global lock'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = historical_job   */
/******************************************/
CREATE TABLE `historical_job` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `user_id` varchar(64) NOT NULL COMMENT 'User ID',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `target` varchar(128) NOT NULL COMMENT 'Target',
  `host_ip` varchar(64) NOT NULL COMMENT 'Host IP',
  `estimated_load` bigint(20) unsigned NOT NULL COMMENT 'Estimated load',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1444 DEFAULT CHARSET=utf8 COMMENT='Historical job'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = master   */
/******************************************/
CREATE TABLE `master` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `host_ip` varchar(64) NOT NULL COMMENT 'Host IP',
  `host_name` varchar(128) NOT NULL COMMENT 'Host name',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `leader` tinyint(4) NOT NULL COMMENT 'Is Leader',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_host_ip` (`host_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Master'
;

/******************************************/
/*   DatabaseName = jifa   */
/*   TableName = worker   */
/******************************************/
CREATE TABLE `worker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `host_ip` varchar(64) NOT NULL COMMENT 'Host IP',
  `host_name` varchar(128) NOT NULL COMMENT 'Host name',
  `current_load` bigint(20) unsigned NOT NULL COMMENT 'Current load',
  `cpu_count` int(10) unsigned NOT NULL COMMENT 'CPU count',
  `memory_used` bigint(20) unsigned NOT NULL COMMENT 'Memory used',
  `memory_total` bigint(20) unsigned NOT NULL COMMENT 'Memory total',
  `disk_used` bigint(20) unsigned NOT NULL COMMENT 'Disk used',
  `disk_total` bigint(20) unsigned NOT NULL COMMENT 'Disk total',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last modified time',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `max_load` bigint(20) unsigned NOT NULL COMMENT 'Max load',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_host_ip` (`host_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Worker'
;




INSERT INTO `global_lock` (`id`,`name`,`last_modified_time`,`creation_time`) VALUES (1,'MASTER-JOB-LOCK','2019-07-18 14:46:21','2019-07-18 14:46:21');

INSERT INTO `worker` (`id`,`host_ip`,`host_name`,`current_load`,`cpu_count`,`memory_used`,`memory_total`,`disk_used`,`disk_total`,`last_modified_time`,`creation_time`,`max_load`) VALUES (2,'worker','worker',95,8,0,100,23,239072,'2020-10-26 13:23:43','2019-06-20 10:47:25',98765);

INSERT INTO `master` (`id`,`host_ip`,`host_name`,`last_modified_time`,`creation_time`,`leader`) VALUES (1,'localhost','DEV','2020-10-26 13:21:22','2019-07-18 11:55:38',1);

INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (1,'JOB-RETIRING-INTERVAL','20000','2019-07-19 16:42:54','2019-07-18 11:31:11');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (4,'JOB-COMMON-TIMEOUT-THRESHOLD','300000','2019-07-24 19:59:35','2019-07-18 13:25:46');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (6,'JOB-SCHEDULING-INTERVAL','60000','2019-07-19 18:43:31','2019-07-18 13:30:31');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (7,'JOB-NOTIFY-WORKER-ACTION-DELAY','2000','2019-07-19 14:55:47','2019-07-18 14:11:06');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (8,'JOB-TRIGGER-SCHEDULING-ACTION-DELAY','2000','2019-07-18 14:11:20','2019-07-18 14:11:20');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (9,'JOB-PENDING-MAX-COUNT','25','2019-07-18 14:58:19','2019-07-18 14:58:19');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (10,'JOB-TRANSFER-RESULT-FILLING-INTERVAL','60000','2019-07-19 16:45:09','2019-07-19 16:45:09');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (11,'JOB-SMALL-TIMEOUT-THRESHOLD','30000','2019-07-24 20:00:38','2019-07-24 20:00:38');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (13,'JOB-DISK-CLEANUP-PERIODIC','20000','2019-10-15 10:11:46','2019-09-10 16:26:32');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (14,'JOB-DISK-USAGE-UPDATING-PERIODIC','10000','2019-10-23 11:22:06','2019-10-22 16:46:50');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (15,'TASK-ENABLE-DISK-CLEANUP','0','2019-10-24 14:36:52','2019-10-22 21:37:09');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (29,'JOB-CLEAN-STALE-FILES','true','2020-10-26 13:34:54','2020-10-26 13:22:27');
INSERT INTO `config` (`id`,`name`,`value`,`last_modified_time`,`creation_time`) VALUES (30,'SCHEDULER-PATTERN','DEFAULT','2021-12-27 08:00:00','2021-12-27 08:00:00');
