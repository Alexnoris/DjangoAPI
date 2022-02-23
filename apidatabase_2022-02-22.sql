# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.7.1-MariaDB-1:10.7.1+maria~focal-log)
# Base de datos: apidatabase
# Tiempo de Generación: 2022-02-23 5:43:57 a.m. +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla api_actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_actor`;

CREATE TABLE `api_actor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_actor` WRITE;
/*!40000 ALTER TABLE `api_actor` DISABLE KEYS */;

INSERT INTO `api_actor` (`id`, `name`)
VALUES
	(1,'Alex'),
	(2,'Russell'),
	(3,'Abraham'),
	(4,'Alfredo');

/*!40000 ALTER TABLE `api_actor` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_director
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_director`;

CREATE TABLE `api_director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `budget` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_director` WRITE;
/*!40000 ALTER TABLE `api_director` DISABLE KEYS */;

INSERT INTO `api_director` (`id`, `name`, `budget`)
VALUES
	(1,'Alex',999999),
	(2,'Alfredo',999999),
	(3,'Russell',999999),
	(4,'Abraham',999999);

/*!40000 ALTER TABLE `api_director` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_movie`;

CREATE TABLE `api_movie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `ranking` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` (`category_id`),
  CONSTRAINT `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` FOREIGN KEY (`category_id`) REFERENCES `api_moviecategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_movie` WRITE;
/*!40000 ALTER TABLE `api_movie` DISABLE KEYS */;

INSERT INTO `api_movie` (`id`, `name`, `description`, `ranking`, `category_id`)
VALUES
	(1,'The night','dsda',1,1),
	(2,'Risa','dasda',2,2),
	(3,'Casa','dasdfa',3,2),
	(4,'Texas','sadsajio',4,1),
	(9,'Casa','dasdfa',3,2),
	(10,'Texas','sadsajio',4,1),
	(11,'Casa','dasdfa',3,2);

/*!40000 ALTER TABLE `api_movie` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_movie_actors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_movie_actors`;

CREATE TABLE `api_movie_actors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `actor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_actors_movie_id_actor_id_997d9969_uniq` (`movie_id`,`actor_id`),
  KEY `api_movie_actors_actor_id_663ed9a3_fk_api_actor_id` (`actor_id`),
  CONSTRAINT `api_movie_actors_actor_id_663ed9a3_fk_api_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `api_actor` (`id`),
  CONSTRAINT `api_movie_actors_movie_id_fa15de27_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_movie_actors` WRITE;
/*!40000 ALTER TABLE `api_movie_actors` DISABLE KEYS */;

INSERT INTO `api_movie_actors` (`id`, `movie_id`, `actor_id`)
VALUES
	(1,2,1);

/*!40000 ALTER TABLE `api_movie_actors` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_movie_director
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_movie_director`;

CREATE TABLE `api_movie_director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `director_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_director_movie_id_director_id_cceb9ecf_uniq` (`movie_id`,`director_id`),
  KEY `api_movie_director_director_id_311cc9a1_fk_api_director_id` (`director_id`),
  CONSTRAINT `api_movie_director_director_id_311cc9a1_fk_api_director_id` FOREIGN KEY (`director_id`) REFERENCES `api_director` (`id`),
  CONSTRAINT `api_movie_director_movie_id_301762f6_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_movie_director` WRITE;
/*!40000 ALTER TABLE `api_movie_director` DISABLE KEYS */;

INSERT INTO `api_movie_director` (`id`, `movie_id`, `director_id`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `api_movie_director` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_movie_sountracks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_movie_sountracks`;

CREATE TABLE `api_movie_sountracks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `soundtracks_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_sountracks_movie_id_soundtracks_id_04dced91_uniq` (`movie_id`,`soundtracks_id`),
  KEY `api_movie_sountracks_soundtracks_id_1bf8afc3_fk_api_sound` (`soundtracks_id`),
  CONSTRAINT `api_movie_sountracks_movie_id_22c74340_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`),
  CONSTRAINT `api_movie_sountracks_soundtracks_id_1bf8afc3_fk_api_sound` FOREIGN KEY (`soundtracks_id`) REFERENCES `api_soundtracks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_movie_sountracks` WRITE;
/*!40000 ALTER TABLE `api_movie_sountracks` DISABLE KEYS */;

