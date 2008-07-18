/*!40101 SET NAMES utf8 */;

UPDATE `c_review_category` SET `category` = 'Books' WHERE `category` = 'books-jp';
UPDATE `c_review_category` SET `category` = 'ForeignBooks' WHERE `category` = 'books-us';
UPDATE `c_review_category` SET `category` = 'Music' WHERE `category` = 'music-jp';
UPDATE `c_review_category` SET `category` = 'Classical' WHERE `category` = 'classical-jp';
UPDATE `c_review_category` SET `category` = 'DVD' WHERE `category` = 'dvd-jp';
UPDATE `c_review_category` SET `category` = 'VideoGames' WHERE `category` = 'videogames-jp';
UPDATE `c_review_category` SET `category` = 'Software' WHERE `category` = 'software-jp';
UPDATE `c_review_category` SET `category` = 'Electronics' WHERE `category` = 'electronics-jp';
UPDATE `c_review_category` SET `category` = 'Kitchen' WHERE `category` = 'kitchen-jp';
UPDATE `c_review_category` SET `category` = 'Toys' WHERE `category` = 'toys-jp';
UPDATE `c_review_category` SET `category` = 'SportingGoods' WHERE `category` = 'sporting-goods-jp';
UPDATE `c_review_category` SET `category` = 'HealthPersonalCare' WHERE `category` = 'hpc-jp';
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Watches','時計',13);
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Baby','ベビー＆マタニティ',14);
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Apparel','アパレル＆シューズ',15);
