INSERT INTO c_admin_config VALUES (NULL, 'SKIN_BG_11', 'C1C6CF');
INSERT INTO c_admin_config VALUES (NULL, 'SKIN_BG_12', 'FFFFFF');
INSERT INTO c_admin_config VALUES (NULL, 'SKIN_BG_13', 'E9EAF0');

-- --------------------------------------------------------

INSERT INTO c_commu_category VALUES (1,'地域',100,1);
INSERT INTO c_commu_category VALUES (2,'グルメ',200,1);
INSERT INTO c_commu_category VALUES (3,'スポーツ',300,1);

-- --------------------------------------------------------

INSERT INTO c_commu_category_parent VALUES (1,'コミュニティカテゴリ',1);

-- --------------------------------------------------------

INSERT INTO c_image VALUES (NULL, 'skin_no_image.gif', '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', NOW(), 'gif');
INSERT INTO c_image VALUES (NULL, 'skin_no_logo.gif', 'R0lGODlhtAC0APcAAMjJzsnL0Lu9wpWYnr7Axd7f5dXW23h8gsLEypqcore4vomMkqaoroWIjrGzuX2AhtPU2aqsspKVmoKGjMzN0rm7wI2QltDS1q2wteXm67K0ubq9wqyutM7O1NbX3KSmrNXW3IGEisTFy8fIzd/g5dPU2p6hptTV2sbHzNfY3tLT2M/Q19ja37S2vNHS16iqsMbIzubm687Q1JSXncrM0cDBxpCTmYiLkdDR1n+CiJyfpJiboczO1KSmqouOlLS2uo6Rl62vs4aJj/v7/N7g6eLk7N3f6N/h6re5xvDx9fr6/Pn5++Tm7e/w9O3u8+bn7t3f6fb2+fv8/fP09+Xn7vHy9vn6+/T1+O7v9ODi6uHi6+Hj6+bo7/f4+vj4+urr8XF1e+fo7+nq8OPl7PLz9vf3+uPk7OPl7fLy9vT09/r7/PX2+fj5+vX1+ODh6t/g6fb3+ejp7+fp7+vs8uXm7d7f6e7v8/r6++Tl7fLz9/X2+ODi6+Lk6/Pz9/Hx9d3e6Pj5+97g6uXm7vf3+e/w9eLj7OHj6uzt8uvs8ejp8Onr8efo7trb4dna4Ojq8OHi6ODh5+rr8OXm7N/g5ubn7Xd7gdvc4uPk6d3e5OLj6OTl69nZ3+Tm7Obo7tfY3ejp7tzd4+nq76KkquXn7djZ3qGkqebn7KKlquLj6ePk6uDh5qGjqefo7b2/xOTl6uHi5+Pl6+Tl6aOlq+Di6L2+xN7f5tvc4eTk6uTl7Nrb4Nzd4rq8wdnZ4NbX29jZ39/h59ze5OLk6eLk6uPk66GkquDh6Nnb4dna4X2Bh+Hj6JeaoN7g5t3e5drb4tvc43d6gKKkqc7P1d/g56CiqNbY3dzd5NjZ3dTV2d3e46Olqr2/xd3f5Z+ip9fY3KCjqNvd4+Pl6t7f47u+w6Omq9nZ3ry+w9LT13Z6gKCjqZ2gpYSHjauts7i6wJOWm5udo5+iqNrc4uPk6IyPlXd7gKmrsYiMkaepr6uutMHDyc/S2NfZ3tbY3K+xt3yAhZ2gptDR2CH5BAAAAAAALAAAAAC0ALQAQAj/AJEIHEiwoMGDCBMqXMiwocOHECNKVDikosWLGDNq3Mixo8ePIEOKHEmypEaBSlKqXMmypcuXMGPKnEmzps2bOHO6FLikp8+fQIMKHUq0qNGjSJMqXcq0qVCBXqJKnUq1qtWrWLNq3cq1q9evYMNaFQinrNmzaNOqXcu2rdu3cOPKnUu3rlqBbfLq3cu3r9+/gAMLHky4sOHDiBP7FTilsePHkCNLnky5suXLmDNr3sy5s2SBVUKLHk26tOnTqFOrXs26tevXsGObFkiotu3buHPr3s27t+/fwIMLH068uG6BdpIrX868ufPn0KNLn069uvXr2LM7F3iou/fukWLJ/wMz40I3XapevSKRy0ArMJUgsPpk6xkYDtfIhXuVaX2uXgRUAoYIrMSQCxhgKADGAq+E8t0h4X0ARg8NgNEKCbbUA0YQD1TiCSsPIhIDPmDYkAAYp2CjyzhgEHAJIg96FwM5CLKgyoFC1DABGAiYAqN3oahyCoq6rNiiKhlc8ooqqoRDjoLc9IINk6pkEksmjQQIBg2s/AhhDBiAMQEF2PgYo0BfpKnmIpOEuQAolKgpp5pixOFKI0CA8QIkccw55yUIgDGPCi4g6AkkoFQAhjKQLHKJA2C408gkjWgoACiVgiFAAZhEUwkymFCiCQ9ielAAKKWAUQojjAxJyyN9+v/5hSukiLlJAY0syIgkX4ihiSUU7LhLJqiqyqqrsMoZxyO0oFjAIrKqGcclnpiQICOaiBGtnAIl4u2334ZBxyPNnPBPNNEogEA0K5TAizS4hOFtGLgUc0wJK0QDgLroquBLLcPIiwszIKTADC7eDlONCgKscEwq8tIhjS8gOFNMLRQ7A3EiEpeADwApPPJEIk88cgwIx4hMrzS84Ksvvx2UkALA8g7DTAAz0wFuuKkc848IM9fCSwAayxsuKs0gwEsxI++88xPF8IJAM6gY7fTOAj2h9dZcd+3112CHLfbYZJdt9tlop6321wIx4fbbcMct99x012333XjnrffefPf/7ffcAhUh+OCEF2744YgnrvjijDfu+OOQRy754QJpYfnlmGeu+eacd+7556CHLvropJdu+uYCHaH66qy37vrrsMcu++y012777bjnrvvrAhHh++/ABy/88MQXb/zxyCev/PLMN+/88AIZIf301Fdv/fXYZ6/99tx37/334Icv/vUCZWH++einr/767Lfv/vvwxy///PTXb//6AsWh//789+///wAMoAAHSMACGvCACEygAv8nECk48IEQjKAEJ0jBClrwghjMoAY3yMEOenCCAjGJCEdIwhKa8IQmFMgdVsjCFrrwhTCM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', NOW(), 'gif');
INSERT INTO c_image VALUES (NULL, 'skin_no_logo_small.gif', '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', NOW(), 'gif');

