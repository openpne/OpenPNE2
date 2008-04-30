/*!40101 SET NAMES utf8 */;
CREATE TABLE `c_config_decoration` (
  `c_config_decoration_id` int(11) NOT NULL auto_increment,
  `tagname` text NOT NULL,
  `caption` text NOT NULL,
  `sample` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_config_decoration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `c_config_decoration` VALUES (NULL,'op:b','太字','<strong>表示例</strong>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:u','下線','<ins>表示例</ins>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:s','取り消し線','<del>表示例</del>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:i','斜体','<em>表示例</em>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:large','大きめの文字','<span style="font-size:20px;">表示例</span>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:small','小さめの文字','<span style="font-size:8px;">表示例</span>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:color','文字色指定','<span style="color:#33F864;">表示例</span>',1);

INSERT IGNORE INTO `c_admin_config` VALUES (NULL,'OPENPNE_USE_DECORATION',1);

