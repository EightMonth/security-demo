DROP TABLE IF EXISTS `clientdetails`;
DROP TABLE IF EXISTS `oauth_access_token`;
DROP TABLE IF EXISTS `oauth_approvals`;
DROP TABLE IF EXISTS `oauth_client_details`;
DROP TABLE IF EXISTS `oauth_client_token`;
DROP TABLE IF EXISTS `oauth_refresh_token`;

CREATE TABLE `clientdetails` (
  `appId` VARCHAR(128) NOT NULL,
  `resourceIds` VARCHAR(256) DEFAULT NULL,
  `appSecret` VARCHAR(256) DEFAULT NULL,
  `scope` VARCHAR(256) DEFAULT NULL,
  `grantTypes` VARCHAR(256) DEFAULT NULL,
  `redirectUrl` VARCHAR(256) DEFAULT NULL,
  `authorities` VARCHAR(256) DEFAULT NULL,
  `access_token_validity` INT(11) DEFAULT NULL,
  `refresh_token_validity` INT(11) DEFAULT NULL,
  `additionalInformation` VARCHAR(4096) DEFAULT NULL,
  `autoApproveScopes` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE `oauth_access_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication_id` VARCHAR(128) NOT NULL,
  `user_name` VARCHAR(256) DEFAULT NULL,
  `client_id` VARCHAR(256) DEFAULT NULL,
  `authentication` BLOB,
  `refresh_token` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `oauth_approvals` (
  `userId` VARCHAR(256) DEFAULT NULL,
  `clientId` VARCHAR(256) DEFAULT NULL,
  `scope` VARCHAR(256) DEFAULT NULL,
  `status` VARCHAR(10) DEFAULT NULL,
  `expiresAt` DATETIME DEFAULT NULL,
  `lastModifiedAt` DATETIME DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `oauth_client_details` (
  `client_id` VARCHAR(128) NOT NULL,
  `resource_ids` VARCHAR(256) DEFAULT NULL,
  `client_secret` VARCHAR(256) DEFAULT NULL,
  `scope` VARCHAR(256) DEFAULT NULL,
  `authorized_grant_types` VARCHAR(256) DEFAULT NULL,
  `web_server_redirect_uri` VARCHAR(256) DEFAULT NULL,
  `authorities` VARCHAR(256) DEFAULT NULL,
  `access_token_validity` INT(11) DEFAULT NULL,
  `refresh_token_validity` INT(11) DEFAULT NULL,
  `additional_information` VARCHAR(4096) DEFAULT NULL,
  `autoapprove` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `oauth_client_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication_id` VARCHAR(128) NOT NULL,
  `user_name` VARCHAR(256) DEFAULT NULL,
  `client_id` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` VARCHAR(256) DEFAULT NULL,
  `authentication` BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `oauth_refresh_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication` BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `oauth_client_details` VALUES ('dev', '', 'dev', 'app', 'password,client_credentials,authorization_code,refresh_token', 'http://www.baidu.com', '', 3600, 3600, '{\"country\":\"CN\",\"country_code\":\"086\"}', 'false');

DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `role`;
DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `role_permission`;
DROP TABLE IF EXISTS `permission`;

CREATE TABLE `user` (
`id` BIGINT(11) NOT NULL AUTO_INCREMENT,
`username` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);
CREATE TABLE `role` (
`id` BIGINT(11) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);
CREATE TABLE `user_role` (
`user_id` BIGINT(11) NOT NULL,
`role_id` BIGINT(11) NOT NULL
);
CREATE TABLE `role_permission` (
`role_id` BIGINT(11) NOT NULL,
`permission_id` BIGINT(11) NOT NULL
);
CREATE TABLE `permission` (
`id` BIGINT(11) NOT NULL AUTO_INCREMENT,
`url` VARCHAR(255) NOT NULL,
`name` VARCHAR(255) NOT NULL,
`description` VARCHAR(255) NULL,
`pid` BIGINT(11) NOT NULL,
PRIMARY KEY (`id`)
);

INSERT INTO USER (id, username, PASSWORD) VALUES (1,'user','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USER (id, username , PASSWORD) VALUES (2,'admin','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO role (id, NAME) VALUES (1,'USER');
INSERT INTO role (id, NAME) VALUES (2,'ADMIN');
INSERT INTO permission (id, url, NAME, pid) VALUES (1,'/**','',0);
INSERT INTO permission (id, url, NAME, pid) VALUES (2,'/**','',0);
INSERT INTO user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO role_permission (role_id, permission_id) VALUES (1, 1);
INSERT INTO role_permission (role_id, permission_id) VALUES (2, 2);