-- --------------------------------------------------------

INSERT INTO c_member VALUES (1,'OpenPNE君',0,1,1,'private','','','','',NOW(),NOW(),'',0,1,1,1,0,1,'public',0,0,0);

-- --------------------------------------------------------

INSERT INTO c_password_query VALUES (1,'母または父の旧姓は?');
INSERT INTO c_password_query VALUES (2,'運転免許証番号の下 5 桁は?');
INSERT INTO c_password_query VALUES (3,'初恋の人の名前は?');
INSERT INTO c_password_query VALUES (4,'卒業した小学校の名前は？');
INSERT INTO c_password_query VALUES (5,'本籍地の県名は？');

INSERT INTO c_profile VALUES (1,'sex','性別',0,0,'public','select',200,0,1,1,'string','',0,0);
INSERT INTO c_profile VALUES (2,'blood_type','血液型',0,1,'public','select',300,0,1,1,'string','',0,0);
INSERT INTO c_profile VALUES (3,'pre_addr_pref','現住所',0,1,'public','select',400,0,1,1,'string','',0,0);
INSERT INTO c_profile VALUES (4,'old_addr_pref','出身地',0,1,'public','select',500,0,1,1,'string','',0,0);
INSERT INTO c_profile VALUES (5,'self_intro','自己紹介',0,0,'public','textarea',600,0,1,1,'string','',0,0);

-- --------------------------------------------------------

