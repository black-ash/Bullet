
ALTER TABLE `t_device_online` ADD COLUMN `intranetIp` varchar(30) COMMENT '内网IP' AFTER `status`;

ALTER TABLE `t_device_mapping`
ADD COLUMN `hostname`  varchar(255) NULL AFTER `remote_port`;

ALTER TABLE `t_device_mapping`
ADD COLUMN `bind_tls`  int(1) NULL AFTER `hostname`;




ALTER TABLE `t_device_online` CHANGE COLUMN `deviceId` `deviceNo` varchar(255) NOT NULL COMMENT '设备编号';
ALTER TABLE `t_device_online` ADD COLUMN `mac_addr` varchar(20) COMMENT 'Mac地址' AFTER `intranetIp`;
ALTER TABLE  `t_device_online` CHANGE COLUMN `intranetIp` `intranetIp` varchar(100) DEFAULT NULL COMMENT '内网IP';
ALTER TABLE  `t_device` ADD COLUMN `mac_addr` varchar(20) COMMENT 'mac地址' AFTER `intranetIp`;


ALTER TABLE `t_device` CHANGE COLUMN `intranetIp` `intranet_ip` varchar(30) DEFAULT NULL COMMENT '内网IP';



ALTER TABLE `t_user` ADD COLUMN `icon` varchar(255) COMMENT '头像' AFTER `agree`;
ALTER TABLE `t_device_mapping` ADD COLUMN `status` int COMMENT '映射状态 （1、启用；0、停用)' AFTER `tls_key`, AUTO_INCREMENT=6;
update t_device_mapping set status = 1;


-- 2019年11月17日 marker  新增基础认证
ALTER TABLE `t_device_mapping` ADD COLUMN `auth` varchar(100) COMMENT '基础认证' AFTER `status`;

-- 2019年12月24日 marker 新增登录时间字段
ALTER TABLE `t_user` ADD COLUMN `loginTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间' AFTER `icon`;

ALTER TABLE `t_user` ADD COLUMN `balance` decimal(10,2) DEFAULT 0 COMMENT '余额' AFTER `loginTime`;


-- 2019年12月25日 marker 新增服务通道表
ALTER TABLE `t_device_mapping` ADD COLUMN `server_tunnel_id` bigint COMMENT '服务通道ID' AFTER `auth`;
update t_device_mapping set server_tunnel_id = 1;


-- 2020年1月14日 marker 新增domain_id

ALTER TABLE `t_device_mapping` ADD COLUMN `domain_id` bigint COMMENT '域名ID' AFTER `server_tunnel_id`;

-- 2020年1月15日 marker 新增设备通道
ALTER TABLE `t_device` ADD COLUMN `server_tunnel_id` bigint NOT NULL COMMENT '设备通道' AFTER `mac_addr`;

-- 2020年3月17日 marker server_tunnel_id 设置默认值1
ALTER TABLE `t_device` CHANGE COLUMN `server_tunnel_id` `server_tunnel_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '设备通道';


-- 2020年3月18日 marker 新注册的用户，创建时间默认
ALTER TABLE `t_sys_users` CHANGE COLUMN `created_time` `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', CHANGE COLUMN `updated_time` `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间';
-- 2020年3月18日 marker 新增注册激活码
ALTER TABLE `t_sys_users` ADD COLUMN `activate_code` varchar(50) COMMENT '激活码' AFTER `updated_by`;

-- 2020年6月25日 marker 新增设备秘钥，提高安全性
ALTER TABLE `t_device`
ADD COLUMN `device_secret` varchar(100) NULL COMMENT '设备秘钥' AFTER `server_tunnel_id`;


-- 2019年6月4日 (线上已更新)



