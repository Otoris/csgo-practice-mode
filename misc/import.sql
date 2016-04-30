--
-- Table structure for table `practicemode_grenades`
--

DROP TABLE IF EXISTS `practicemode_grenades`;
CREATE TABLE `practicemode_grenades` (
  `auth` varchar(64) NOT NULL DEFAULT '',
  `map` varchar(64) NOT NULL DEFAULT '',
  `id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(256) NOT NULL DEFAULT '',
  `categories` varchar(128) NOT NULL DEFAULT '',
  `originx` float NOT NULL DEFAULT '0',
  `originy` float NOT NULL DEFAULT '0',
  `originz` float NOT NULL DEFAULT '0',
  `anglex` float NOT NULL DEFAULT '0',
  `angley` float NOT NULL DEFAULT '0',
  `anglez` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth`,`map`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practicemode_users`
--

DROP TABLE IF EXISTS `practicemode_users`;
CREATE TABLE `practicemode_users` (
  `auth` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`auth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