INSERT INTO c_profile_option VALUES (1,1,'男性',1);
INSERT INTO c_profile_option VALUES (2,1,'女性',2);
INSERT INTO c_profile_option VALUES (3,2,'A',1);
INSERT INTO c_profile_option VALUES (4,2,'B',2);
INSERT INTO c_profile_option VALUES (5,2,'O',3);
INSERT INTO c_profile_option VALUES (6,2,'AB',4);
INSERT INTO c_profile_option VALUES (7,3,'北海道',1);
INSERT INTO c_profile_option VALUES (8,3,'青森県',2);
INSERT INTO c_profile_option VALUES (9,3,'岩手県',3);
INSERT INTO c_profile_option VALUES (10,3,'宮城県',4);
INSERT INTO c_profile_option VALUES (11,3,'秋田県',5);
INSERT INTO c_profile_option VALUES (12,3,'山形県',6);
INSERT INTO c_profile_option VALUES (13,3,'福島県',7);
INSERT INTO c_profile_option VALUES (14,3,'茨城県',8);
INSERT INTO c_profile_option VALUES (15,3,'栃木県',9);
INSERT INTO c_profile_option VALUES (16,3,'群馬県',10);
INSERT INTO c_profile_option VALUES (17,3,'埼玉県',11);
INSERT INTO c_profile_option VALUES (18,3,'千葉県',12);
INSERT INTO c_profile_option VALUES (19,3,'東京都',13);
INSERT INTO c_profile_option VALUES (20,3,'神奈川県',14);
INSERT INTO c_profile_option VALUES (21,3,'新潟県',15);
INSERT INTO c_profile_option VALUES (22,3,'富山県',16);
INSERT INTO c_profile_option VALUES (23,3,'石川県',17);
INSERT INTO c_profile_option VALUES (24,3,'福井県',18);
INSERT INTO c_profile_option VALUES (25,3,'山梨県',19);
INSERT INTO c_profile_option VALUES (26,3,'長野県',20);
INSERT INTO c_profile_option VALUES (27,3,'岐阜県',21);
INSERT INTO c_profile_option VALUES (28,3,'静岡県',22);
INSERT INTO c_profile_option VALUES (29,3,'愛知県',23);
INSERT INTO c_profile_option VALUES (30,3,'三重県',24);
INSERT INTO c_profile_option VALUES (31,3,'滋賀県',25);
INSERT INTO c_profile_option VALUES (32,3,'京都府',26);
INSERT INTO c_profile_option VALUES (33,3,'大阪府',27);
INSERT INTO c_profile_option VALUES (34,3,'兵庫県',28);
INSERT INTO c_profile_option VALUES (35,3,'奈良県',29);
INSERT INTO c_profile_option VALUES (36,3,'和歌山県',30);
INSERT INTO c_profile_option VALUES (37,3,'鳥取県',31);
INSERT INTO c_profile_option VALUES (38,3,'島根県',32);
INSERT INTO c_profile_option VALUES (39,3,'岡山県',33);
INSERT INTO c_profile_option VALUES (40,3,'広島県',34);
INSERT INTO c_profile_option VALUES (41,3,'山口県',35);
INSERT INTO c_profile_option VALUES (42,3,'徳島県',36);
INSERT INTO c_profile_option VALUES (43,3,'香川県',37);
INSERT INTO c_profile_option VALUES (44,3,'愛媛県',38);
INSERT INTO c_profile_option VALUES (45,3,'高知県',39);
INSERT INTO c_profile_option VALUES (46,3,'福岡県',40);
INSERT INTO c_profile_option VALUES (47,3,'佐賀県',41);
INSERT INTO c_profile_option VALUES (48,3,'長崎県',42);
INSERT INTO c_profile_option VALUES (49,3,'熊本県',43);
INSERT INTO c_profile_option VALUES (50,3,'大分県',44);
INSERT INTO c_profile_option VALUES (51,3,'宮崎県',45);
INSERT INTO c_profile_option VALUES (52,3,'鹿児島県',46);
INSERT INTO c_profile_option VALUES (53,3,'沖縄県',47);
INSERT INTO c_profile_option VALUES (54,3,'その他',48);
INSERT INTO c_profile_option VALUES (55,4,'北海道',1);
INSERT INTO c_profile_option VALUES (56,4,'青森県',2);
INSERT INTO c_profile_option VALUES (57,4,'岩手県',3);
INSERT INTO c_profile_option VALUES (58,4,'宮城県',4);
INSERT INTO c_profile_option VALUES (59,4,'秋田県',5);
INSERT INTO c_profile_option VALUES (60,4,'山形県',6);
INSERT INTO c_profile_option VALUES (61,4,'福島県',7);
INSERT INTO c_profile_option VALUES (62,4,'茨城県',8);
INSERT INTO c_profile_option VALUES (63,4,'栃木県',9);
INSERT INTO c_profile_option VALUES (64,4,'群馬県',10);
INSERT INTO c_profile_option VALUES (65,4,'埼玉県',11);
INSERT INTO c_profile_option VALUES (66,4,'千葉県',12);
INSERT INTO c_profile_option VALUES (67,4,'東京都',13);
INSERT INTO c_profile_option VALUES (68,4,'神奈川県',14);
INSERT INTO c_profile_option VALUES (69,4,'新潟県',15);
INSERT INTO c_profile_option VALUES (70,4,'富山県',16);
INSERT INTO c_profile_option VALUES (71,4,'石川県',17);
INSERT INTO c_profile_option VALUES (72,4,'福井県',18);
INSERT INTO c_profile_option VALUES (73,4,'山梨県',19);
INSERT INTO c_profile_option VALUES (74,4,'長野県',20);
INSERT INTO c_profile_option VALUES (75,4,'岐阜県',21);
INSERT INTO c_profile_option VALUES (76,4,'静岡県',22);
INSERT INTO c_profile_option VALUES (77,4,'愛知県',23);
INSERT INTO c_profile_option VALUES (78,4,'三重県',24);
INSERT INTO c_profile_option VALUES (79,4,'滋賀県',25);
INSERT INTO c_profile_option VALUES (80,4,'京都府',26);
INSERT INTO c_profile_option VALUES (81,4,'大阪府',27);
INSERT INTO c_profile_option VALUES (82,4,'兵庫県',28);
INSERT INTO c_profile_option VALUES (83,4,'奈良県',29);
INSERT INTO c_profile_option VALUES (84,4,'和歌山県',30);
INSERT INTO c_profile_option VALUES (85,4,'鳥取県',31);
INSERT INTO c_profile_option VALUES (86,4,'島根県',32);
INSERT INTO c_profile_option VALUES (87,4,'岡山県',33);
INSERT INTO c_profile_option VALUES (88,4,'広島県',34);
INSERT INTO c_profile_option VALUES (89,4,'山口県',35);
INSERT INTO c_profile_option VALUES (90,4,'徳島県',36);
INSERT INTO c_profile_option VALUES (91,4,'香川県',37);
INSERT INTO c_profile_option VALUES (92,4,'愛媛県',38);
INSERT INTO c_profile_option VALUES (93,4,'高知県',39);
INSERT INTO c_profile_option VALUES (94,4,'福岡県',40);
INSERT INTO c_profile_option VALUES (95,4,'佐賀県',41);
INSERT INTO c_profile_option VALUES (96,4,'長崎県',42);
INSERT INTO c_profile_option VALUES (97,4,'熊本県',43);
INSERT INTO c_profile_option VALUES (98,4,'大分県',44);
INSERT INTO c_profile_option VALUES (99,4,'宮崎県',45);
INSERT INTO c_profile_option VALUES (100,4,'鹿児島県',46);
INSERT INTO c_profile_option VALUES (101,4,'沖縄県',47);
INSERT INTO c_profile_option VALUES (102,4,'その他',48);

