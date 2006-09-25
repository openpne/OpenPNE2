ALTER TABLE `c_commu` ADD `is_display_map` BOOL NOT NULL,
ADD `map_latitude` DOUBLE NOT NULL ,
ADD `map_longitude` DOUBLE NOT NULL ,
ADD `map_zoom` INT NOT NULL ;

ALTER TABLE `c_profile_pref` ADD `map_latitude` DOUBLE NOT NULL ,
ADD `map_longitude` DOUBLE NOT NULL ,
ADD `map_zoom` INT NOT NULL ;

UPDATE c_profile_pref SET map_latitude = '43.068612', map_longitude = '141.350768', map_zoom = 7 WHERE c_profile_pref_id = 1;
UPDATE c_profile_pref SET map_latitude = '40.828668', map_longitude = '140.734738', map_zoom = 7 WHERE c_profile_pref_id = 2;
UPDATE c_profile_pref SET map_latitude = '39.701547', map_longitude = '141.136599', map_zoom = 7 WHERE c_profile_pref_id = 3;
UPDATE c_profile_pref SET map_latitude = '38.260027', map_longitude = '140.882158', map_zoom = 7 WHERE c_profile_pref_id = 4;
UPDATE c_profile_pref SET map_latitude = '39.716748', map_longitude = '140.129931', map_zoom = 7 WHERE c_profile_pref_id = 5;
UPDATE c_profile_pref SET map_latitude = '38.248098', map_longitude = '140.327253', map_zoom = 7 WHERE c_profile_pref_id = 6;
UPDATE c_profile_pref SET map_latitude = '37.754123', map_longitude = '140.45968', map_zoom = 7 WHERE c_profile_pref_id = 7;
UPDATE c_profile_pref SET map_latitude = '36.370911', map_longitude = '140.47676', map_zoom = 7 WHERE c_profile_pref_id = 8;
UPDATE c_profile_pref SET map_latitude = '36.559246', map_longitude = '139.898389', map_zoom = 7 WHERE c_profile_pref_id = 9;
UPDATE c_profile_pref SET map_latitude = '36.383399', map_longitude = '139.072833', map_zoom = 7 WHERE c_profile_pref_id = 10;
UPDATE c_profile_pref SET map_latitude = '35.906439', map_longitude = '139.62405', map_zoom = 7 WHERE c_profile_pref_id = 11;
UPDATE c_profile_pref SET map_latitude = '35.613425', map_longitude = '140.112837', map_zoom = 7 WHERE c_profile_pref_id = 12;
UPDATE c_profile_pref SET map_latitude = '35.681391', map_longitude = '139.766103', map_zoom = 7 WHERE c_profile_pref_id = 13;
UPDATE c_profile_pref SET map_latitude = '35.465941', map_longitude = '139.622847', map_zoom = 7 WHERE c_profile_pref_id = 14;
UPDATE c_profile_pref SET map_latitude = '35.667054', map_longitude = '138.569015', map_zoom = 7 WHERE c_profile_pref_id = 19;
UPDATE c_profile_pref SET map_latitude = '36.643307', map_longitude = '138.189101', map_zoom = 7 WHERE c_profile_pref_id = 20;
UPDATE c_profile_pref SET map_latitude = '37.912299', map_longitude = '139.060869', map_zoom = 7 WHERE c_profile_pref_id = 15;
UPDATE c_profile_pref SET map_latitude = '36.701384', map_longitude = '137.213091', map_zoom = 7 WHERE c_profile_pref_id = 16;
UPDATE c_profile_pref SET map_latitude = '36.578117', map_longitude = '136.648166', map_zoom = 7 WHERE c_profile_pref_id = 17;
UPDATE c_profile_pref SET map_latitude = '36.061479', map_longitude = '136.223261', map_zoom = 7 WHERE c_profile_pref_id = 18;
UPDATE c_profile_pref SET map_latitude = '35.409967', map_longitude = '136.756324', map_zoom = 7 WHERE c_profile_pref_id = 21;
UPDATE c_profile_pref SET map_latitude = '34.971629', map_longitude = '138.388579', map_zoom = 7 WHERE c_profile_pref_id = 22;
UPDATE c_profile_pref SET map_latitude = '35.170694', map_longitude = '136.881637', map_zoom = 7 WHERE c_profile_pref_id = 23;
UPDATE c_profile_pref SET map_latitude = '34.734418', map_longitude = '136.510581', map_zoom = 7 WHERE c_profile_pref_id = 24;
UPDATE c_profile_pref SET map_latitude = '35.002997', map_longitude = '135.864651', map_zoom = 7 WHERE c_profile_pref_id = 25;
UPDATE c_profile_pref SET map_latitude = '34.985705', map_longitude = '135.758228', map_zoom = 7 WHERE c_profile_pref_id = 26;
UPDATE c_profile_pref SET map_latitude = '34.702398', map_longitude = '135.495188', map_zoom = 7 WHERE c_profile_pref_id = 27;
UPDATE c_profile_pref SET map_latitude = '34.679453', map_longitude = '135.178221', map_zoom = 7 WHERE c_profile_pref_id = 28;
UPDATE c_profile_pref SET map_latitude = '34.680482', map_longitude = '135.818935', map_zoom = 7 WHERE c_profile_pref_id = 29;
UPDATE c_profile_pref SET map_latitude = '34.232436', map_longitude = '135.191454', map_zoom = 7 WHERE c_profile_pref_id = 30;
UPDATE c_profile_pref SET map_latitude = '35.493953', map_longitude = '134.225901', map_zoom = 7 WHERE c_profile_pref_id = 31;
UPDATE c_profile_pref SET map_latitude = '35.463947', map_longitude = '133.063871', map_zoom = 7 WHERE c_profile_pref_id = 32;
UPDATE c_profile_pref SET map_latitude = '34.666572', map_longitude = '133.918552', map_zoom = 7 WHERE c_profile_pref_id = 33;
UPDATE c_profile_pref SET map_latitude = '34.397446', map_longitude = '132.475593', map_zoom = 7 WHERE c_profile_pref_id = 34;
UPDATE c_profile_pref SET map_latitude = '34.172649', map_longitude = '131.48061', map_zoom = 7 WHERE c_profile_pref_id = 35;
UPDATE c_profile_pref SET map_latitude = '34.074572', map_longitude = '134.551391', map_zoom = 7 WHERE c_profile_pref_id = 36;
UPDATE c_profile_pref SET map_latitude = '34.350754', map_longitude = '134.046821', map_zoom = 7 WHERE c_profile_pref_id = 37;
UPDATE c_profile_pref SET map_latitude = '33.839954', map_longitude = '132.751149', map_zoom = 7 WHERE c_profile_pref_id = 38;
UPDATE c_profile_pref SET map_latitude = '33.566758', map_longitude = '133.543522', map_zoom = 7 WHERE c_profile_pref_id = 39;
UPDATE c_profile_pref SET map_latitude = '33.590002', map_longitude = '130.420622', map_zoom = 7 WHERE c_profile_pref_id = 40;
UPDATE c_profile_pref SET map_latitude = '33.264212', map_longitude = '130.297608', map_zoom = 7 WHERE c_profile_pref_id = 41;
UPDATE c_profile_pref SET map_latitude = '32.753085', map_longitude = '129.870515', map_zoom = 7 WHERE c_profile_pref_id = 42;
UPDATE c_profile_pref SET map_latitude = '32.789207', map_longitude = '130.688499', map_zoom = 7 WHERE c_profile_pref_id = 43;
UPDATE c_profile_pref SET map_latitude = '33.232794', map_longitude = '131.606595', map_zoom = 7 WHERE c_profile_pref_id = 44;
UPDATE c_profile_pref SET map_latitude = '31.915323', map_longitude = '131.432083', map_zoom = 7 WHERE c_profile_pref_id = 45;
UPDATE c_profile_pref SET map_latitude = '31.602098', map_longitude = '130.564112', map_zoom = 7 WHERE c_profile_pref_id = 46;
UPDATE c_profile_pref SET map_latitude = '26.212401', map_longitude = '127.680932', map_zoom = 7 WHERE c_profile_pref_id = 47;
