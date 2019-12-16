-- Adminer 4.2.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_1` int(11) NOT NULL,
  `friend_2` int(11) NOT NULL,
  `state` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `team` (`id`, `title`, `description`) VALUES
(1,	'admin',	'administrator');

DROP TABLE IF EXISTS `team_members`;
CREATE TABLE `team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidder` int(11) NOT NULL,
  `invited` int(11) NOT NULL,
  `state` int(2) NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `team_members` (`id`, `bidder`, `invited`, `state`, `level`) VALUES
(1,	0,	1,	1,	0);

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `token` (`id`, `user_id`, `token`, `email`, `created_at`) VALUES
(1,	0,	'mXob9eR0zfRz0l_dkC1febCQEUBxM87R',	'admin@google.com',	1445774708),
(2,	0,	'N-TIVS-VH6kCVZ5L3B996fF4T-Y48tCx',	'andrew@ukr.net',	1445975231),
(3,	0,	'opEb-965UD36fIzJXS4fIFUJ1E7Ku4_6',	'admin@google.com',	1445975314),
(4,	0,	'xRa8y5eROfStI8BszwWELqZcA0exhmDp',	'dow@nas.com',	1445975434),
(5,	1,	'sdfsdf',	'1@h.h',	1479555396),
(6,	1,	'66IWV183nu-pIGS5Z9G8bQJ3v4N_5LKj',	'1@h.h',	1479555602),
(7,	1,	'_fzqThOVuj8l6rmyWqMikMZfhMbGkEKU',	'1@h.h1',	1479555821),
(8,	1,	'0Y_mqqYWA5TwKIYEiW9hAEzUjFQdx_mi',	'1@h.h2',	1479555838),
(9,	1,	'ov855ZfhokpwHj7yxcgreInYex6M2ZEX',	'1@h.h3',	1479555888),
(10,	1,	'Ashbx5dyrO2kqMQ0ruxrGT4GJlyHuIkL',	'1@h.h4',	1479555957),
(11,	1,	'JKa8Ko8VpzBTuDEyrsG2O1LYMgagq6aa',	'1@h.h4',	1479556076),
(12,	1,	'bk8HmQaNB8khVIuMHeJpKKAn8We11LTG',	'1@h.h4',	1479556139),
(13,	1,	'ElSVTCOa-bZgjhbzBuIgr5tPRBsuggbZ',	'1@h.h4',	1479556319),
(14,	1,	'i6KHJPNjioVS0N0OAzPZQhD9dkZO4Cmj',	'1@h.h4',	1479556348),
(15,	1,	'xhIEPkwmU8nRWxC_lNAkY9emGusLLO2b',	'1@h.h4',	1479556411),
(16,	1,	'uTT55N59qlPVtBjZE3UzLnoaz12Xw1lo',	'1@h.h4',	1479556634),
(17,	1,	'VXaavFEnasKdHxwddpFzL_KXN1fvVLV1',	'1@h.h4',	1479557027),
(18,	1,	'bOfj5OWGm8xMfeYNSjeFxEQHf8HPEwmn',	'1@h.h4',	1479557151),
(19,	1,	'eKRj_crk_mBQ9rzRxAsnfYF9TLg5Udie',	'1@h.h4',	1479557317),
(20,	1,	'_DuIoNXlG2WQVI7pghXlZtmskEJLppnr',	'1@h.h4',	1479557499),
(21,	1,	'1GCzIaQTpYGa24gb1NEyniCkr5DJTzwj',	'1@h.h4',	1479557537),
(22,	1,	'vWp37SSCCBF6ZPs_qcwk7Vj5owhh_qSq',	'1@h.h4',	1479557572),
(23,	1,	'kCfYHJKT0fuqU05q-gZElhb7SxWeZJ-j',	'1@h.h5',	1479557589),
(24,	1,	'gPJh6Us9ek6fmwY6GbE_AUDeaPx9iwjA',	'1@h.h6',	1479558200),
(25,	1,	'BRhkNY74TQ7ZR65MfQE5OvMssgeYApQ_',	'1@h.h6',	1479641818),
(26,	5,	'golQ0xDrvtNNySvRiTZETUYm7yXxrPPC',	'user1@fg.hi',	1479648615),
(27,	5,	'9rFjjJUCBH31TSFKZyXJEWZZRQB_CRHy',	'user2@fg.hi',	1479649030),
(28,	6,	'fTi0C31EXx0Mk4ZBY2m9QqVlGJaoHLUB',	'user12@dsf.fg',	1479649652),
(29,	7,	'tMSuAC7pdUH5wjIWKAOuSm8zrKNAlwIM',	'161122@dfg.dfgdfsg',	1479803940),
(30,	7,	'mB47sRvCvyOANf54-DKK7JjRsyl-oO8J',	'1962211@dfsd.sdf',	1479826227),
(31,	1,	'dHaSxz1piVhK6KjS3wyWmnKQzQ_LFzoz',	'221120162016@dsf.fdes',	1479829843);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `password_reset_token` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `patronymic_name` varchar(64) DEFAULT NULL,
  `phone_mobile` varchar(64) DEFAULT NULL,
  `token_id` int(11) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `about` varchar(256) DEFAULT NULL,
  `webmoney` varchar(32) DEFAULT NULL,
  `skype` varchar(32) DEFAULT NULL,
  `date_of_birth` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `purse` varchar(64) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `first_name`, `last_name`, `patronymic_name`, `phone_mobile`, `token_id`, `country`, `city`, `about`, `webmoney`, `skype`, `date_of_birth`, `gender`, `purse`, `photo`) VALUES
(1,	'admin',	'iIdThSS1opgobUjVcuQJD3j-uk76J32R',	'$2y$13$hbC6oBlRvevLaVTz/O8ktePm3X6y1Dbe4DIS8ZJcfkLjW08y//N4e',	'',	'admin@google.com',	10,	1444729081,	1445975198,	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(2,	'guest',	'UzwGuWJy9X01qE9ckn__H-JKyzhJNJ06',	'$2y$13$zlPMYIT/HxeyKgl/ZjbCNu9Kly3chXlh4ghPZqK911KAbpKNzvoKe',	'',	'guest@i.ua',	10,	1444735401,	1444737742,	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(3,	'andrew',	'AS9O20wHoYAsFUwLdZ3nLH2-XJ8aNiuf',	'$2y$13$1f6nKzN0.Z4uRDnmNzDWx.YHCeYa7Lt0WHeK5lrJZDAaz4eob5/ne',	'',	'andrew@ukr.net',	10,	1445010554,	1445010554,	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(4,	'dow',	'adEYCF4_zRo5unu_QYZSesr59itzCVUM',	'$2y$13$MC/8fYJNpWjOF/4Ec41j0ui.NuPYSIRcEOQCUGvPBnNc6qfwk4Uwe',	'',	'dow@nas.com',	10,	1445975489,	1479741442,	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(6,	'User11',	'n5K3H6Anc5Z-4W4ve2otRajGpcWeDmTt',	'$2y$13$TVMmtwj16m3uNKFQYPnPZux7ErnDq364LmGDVBhCIl3S2A2vGF/bi',	'',	'User1@df.fdg',	10,	1479649150,	1479649150,	'User1',	'User1',	'User1',	'24546',	26,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(7,	'User12',	'l_QXjyYoPswgLj0VlorIy09E8qt03zKe',	'$2y$13$RQ0kSM4aNDcdHXgwt8zWUOTl4h6I7WguzvxYZ7Yda/gLghXZQeUwG',	'',	'User12@fgh.fgh',	10,	1479650391,	1479740476,	'User12',	'User12',	'User12',	'+456466',	28,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(8,	'Пользователь 12',	'',	'',	'',	'Abc',	10,	1479741572,	1479764262,	'First  Abc',	'Last  Abc',	'Отчество',	'Abc',	0,	'Country',	'City',	'Abc',	'Abc',	'Abc',	0,	'0',	'Abc',	''),
(9,	'Пользователь 22112016 Иванов',	'Volqbk8rUPBw642zuRfF50CxSYN3ztyZ',	'$2y$13$1rg0iW7AaScOXEmNyQ5OjuVsqRKdcjxV.pSd.DySwJYJ8iCH8KHN.',	'',	'zsdfasd@sdfdsf.dfgdfg',	10,	1479829745,	1479829745,	'Иванов',	'Иван',	'Иванович',	'+545646456',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(10,	'stas',	'EYs2s_wRijgwWmmAV-kTw20_6IwBWwfL',	'$2y$13$dYjwonkWZn1wW64YnoadHe47vT/FIRSblPJ8vEdWORdf8n76C/OFy',	'',	'xx@ukr.net',	10,	1479829966,	1479830028,	'Grin',	'Stass',	'grin',	'0502622433',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(11,	'Пользователь по токену',	'Cl-PO1SbWhoFbt3EPUc3DMyq7jBejnF2',	'$2y$13$.j89K4qgerQ8UUXSoZgVke5ZBb/wR2CwMOhwwYwRUuAYjACPo7zFS',	'',	'sdf@sd.vds',	10,	1479830128,	1479830128,	'Сергей',	'Андреев',	'Петрович',	'65564564',	31,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(14,	'bailandocore',	'BUiW2nRpxuO2xrI4XdC4PWSHrY8gpDsI',	'$2y$13$0/qtpW..SYOUysjXe2UxzexD4jBtLoXqJRP0Aw00oLAS.c2upXxtC',	'',	'bailandocore@gmail.com',	10,	1479909752,	1479909869,	'Anastasia',	'Anastasia',	'Andrei',	'892156565656',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(15,	'test',	'qAHZNJV-Icero9z3fGje3OfaA3M8_qpE',	'$2y$13$X9zVGwamDxJXG5/14bZU6eSZgihn5d76dgsz1YrSTz2m/DzZKTKHm',	'',	'test@sfsd.yt',	10,	1479982161,	1479982161,	'test',	'test',	'test',	'32424234',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(16,	'Username 24',	'35IohYuTPtF1plMMY8iEfZ3cQgwVhzVM',	'$2y$13$VEwIqdeXgyCHez8WzlmL2.K8QuqD5LGZRbAn6MH2WxkJG9ZPUXiJq',	'',	'andreev@sn.ty',	10,	1480004131,	1480004131,	'Андреев',	'Сергей',	'Леонидович',	'+3864564565',	0,	'',	'',	'',	'',	'',	0,	'0',	'',	''),
(17,	'',	'mdBuKGyVJscP9YkAzfhv0MKUaLvnZmJH',	'$2y$13$JrlpVHWf7gHn9mumopYFUO3ZSwx0.YnOTjAfWkpm4urWjzMRYYFlW',	'',	'',	10,	1480086610,	1480086610,	'',	'',	'',	'',	0,	'',	'',	'',	'',	'',	0,	'',	'',	''),
(20,	'test3',	'yeZeSd4D6x8rr-NjWKe3tgcnWY66je7H',	'$2y$13$FlIH1lDn4gpMXTgkLlu0eur.IXMOlY.qRnaKfgZzfYKSYsJ53VmPq',	'',	'email@email.r',	10,	1480096627,	1480096627,	'name',	'famil',	NULL,	NULL,	NULL,	'starana',	'gorod',	'ocebe',	NULL,	'skype',	NULL,	'myj',	NULL,	NULL),
(21,	'test1',	'qERGOeU4KL4HQWUvzCRMn9-KMfrGZgp9',	'$2y$13$yP62OR8h8iau/G5QF.SBkOrt31aa7t/8ilwn/t6KpkuaFw18GbPG2',	'',	'email2@email.r',	10,	1480096881,	1480096881,	'name',	'famil',	NULL,	NULL,	NULL,	'starana',	'gorod',	'qweqwe',	NULL,	'skype',	NULL,	'myj',	NULL,	'/uploads/avatars/1_238.jpg'),
(22,	'asdasd',	'rNIpxafBNslYjAQNFdQ1diaHeReuKcOG',	'$2y$13$UmBlPKI1naPVYF1KNh4z5urpvY6eOoZZsqb8ZAD4UNCEOMw/o44oa',	'',	'asd@DAS.e',	10,	1480097156,	1480097156,	'asdas',	'asdasd',	NULL,	NULL,	NULL,	'',	'',	'',	NULL,	'',	NULL,	'',	NULL,	NULL);

-- 2016-11-28 16:32:33