-- --------------------------------------------------------

INSERT INTO c_profile_pref VALUES (1,'北海道',1);
INSERT INTO c_profile_pref VALUES (2,'青森県',2);
INSERT INTO c_profile_pref VALUES (3,'岩手県',3);
INSERT INTO c_profile_pref VALUES (4,'宮城県',4);
INSERT INTO c_profile_pref VALUES (5,'秋田県',5);
INSERT INTO c_profile_pref VALUES (6,'山形県',6);
INSERT INTO c_profile_pref VALUES (7,'福島県',7);
INSERT INTO c_profile_pref VALUES (8,'茨城県',8);
INSERT INTO c_profile_pref VALUES (9,'栃木県',9);
INSERT INTO c_profile_pref VALUES (10,'群馬県',10);
INSERT INTO c_profile_pref VALUES (11,'埼玉県',11);
INSERT INTO c_profile_pref VALUES (12,'千葉県',12);
INSERT INTO c_profile_pref VALUES (13,'東京都',13);
INSERT INTO c_profile_pref VALUES (14,'神奈川県',14);
INSERT INTO c_profile_pref VALUES (15,'新潟県',15);
INSERT INTO c_profile_pref VALUES (16,'富山県',16);
INSERT INTO c_profile_pref VALUES (17,'石川県',17);
INSERT INTO c_profile_pref VALUES (18,'福井県',18);
INSERT INTO c_profile_pref VALUES (19,'山梨県',19);
INSERT INTO c_profile_pref VALUES (20,'長野県',20);
INSERT INTO c_profile_pref VALUES (21,'岐阜県',21);
INSERT INTO c_profile_pref VALUES (22,'静岡県',22);
INSERT INTO c_profile_pref VALUES (23,'愛知県',23);
INSERT INTO c_profile_pref VALUES (24,'三重県',24);
INSERT INTO c_profile_pref VALUES (25,'滋賀県',25);
INSERT INTO c_profile_pref VALUES (26,'京都府',26);
INSERT INTO c_profile_pref VALUES (27,'大阪府',27);
INSERT INTO c_profile_pref VALUES (28,'兵庫県',28);
INSERT INTO c_profile_pref VALUES (29,'奈良県',29);
INSERT INTO c_profile_pref VALUES (30,'和歌山県',30);
INSERT INTO c_profile_pref VALUES (31,'鳥取県',31);
INSERT INTO c_profile_pref VALUES (32,'島根県',32);
INSERT INTO c_profile_pref VALUES (33,'岡山県',33);
INSERT INTO c_profile_pref VALUES (34,'広島県',34);
INSERT INTO c_profile_pref VALUES (35,'山口県',35);
INSERT INTO c_profile_pref VALUES (36,'徳島県',36);
INSERT INTO c_profile_pref VALUES (37,'香川県',37);
INSERT INTO c_profile_pref VALUES (38,'愛媛県',38);
INSERT INTO c_profile_pref VALUES (39,'高知県',39);
INSERT INTO c_profile_pref VALUES (40,'福岡県',40);
INSERT INTO c_profile_pref VALUES (41,'佐賀県',41);
INSERT INTO c_profile_pref VALUES (42,'長崎県',42);
INSERT INTO c_profile_pref VALUES (43,'熊本県',43);
INSERT INTO c_profile_pref VALUES (44,'大分県',44);
INSERT INTO c_profile_pref VALUES (45,'宮崎県',45);
INSERT INTO c_profile_pref VALUES (46,'鹿児島県',46);
INSERT INTO c_profile_pref VALUES (47,'沖縄県',47);
INSERT INTO c_profile_pref VALUES (50,'その他',50);

