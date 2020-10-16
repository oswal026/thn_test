/*
SQLyog Ultimate v9.02 
MySQL - 5.5.5-10.4.14-MariaDB : Database - thn_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`thn_test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `thn_test`;

/*Table structure for table `bookingrooms` */

DROP TABLE IF EXISTS `bookingrooms`;

CREATE TABLE `bookingrooms` (
  `bookingRoomQty` int(11) NOT NULL,
  `bookingRoomPrice` decimal(15,2) NOT NULL,
  `roomId` int(10) unsigned NOT NULL,
  `bookingId` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `bookingrooms_roomid_foreign` (`roomId`),
  KEY `bookingrooms_bookingid_foreign` (`bookingId`),
  CONSTRAINT `bookingrooms_bookingid_foreign` FOREIGN KEY (`bookingId`) REFERENCES `bookings` (`bookingId`),
  CONSTRAINT `bookingrooms_roomid_foreign` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bookingrooms` */

insert  into `bookingrooms`(`bookingRoomQty`,`bookingRoomPrice`,`roomId`,`bookingId`,`created_at`,`updated_at`,`deleted_at`) values (1,'100.00',5,1,'2020-10-15 16:00:00',NULL,NULL),(1,'50.00',3,1,'2020-10-15 16:00:00',NULL,NULL),(1,'35.00',1,2,'2020-10-15 16:00:00',NULL,NULL),(1,'43.00',6,3,'2020-10-15 16:00:00',NULL,NULL),(1,'38.00',10,4,'2020-10-15 16:00:00',NULL,NULL),(1,'85.00',11,5,'2020-10-15 16:00:00',NULL,NULL);

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `bookingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookingFrom` datetime NOT NULL,
  `bookingTo` datetime NOT NULL,
  `bookingStatusId` int(10) unsigned NOT NULL,
  `hotelId` int(10) unsigned NOT NULL,
  `guestId` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  KEY `bookings_bookingstatusid_foreign` (`bookingStatusId`),
  KEY `bookings_hotelid_foreign` (`hotelId`),
  KEY `bookings_guestid_foreign` (`guestId`),
  CONSTRAINT `bookings_bookingstatusid_foreign` FOREIGN KEY (`bookingStatusId`) REFERENCES `bookingstatus` (`bookingStatusId`),
  CONSTRAINT `bookings_guestid_foreign` FOREIGN KEY (`guestId`) REFERENCES `guests` (`guestId`),
  CONSTRAINT `bookings_hotelid_foreign` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bookings` */

insert  into `bookings`(`bookingId`,`bookingFrom`,`bookingTo`,`bookingStatusId`,`hotelId`,`guestId`,`created_at`,`updated_at`,`deleted_at`) values (1,'2020-10-25 13:00:00','2020-10-27 11:00:00',2,1,1,'2020-10-15 16:00:00',NULL,NULL),(2,'2020-10-28 13:00:00','2020-10-29 11:00:00',2,1,2,'2020-10-15 16:00:00',NULL,NULL),(3,'2020-11-01 13:00:00','2020-11-02 11:00:00',3,2,3,'2020-10-15 16:00:00',NULL,NULL),(4,'2020-12-15 13:00:00','2020-12-18 11:00:00',1,3,4,'2020-10-15 16:00:00',NULL,NULL),(5,'2020-10-23 13:00:00','2020-10-24 11:00:00',2,3,5,'2020-10-15 16:00:00',NULL,NULL);

/*Table structure for table `bookingstatus` */

DROP TABLE IF EXISTS `bookingstatus`;

CREATE TABLE `bookingstatus` (
  `bookingStatusId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookingStatusName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookingStatusIsActive` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bookingStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bookingstatus` */

insert  into `bookingstatus`(`bookingStatusId`,`bookingStatusName`,`bookingStatusIsActive`,`created_at`,`updated_at`,`deleted_at`) values (1,'Pendiente',1,'2020-10-15 16:17:49',NULL,NULL),(2,'Completada',1,'2020-10-15 16:17:49',NULL,NULL),(3,'Cancelada',1,'2020-10-15 16:17:49',NULL,NULL);

/*Table structure for table `facilities` */

DROP TABLE IF EXISTS `facilities`;

CREATE TABLE `facilities` (
  `facilityId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facilityName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facilityDescription` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`facilityId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `facilities` */

insert  into `facilities`(`facilityId`,`facilityName`,`facilityDescription`,`created_at`,`updated_at`,`deleted_at`) values (1,'Piscina',NULL,'2020-10-15 16:17:49',NULL,NULL),(2,'Parking',NULL,'2020-10-15 16:17:49',NULL,NULL),(3,'Wifi gratis',NULL,'2020-10-15 16:17:49',NULL,NULL),(4,'Habitaciones familiares',NULL,'2020-10-15 16:17:49',NULL,NULL),(5,'Admite mascotas',NULL,'2020-10-15 16:17:49',NULL,NULL),(6,'Bar',NULL,'2020-10-15 16:17:49',NULL,NULL),(7,'Tetera/cafetera en todas las habitaciones',NULL,'2020-10-15 16:17:49',NULL,NULL),(8,'Restaurante',NULL,'2020-10-15 16:17:49',NULL,NULL),(9,'Centro de Fitness',NULL,'2020-10-15 16:17:49',NULL,NULL),(10,'Servicio de habitaciones',NULL,'2020-10-15 16:17:49',NULL,NULL),(11,'Habitaciones para no fumadores',NULL,'2020-10-15 16:17:49',NULL,NULL),(12,'Desayuno',NULL,'2020-10-15 16:17:49',NULL,NULL),(13,'Adaptado personas de movilidad reducida',NULL,'2020-10-15 16:17:49',NULL,NULL);

/*Table structure for table `guests` */

DROP TABLE IF EXISTS `guests`;

CREATE TABLE `guests` (
  `guestId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guestFirstName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestLastName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestDni` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestEmail` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestPhone` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestPostCode` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestCountry` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestCity` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestProvince` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestLocality` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`guestId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `guests` */

insert  into `guests`(`guestId`,`guestFirstName`,`guestLastName`,`guestDni`,`guestEmail`,`guestPhone`,`guestAddress`,`guestPostCode`,`guestCountry`,`guestCity`,`guestProvince`,`guestLocality`,`created_at`,`updated_at`,`deleted_at`) values (1,'Oswaldo','Cáceres','Y6497936J','oswal026@gmail.com','+34667083524','Calle Pamplona Escudero, 35 1E','50005','España','Zaragoza','Zaragoza','Zaragoza','2020-10-15 16:17:49',NULL,NULL),(2,'José','Hernández','Y1235485J','joseh@gmail.com','+34525989865','Calle Valencia, 25 4H','50009','España','Zaragoza','Zaragoza','Zaragoza','2020-10-15 16:17:49',NULL,NULL),(3,'María','Martín','F5632132G','mariam@hotmail.com','+34654213213','Calle Arzobispo Apaolaza, 24 1H','50009','España','Zaragoza','Zaragoza','Zaragoza','2020-10-15 16:17:49',NULL,NULL),(4,'Reina','Hernandez','16548613','reina@gmail.com','+583795834','Bella Vista, 3-40','5001','Venezuela','San Cristóbal','Táchira','La concordia','2020-10-15 16:17:49',NULL,NULL),(5,'Manuel','Díaz','Y806554F','manu@gmail.com','+34667083524','Calle Pamplona Escudero, 35 1E','50005','España','Zaragoza','Zaragoza','Zaragoza','2020-10-15 16:17:49',NULL,NULL);

/*Table structure for table `hotelfacilities` */

DROP TABLE IF EXISTS `hotelfacilities`;

CREATE TABLE `hotelfacilities` (
  `facilityId` int(10) unsigned NOT NULL,
  `hotelId` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `hotelfacilities_facilityid_foreign` (`facilityId`),
  KEY `hotelfacilities_hotelid_foreign` (`hotelId`),
  CONSTRAINT `hotelfacilities_facilityid_foreign` FOREIGN KEY (`facilityId`) REFERENCES `facilities` (`facilityId`),
  CONSTRAINT `hotelfacilities_hotelid_foreign` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`hotelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hotelfacilities` */

insert  into `hotelfacilities`(`facilityId`,`hotelId`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'2020-10-15 16:17:49',NULL,NULL),(2,1,'2020-10-15 16:17:49',NULL,NULL),(3,1,'2020-10-15 16:17:49',NULL,NULL),(4,1,'2020-10-15 16:17:49',NULL,NULL),(5,1,'2020-10-15 16:17:49',NULL,NULL),(6,1,'2020-10-15 16:17:49',NULL,NULL),(7,1,'2020-10-15 16:17:49',NULL,NULL),(2,2,'2020-10-15 16:17:49',NULL,NULL),(3,2,'2020-10-15 16:17:49',NULL,NULL),(4,2,'2020-10-15 16:17:49',NULL,NULL),(8,2,'2020-10-15 16:17:49',NULL,NULL),(11,2,'2020-10-15 16:17:49',NULL,NULL),(12,2,'2020-10-15 16:17:49',NULL,NULL),(13,2,'2020-10-15 16:17:49',NULL,NULL),(3,3,'2020-10-15 16:17:49',NULL,NULL),(2,3,'2020-10-15 16:17:49',NULL,NULL),(4,3,'2020-10-15 16:17:49',NULL,NULL),(9,3,'2020-10-15 16:17:49',NULL,NULL),(10,3,'2020-10-15 16:17:49',NULL,NULL),(1,4,'2020-10-15 16:17:49',NULL,NULL),(2,4,'2020-10-15 16:17:49',NULL,NULL),(3,4,'2020-10-15 16:17:49',NULL,NULL),(4,4,'2020-10-15 16:17:49',NULL,NULL),(10,4,'2020-10-15 16:17:49',NULL,NULL),(11,4,'2020-10-15 16:17:49',NULL,NULL),(12,4,'2020-10-15 16:17:49',NULL,NULL),(13,4,'2020-10-15 16:17:49',NULL,NULL);

/*Table structure for table `hotels` */

DROP TABLE IF EXISTS `hotels`;

CREATE TABLE `hotels` (
  `hotelId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelDescription` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotelEmail` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelPhone` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelPostCode` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelCountry` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelCity` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelProvince` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelLocality` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotelUrl` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotelRate` decimal(15,2) NOT NULL,
  `hotelIsActive` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hotelId`),
  KEY `hotel_id_index` (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hotels` */

insert  into `hotels`(`hotelId`,`hotelName`,`hotelDescription`,`hotelEmail`,`hotelPhone`,`hotelAddress`,`hotelPostCode`,`hotelCountry`,`hotelCity`,`hotelProvince`,`hotelLocality`,`hotelUrl`,`hotelRate`,`hotelIsActive`,`created_at`,`updated_at`,`deleted_at`) values (1,'Hotel SB Glow **** Sup','El Hotel SB Glow **** Sup dispone de restaurante, piscina al aire libre, centro de fitness y bar y se encuentra en Barcelona. Este hotel de 4 estrellas también alberga un salón compartido y ofrece habitaciones con aire acondicionado, WiFi gratuita y baño privado. Además, hay recepción las 24 horas, servicio de habitaciones y servicio de organización de excursiones.\r\n\r\nLas habitaciones del hotel están equipadas con escritorio, TV de pantalla plana, armario y hervidor de agua.\r\n\r\nAdemás, el Hotel SB Glow **** Sup prepara un desayuno buffet todos los días.\r\n\r\nEl hotel ofrece alojamiento de 4 estrellas con hammam y sauna.\r\n\r\nEl Hotel SB Glow **** Sup se encuentra cerca de las playas de Bogatell, Nova Icaria y Mar Bella. El aeropuerto de Barcelona El Prat, el más cercano, queda a 20 km del establecimiento.','hotelsbglow@gmail.com','+34652487931','154 Carrer de Badajoz','08020','España','Barcelona','Sant Martí','Sant Martí','https://www.hotelsbglow.com/','8.00',1,NULL,NULL,NULL),(2,'Hostal Pizarro','El Hostal Pizarro ocupa un edificio modernista del barrio de Chueca de Madrid, una zona famosa en todo el mundo por su animado ambiente nocturno gay y lésbico.\r\n\r\nEste hostal gay-friendly dispone de salón con TV vía satélite y conexión Wi-Fi, el lugar perfecto para conocer a otros huéspedes.\r\nEn los alrededores encontrará tiendas, bares y discotecas para todos los gustos, así como también lugares de interés cultural, entre ellos algunos de los museos más prestigiosos del mundo (Reina Sofía, Prado, Thyssen-Bornemisza).\r\n\r\nNuestros clientes dicen que esta parte de Madrid es su favorita, según los comentarios independientes.\r\n\r\nA las parejas les encanta la ubicación — Le han puesto un 9,4 para viajes de dos personas.\r\n\r\n¡Hablamos tu idioma!','hostalpizarro@gmail.com','+34658255555','Pizarro, 14','28004','España','Madrid','Madrid','Centro de Madrid',NULL,'8.30',1,NULL,NULL,NULL),(3,'Hostal Madrid','Este hostal económico ofrece conexión Wi-Fi gratuita y está situado en el centro de Madrid, en un emplazamiento ideal para visitar los lugares de interés de esta fantástica ciudad y disfrutar de la animada vida nocturna.\r\n\r\nEl Hostal Madrid se encuentra a solo 5 minutos a pie de varios lugares de interés turístico de la ciudad, situados entre la famosa Puerta del Sol y la Plaza Mayor. Goza de una ubicación estupenda, cerca de los excelentes museos y teatros de Madrid, como el Centro de Arte Reina Sofía y el Museo del Prado. El hostal está abierto las 24 horas del día para que pueda salir a explorar los numerosos bares y discotecas que están abiertos todas las noches de la semana en el centro de la ciudad.\r\n\r\nLas habitaciones del hostal son prácticas y tienen una decoración elegante, con muebles de hierro forjado y suelo de madera. Este alojamiento es ideal para aquellos que visitan la ciudad y no quieren gastar mucho dinero.\r\n\r\nNuestros clientes dicen que esta parte de Madrid es su favorita, según los comentarios independientes.\r\n\r\nA las parejas les encanta la ubicación — Le han puesto un 9,7 para viajes de dos personas.\r\n\r\n¡Hablamos tu idioma!','hostalmadrid@gmail.com','+34526889555','Esparteros, 6','28012','España','Madrid','Madrid','Centro de Madrid',NULL,'9.70',1,NULL,NULL,NULL),(4,'Catalonia El Pilar','El Catalonia El Pilar está en el centro histórico de Zaragoza, a 2 minutos a pie del mercado central y de la basílica del Pilar. Alberga un gimnasio moderno y habitaciones con WiFi gratuita y TV vía satélite.\r\n\r\nAdemás, el establecimiento El Pilar ocupa un edificio modernista de principios del siglo XX que aún conserva los ascensores de madera originales.\r\n\r\nLas habitaciones del Hotel Catalonia El Pilar disponen de aire acondicionado, calefacción, escritorio, caja fuerte de uso gratuito y baño privado con secador de pelo.\r\n\r\nEl hotel tiene un restaurante donde se sirve un desayuno buffet y platos típicos aragoneses. A 5 minutos a pie hay varios restaurantes y bares de tapas.\r\n\r\nEl hotel se sitúa a 5 minutos a pie de la catedral de La Seo, a 15 minutos a pie de la plaza de toros de Zaragoza y a 20 minutos del palacio morisco medieval de la Aljafería.\r\n\r\nAdemás, hay una zona de carga y descarga en la entrada, y aparcamiento público en los alrededores.\r\n\r\nNuestros clientes dicen que esta parte de Zaragoza es su favorita, según los comentarios independientes.\r\n\r\nA las parejas les encanta la ubicación — Le han puesto un 9,7 para viajes de dos personas.','cataloniaelpilar@gmail.com','+34568962321','Manifestación, 16','50003','España','Zaragoza','Zaragoza','Zaragoza',NULL,'9.10',1,NULL,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2020_10_14_203323_create_hotels_table',1),(2,'2020_10_14_211020_create_guests_table',1),(3,'2020_10_14_211119_create_facilities_table',1),(4,'2020_10_14_211319_create_room_types_table',1),(5,'2020_10_14_211348_create_rooms_table',1),(6,'2020_10_14_211349_create_booking_status_table',1),(7,'2020_10_14_211349_create_bookings_table',1),(8,'2020_10_14_211440_create_booking_rooms_table',1),(9,'2020_10_14_211644_create_hotel_facilities_table',1);

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `roomId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roomDescription` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roomFloor` int(11) NOT NULL,
  `roomIsAvailable` tinyint(4) NOT NULL DEFAULT 1,
  `roomTypeId` int(10) unsigned NOT NULL,
  `hotelId` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`roomId`),
  KEY `rooms_roomtypeid_foreign` (`roomTypeId`),
  KEY `rooms_hotelid_foreign` (`hotelId`),
  CONSTRAINT `rooms_hotelid_foreign` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`hotelId`),
  CONSTRAINT `rooms_roomtypeid_foreign` FOREIGN KEY (`roomTypeId`) REFERENCES `roomtypes` (`roomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rooms` */

insert  into `rooms`(`roomId`,`roomDescription`,`roomFloor`,`roomIsAvailable`,`roomTypeId`,`hotelId`,`created_at`,`updated_at`,`deleted_at`) values (1,'Habitación Doble - 1 o 2 camas',1,1,2,1,'2020-10-15 16:17:49',NULL,NULL),(2,'Habitación Triple',1,1,3,1,'2020-10-15 16:17:49',NULL,NULL),(3,'Habitación Doble Estándar',1,1,2,1,'2020-10-15 16:17:49',NULL,NULL),(4,'Habitación Triple (2 adultos + 1 niño)',1,0,3,1,'2020-10-15 16:17:49',NULL,NULL),(5,'Suite Deluxe con bañera de hidromasaje',2,1,6,1,'2020-10-15 16:17:49',NULL,NULL),(6,'Habitación Doble - 1 o 2 camas',1,1,2,2,'2020-10-15 16:17:49',NULL,NULL),(7,'Habitación Triple (2 adultos + 1 niño)',1,1,3,2,'2020-10-15 16:17:49',NULL,NULL),(8,'Habitación Doble Estándar',1,1,2,2,'2020-10-15 16:17:49',NULL,NULL),(9,'Habitación Triple',1,1,3,2,'2020-10-15 16:17:49',NULL,NULL),(10,'Habitación Familiar(5)',1,1,8,3,'2020-10-15 16:17:49',NULL,NULL),(11,'Habitación Doble',1,1,2,4,'2020-10-15 16:17:49',NULL,NULL),(12,'Habitación Doble Estándar',1,0,2,3,'2020-10-15 16:17:49',NULL,NULL);

/*Table structure for table `roomtypes` */

DROP TABLE IF EXISTS `roomtypes`;

CREATE TABLE `roomtypes` (
  `roomTypeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roomTypeName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roomTypeDescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roomTypeSleeps` int(11) NOT NULL,
  `roomTypeSmokingIsAllowed` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`roomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roomtypes` */

insert  into `roomtypes`(`roomTypeId`,`roomTypeName`,`roomTypeDescription`,`roomTypeSleeps`,`roomTypeSmokingIsAllowed`,`created_at`,`updated_at`,`deleted_at`) values (1,'Individual','Habitación asignada a una persona.',1,1,'2020-10-15 16:17:49',NULL,NULL),(2,'Doble','Habitación con 1 cama doble grande o 2 camas individuales.',2,1,'2020-10-15 16:17:49',NULL,NULL),(3,'Triple','Habitación con 1 cama individual y 1 cama doble grande o 3 camas individuales',3,1,'2020-10-15 16:17:49',NULL,NULL),(4,'Quad','Sala asignada a cuatro personas.',4,1,'2020-10-15 16:17:49',NULL,NULL),(5,'Doble Estándar','Habitación con 2 camas individuales o 1 cama doble.',2,0,'2020-10-15 16:17:49',NULL,NULL),(6,'Suit Deluxe','Habitación con 1 cama doble grande.',2,1,'2020-10-15 16:17:49',NULL,NULL),(7,'Familiar (4 adultos)','Habitación con 1 cama doble y 2 camas individuales',4,1,'2020-10-15 16:17:49',NULL,NULL),(8,'Familiar (5 adultos)','Habitación con 1 cama doble grande y 3 camas individuales',5,1,'2020-10-15 16:17:49',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
