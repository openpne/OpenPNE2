/*!40101 SET NAMES utf8 */;

UPDATE `c_action` SET name = '入会する' WHERE c_action_id = 1;
UPDATE `c_action` SET name = '自分の日記にコメントされる' WHERE c_action_id = 2;
UPDATE `c_action` SET name = '他人の日記にコメントする' WHERE c_action_id = 3;
UPDATE `c_action` SET name = '日記を書く' WHERE c_action_id = 4;
UPDATE `c_action` SET name = 'マイフレンドの紹介文を書く' WHERE c_action_id = 5;
UPDATE `c_action` SET name = 'レビューを書く' WHERE c_action_id = 6;
UPDATE `c_action` SET name = '友人を招待する' WHERE c_action_id = 7;
UPDATE `c_action` SET name = 'マイフレンドにメンバーを紹介する' WHERE c_action_id = 8;
INSERT INTO `c_action` VALUES (9,'コミュニティにトピックを作成する',0);
INSERT INTO `c_action` VALUES (10,'コミュニティにイベントを作成する',0);
INSERT INTO `c_action` VALUES (11,'コミュニティのトピック・イベントにコメントする',0);