INSERT INTO `api_movie_sountracks` (`id`, `movie_id`, `soundtracks_id`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `api_movie_sountracks` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_moviecategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_moviecategories`;

CREATE TABLE `api_moviecategories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_moviecategories` WRITE;
/*!40000 ALTER TABLE `api_moviecategories` DISABLE KEYS */;

INSERT INTO `api_moviecategories` (`id`, `name`)
VALUES
	(1,'Terror'),
	(2,'Comedia');

/*!40000 ALTER TABLE `api_moviecategories` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla api_soundtracks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_soundtracks`;

CREATE TABLE `api_soundtracks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `api_soundtracks` WRITE;
/*!40000 ALTER TABLE `api_soundtracks` DISABLE KEYS */;

INSERT INTO `api_soundtracks` (`id`, `name`, `duration`)
VALUES
	(1,'La sonda',4),
	(2,'J',5);

/*!40000 ALTER TABLE `api_soundtracks` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add movie',7,'add_movie'),
	(26,'Can change movie',7,'change_movie'),
	(27,'Can delete movie',7,'delete_movie'),
	(28,'Can view movie',7,'view_movie'),
	(29,'Can add movie categories',8,'add_moviecategories'),
	(30,'Can change movie categories',8,'change_moviecategories'),
	(31,'Can delete movie categories',8,'delete_moviecategories'),
	(32,'Can view movie categories',8,'view_moviecategories'),
	(33,'Can add API key',9,'add_apikey'),
	(34,'Can change API key',9,'change_apikey'),
	(35,'Can delete API key',9,'delete_apikey'),
	(36,'Can view API key',9,'view_apikey'),
	(37,'Can add actor',10,'add_actor'),
	(38,'Can change actor',10,'change_actor'),
	(39,'Can delete actor',10,'delete_actor'),
	(40,'Can view actor',10,'view_actor'),
	(41,'Can add soundtracks',11,'add_soundtracks'),
	(42,'Can change soundtracks',11,'change_soundtracks'),
	(43,'Can delete soundtracks',11,'delete_soundtracks'),
	(44,'Can view soundtracks',11,'view_soundtracks'),
	(45,'Can add director',12,'add_director'),
	(46,'Can change director',12,'change_director'),
	(47,'Can delete director',12,'delete_director'),
	(48,'Can view director',12,'view_director');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$320000$KF6abUMf1cL34fQ73BVhlC$EJkYwzOc6A/GrecplF+fsYdcIhAg959WL+J4PVN1e30=','2022-02-10 02:32:14.501417',1,'admin','','','admin@admin.com',1,1,'2022-02-10 02:32:08.383515');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2022-02-10 02:34:39.198738','IHsLKXEf.pbkdf2_sha256$320000$XzfIWqcAG3ikwoqUcZCErI$fncrvaKiogLFg9YsGrX9EBxtcEXLX3bGjV9ElR5bVFc=','Api1',1,'[{\"added\": {}}]',9,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(10,'api','actor'),
	(12,'api','director'),
	(7,'api','movie'),
	(8,'api','moviecategories'),
	(11,'api','soundtracks'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(9,'rest_framework_api_key','apikey'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2022-02-10 01:46:18.678903'),
	(2,'auth','0001_initial','2022-02-10 01:46:19.124840'),
	(3,'admin','0001_initial','2022-02-10 01:46:19.231790'),
	(4,'admin','0002_logentry_remove_auto_add','2022-02-10 01:46:19.243456'),
	(5,'admin','0003_logentry_add_action_flag_choices','2022-02-10 01:46:19.254208'),
	(6,'contenttypes','0002_remove_content_type_name','2022-02-10 01:46:19.320805'),
	(7,'auth','0002_alter_permission_name_max_length','2022-02-10 01:46:19.377613'),
	(8,'auth','0003_alter_user_email_max_length','2022-02-10 01:46:19.406210'),
	(9,'auth','0004_alter_user_username_opts','2022-02-10 01:46:19.416146'),
	(10,'auth','0005_alter_user_last_login_null','2022-02-10 01:46:19.459267'),
	(11,'auth','0006_require_contenttypes_0002','2022-02-10 01:46:19.467080'),
	(12,'auth','0007_alter_validators_add_error_messages','2022-02-10 01:46:19.476908'),
	(13,'auth','0008_alter_user_username_max_length','2022-02-10 01:46:19.503403'),
	(14,'auth','0009_alter_user_last_name_max_length','2022-02-10 01:46:19.529327'),
	(15,'auth','0010_alter_group_name_max_length','2022-02-10 01:46:19.557349'),
	(16,'auth','0011_update_proxy_permissions','2022-02-10 01:46:19.570405'),
	(17,'auth','0012_alter_user_first_name_max_length','2022-02-10 01:46:19.597682'),
	(18,'sessions','0001_initial','2022-02-10 01:46:19.654650'),
	(19,'api','0001_initial','2022-02-10 02:13:03.567083'),
	(20,'rest_framework_api_key','0001_initial','2022-02-10 02:24:05.424400'),
	(21,'rest_framework_api_key','0002_auto_20190529_2243','2022-02-10 02:24:05.450408'),
	(22,'rest_framework_api_key','0003_auto_20190623_1952','2022-02-10 02:24:05.458475'),
	(23,'rest_framework_api_key','0004_prefix_hashed_key','2022-02-10 02:24:05.589728'),
	(24,'api','0002_actor_director_soundtracks_movie_actors_and_more','2022-02-23 02:26:39.739816');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('gtmq05ncze2ipugx9nspbngkag6smoen','.eJxVjMsOwiAQRf-FtSECHR4u3fcbmpkBpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNEdxEUqcfjdCfqS6g3jHemuSW12XmeSuyIN2ObaYntfD_Tso2Mu3BhNZubMOmR14cKi1heSssUqxM5S8IiAVaPAmYMxaeyKbObMBTHEQ7w_FyTfY:1nHzFm:hq0KTJkfpDOrPNC4BlkutD-_Ryc_M-y5EiRNiDns4-E','2022-02-24 02:32:14.503330');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rest_framework_api_key_apikey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rest_framework_api_key_apikey`;

CREATE TABLE `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rest_framework_api_key_apikey` WRITE;
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;

INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`)
VALUES
	('IHsLKXEf.pbkdf2_sha256$320000$XzfIWqcAG3ikwoqUcZCErI$fncrvaKiogLFg9YsGrX9EBxtcEXLX3bGjV9ElR5bVFc=','2022-02-10 02:34:39.198323','Api1',0,NULL,'pbkdf2_sha256$320000$XzfIWqcAG3ikwoqUcZCErI$fncrvaKiogLFg9YsGrX9EBxtcEXLX3bGjV9ElR5bVFc=','IHsLKXEf');

/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