-- --------------------------------------------------------

INSERT INTO c_review_category VALUES (1,'books-jp','和書',1);
INSERT INTO c_review_category VALUES (2,'books-us','洋書',2);
INSERT INTO c_review_category VALUES (3,'music-jp','CDポピュラー',3);
INSERT INTO c_review_category VALUES (4,'classical-jp','CDクラシック',4);
INSERT INTO c_review_category VALUES (5,'dvd-jp','DVD',5);
INSERT INTO c_review_category VALUES (6,'videogames-jp','ゲーム',6);
INSERT INTO c_review_category VALUES (7,'software-jp','ソフトウェア',7);
INSERT INTO c_review_category VALUES (8,'electronics-jp','エレクトロニクス',8);
INSERT INTO c_review_category VALUES (9,'kitchen-jp','キッチン',9);
INSERT INTO c_review_category VALUES (10,'toys-jp','おもちゃ＆ホビー',10);
INSERT INTO c_review_category VALUES (11,'sporting-goods-jp','スポーツ',11);

-- --------------------------------------------------------

INSERT INTO c_siteadmin VALUES (1,'inc_page_footer_before','<a href=\"?m=pc&a=page_o_sns_kiyaku\" target=\"_blank\">利用規約</a> <a href=\"?m=pc&a=page_o_sns_privacy\" target=\"_blank\">プライバシーポリシー</a> <a href=\"http://blog.livedoor.jp/tejimaya_news/archives/2004-01.html\" target=\"_blank\">OpenPNEとは</a>',NOW());
INSERT INTO c_siteadmin VALUES (2,'inc_page_footer_after','<a href=\"?m=pc&a=page_o_sns_kiyaku\" target=\"_blank\">利用規約</a> <a href=\"?m=pc&a=page_o_sns_privacy\" target=\"_blank\">プライバシーポリシー</a>',NOW());
INSERT INTO c_siteadmin VALUES (3,'inc_custom_css','/**フォント色変更**/\n\n/*リンク関連*/\na:link    { color: #026CD1; }\na:visited { color: #004A95; }\na:hover   { color: #76AFE6; }\na:active  { color: #76AFE6; }\n\n/*コンテンツ見出しlv1*/\ntd.bg_06 span.b_b,\n.c_00 { color: #222222; }\n\n/*コンテンツ見出しlv2*/\n.c_01 { color: #444444; }\n\n/*強調文字暖色*/\n.c_02 { color: #D92C49; }\n\n/*強調文字寒色*/\n.c_03 { color: #2C65D9; }\n\n/*その他文字色*/\nbody { color: #000000; }', NOW());

-- --------------------------------------------------------

INSERT INTO c_skin_filename (skinname, filename) VALUES
 ('no_image', 'skin_no_image.gif'),
 ('no_logo', 'skin_no_logo.gif'),
 ('no_logo_small', 'skin_no_logo_small.gif');

-- --------------------------------------------------------

INSERT INTO c_sns_config VALUES (1,'default','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','B7B9C6','FFFFFF','B7B9C6','B7B9C6','FFFFFF','FFFFFF','B7B9C6');
