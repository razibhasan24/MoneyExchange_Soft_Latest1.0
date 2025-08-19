-- MySQL Administrator dump 1.4

-- Server version	5.5.5-10.4.32-MariaDB
--
-- Create schema test
--

CREATE DATABASE IF NOT EXISTS test;
USE test;
--
-- Temporary table structure for view `v_product_list1`
--

DROP TABLE IF EXISTS `v_product_list1`;
DROP VIEW IF EXISTS `v_product_list1`;
CREATE TABLE `v_product_list1` (
  `id` int(10),
  `product_name` varchar(50),
  `mfg_name` varchar(50)
);

--
-- Definition of table `_store`
--

DROP TABLE IF EXISTS `_store`;
CREATE TABLE `_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `currency_type` varchar(50) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `vendors` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `_store`
--

/*!40000 ALTER TABLE `_store` DISABLE KEYS */;
INSERT INTO `_store` (`id`,`name`,`city`,`currency_type`,`contact`,`vendors`) VALUES 
 (1,'Main Branch','Dhaka','BDT','01711111111','Vendor A'),
 (2,'Uttara Branch','Dhaka','BDT','01722222222','Vendor B'),
 (3,'Chittagong Branch','Chittagong','BDT','01733333333','Vendor C'),
 (4,'Sylhet Branch','Sylhet','BDT','01744444444','Vendor D'),
 (5,'Khulna Branch','Khulna','BDT','01755555555','Vendor E');
/*!40000 ALTER TABLE `_store` ENABLE KEYS */;

--
-- Definition of table `core_academy_admissions`
--

DROP TABLE IF EXISTS `core_academy_admissions`;
CREATE TABLE `core_academy_admissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_student_id` int(10) unsigned NOT NULL,
  `academy_batch_id` int(10) unsigned NOT NULL,
  `academy_section_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `roll` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_admissions`
--

/*!40000 ALTER TABLE `core_academy_admissions` DISABLE KEYS */;
INSERT INTO `core_academy_admissions` (`id`,`academy_student_id`,`academy_batch_id`,`academy_section_id`,`created_at`,`roll`) VALUES 
 (1,1,1,2,'2025-03-19 15:20:06',2);
/*!40000 ALTER TABLE `core_academy_admissions` ENABLE KEYS */;


--
-- Definition of table `core_academy_batches`
--

DROP TABLE IF EXISTS `core_academy_batches`;
CREATE TABLE `core_academy_batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `current_class_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_batches`
--

/*!40000 ALTER TABLE `core_academy_batches` DISABLE KEYS */;
INSERT INTO `core_academy_batches` (`id`,`name`,`current_class_id`) VALUES 
 (1,'Batch1',1),
 (2,'Batch2',2);
/*!40000 ALTER TABLE `core_academy_batches` ENABLE KEYS */;


--
-- Definition of table `core_academy_classes`
--

DROP TABLE IF EXISTS `core_academy_classes`;
CREATE TABLE `core_academy_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_classes`
--

/*!40000 ALTER TABLE `core_academy_classes` DISABLE KEYS */;
INSERT INTO `core_academy_classes` (`id`,`name`) VALUES 
 (1,'KG'),
 (2,'ONE'),
 (3,'TWO'),
 (4,'THREE'),
 (5,'FOUR'),
 (6,'FIVE');
/*!40000 ALTER TABLE `core_academy_classes` ENABLE KEYS */;


--
-- Definition of table `core_academy_exam_types`
--

DROP TABLE IF EXISTS `core_academy_exam_types`;
CREATE TABLE `core_academy_exam_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_exam_types`
--

/*!40000 ALTER TABLE `core_academy_exam_types` DISABLE KEYS */;
INSERT INTO `core_academy_exam_types` (`id`,`name`) VALUES 
 (1,'MCQ'),
 (2,'CT');
/*!40000 ALTER TABLE `core_academy_exam_types` ENABLE KEYS */;

--
-- Definition of table `core_academy_invoices`
--

DROP TABLE IF EXISTS `core_academy_invoices`;
CREATE TABLE `core_academy_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invoice_total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `paid_total` float DEFAULT NULL,
  `previous_due` float DEFAULT NULL,
  `payment_term_id` int(10) unsigned DEFAULT NULL,
  `vat` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_invoices`
--

/*!40000 ALTER TABLE `core_academy_invoices` DISABLE KEYS */;
INSERT INTO `core_academy_invoices` (`id`,`student_id`,`created_at`,`updated_at`,`invoice_total`,`discount`,`paid_total`,`previous_due`,`payment_term_id`,`vat`) VALUES 
 (1,1,'2025-04-01 00:00:00','2025-04-01 00:00:00',223,0,0,0,1,0);
/*!40000 ALTER TABLE `core_academy_invoices` ENABLE KEYS */;

--
-- Definition of table `core_academy_invoice_details`
--

DROP TABLE IF EXISTS `core_academy_invoice_details`;
CREATE TABLE `core_academy_invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `unit` int(10) unsigned DEFAULT NULL,
  `vat` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_invoice_details`
--

/*!40000 ALTER TABLE `core_academy_invoice_details` DISABLE KEYS */;
INSERT INTO `core_academy_invoice_details` (`id`,`invoice_id`,`service_id`,`price`,`discount`,`unit`,`vat`) VALUES 
 (1,1,1,343,3,3,1),
 (2,1,2,343,0,1,0);
/*!40000 ALTER TABLE `core_academy_invoice_details` ENABLE KEYS */;

--
-- Definition of table `core_academy_money_receipts`
--

DROP TABLE IF EXISTS `core_academy_money_receipts`;
CREATE TABLE `core_academy_money_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` varchar(45) NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_academy_money_receipt_details`
--

DROP TABLE IF EXISTS `core_academy_money_receipt_details`;
CREATE TABLE `core_academy_money_receipt_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `fee` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




--
-- Definition of table `core_academy_periods`
--

DROP TABLE IF EXISTS `core_academy_periods`;
CREATE TABLE `core_academy_periods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_periods`
--

/*!40000 ALTER TABLE `core_academy_periods` DISABLE KEYS */;
INSERT INTO `core_academy_periods` (`id`,`name`,`time`) VALUES 
 (1,'1st Period','( 9:00 AM - 9:45 AM)'),
 (2,'2nd Period','( 9:45 AM - 10:30 AM)'),
 (3,'3rd Period','( 10:30 AM - 11:15 AM)'),
 (4,'4th Period','( 11:15 AM - 12:00 PM)');
/*!40000 ALTER TABLE `core_academy_periods` ENABLE KEYS */;


--
-- Definition of table `core_academy_results`
--

DROP TABLE IF EXISTS `core_academy_results`;
CREATE TABLE `core_academy_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_student_id` int(10) unsigned NOT NULL,
  `academy_subject_id` int(10) unsigned NOT NULL,
  `academy_term_id` int(10) unsigned NOT NULL,
  `academy_exam_type_id` int(10) unsigned NOT NULL,
  `mark` float NOT NULL,
  `fullmark` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_results`
--

/*!40000 ALTER TABLE `core_academy_results` DISABLE KEYS */;
INSERT INTO `core_academy_results` (`id`,`academy_student_id`,`academy_subject_id`,`academy_term_id`,`academy_exam_type_id`,`mark`,`fullmark`) VALUES 
 (1,1,1,1,1,20,50),
 (2,1,2,1,1,28,50),
 (3,1,3,1,1,40,50),
 (4,1,4,1,1,32,50),
 (5,1,5,1,1,46,50),
 (6,2,1,1,1,45,50),
 (7,2,2,1,1,36,50),
 (8,2,4,1,1,44,50),
 (9,1,1,2,1,70,100);
/*!40000 ALTER TABLE `core_academy_results` ENABLE KEYS */;


--
-- Definition of table `core_academy_routines`
--

DROP TABLE IF EXISTS `core_academy_routines`;
CREATE TABLE `core_academy_routines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_class_id` int(10) unsigned NOT NULL,
  `academy_subject_id` int(10) unsigned NOT NULL,
  `academy_teacher_id` int(10) unsigned NOT NULL,
  `day` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_routines`
--

/*!40000 ALTER TABLE `core_academy_routines` DISABLE KEYS */;
INSERT INTO `core_academy_routines` (`id`,`academy_class_id`,`academy_subject_id`,`academy_teacher_id`,`day`,`time`) VALUES 
 (1,1,3,3,'SUN','( 9:00 AM - 9:45 AM)'),
 (2,1,2,2,'SUN','( 9:00 AM - 9:45 AM)'),
 (3,1,3,1,'MON','( 9:00 AM - 9:45 AM)');
/*!40000 ALTER TABLE `core_academy_routines` ENABLE KEYS */;


--
-- Definition of table `core_academy_sections`
--

DROP TABLE IF EXISTS `core_academy_sections`;
CREATE TABLE `core_academy_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_sections`
--

/*!40000 ALTER TABLE `core_academy_sections` DISABLE KEYS */;
INSERT INTO `core_academy_sections` (`id`,`name`) VALUES 
 (1,'A'),
 (2,'B');
/*!40000 ALTER TABLE `core_academy_sections` ENABLE KEYS */;


--
-- Definition of table `core_academy_services`
--

DROP TABLE IF EXISTS `core_academy_services`;
CREATE TABLE `core_academy_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_academy_students`
--

DROP TABLE IF EXISTS `core_academy_students`;
CREATE TABLE `core_academy_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fathers_name` varchar(45) NOT NULL,
  `mothers_name` varchar(45) NOT NULL,
  `academy_batch_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dob` date DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_students`
--

/*!40000 ALTER TABLE `core_academy_students` DISABLE KEYS */;
INSERT INTO `core_academy_students` (`id`,`name`,`fathers_name`,`mothers_name`,`academy_batch_id`,`created_at`,`dob`,`photo`,`contact_no`,`address`) VALUES 
 (1,'Jahidul Islam','Habibur Rahama','Najma Akter',2,'2025-03-20 09:42:13','2000-03-19','1.jpg','45435436565','Rampura'),
 (2,'Abdur Rahim','Abdur Karam','Fatema Akter',1,'2025-03-20 09:41:33','2001-01-01','student-jpg.jpg','34242343','NA');
/*!40000 ALTER TABLE `core_academy_students` ENABLE KEYS */;


--
-- Definition of table `core_academy_subjects`
--

DROP TABLE IF EXISTS `core_academy_subjects`;
CREATE TABLE `core_academy_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_subjects`
--

/*!40000 ALTER TABLE `core_academy_subjects` DISABLE KEYS */;
INSERT INTO `core_academy_subjects` (`id`,`name`) VALUES 
 (1,'Bengali'),
 (2,'English'),
 (3,'Mathematics'),
 (4,'Science'),
 (5,'Islamic Studies'),
 (6,'Social Science');
/*!40000 ALTER TABLE `core_academy_subjects` ENABLE KEYS */;


--
-- Definition of table `core_academy_teachers`
--

DROP TABLE IF EXISTS `core_academy_teachers`;
CREATE TABLE `core_academy_teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_teachers`
--

/*!40000 ALTER TABLE `core_academy_teachers` DISABLE KEYS */;
INSERT INTO `core_academy_teachers` (`id`,`name`,`contact_no`,`position`) VALUES 
 (1,'Md. Hassan','324324324','Asst. Teacher'),
 (2,'Md. Sabbir Ahmed','3432432','Teacher'),
 (3,'Md. Hamid','334324','Headmaster'),
 (4,'Md. Kamruzzaman','34324324','Asst. Teacher');
/*!40000 ALTER TABLE `core_academy_teachers` ENABLE KEYS */;


--
-- Definition of table `core_academy_terms`
--

DROP TABLE IF EXISTS `core_academy_terms`;
CREATE TABLE `core_academy_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_academy_terms`
--

/*!40000 ALTER TABLE `core_academy_terms` DISABLE KEYS */;
INSERT INTO `core_academy_terms` (`id`,`name`) VALUES 
 (1,'Mid Term'),
 (2,'Final');
/*!40000 ALTER TABLE `core_academy_terms` ENABLE KEYS */;


--
-- Definition of table `core_adjustment_details`
--

DROP TABLE IF EXISTS `core_adjustment_details`;
CREATE TABLE `core_adjustment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`),
  CONSTRAINT `core_adjustment_details_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `adjuuuuustment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_adjustment_details`
--

/*!40000 ALTER TABLE `core_adjustment_details` DISABLE KEYS */;
INSERT INTO `core_adjustment_details` (`id`,`adjustment_id`,`product_id`,`qty`,`price`) VALUES 
 (1,1,1,2,'50.00'),
 (2,2,2,1,'80.00'),
 (3,3,3,0,'95000.00'),
 (4,4,4,5,'300.00'),
 (5,5,5,2,'40.00'),
 (6,1,1,2,'50.00'),
 (7,2,2,1,'80.00'),
 (8,3,3,0,'95000.00'),
 (9,4,4,5,'300.00'),
 (10,5,5,2,'40.00');
/*!40000 ALTER TABLE `core_adjustment_details` ENABLE KEYS */;


--
-- Definition of table `core_assets`
--

DROP TABLE IF EXISTS `core_assets`;
CREATE TABLE `core_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `purchased_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_assets`
--

/*!40000 ALTER TABLE `core_assets` DISABLE KEYS */;
INSERT INTO `core_assets` (`id`,`name`,`price`,`purchased_at`) VALUES 
 (1,'Computer',50000,'2025-01-01 00:00:00'),
 (2,'Laptop',60000,'2025-01-01 00:00:00');
/*!40000 ALTER TABLE `core_assets` ENABLE KEYS */;

--
-- Definition of table `core_bookings`
--

DROP TABLE IF EXISTS `core_bookings`;
CREATE TABLE `core_bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `order_total` float NOT NULL,
  `paid_total` float NOT NULL,
  `remark` text DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_bookings`
--

/*!40000 ALTER TABLE `core_bookings` DISABLE KEYS */;
INSERT INTO `core_bookings` (`id`,`created_at`,`order_total`,`paid_total`,`remark`,`customer_id`) VALUES 
 (1,'2024-05-22 00:00:00',1000,1000,'Test',7),
 (2,'2024-05-24 00:00:00',700,700,'Test Update Api',3),
 (3,'2024-05-25 00:00:00',3544,3544,'Test',2),
 (4,'2024-05-23 00:00:00',500,500,'Test Api',3),
 (5,'0000-00-00 00:00:00',446,446,'Test',2),
 (6,'0000-00-00 00:00:00',344,455,'test',1),
 (7,'0000-00-00 00:00:00',5000,2000,'NT',1);
/*!40000 ALTER TABLE `core_bookings` ENABLE KEYS */;

--
-- Definition of table `core_booking_details`
--

DROP TABLE IF EXISTS `core_booking_details`;
CREATE TABLE `core_booking_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_booking_details`
--

/*!40000 ALTER TABLE `core_booking_details` DISABLE KEYS */;
INSERT INTO `core_booking_details` (`id`,`booking_id`,`room_id`,`from_date`,`to_date`,`price`) VALUES 
 (1,1,1,'2024-02-10','2024-02-11',500),
 (2,6,2,'2024-05-01','2024-05-03',500),
 (3,6,1,'2024-05-01','2024-05-03',2000),
 (4,7,2,'2024-05-29','2024-05-30',500),
 (5,7,1,'2024-05-29','2024-05-30',2000);
/*!40000 ALTER TABLE `core_booking_details` ENABLE KEYS */;


--
-- Definition of table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
CREATE TABLE `core_cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Definition of table `core_cache_locks`
--

DROP TABLE IF EXISTS `core_cache_locks`;
CREATE TABLE `core_cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Definition of table `core_cattle_categories`
--

DROP TABLE IF EXISTS `core_cattle_categories`;
CREATE TABLE `core_cattle_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_cattle_categories`
--

/*!40000 ALTER TABLE `core_cattle_categories` DISABLE KEYS */;
INSERT INTO `core_cattle_categories` (`id`,`name`) VALUES 
 (1,'Cow'),
 (2,'Goat');
/*!40000 ALTER TABLE `core_cattle_categories` ENABLE KEYS */;


--
-- Definition of table `core_cattles`
--

DROP TABLE IF EXISTS `core_cattles`;
CREATE TABLE `core_cattles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `color` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `gender` tinyint(1) unsigned DEFAULT NULL,
  `cattle_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_cattles`
--

/*!40000 ALTER TABLE `core_cattles` DISABLE KEYS */;
INSERT INTO `core_cattles` (`id`,`name`,`region`,`dob`,`color`,`description`,`photo`,`gender`,`cattle_category_id`) VALUES 
 (2,'Black and White','Indian','2021-05-07','White','','2.webp',1,2),
 (3,'BlackCow','Indian','2021-05-07','Black','','3.jpeg',1,1),
 (19,'Goat 25','Deshi','2024-05-01','Red','','19.png',0,1),
 (24,'Goat 25','Deshi','2021-05-07','Red','Test','1-925-webp.webp',1,2);
/*!40000 ALTER TABLE `core_cattles` ENABLE KEYS */;


--
-- Definition of table `core_checks`
--

DROP TABLE IF EXISTS `core_checks`;
CREATE TABLE `core_checks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_checks`
--

/*!40000 ALTER TABLE `core_checks` DISABLE KEYS */;
INSERT INTO `core_checks` (`id`,`name`,`mobile`,`email`,`address`,`created_at`,`updated_at`) VALUES 
 (1,'iuo','542','@ghf.com','dtyhfg','2025-06-24 16:23:46','2025-06-24 16:23:48');
/*!40000 ALTER TABLE `core_checks` ENABLE KEYS */;


--
-- Definition of table `core_company`
--

DROP TABLE IF EXISTS `core_company`;
CREATE TABLE `core_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `bin` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street_address` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_company`
--

/*!40000 ALTER TABLE `core_company` DISABLE KEYS */;
INSERT INTO `core_company` (`id`,`name`,`mobile`,`bin`,`email`,`website`,`city`,`area`,`street_address`,`post_code`,`inactive`,`logo`) VALUES 
 (1,'OYELI FASHION','432523432','3423423432','oyeili@gmail.com','www.oyelibd.com','Dhaka','Mirpur','Building: 21, Road: 12, Block: A','1219',0,'1.png'),
 (2,'IBN SINA','34234',NULL,'ibnsina@gmail.com','ibnsina.com','Dhaka','Dhanmondi','Building: 21, Road: 12, Block: A','2012',0,'2.png');
/*!40000 ALTER TABLE `core_company` ENABLE KEYS */;


--
-- Definition of table `core_contact_categories`
--

DROP TABLE IF EXISTS `core_contact_categories`;
CREATE TABLE `core_contact_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_contact_categories`
--

/*!40000 ALTER TABLE `core_contact_categories` DISABLE KEYS */;
INSERT INTO `core_contact_categories` (`id`,`name`) VALUES 
 (1,'Family'),
 (2,'Relative'),
 (3,'Friend'),
 (4,'Student');
/*!40000 ALTER TABLE `core_contact_categories` ENABLE KEYS */;


--
-- Definition of table `core_contacts`
--

DROP TABLE IF EXISTS `core_contacts`;
CREATE TABLE `core_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_category_id` int(10) unsigned NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_contacts`
--

/*!40000 ALTER TABLE `core_contacts` DISABLE KEYS */;
INSERT INTO `core_contacts` (`id`,`name`,`contact_category_id`,`contact_no`,`email`) VALUES 
 (1,'Mehedi',4,'01797993131','mehedihasandb0@gmail.com'),
 (2,'Jahid',1,'3423423','jahid1@yahoo.com');
/*!40000 ALTER TABLE `core_contacts` ENABLE KEYS */;


--
-- Definition of table `core_customers`
--

DROP TABLE IF EXISTS `core_customers`;
CREATE TABLE `core_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `address` text DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_customers`
--

/*!40000 ALTER TABLE `core_customers` DISABLE KEYS */;
INSERT INTO `core_customers` (`id`,`name`,`mobile`,`email`,`created_at`,`updated_at`,`address`,`photo`) VALUES 
 (1,'Tanmoy','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (3,'Niyamot','3434343','niyamot@yahoo.com','2023-12-05 16:27:19','2023-12-05 16:27:19','Mirpur','3.png'),
 (6,'Jahidul Islam','34324324','mehedihasandb0@gmail.com','2023-12-05 16:28:16','2023-12-05 16:28:16','333','beetroot-hummus-23bae4e-jpg.jpg'),
 (7,'Jahidul2','34324324','mehedihasandb0@gmail.com','2023-12-05 16:43:59','2023-12-05 16:43:59','343','7.jpg'),
 (8,'Mehedi3','34324324','mehedihasandb0@gmail.com','2023-12-05 16:31:09','2023-12-05 16:31:09','','34324324.jpg'),
 (9,'Sabbir Ahmed','34343434','sabbir3@gmail.com','2023-12-30 15:30:13','2023-12-30 15:30:13','NA',NULL),
 (10,'Abdur Rahman','35443434','abrahman@gmail.com','2023-12-30 15:32:00','2023-12-30 15:32:00','Rampua',NULL),
 (12,'Mahedi Hassanere','9433442sfds','mah3edi@gmail.com','2023-12-30 15:59:14','2023-12-30 15:59:14','NA',NULL),
 (15,'Siam','44444444','siam@yahoo.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (21,'Laiju','123456778','laiju@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (25,'abc','0000','abc@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (28,'Md Salman Aisur Rahman','019886131','salman@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (29,'Atiquer Rahman','098563146','Atiqur@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (30,'razib','1222222','razijb@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (31,'','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (32,'Al AMin','96354965','Alamin@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (33,'Rahul ','8797446','Rahul@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (34,'Laiju','98754324','laiju@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (35,'Engr. Naiiyem Hossain','12555555','naiyem@gmail.com','0000-00-00 00:00:00','0000-00-00 00:00:00','',''),
 (36,'Naiyem','35443434','Naiyem@gmail.com','2025-06-23 06:22:18','2025-06-23 06:22:18','Dhaka',NULL);
/*!40000 ALTER TABLE `core_customers` ENABLE KEYS */;


--
-- Definition of table `core_deliveries`
--

DROP TABLE IF EXISTS `core_deliveries`;
CREATE TABLE `core_deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  `shipper_id` int(10) unsigned NOT NULL,
  `shipped_at` datetime NOT NULL,
  `delivery_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_deliveries`
--

/*!40000 ALTER TABLE `core_deliveries` DISABLE KEYS */;
INSERT INTO `core_deliveries` (`id`,`create_at`,`order_id`,`person_id`,`shipper_id`,`shipped_at`,`delivery_status_id`) VALUES 
 (1,'2025-04-12 00:00:00',43,1,1,'2025-04-12 00:00:00',1),
 (2,'2025-04-12 00:00:00',43,1,1,'2025-04-12 00:00:00',1),
 (3,'2025-04-12 00:00:00',45,1,1,'2025-04-12 00:00:00',1);
/*!40000 ALTER TABLE `core_deliveries` ENABLE KEYS */;


--
-- Definition of table `core_delivery_details`
--

DROP TABLE IF EXISTS `core_delivery_details`;
CREATE TABLE `core_delivery_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` varchar(45) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_delivery_details`
--

/*!40000 ALTER TABLE `core_delivery_details` DISABLE KEYS */;
INSERT INTO `core_delivery_details` (`id`,`delivery_id`,`product_id`,`qty`,`price`) VALUES 
 (1,'1',56,'1',500),
 (2,'2',56,'1',500),
 (3,'3',56,'13',500);
/*!40000 ALTER TABLE `core_delivery_details` ENABLE KEYS */;


--
-- Definition of table `core_delivery_status`
--

DROP TABLE IF EXISTS `core_delivery_status`;
CREATE TABLE `core_delivery_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_delivery_status`
--

/*!40000 ALTER TABLE `core_delivery_status` DISABLE KEYS */;
INSERT INTO `core_delivery_status` (`id`,`name`) VALUES 
 (1,'In transit'),
 (2,'Shipped');
/*!40000 ALTER TABLE `core_delivery_status` ENABLE KEYS */;


--
-- Definition of table `core_departments`
--

DROP TABLE IF EXISTS `core_departments`;
CREATE TABLE `core_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_departments`
--

/*!40000 ALTER TABLE `core_departments` DISABLE KEYS */;
INSERT INTO `core_departments` (`id`,`code`,`name`) VALUES 
 (1,'10','Accounts'),
 (2,'20','IT'),
 (3,'30','HR'),
 (4,'40','Sales and Marketing');
/*!40000 ALTER TABLE `core_departments` ENABLE KEYS */;


--
-- Definition of table `core_districts`
--

DROP TABLE IF EXISTS `core_districts`;
CREATE TABLE `core_districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `division_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_districts`
--

/*!40000 ALTER TABLE `core_districts` DISABLE KEYS */;
INSERT INTO `core_districts` (`id`,`name`,`division_id`) VALUES 
 (1,'Narayangang',1),
 (2,'Nonakhali',3),
 (3,'Feni',3),
 (4,'Tingile',1),
 (5,'Gajipur',1),
 (6,'Potuakhali',2),
 (7,'Dhaka',1);
/*!40000 ALTER TABLE `core_districts` ENABLE KEYS */;


--
-- Definition of table `core_divisions`
--

DROP TABLE IF EXISTS `core_divisions`;
CREATE TABLE `core_divisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_divisions`
--

/*!40000 ALTER TABLE `core_divisions` DISABLE KEYS */;
INSERT INTO `core_divisions` (`id`,`name`) VALUES 
 (1,'Dhaka'),
 (2,'Borishal'),
 (3,'Chottrogram');
/*!40000 ALTER TABLE `core_divisions` ENABLE KEYS */;


--
-- Definition of table `core_ecom_coupons`
--

DROP TABLE IF EXISTS `core_ecom_coupons`;
CREATE TABLE `core_ecom_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon` varchar(45) NOT NULL,
  `percent_b2b` double NOT NULL,
  `percent_b2c` double NOT NULL,
  `percent_m` double NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_ecom_coupons`
--

/*!40000 ALTER TABLE `core_ecom_coupons` DISABLE KEYS */;
INSERT INTO `core_ecom_coupons` (`id`,`coupon`,`percent_b2b`,`percent_b2c`,`percent_m`,`start_date`,`end_date`,`created_at`) VALUES 
 (1,'AX353',5,3,4,'2025-04-09 00:00:00','2025-04-30 00:00:00','2025-04-09 11:06:25');
/*!40000 ALTER TABLE `core_ecom_coupons` ENABLE KEYS */;


--
-- Definition of table `core_ecom_used_coupons`
--

DROP TABLE IF EXISTS `core_ecom_used_coupons`;
CREATE TABLE `core_ecom_used_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `coupon_id` int(10) unsigned NOT NULL,
  `used_at` datetime NOT NULL,
  `percent_given` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_failed_jobs`
--

DROP TABLE IF EXISTS `core_failed_jobs`;
CREATE TABLE `core_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Definition of table `core_hms_appointments`
--

DROP TABLE IF EXISTS `core_hms_appointments`;
CREATE TABLE `core_hms_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  `appointment_at` datetime NOT NULL,
  `cc` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hms_consultants`
--

DROP TABLE IF EXISTS `core_hms_consultants`;
CREATE TABLE `core_hms_consultants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `hms_department_id` int(10) unsigned NOT NULL,
  `designation` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_consultants`
--

/*!40000 ALTER TABLE `core_hms_consultants` DISABLE KEYS */;
INSERT INTO `core_hms_consultants` (`id`,`name`,`hms_department_id`,`designation`) VALUES 
 (1,'Dr. Moshaidul Islam',1,'MBBS'),
 (2,'Jahidul Islam',2,'Prof.');
/*!40000 ALTER TABLE `core_hms_consultants` ENABLE KEYS */;


--
-- Definition of table `core_hms_departments`
--

DROP TABLE IF EXISTS `core_hms_departments`;
CREATE TABLE `core_hms_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_departments`
--

/*!40000 ALTER TABLE `core_hms_departments` DISABLE KEYS */;
INSERT INTO `core_hms_departments` (`id`,`name`) VALUES 
 (1,'Medicine'),
 (2,'ENT');
/*!40000 ALTER TABLE `core_hms_departments` ENABLE KEYS */;

--
-- Definition of table `core_hms_invoices`
--

DROP TABLE IF EXISTS `core_hms_invoices`;
CREATE TABLE `core_hms_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `invoice_total` float DEFAULT NULL,
  `paid_total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `payment_term` varchar(45) DEFAULT NULL,
  `previous_due` float DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hms_invoices`
--

/*!40000 ALTER TABLE `core_hms_invoices` DISABLE KEYS */;
INSERT INTO `core_hms_invoices` (`id`,`patient_id`,`remark`,`created_at`,`invoice_total`,`paid_total`,`discount`,`vat`,`payment_term`,`previous_due`,`updated_at`) VALUES 
 (1,0,'','0000-00-00 00:00:00',0,0,0,0,'',0,'0000-00-00 00:00:00'),
 (2,0,'','0000-00-00 00:00:00',0,0,0,0,'',0,'0000-00-00 00:00:00'),
 (3,1,'Na','2025-01-10 00:00:00',399,399,0,0,'CASH',0,'0000-00-00 00:00:00'),
 (4,1,'Na','2025-01-10 00:00:00',399,399,0,0,'CASH',0,'0000-00-00 00:00:00'),
 (5,0,'Na','0000-00-00 00:00:00',9000,9000,0,0,'CASH',0,'0000-00-00 00:00:00'),
 (6,0,'Na','0000-00-00 00:00:00',9000,9000,0,0,'CASH',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `core_hms_invoices` ENABLE KEYS */;


--
-- Definition of table `core_hms_invoice_detials`
--

DROP TABLE IF EXISTS `core_hms_invoice_detials`;
CREATE TABLE `core_hms_invoice_detials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `unit` float NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hms_invoice_detials`
--

/*!40000 ALTER TABLE `core_hms_invoice_detials` DISABLE KEYS */;
INSERT INTO `core_hms_invoice_detials` (`id`,`invoice_id`,`service_id`,`unit`,`price`,`discount`,`vat`) VALUES 
 (1,3,1,1,1000,0,0),
 (2,3,2,1,2000,0,0),
 (3,4,1,1,1000,0,0),
 (4,4,2,1,2000,0,0),
 (5,5,2,1,3000,0,0),
 (6,5,3,1,6000,0,0),
 (7,6,2,1,3000,0,0),
 (8,6,3,1,6000,0,0);
/*!40000 ALTER TABLE `core_hms_invoice_detials` ENABLE KEYS */;


--
-- Definition of table `core_hms_medicine_categories`
--

DROP TABLE IF EXISTS `core_hms_medicine_categories`;
CREATE TABLE `core_hms_medicine_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_medicine_categories`
--

/*!40000 ALTER TABLE `core_hms_medicine_categories` DISABLE KEYS */;
INSERT INTO `core_hms_medicine_categories` (`id`,`name`) VALUES 
 (1,'Antibiotic'),
 (2,'Vitamin'),
 (3,'Painkiller'),
 (4,'Antacids');
/*!40000 ALTER TABLE `core_hms_medicine_categories` ENABLE KEYS */;


--
-- Definition of table `core_hms_medicine_types`
--

DROP TABLE IF EXISTS `core_hms_medicine_types`;
CREATE TABLE `core_hms_medicine_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_medicine_types`
--

/*!40000 ALTER TABLE `core_hms_medicine_types` DISABLE KEYS */;
INSERT INTO `core_hms_medicine_types` (`id`,`name`) VALUES 
 (1,'Tab'),
 (2,'Inj'),
 (3,'Syr'),
 (4,'Cap');
/*!40000 ALTER TABLE `core_hms_medicine_types` ENABLE KEYS */;


--
-- Definition of table `core_hms_medicines`
--

DROP TABLE IF EXISTS `core_hms_medicines`;
CREATE TABLE `core_hms_medicines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `hms_medicine_category_id` int(10) unsigned NOT NULL,
  `hms_medicine_type_id` int(10) unsigned NOT NULL,
  `generic_name` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_medicines`
--

/*!40000 ALTER TABLE `core_hms_medicines` DISABLE KEYS */;
INSERT INTO `core_hms_medicines` (`id`,`name`,`hms_medicine_category_id`,`hms_medicine_type_id`,`generic_name`,`description`) VALUES 
 (1,'Napa 500mg',4,1,'Paracitamal','Na'),
 (2,'Seclo 20mg',3,4,'Antacid','Na'),
 (3,'Tabib',2,3,'IBN SINA','None');
/*!40000 ALTER TABLE `core_hms_medicines` ENABLE KEYS */;


--
-- Definition of table `core_hms_patients`
--

DROP TABLE IF EXISTS `core_hms_patients`;
CREATE TABLE `core_hms_patients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `mob_ext` int(10) unsigned NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `profession` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_patients`
--

/*!40000 ALTER TABLE `core_hms_patients` DISABLE KEYS */;
INSERT INTO `core_hms_patients` (`id`,`name`,`mobile`,`dob`,`mob_ext`,`gender`,`profession`) VALUES 
 (1,'Jahidul Islam','038403423','2000-01-01',1,1,'student'),
 (2,'Jamuna','034343345','2023-01-02',1,1,'na'),
 (3,'Abdur Rahman','23432432','2000-01-20',1,1,'Student'),
 (4,'Laiju Akter ','01701010','2020-02-03',0,1,'Business');
/*!40000 ALTER TABLE `core_hms_patients` ENABLE KEYS */;

--
-- Definition of table `core_hms_prescriptions`
--

DROP TABLE IF EXISTS `core_hms_prescriptions`;
CREATE TABLE `core_hms_prescriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `consultant_id` int(10) unsigned NOT NULL,
  `cc` text NOT NULL,
  `rf` text NOT NULL,
  `investigation` text NOT NULL,
  `advice` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_prescriptions`
--

/*!40000 ALTER TABLE `core_hms_prescriptions` DISABLE KEYS */;
INSERT INTO `core_hms_prescriptions` (`id`,`patient_id`,`consultant_id`,`cc`,`rf`,`investigation`,`advice`) VALUES 
 (1,2,1,'Fiver','NA','x-ray','advice'),
 (2,2,1,'Cough','NA','X-RAY, Blood Test','Visit after 1 week'),
 (3,3,1,'Cold','RDD','Blood','Test'),
 (4,1,1,'Cold','BA','Blood Test','Tst'),
 (5,3,1,'','','','');
/*!40000 ALTER TABLE `core_hms_prescriptions` ENABLE KEYS */;

--
-- Definition of table `core_hms_prescription_details`
--

DROP TABLE IF EXISTS `core_hms_prescription_details`;
CREATE TABLE `core_hms_prescription_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prescription_id` int(10) unsigned NOT NULL,
  `medicine_id` int(10) unsigned NOT NULL,
  `dose` varchar(20) NOT NULL,
  `days` double NOT NULL,
  `suggestion` text NOT NULL,
  `medicine_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_hms_prescription_details`
--

/*!40000 ALTER TABLE `core_hms_prescription_details` DISABLE KEYS */;
INSERT INTO `core_hms_prescription_details` (`id`,`prescription_id`,`medicine_id`,`dose`,`days`,`suggestion`,`medicine_name`) VALUES 
 (1,2,1,'0+0+1',1,'after meal','Napa 500mg'),
 (2,2,2,'1+1+1',3,'after meal','Seclo 20mg'),
 (3,3,1,'0+0+1',1,'dfg','Napa 500mg'),
 (4,4,1,'1+0+0',2,'Test','Napa 500mg'),
 (5,4,2,'1+1+1',3,'Test','Seclo 20mg'),
 (6,5,1,'0+1+0',2,'433','1-Napa 500mg'),
 (7,6,1,'1+0+1',2,'433','1-Napa 500mg'),
 (8,6,1,'0+1+1',3,'433','1-Napa 500mg'),
 (9,7,1,'0+0+1',1,'','1-Napa 500mg'),
 (10,7,2,'1+0+1',1,'ddd','2-Seclo 20mg'),
 (11,8,1,'0+0+1',1,'test','1-Napa 500mg'),
 (12,8,1,'0+0+1',1,'test','1-Napa 500mg'),
 (13,9,1,'0+0+1',1,'test','1-Napa 500mg'),
 (14,9,1,'0+0+1',1,'test','1-Napa 500mg');
/*!40000 ALTER TABLE `core_hms_prescription_details` ENABLE KEYS */;

--
-- Definition of table `core_hms_service_categories`
--

DROP TABLE IF EXISTS `core_hms_service_categories`;
CREATE TABLE `core_hms_service_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hms_service_categories`
--

/*!40000 ALTER TABLE `core_hms_service_categories` DISABLE KEYS */;
INSERT INTO `core_hms_service_categories` (`id`,`name`) VALUES 
 (1,'Pathology'),
 (2,'Hospital'),
 (3,'Therapy');
/*!40000 ALTER TABLE `core_hms_service_categories` ENABLE KEYS */;


--
-- Definition of table `core_hms_services`
--

DROP TABLE IF EXISTS `core_hms_services`;
CREATE TABLE `core_hms_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hms_services`
--

/*!40000 ALTER TABLE `core_hms_services` DISABLE KEYS */;
INSERT INTO `core_hms_services` (`id`,`name`,`price`,`discount`,`vat`,`category_id`) VALUES 
 (1,'X-Ray',1000,0,0,1),
 (2,'ECG',3000,0,0,1),
 (3,'MRI',6000,0,0,2);
/*!40000 ALTER TABLE `core_hms_services` ENABLE KEYS */;


--
-- Definition of table `core_hotel_beds`
--

DROP TABLE IF EXISTS `core_hotel_beds`;
CREATE TABLE `core_hotel_beds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `hotel_id` int(10) unsigned NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hotel_bookings`
--

DROP TABLE IF EXISTS `core_hotel_bookings`;
CREATE TABLE `core_hotel_bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `booking_date` datetime NOT NULL,
  `paid_amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Definition of table `core_hotel_booking_details`
--

DROP TABLE IF EXISTS `core_hotel_booking_details`;
CREATE TABLE `core_hotel_booking_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned NOT NULL,
  `bed_id` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `book_from` datetime NOT NULL,
  `book_to` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hotel_receipts`
--

DROP TABLE IF EXISTS `core_hotel_receipts`;
CREATE TABLE `core_hotel_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `receipt_total` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hotel_receipts_details`
--

DROP TABLE IF EXISTS `core_hotel_receipts_details`;
CREATE TABLE `core_hotel_receipts_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  `bed_id` int(10) unsigned NOT NULL,
  `book_from` datetime DEFAULT NULL,
  `book_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hotels`
--

DROP TABLE IF EXISTS `core_hotels`;
CREATE TABLE `core_hotels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_attendace_methods`
--

DROP TABLE IF EXISTS `core_hr_attendace_methods`;
CREATE TABLE `core_hr_attendace_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_attendances`
--

DROP TABLE IF EXISTS `core_hr_attendances`;
CREATE TABLE `core_hr_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `att_datetime` datetime NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Definition of table `core_hr_leave_application_status`
--

DROP TABLE IF EXISTS `core_hr_leave_application_status`;
CREATE TABLE `core_hr_leave_application_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_leave_applications`
--

DROP TABLE IF EXISTS `core_hr_leave_applications`;
CREATE TABLE `core_hr_leave_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  `reason_id` int(10) unsigned NOT NULL,
  `remark` varchar(45) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_leave_categories`
--

DROP TABLE IF EXISTS `core_hr_leave_categories`;
CREATE TABLE `core_hr_leave_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_leave_categories`
--

/*!40000 ALTER TABLE `core_hr_leave_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_leave_categories` ENABLE KEYS */;


--
-- Definition of table `core_hr_leave_configs`
--

DROP TABLE IF EXISTS `core_hr_leave_configs`;
CREATE TABLE `core_hr_leave_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_leave_configs`
--

/*!40000 ALTER TABLE `core_hr_leave_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_leave_configs` ENABLE KEYS */;


--
-- Definition of table `core_hr_leave_transactions`
--

DROP TABLE IF EXISTS `core_hr_leave_transactions`;
CREATE TABLE `core_hr_leave_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `days` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_leave_transactions`
--

/*!40000 ALTER TABLE `core_hr_leave_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_leave_transactions` ENABLE KEYS */;


--
-- Definition of table `core_hr_payroll_configs`
--

DROP TABLE IF EXISTS `core_hr_payroll_configs`;
CREATE TABLE `core_hr_payroll_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `payroll_item_id` int(10) unsigned NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_payroll_configs`
--

/*!40000 ALTER TABLE `core_hr_payroll_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_configs` ENABLE KEYS */;


--
-- Definition of table `core_hr_payroll_invoice_details`
--

DROP TABLE IF EXISTS `core_hr_payroll_invoice_details`;
CREATE TABLE `core_hr_payroll_invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_payroll_invoices`
--

DROP TABLE IF EXISTS `core_hr_payroll_invoices`;
CREATE TABLE `core_hr_payroll_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `billed_at` datetime NOT NULL,
  `invoice_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_payroll_invoices`
--

/*!40000 ALTER TABLE `core_hr_payroll_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_invoices` ENABLE KEYS */;


--
-- Definition of table `core_hr_payroll_invoice_details`
--

DROP TABLE IF EXISTS `core_hr_payroll_invoice_details`;
CREATE TABLE `core_hr_payroll_invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Definition of table `core_hr_payroll_item_types`
--

DROP TABLE IF EXISTS `core_hr_payroll_item_types`;
CREATE TABLE `core_hr_payroll_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_payroll_item_types`
--

/*!40000 ALTER TABLE `core_hr_payroll_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_item_types` ENABLE KEYS */;


--
-- Definition of table `core_hr_payroll_items`
--

DROP TABLE IF EXISTS `core_hr_payroll_items`;
CREATE TABLE `core_hr_payroll_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_payroll_items`
--

/*!40000 ALTER TABLE `core_hr_payroll_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_items` ENABLE KEYS */;

--
-- Dumping data for table `core_hr_payroll_receipt_details`
--

/*!40000 ALTER TABLE `core_hr_payroll_receipt_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_receipt_details` ENABLE KEYS */;


--
-- Definition of table `core_hr_payroll_receipts`
--

DROP TABLE IF EXISTS `core_hr_payroll_receipts`;
CREATE TABLE `core_hr_payroll_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `receipt_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Definition of table `core_hr_payroll_receipt_details`
--

DROP TABLE IF EXISTS `core_hr_payroll_receipt_details`;
CREATE TABLE `core_hr_payroll_receipt_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_payroll_receipts`
--

/*!40000 ALTER TABLE `core_hr_payroll_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_payroll_receipts` ENABLE KEYS */;


--
-- Definition of table `core_hr_person_shifts`
--

DROP TABLE IF EXISTS `core_hr_person_shifts`;
CREATE TABLE `core_hr_person_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `shift_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_person_shifts`
--

/*!40000 ALTER TABLE `core_hr_person_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_person_shifts` ENABLE KEYS */;


--
-- Definition of table `core_hr_shifts`
--

DROP TABLE IF EXISTS `core_hr_shifts`;
CREATE TABLE `core_hr_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `from_time` datetime NOT NULL,
  `to_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_hr_shifts`
--

/*!40000 ALTER TABLE `core_hr_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_hr_shifts` ENABLE KEYS */;

--
-- Definition of table `core_invoices`
--

DROP TABLE IF EXISTS `core_invoices`;
CREATE TABLE `core_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `payment_term` varchar(45) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invoice_total` float NOT NULL,
  `paid_total` float NOT NULL,
  `previous_due` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_invoices`
--

/*!40000 ALTER TABLE `core_invoices` DISABLE KEYS */;
INSERT INTO `core_invoices` (`id`,`customer_id`,`created_at`,`remark`,`payment_term`,`updated_at`,`invoice_total`,`paid_total`,`previous_due`) VALUES 
 (1,1,'2025-04-01 00:00:00','Na','','2025-04-01 00:00:00',199,199,0),
 (2,1,'2025-04-01 00:00:00','Na','','2025-04-01 00:00:00',199,199,0),
 (3,1,'2025-04-01 00:00:00','Na','CASH','2025-04-01 00:00:00',199,199,0),
 (4,1,'2025-04-01 00:00:00','Na','CASH','2025-04-01 00:00:00',199,199,0),
 (5,1,'2025-04-01 00:00:00','Na','CASH','2025-04-01 00:00:00',199,199,0),
 (6,1,'0000-00-00 00:00:00','Na','','0000-00-00 00:00:00',0,0,0),
 (7,9,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',0,0,0),
 (8,1,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',100,100,0),
 (9,1,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',1200,1200,0),
 (10,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (11,9,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',6888,6888,0),
 (12,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (13,8,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',1199,1199,0),
 (15,8,'0000-00-00 00:00:00','Na','CASH','0000-00-00 00:00:00',655,655,0),
 (17,1,'2025-05-06 00:00:00','Na','CASH','2025-05-06 00:00:00',20100,20100,0),
 (18,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (19,8,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',200,200,0),
 (20,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (21,15,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',5800,5800,0),
 (22,1,'2025-04-01 00:00:00','Na','CASH','2025-04-01 00:00:00',199,199,0),
 (23,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (24,15,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',11300,11300,0),
 (25,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (26,0,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',200,200,0),
 (27,1,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',11200,11200,0),
 (28,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (29,1,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',11200,11200,0),
 (30,0,'0000-00-00 00:00:00','','','0000-00-00 00:00:00',0,0,0),
 (31,15,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',400,400,0),
 (32,15,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',400,400,0),
 (33,6,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',500,500,0),
 (34,10,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',100,100,0),
 (35,9,'2025-05-07 00:00:00','Na','CASH','2025-05-07 00:00:00',200,200,0);
/*!40000 ALTER TABLE `core_invoices` ENABLE KEYS */;


--
-- Definition of table `core_invoice_details`
--

DROP TABLE IF EXISTS `core_invoice_details`;
CREATE TABLE `core_invoice_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `qty` float NOT NULL,
  `discount` float NOT NULL,
  `vat` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_invoice_details`
--

/*!40000 ALTER TABLE `core_invoice_details` DISABLE KEYS */;
INSERT INTO `core_invoice_details` (`id`,`invoice_id`,`product_id`,`price`,`qty`,`discount`,`vat`) VALUES 
 (1,5,1,299,3,0,0),
 (2,5,2,399,2,0,0),
 (3,6,50,100,1,0,0),
 (4,6,17,200,1,0,0),
 (5,7,50,467,1,0,0),
 (6,8,17,100,1,0,0),
 (7,9,56,100,4,0,0),
 (8,9,47,200,4,0,0),
 (9,11,47,3444,1,0,0),
 (10,11,52,3444,1,0,0),
 (11,13,52,544,1,0,0),
 (12,13,47,655,1,0,0),
 (13,15,47,655,1,0,0),
 (14,17,46,100,1,0,0),
 (15,17,52,20000,1,0,0),
 (16,19,47,100,1,0,0),
 (17,19,50,100,1,0,0),
 (18,21,17,5500,1,0,0),
 (19,21,47,100,1,0,0),
 (20,22,1,299,3,0,0),
 (21,22,2,399,2,0,0),
 (22,24,17,5500,1,0,0),
 (23,26,46,100,1,0,0),
 (24,26,50,100,1,0,0),
 (25,0,17,5500,1,0,0),
 (26,0,47,100,1,0,0),
 (27,27,17,5500,1,0,0),
 (28,27,47,100,1,0,0),
 (29,33,50,100,1,0,0),
 (30,34,46,100,1,0,0),
 (31,35,47,100,1,0,0),
 (32,35,50,100,1,0,0);
/*!40000 ALTER TABLE `core_invoice_details` ENABLE KEYS */;


--
-- Definition of table `core_job_batches`
--

DROP TABLE IF EXISTS `core_job_batches`;
CREATE TABLE `core_job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_job_batches`
--

/*!40000 ALTER TABLE `core_job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_job_batches` ENABLE KEYS */;


--
-- Definition of table `core_jobs`
--

DROP TABLE IF EXISTS `core_jobs`;
CREATE TABLE `core_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_jobs`
--

/*!40000 ALTER TABLE `core_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_jobs` ENABLE KEYS */;


--
-- Definition of table `core_manufacturers`
--

DROP TABLE IF EXISTS `core_manufacturers`;
CREATE TABLE `core_manufacturers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_manufacturers`
--

/*!40000 ALTER TABLE `core_manufacturers` DISABLE KEYS */;
INSERT INTO `core_manufacturers` (`id`,`name`) VALUES 
 (1,'APCL'),
 (2,'ISL'),
 (3,'IDB');
/*!40000 ALTER TABLE `core_manufacturers` ENABLE KEYS */;


--
-- Definition of table `core_me_customers`
--

DROP TABLE IF EXISTS `core_me_customers`;
CREATE TABLE `core_me_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `country` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_customers`
--

/*!40000 ALTER TABLE `core_me_customers` DISABLE KEYS */;
INSERT INTO `core_me_customers` (`id`,`name`,`mobile`,`address`,`email`,`gender`,`age`,`is_active`,`country`,`created_at`,`updated_at`) VALUES 
 (1,'Customer A','1112223333','123 Customer St','customerA@example.com','Male',35,1,'USA','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,'Customer B','2223334444','456 Client Ave','customerB@example.com','Female',28,1,'USA','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,'Customer C','3334445555','789 Buyer Rd','customerC@example.com','Other',42,1,'Canada','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,'Customer D','4445556666','321 Shopper Ln','customerD@example.com','Male',25,1,'UK','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,'Customer E','5556667777','654 Consumer Blvd','customerE@example.com','Female',31,1,'Australia','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (6,'Customer A','1112223333','123 Customer St','customerA@example.com','Male',35,1,'USA','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (7,'Customer B','2223334444','456 Client Ave','customerB@example.com','Female',28,1,'USA','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (8,'Customer C','3334445555','789 Buyer Rd','customerC@example.com','Other',42,1,'Canada','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (9,'Customer D','4445556666','321 Shopper Ln','customerD@example.com','Male',25,1,'UK','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (10,'Customer E','5556667777','654 Consumer Blvd','customerE@example.com','Female',31,1,'Australia','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (11,'Customer A','1112223333','123 Customer St','customerA@example.com','Male',35,1,'USA','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (12,'Customer B','2223334444','456 Client Ave','customerB@example.com','Female',28,1,'USA','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (13,'Customer C','3334445555','789 Buyer Rd','customerC@example.com','Other',42,1,'Canada','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (14,'Customer D','4445556666','321 Shopper Ln','customerD@example.com','Male',25,1,'UK','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (15,'Customer E','5556667777','654 Consumer Blvd','customerE@example.com','Female',31,1,'Australia','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (16,'Customer A','1112223333','123 Customer St','customerA@example.com','Male',35,1,'USA','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (17,'Customer B','2223334444','456 Client Ave','customerB@example.com','Female',28,1,'USA','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (18,'Customer C','3334445555','789 Buyer Rd','customerC@example.com','Other',42,1,'Canada','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (19,'Customer D','4445556666','321 Shopper Ln','customerD@example.com','Male',25,1,'UK','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (20,'Customer E','5556667777','654 Consumer Blvd','customerE@example.com','Female',31,1,'Australia','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_customers` ENABLE KEYS */;


--
-- Definition of table `core_me_invoices`
--

DROP TABLE IF EXISTS `core_me_invoices`;
CREATE TABLE `core_me_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `customer_id` int(11) DEFAULT NULL,
  `payment_term` varchar(50) DEFAULT NULL,
  `invoice_total` decimal(12,2) DEFAULT NULL,
  `paid_total` decimal(12,2) DEFAULT NULL,
  `previous_due` decimal(12,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discount` decimal(10,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `core_me_invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `core_me_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_invoices`
--

/*!40000 ALTER TABLE `core_me_invoices` DISABLE KEYS */;
INSERT INTO `core_me_invoices` (`id`,`name`,`customer_id`,`payment_term`,`invoice_total`,`paid_total`,`previous_due`,`remarks`,`created_at`,`updated_at`,`discount`) VALUES 
 (1,'INV-2023-001',0,'Net 30','1500.00','1500.00','0.00','First invoice','2025-06-30 10:01:56','2025-06-30 10:01:56','0'),
 (2,'INV-2023-002',0,'Net 15','850.00','500.00','0.00','Partial payment','2025-06-30 10:01:56','2025-06-30 10:01:56','0'),
 (3,'INV-2023-003',0,'Net 30','2200.00','2200.00','0.00','Bulk order','2025-06-30 10:01:56','2025-06-30 10:01:56','0'),
 (4,'INV-2023-004',0,'Net 7','1200.00','0.00','0.00','New customer','2025-06-30 10:01:56','2025-06-30 10:01:56','0'),
 (5,'INV-2023-005',0,'Net 30','1800.00','1800.00','0.00','Regular customer','2025-06-30 10:01:56','2025-06-30 10:01:56','0'),
 (6,'INV-2023-001',0,'Net 30','1500.00','1500.00','0.00','First invoice','2025-06-30 11:52:46','2025-06-30 11:52:46','0'),
 (7,'INV-2023-002',0,'Net 15','850.00','500.00','0.00','Partial payment','2025-06-30 11:52:46','2025-06-30 11:52:46','0'),
 (8,'INV-2023-003',0,'Net 30','2200.00','2200.00','0.00','Bulk order','2025-06-30 11:52:46','2025-06-30 11:52:46','0'),
 (9,'INV-2023-004',0,'Net 7','1200.00','0.00','0.00','New customer','2025-06-30 11:52:46','2025-06-30 11:52:46','0'),
 (10,'INV-2023-005',0,'Net 30','1800.00','1800.00','0.00','Regular customer','2025-06-30 11:52:46','2025-06-30 11:52:46','0'),
 (11,'INV-2023-001',0,'Net 30','1500.00','1500.00','0.00','First invoice','2025-06-30 12:41:07','2025-06-30 12:41:07','0'),
 (12,'INV-2023-002',0,'Net 15','850.00','500.00','0.00','Partial payment','2025-06-30 12:41:07','2025-06-30 12:41:07','0'),
 (13,'INV-2023-003',0,'Net 30','2200.00','2200.00','0.00','Bulk order','2025-06-30 12:41:07','2025-06-30 12:41:07','0'),
 (14,'INV-2023-004',0,'Net 7','1200.00','0.00','0.00','New customer','2025-06-30 12:41:07','2025-06-30 12:41:07','0'),
 (15,'INV-2023-005',0,'Net 30','1800.00','1800.00','0.00','Regular customer','2025-06-30 12:41:07','2025-06-30 12:41:07','0'),
 (16,'INV-2023-001',0,'Net 30','1500.00','1500.00','0.00','First invoice','2025-06-30 12:42:30','2025-06-30 12:42:30','0'),
 (17,'INV-2023-002',0,'Net 15','850.00','500.00','0.00','Partial payment','2025-06-30 12:42:30','2025-06-30 12:42:30','0'),
 (18,'INV-2023-003',0,'Net 30','2200.00','2200.00','0.00','Bulk order','2025-06-30 12:42:30','2025-06-30 12:42:30','0'),
 (19,'INV-2023-004',0,'Net 7','1200.00','0.00','0.00','New customer','2025-06-30 12:42:30','2025-06-30 12:42:30','0'),
 (20,'INV-2023-005',0,'Net 30','1800.00','1800.00','0.00','Regular customer','2025-06-30 12:42:30','2025-06-30 12:42:30','0'),
 (22,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 04:52:34',NULL,'20'),
 (23,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 04:54:24',NULL,'20'),
 (24,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 04:56:07',NULL,'20'),
 (25,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:00:38',NULL,'20'),
 (26,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:03:03',NULL,'20'),
 (27,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:03:07',NULL,'20'),
 (28,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:05:04',NULL,'20'),
 (29,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:05:15',NULL,'20'),
 (30,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:07:09',NULL,'20'),
 (31,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:14:15',NULL,'20'),
 (32,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:14:53',NULL,'20'),
 (33,'',1,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:15:14',NULL,'20'),
 (34,'',2,'Net 30','500.00','100.00','0.00','First invoice','2025-07-07 05:16:43',NULL,'20');
/*!40000 ALTER TABLE `core_me_invoices` ENABLE KEYS */;

--
-- Definition of table `core_me_invoice_details`
--

DROP TABLE IF EXISTS `core_me_invoice_details`;
CREATE TABLE `core_me_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `core_me_invoice_details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `core_me_invoices` (`id`),
  CONSTRAINT `core_me_invoice_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `core_me_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_invoice_details`
--

/*!40000 ALTER TABLE `core_me_invoice_details` DISABLE KEYS */;
INSERT INTO `core_me_invoice_details` (`id`,`invoice_id`,`product_id`,`price`,`qty`,`discount`,`vat`) VALUES 
 (1,1,0,'14.99',50,'1.50','0.75'),
 (2,1,0,'1099.00',1,'100.00','50.00'),
 (3,2,0,'24.99',20,'2.50','1.25'),
 (4,2,0,'699.00',1,'50.00','35.00'),
 (5,3,0,'5.00',200,'10.00','5.00'),
 (6,3,0,'14.99',100,'5.00','2.50'),
 (7,4,0,'1099.00',1,'100.00','50.00'),
 (8,4,0,'24.99',10,'1.00','0.50'),
 (9,5,0,'699.00',2,'75.00','35.00'),
 (10,5,0,'5.00',100,'5.00','2.50'),
 (11,1,0,'14.99',50,'1.50','0.75'),
 (12,1,0,'1099.00',1,'100.00','50.00'),
 (13,2,0,'24.99',20,'2.50','1.25'),
 (14,2,0,'699.00',1,'50.00','35.00'),
 (15,3,0,'5.00',200,'10.00','5.00'),
 (16,3,0,'14.99',100,'5.00','2.50'),
 (17,4,0,'1099.00',1,'100.00','50.00'),
 (18,4,0,'24.99',10,'1.00','0.50'),
 (19,5,0,'699.00',2,'75.00','35.00'),
 (20,5,0,'5.00',100,'5.00','2.50'),
 (21,1,0,'14.99',50,'1.50','0.75'),
 (22,1,0,'1099.00',1,'100.00','50.00'),
 (23,2,0,'24.99',20,'2.50','1.25'),
 (24,2,0,'699.00',1,'50.00','35.00'),
 (25,3,0,'5.00',200,'10.00','5.00'),
 (26,3,0,'14.99',100,'5.00','2.50'),
 (27,4,0,'1099.00',1,'100.00','50.00'),
 (28,4,0,'24.99',10,'1.00','0.50'),
 (29,5,0,'699.00',2,'75.00','35.00'),
 (30,5,0,'5.00',100,'5.00','2.50'),
 (31,1,0,'14.99',50,'1.50','0.75'),
 (32,1,0,'1099.00',1,'100.00','50.00'),
 (33,2,0,'24.99',20,'2.50','1.25'),
 (34,2,0,'699.00',1,'50.00','35.00'),
 (35,3,0,'5.00',200,'10.00','5.00'),
 (36,3,0,'14.99',100,'5.00','2.50'),
 (37,4,0,'1099.00',1,'100.00','50.00'),
 (38,4,0,'24.99',10,'1.00','0.50'),
 (39,5,0,'699.00',2,'75.00','35.00'),
 (40,5,0,'5.00',100,'5.00','2.50'),
 (44,31,12,'100.00',2,NULL,'5.00'),
 (45,31,13,'150.00',1,NULL,'7.50'),
 (46,32,12,'100.00',2,NULL,'5.00'),
 (47,32,13,'150.00',1,NULL,'7.50'),
 (48,33,12,'100.00',2,NULL,'5.00'),
 (49,33,13,'150.00',1,NULL,'7.50'),
 (50,34,12,'100.00',2,NULL,'5.00'),
 (51,34,13,'150.00',1,NULL,'7.50');
/*!40000 ALTER TABLE `core_me_invoice_details` ENABLE KEYS */;

--
-- Definition of table `core_me_money_stores`
--

DROP TABLE IF EXISTS `core_me_money_stores`;
CREATE TABLE `core_me_money_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `currency_type` varchar(50) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `vendors` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_money_stores`
--

/*!40000 ALTER TABLE `core_me_money_stores` DISABLE KEYS */;
INSERT INTO `core_me_money_stores` (`id`,`name`,`city`,`currency_type`,`contact`,`vendors`) VALUES 
 (1,'Main Store','New York','USD','John Doe','Supplier A, Supplier B'),
 (2,'Warehouse','New Jersey','USD','Jane Smith','Supplier C, Supplier D'),
 (3,'Online Store','Virtual','USD','Mike Johnson','Multiple vendors'),
 (4,'Outlet Store','Boston','USD','Sarah Williams','Supplier E'),
 (5,'Express Store','Philadelphia','USD','David Brown','Supplier F'),
 (6,'Main Store','New York','USD','John Doe','Supplier A, Supplier B'),
 (7,'Warehouse','New Jersey','USD','Jane Smith','Supplier C, Supplier D'),
 (8,'Online Store','Virtual','USD','Mike Johnson','Multiple vendors'),
 (9,'Outlet Store','Boston','USD','Sarah Williams','Supplier E'),
 (10,'Express Store','Philadelphia','USD','David Brown','Supplier F'),
 (11,'Main Store','New York','USD','John Doe','Supplier A, Supplier B'),
 (12,'Warehouse','New Jersey','USD','Jane Smith','Supplier C, Supplier D'),
 (13,'Online Store','Virtual','USD','Mike Johnson','Multiple vendors'),
 (14,'Outlet Store','Boston','USD','Sarah Williams','Supplier E'),
 (15,'Express Store','Philadelphia','USD','David Brown','Supplier F'),
 (16,'Main Store','New York','USD','John Doe','Supplier A, Supplier B'),
 (17,'Warehouse','New Jersey','USD','Jane Smith','Supplier C, Supplier D'),
 (18,'Online Store','Virtual','USD','Mike Johnson','Multiple vendors'),
 (19,'Outlet Store','Boston','USD','Sarah Williams','Supplier E'),
 (20,'Express Store','Philadelphia','USD','David Brown','Supplier F'),
 (21,'Main Store','New York','USD','John Doe','Supplier A, Supplier B'),
 (22,'Warehouse','New Jersey','USD','Jane Smith','Supplier C, Supplier D'),
 (23,'Online Store','Virtual','USD','Mike Johnson','Multiple vendors'),
 (24,'Outlet Store','Boston','USD','Sarah Williams','Supplier E'),
 (25,'Express Store','Philadelphia','USD','David Brown','Supplier F');
/*!40000 ALTER TABLE `core_me_money_stores` ENABLE KEYS */;


--
-- Definition of table `core_me_product_categories`
--

DROP TABLE IF EXISTS `core_me_product_categories`;
CREATE TABLE `core_me_product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_product_categories`
--

/*!40000 ALTER TABLE `core_me_product_categories` DISABLE KEYS */;
INSERT INTO `core_me_product_categories` (`id`,`name`,`description`,`product_id`,`status`,`created_at`,`updated_at`) VALUES 
 (11,'Russian_ruble-1000','Lates updated rubbles',6,'active','2025-06-30 05:53:52','2025-06-30 05:53:52'),
 (13,'Rice','Different varieties of rice',1,'active','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (14,'Mobile Phones','Smartphones and feature phones',2,'active','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (15,'Shirts','Casual and formal shirts',3,'active','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (16,'Sofas','Living room furniture',4,'active','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (17,'Notebooks','Writing notebooks',5,'active','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (19,'Mobile Phones','Smartphones and feature phones',2,'active','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (20,'Shirts','Casual and formal shirts',3,'active','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (21,'Sofas','Living room furniture',4,'active','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (22,'Notebooks','Writing notebooks',5,'active','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_product_categories` ENABLE KEYS */;


--
-- Definition of table `core_me_product_sections`
--

DROP TABLE IF EXISTS `core_me_product_sections`;
CREATE TABLE `core_me_product_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `core_me_product_sections_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `core_me_product_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_product_sections`
--

/*!40000 ALTER TABLE `core_me_product_sections` DISABLE KEYS */;
INSERT INTO `core_me_product_sections` (`id`,`name`,`unit_id`,`photo`) VALUES 
 (1,'Food Items',1,'food.png'),
 (2,'Beverages',3,'beverages.png'),
 (3,'Home Appliances',1,'appliances.png'),
 (4,'Men\'s Clothing',1,'mens_clothing.png'),
 (5,'Office Supplies',1,'office.png'),
 (6,'Food Items',1,'food.png'),
 (7,'Beverages',3,'beverages.png'),
 (8,'Home Appliances',1,'appliances.png'),
 (9,'Men\'s Clothing',1,'mens_clothing.png'),
 (10,'Office Supplies',1,'office.png'),
 (11,'Food Items',1,'food.png'),
 (12,'Beverages',3,'beverages.png'),
 (13,'Home Appliances',1,'appliances.png'),
 (14,'Men\'s Clothing',1,'mens_clothing.png'),
 (15,'Office Supplies',1,'office.png'),
 (16,'Food Items',1,'food.png'),
 (17,'Beverages',3,'beverages.png'),
 (18,'Home Appliances',1,'appliances.png'),
 (19,'Men\'s Clothing',1,'mens_clothing.png'),
 (20,'Office Supplies',1,'office.png');
/*!40000 ALTER TABLE `core_me_product_sections` ENABLE KEYS */;


--
-- Definition of table `core_me_product_types`
--

DROP TABLE IF EXISTS `core_me_product_types`;
CREATE TABLE `core_me_product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_product_types`
--

/*!40000 ALTER TABLE `core_me_product_types` DISABLE KEYS */;
INSERT INTO `core_me_product_types` (`id`,`name`,`description`) VALUES 
 (1,'Grocery','Daily grocery items'),
 (2,'Electronics','Electronic devices and accessories'),
 (3,'Clothing','Apparel and clothing items'),
 (4,'Furniture','Home and office furniture'),
 (5,'Stationery','Office and school stationery'),
 (6,'Grocery','Daily grocery items'),
 (7,'Electronics','Electronic devices and accessories'),
 (8,'Clothing','Apparel and clothing items'),
 (9,'Furniture','Home and office furniture'),
 (10,'Stationery','Office and school stationery'),
 (11,'Grocery','Daily grocery items'),
 (12,'Electronics','Electronic devices and accessories'),
 (13,'Clothing','Apparel and clothing items'),
 (14,'Furniture','Home and office furniture'),
 (15,'Stationery','Office and school stationery'),
 (16,'Grocery','Daily grocery items'),
 (17,'Electronics','Electronic devices and accessories'),
 (18,'Clothing','Apparel and clothing items'),
 (19,'Furniture','Home and office furniture'),
 (20,'Stationery','Office and school stationery');
/*!40000 ALTER TABLE `core_me_product_types` ENABLE KEYS */;


--
-- Definition of table `core_me_product_units`
--

DROP TABLE IF EXISTS `core_me_product_units`;
CREATE TABLE `core_me_product_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_product_units`
--

/*!40000 ALTER TABLE `core_me_product_units` DISABLE KEYS */;
INSERT INTO `core_me_product_units` (`id`,`name`,`photo`) VALUES 
 (1,'',''),
 (2,'Piece','piece.png'),
 (3,'Kilogram','kg.png'),
 (4,'Liter','liter.png'),
 (5,'Box','box.png'),
 (6,'Packet','packet.png');
/*!40000 ALTER TABLE `core_me_product_units` ENABLE KEYS */;


--
-- Definition of table `core_me_products`
--

DROP TABLE IF EXISTS `core_me_products`;
CREATE TABLE `core_me_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `regular_price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_section_id` int(11) DEFAULT NULL,
  `offer_discount` decimal(5,2) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_unit_id` (`product_unit_id`),
  CONSTRAINT `core_me_products_ibfk_1` FOREIGN KEY (`product_unit_id`) REFERENCES `core_me_product_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_products`
--

/*!40000 ALTER TABLE `core_me_products` DISABLE KEYS */;
INSERT INTO `core_me_products` (`id`,`name`,`offer_price`,`regular_price`,`description`,`photo`,`product_category_id`,`product_section_id`,`offer_discount`,`product_type_id`,`product_unit_id`,`created_at`,`updated_at`) VALUES 
 (12,'Russian_ruble-1000','40.00','11.00','Lates updated rubbles',NULL,11,2,'20.00',7,NULL,'2025-06-30 06:26:54','2025-06-30 06:26:54'),
 (13,'Russian_ruble-5000','100.00','50200.00','Lates updated rubbles','uploads/idAwofr4Tb3ve9ggzz6pP9XVm4XRHSvpCIAHg0zB.jpg',8,2,'100.00',9,NULL,'2025-06-30 06:28:48','2025-06-30 06:28:48'),
 (15,'iPhone 13','999.00','1099.00','Latest Apple smartphone','iphone13.jpg',2,3,'9.09',2,1,NULL,NULL),
 (16,'Cotton T-Shirt','19.99','24.99','100% cotton t-shirt','tshirt.jpg',3,4,'20.00',3,1,NULL,NULL),
 (17,'Leather Sofa','599.00','699.00','3-seater leather sofa','sofa.jpg',4,5,'14.31',4,1,NULL,NULL),
 (18,'A4 Notebook','4.50','5.00','100-page A4 notebook','notebook.jpg',5,5,'10.00',5,1,NULL,NULL),
 (19,'Basmati Rice','12.99','14.99','Premium quality basmati rice','basmati.jpg',1,1,'10.00',1,2,NULL,NULL),
 (20,'iPhone 13','999.00','1099.00','Latest Apple smartphone','iphone13.jpg',2,3,'9.09',2,1,NULL,NULL),
 (21,'Cotton T-Shirt','19.99','24.99','100% cotton t-shirt','tshirt.jpg',3,4,'20.00',3,1,NULL,NULL),
 (22,'Leather Sofa','599.00','699.00','3-seater leather sofa','sofa.jpg',4,5,'14.31',4,1,NULL,NULL),
 (23,'A4 Notebook','4.50','5.00','100-page A4 notebook','notebook.jpg',5,5,'10.00',5,1,NULL,NULL);
/*!40000 ALTER TABLE `core_me_products` ENABLE KEYS */;


--
-- Definition of table `core_me_purchases`
--

DROP TABLE IF EXISTS `core_me_purchases`;
CREATE TABLE `core_me_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `purchase_total` decimal(12,2) DEFAULT NULL,
  `paid_amount` decimal(12,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_purchases`
--

/*!40000 ALTER TABLE `core_me_purchases` DISABLE KEYS */;
INSERT INTO `core_me_purchases` (`id`,`name`,`purchase_date`,`shipping_address`,`purchase_total`,`paid_amount`,`remarks`,`status_id`,`discount`,`vat`,`created_at`,`updated_at`) VALUES 
 (1,'Purchase Order 001','2023-01-15','123 Main St, New York','2500.00','2500.00','Initial stock',2,'100.00','150.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,'Purchase Order 002','2023-02-20','456 Oak Ave, New Jersey','1800.00','1500.00','Restocking',1,'50.00','120.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,'Purchase Order 003','2023-03-10','789 Pine Rd, Boston','3200.00','3200.00','New products',2,'200.00','200.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,'Purchase Order 004','2023-04-05','321 Elm St, Philadelphia','1500.00','1000.00','Seasonal items',1,'75.00','90.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,'Purchase Order 005','2023-05-12','654 Maple Dr, Chicago','2750.00','2750.00','Bulk order',2,'125.00','165.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (6,'Purchase Order 001','2023-01-15','123 Main St, New York','2500.00','2500.00','Initial stock',2,'100.00','150.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (7,'Purchase Order 002','2023-02-20','456 Oak Ave, New Jersey','1800.00','1500.00','Restocking',1,'50.00','120.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (8,'Purchase Order 003','2023-03-10','789 Pine Rd, Boston','3200.00','3200.00','New products',2,'200.00','200.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (9,'Purchase Order 004','2023-04-05','321 Elm St, Philadelphia','1500.00','1000.00','Seasonal items',1,'75.00','90.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (10,'Purchase Order 005','2023-05-12','654 Maple Dr, Chicago','2750.00','2750.00','Bulk order',2,'125.00','165.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (11,'Purchase Order 001','2023-01-15','123 Main St, New York','2500.00','2500.00','Initial stock',2,'100.00','150.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (12,'Purchase Order 002','2023-02-20','456 Oak Ave, New Jersey','1800.00','1500.00','Restocking',1,'50.00','120.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (13,'Purchase Order 003','2023-03-10','789 Pine Rd, Boston','3200.00','3200.00','New products',2,'200.00','200.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (14,'Purchase Order 004','2023-04-05','321 Elm St, Philadelphia','1500.00','1000.00','Seasonal items',1,'75.00','90.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (15,'Purchase Order 005','2023-05-12','654 Maple Dr, Chicago','2750.00','2750.00','Bulk order',2,'125.00','165.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (16,'Purchase Order 001','2023-01-15','123 Main St, New York','2500.00','2500.00','Initial stock',2,'100.00','150.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (17,'Purchase Order 002','2023-02-20','456 Oak Ave, New Jersey','1800.00','1500.00','Restocking',1,'50.00','120.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (18,'Purchase Order 003','2023-03-10','789 Pine Rd, Boston','3200.00','3200.00','New products',2,'200.00','200.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (19,'Purchase Order 004','2023-04-05','321 Elm St, Philadelphia','1500.00','1000.00','Seasonal items',1,'75.00','90.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (20,'Purchase Order 005','2023-05-12','654 Maple Dr, Chicago','2750.00','2750.00','Bulk order',2,'125.00','165.00','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_purchases` ENABLE KEYS */;


--
-- Definition of table `core_me_purchase_details`
--

DROP TABLE IF EXISTS `core_me_purchase_details`;
CREATE TABLE `core_me_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `carate_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `core_me_purchase_details_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `core_me_purchases` (`id`),
  CONSTRAINT `core_me_purchase_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `core_me_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_purchase_details`
--

/*!40000 ALTER TABLE `core_me_purchase_details` DISABLE KEYS */;
INSERT INTO `core_me_purchase_details` (`id`,`purchase_id`,`product_id`,`qty`,`price`,`vat`,`discount`,`carate_at`,`update_at`) VALUES 
 (1,1,0,100,'10.00','5.00','1.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,1,0,5,'800.00','80.00','40.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,2,0,50,'15.00','1.50','0.75','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,2,0,2,'500.00','50.00','25.00','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,3,0,200,'3.00','0.30','0.15','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (6,3,0,150,'11.00','5.50','1.10','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (7,4,0,3,'850.00','85.00','42.50','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (8,4,0,30,'16.00','1.60','0.80','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (9,5,0,3,'550.00','55.00','27.50','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (10,5,0,150,'3.50','0.35','0.18','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (11,1,0,100,'10.00','5.00','1.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (12,1,0,5,'800.00','80.00','40.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (13,2,0,50,'15.00','1.50','0.75','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (14,2,0,2,'500.00','50.00','25.00','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (15,3,0,200,'3.00','0.30','0.15','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (16,3,0,150,'11.00','5.50','1.10','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (17,4,0,3,'850.00','85.00','42.50','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (18,4,0,30,'16.00','1.60','0.80','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (19,5,0,3,'550.00','55.00','27.50','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (20,5,0,150,'3.50','0.35','0.18','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (21,1,0,100,'10.00','5.00','1.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (22,1,0,5,'800.00','80.00','40.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (23,2,0,50,'15.00','1.50','0.75','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (24,2,0,2,'500.00','50.00','25.00','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (25,3,0,200,'3.00','0.30','0.15','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (26,3,0,150,'11.00','5.50','1.10','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (27,4,0,3,'850.00','85.00','42.50','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (28,4,0,30,'16.00','1.60','0.80','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (29,5,0,3,'550.00','55.00','27.50','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (30,5,0,150,'3.50','0.35','0.18','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (31,1,0,100,'10.00','5.00','1.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (32,1,0,5,'800.00','80.00','40.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (33,2,0,50,'15.00','1.50','0.75','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (34,2,0,2,'500.00','50.00','25.00','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (35,3,0,200,'3.00','0.30','0.15','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (36,3,0,150,'11.00','5.50','1.10','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (37,4,0,3,'850.00','85.00','42.50','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (38,4,0,30,'16.00','1.60','0.80','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (39,5,0,3,'550.00','55.00','27.50','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (40,5,0,150,'3.50','0.35','0.18','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_purchase_details` ENABLE KEYS */;



--
-- Definition of table `core_me_status`
--

DROP TABLE IF EXISTS `core_me_status`;
CREATE TABLE `core_me_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_status`
--

/*!40000 ALTER TABLE `core_me_status` DISABLE KEYS */;
INSERT INTO `core_me_status` (`id`,`name`,`code`,`description`,`created_at`,`updated_at`) VALUES 
 (1,'Pending','PEND','Transaction is pending','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,'Completed','COMP','Transaction completed successfully','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,'Cancelled','CANC','Transaction was cancelled','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,'Refunded','REF','Transaction was refunded','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,'On Hold','HOLD','Transaction is on hold','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (6,'Pending','PEND','Transaction is pending','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (7,'Completed','COMP','Transaction completed successfully','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (8,'Cancelled','CANC','Transaction was cancelled','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (9,'Refunded','REF','Transaction was refunded','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (10,'On Hold','HOLD','Transaction is on hold','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (11,'Pending','PEND','Transaction is pending','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (12,'Completed','COMP','Transaction completed successfully','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (13,'Cancelled','CANC','Transaction was cancelled','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (14,'Refunded','REF','Transaction was refunded','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (15,'On Hold','HOLD','Transaction is on hold','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (16,'Pending','PEND','Transaction is pending','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (17,'Completed','COMP','Transaction completed successfully','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (18,'Cancelled','CANC','Transaction was cancelled','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (19,'Refunded','REF','Transaction was refunded','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (20,'On Hold','HOLD','Transaction is on hold','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_status` ENABLE KEYS */;


--
-- Definition of table `core_me_stock_adjustment`
--

DROP TABLE IF EXISTS `core_me_stock_adjustment`;
CREATE TABLE `core_me_stock_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adjustment_type_id` int(11) DEFAULT NULL,
  `money_store_id` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_type_id` (`adjustment_type_id`),
  KEY `money_store_id` (`money_store_id`),
  CONSTRAINT `core_me_stock_adjustment_ibfk_1` FOREIGN KEY (`adjustment_type_id`) REFERENCES `core_mex_adjustment_types` (`id`),
  CONSTRAINT `core_me_stock_adjustment_ibfk_2` FOREIGN KEY (`money_store_id`) REFERENCES `core_me_money_stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_stock_adjustment`
--

/*!40000 ALTER TABLE `core_me_stock_adjustment` DISABLE KEYS */;
INSERT INTO `core_me_stock_adjustment` (`id`,`adjustment_at`,`user_id`,`adjustment_type_id`,`money_store_id`,`remarks`) VALUES 
 (1,'2023-01-20 10:00:00',1,1,1,'Damaged rice bags'),
 (2,'2023-02-25 11:30:00',2,2,2,'Found extra t-shirts'),
 (3,'2023-03-15 09:15:00',3,3,1,'Phone theft reported'),
 (4,'2023-04-10 14:45:00',4,4,3,'Customer sofa return'),
 (5,'2023-05-20 16:20:00',5,5,4,'Notebook miscount'),
 (6,'2023-01-20 10:00:00',1,1,1,'Damaged rice bags'),
 (7,'2023-02-25 11:30:00',2,2,2,'Found extra t-shirts'),
 (8,'2023-03-15 09:15:00',3,3,1,'Phone theft reported'),
 (9,'2023-04-10 14:45:00',4,4,3,'Customer sofa return'),
 (10,'2023-05-20 16:20:00',5,5,4,'Notebook miscount'),
 (11,'2023-01-20 10:00:00',1,1,1,'Damaged rice bags'),
 (12,'2023-02-25 11:30:00',2,2,2,'Found extra t-shirts'),
 (13,'2023-03-15 09:15:00',3,3,1,'Phone theft reported'),
 (14,'2023-04-10 14:45:00',4,4,3,'Customer sofa return'),
 (15,'2023-05-20 16:20:00',5,5,4,'Notebook miscount'),
 (16,'2023-01-20 10:00:00',1,1,1,'Damaged rice bags'),
 (17,'2023-02-25 11:30:00',2,2,2,'Found extra t-shirts'),
 (18,'2023-03-15 09:15:00',3,3,1,'Phone theft reported'),
 (19,'2023-04-10 14:45:00',4,4,3,'Customer sofa return'),
 (20,'2023-05-20 16:20:00',5,5,4,'Notebook miscount');
/*!40000 ALTER TABLE `core_me_stock_adjustment` ENABLE KEYS */;


--
-- Definition of table `core_me_stock_adjustment_details`
--

DROP TABLE IF EXISTS `core_me_stock_adjustment_details`;
CREATE TABLE `core_me_stock_adjustment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`),
  CONSTRAINT `core_me_stock_adjustment_details_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `core_me_stock_adjustment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_stock_adjustment_details`
--

/*!40000 ALTER TABLE `core_me_stock_adjustment_details` DISABLE KEYS */;
INSERT INTO `core_me_stock_adjustment_details` (`id`,`adjustment_id`,`product_id`,`qty`,`price`) VALUES 
 (1,1,1,5,'12.99'),
 (2,2,3,2,'19.99'),
 (3,3,2,1,'999.00'),
 (4,4,4,1,'599.00'),
 (5,5,5,10,'4.50'),
 (6,1,1,5,'12.99'),
 (7,2,3,2,'19.99'),
 (8,3,2,1,'999.00'),
 (9,4,4,1,'599.00'),
 (10,5,5,10,'4.50'),
 (11,1,1,5,'12.99'),
 (12,2,3,2,'19.99'),
 (13,3,2,1,'999.00'),
 (14,4,4,1,'599.00'),
 (15,5,5,10,'4.50'),
 (16,1,1,5,'12.99'),
 (17,2,3,2,'19.99'),
 (18,3,2,1,'999.00'),
 (19,4,4,1,'599.00'),
 (20,5,5,10,'4.50');
/*!40000 ALTER TABLE `core_me_stock_adjustment_details` ENABLE KEYS */;


--
-- Definition of table `core_me_stocks`
--

DROP TABLE IF EXISTS `core_me_stocks`;
CREATE TABLE `core_me_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `money_store_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `money_store_id` (`money_store_id`),
  CONSTRAINT `core_me_stocks_ibfk_1` FOREIGN KEY (`money_store_id`) REFERENCES `core_me_money_stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_stocks`
--

/*!40000 ALTER TABLE `core_me_stocks` DISABLE KEYS */;
INSERT INTO `core_me_stocks` (`id`,`name`,`product_id`,`qty`,`transaction_id`,`remarks`,`money_store_id`,`created_at`,`updated_at`) VALUES 
 (38,'Russian_ruble-1000',1,100,1,'na',15,'2025-06-30 06:24:29','2025-06-30 06:24:29'),
 (39,'Russian_ruble-5000',6,100,2,'na',3,'2025-06-30 06:25:42','2025-06-30 06:25:42'),
 (40,'Initial Rice Stock',1,100,1,'Initial purchase',1,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (41,'Phone Stock',2,5,1,'New phones',1,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (42,'T-Shirt Stock',3,50,2,'Summer collection',2,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (43,'Sofa Stock',4,2,2,'Living room furniture',3,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (44,'Notebook Stock',5,200,3,'Back to school',4,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (45,'Additional Rice',1,150,3,'Restocking',1,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (46,'Phone Restock',2,3,4,'New models',1,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (47,'T-Shirt Restock',3,30,4,'New colors',2,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (48,'Sofa Restock',4,3,5,'New designs',3,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (49,'Notebook Restock',5,150,5,'Year-end stock',4,'2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (50,'Initial Rice Stock',1,100,1,'Initial purchase',1,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (51,'Phone Stock',2,5,1,'New phones',1,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (52,'T-Shirt Stock',3,50,2,'Summer collection',2,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (53,'Sofa Stock',4,2,2,'Living room furniture',3,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (54,'Notebook Stock',5,200,3,'Back to school',4,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (55,'Additional Rice',1,150,3,'Restocking',1,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (56,'Phone Restock',2,3,4,'New models',1,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (57,'T-Shirt Restock',3,30,4,'New colors',2,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (58,'Sofa Restock',4,3,5,'New designs',3,'2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (59,'Notebook Restock',5,150,5,'Year-end stock',4,'2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_stocks` ENABLE KEYS */;


--
-- Definition of table `core_me_transactions`
--

DROP TABLE IF EXISTS `core_me_transactions`;
CREATE TABLE `core_me_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `transaction_type` enum('credit','debit') NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `core_me_transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `core_me_transactions_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_transactions`
--

/*!40000 ALTER TABLE `core_me_transactions` DISABLE KEYS */;
INSERT INTO `core_me_transactions` (`id`,`user_id`,`amount`,`transaction_type`,`status_id`,`remarks`,`created_at`,`updated_at`) VALUES 
 (1,1,'2500.00','debit',2,'Purchase Order 001 payment','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,2,'1500.00','debit',2,'Partial payment for PO 002','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,3,'3200.00','debit',2,'Purchase Order 003 payment','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,4,'1000.00','debit',2,'Partial payment for PO 004','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,5,'2750.00','debit',2,'Purchase Order 005 payment','2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (6,1,'2500.00','debit',2,'Purchase Order 001 payment','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (7,2,'1500.00','debit',2,'Partial payment for PO 002','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (8,3,'3200.00','debit',2,'Purchase Order 003 payment','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (9,4,'1000.00','debit',2,'Partial payment for PO 004','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (10,5,'2750.00','debit',2,'Purchase Order 005 payment','2025-06-30 11:52:46','2025-06-30 11:52:46'),
 (11,1,'2500.00','debit',2,'Purchase Order 001 payment','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (12,2,'1500.00','debit',2,'Partial payment for PO 002','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (13,3,'3200.00','debit',2,'Purchase Order 003 payment','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (14,4,'1000.00','debit',2,'Partial payment for PO 004','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (15,5,'2750.00','debit',2,'Purchase Order 005 payment','2025-06-30 12:41:07','2025-06-30 12:41:07'),
 (16,1,'2500.00','debit',2,'Purchase Order 001 payment','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (17,2,'1500.00','debit',2,'Partial payment for PO 002','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (18,3,'3200.00','debit',2,'Purchase Order 003 payment','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (19,4,'1000.00','debit',2,'Partial payment for PO 004','2025-06-30 12:42:29','2025-06-30 12:42:29'),
 (20,5,'2750.00','debit',2,'Purchase Order 005 payment','2025-06-30 12:42:29','2025-06-30 12:42:29');
/*!40000 ALTER TABLE `core_me_transactions` ENABLE KEYS */;


--
-- Definition of table `core_me_users`
--

DROP TABLE IF EXISTS `core_me_users`;
CREATE TABLE `core_me_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_me_users`
--

/*!40000 ALTER TABLE `core_me_users` DISABLE KEYS */;
INSERT INTO `core_me_users` (`id`,`name`,`email`,`password`,`mobile`,`address`,`is_active`,`created_at`,`updated_at`) VALUES 
 (1,'Admin User','admin@example.com','hashed_password1','1234567890','123 Main St',1,'2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (2,'Manager','manager@example.com','hashed_password2','2345678901','456 Oak Ave',1,'2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (3,'Sales Rep','sales@example.com','hashed_password3','3456789012','789 Pine Rd',1,'2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (4,'Warehouse Staff','warehouse@example.com','hashed_password4','4567890123','321 Elm St',1,'2025-06-30 10:01:56','2025-06-30 10:01:56'),
 (5,'Accountant','accountant@example.com','hashed_password5','5678901234','654 Maple Dr',1,'2025-06-30 10:01:56','2025-06-30 10:01:56');
/*!40000 ALTER TABLE `core_me_users` ENABLE KEYS */;


--
-- Definition of table `core_mex_adjustment_types`
--

DROP TABLE IF EXISTS `core_mex_adjustment_types`;
CREATE TABLE `core_mex_adjustment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `factor` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_adjustment_types`
--

/*!40000 ALTER TABLE `core_mex_adjustment_types` DISABLE KEYS */;
INSERT INTO `core_mex_adjustment_types` (`id`,`name`,`factor`) VALUES 
 (1,'Increase','1.00'),
 (2,'Decrease','-1.00'),
 (3,'Correction','0.00'),
 (4,'Transfer','1.00'),
 (5,'Return','-1.00'),
 (6,'Damaged','-1.00'),
 (7,'Found','1.00'),
 (8,'Theft','-1.00'),
 (9,'Return','1.00'),
 (10,'Miscount','0.50'),
 (11,'Damaged','-1.00'),
 (12,'Found','1.00'),
 (13,'Theft','-1.00'),
 (14,'Return','1.00'),
 (15,'Miscount','0.50'),
 (16,'Damaged','-1.00'),
 (17,'Found','1.00'),
 (18,'Theft','-1.00'),
 (19,'Return','1.00'),
 (20,'Miscount','0.50'),
 (21,'Damaged','-1.00'),
 (22,'Found','1.00'),
 (23,'Theft','-1.00'),
 (24,'Return','1.00'),
 (25,'Miscount','0.50');
/*!40000 ALTER TABLE `core_mex_adjustment_types` ENABLE KEYS */;


--
-- Definition of table `core_mex_adjustments`
--

DROP TABLE IF EXISTS `core_mex_adjustments`;
CREATE TABLE `core_mex_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_adjustments`
--

/*!40000 ALTER TABLE `core_mex_adjustments` DISABLE KEYS */;
INSERT INTO `core_mex_adjustments` (`id`,`agent_id`,`amount`,`type`,`reason`,`created_by`,`created_at`,`updated_at`) VALUES 
 (1,1,'1000.00','','ss',NULL,'2025-07-09 12:10:53','2025-07-09 12:10:53');
/*!40000 ALTER TABLE `core_mex_adjustments` ENABLE KEYS */;


--
-- Definition of table `core_mex_agents`
--

DROP TABLE IF EXISTS `core_mex_agents`;
CREATE TABLE `core_mex_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_agents`
--

/*!40000 ALTER TABLE `core_mex_agents` DISABLE KEYS */;
INSERT INTO `core_mex_agents` (`id`,`name`,`email`,`phone`,`created_at`,`updated_at`) VALUES 
 (1,'jone','jone@gmail.com','018225544112','2025-07-09 11:09:57','2025-07-09 11:09:57'),
 (2,'Roth Mcmahon','jerydo@mailinator.com','+1 (861) 166-7222','2025-07-14 06:52:23','2025-07-14 06:52:23'),
 (3,'Jayme Witt','modaqivid@mailinator.com','+1 (209) 758-1365','2025-07-14 06:52:30','2025-07-14 06:52:30'),
 (4,'Ignatius Moreno','satuc@mailinator.com','+1 (686) 216-4317','2025-07-14 06:52:37','2025-07-14 06:52:37'),
 (5,'Odysseus Barrett','saqokiv@mailinator.com','+1 (856) 901-2226','2025-07-14 06:52:42','2025-07-14 06:52:42');
/*!40000 ALTER TABLE `core_mex_agents` ENABLE KEYS */;


--
-- Definition of table `core_mex_authorities`
--

DROP TABLE IF EXISTS `core_mex_authorities`;
CREATE TABLE `core_mex_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_authorities`
--

/*!40000 ALTER TABLE `core_mex_authorities` DISABLE KEYS */;
INSERT INTO `core_mex_authorities` (`id`,`name`,`description`,`status`,`created_at`,`updated_at`) VALUES 
 (1,'Admin','Full access to all system functions','active','2025-07-13 09:48:29','2025-07-13 09:48:29'),
 (2,'Manager','Manage operations and user activities','active','2025-07-13 09:48:29','2025-07-13 09:48:29'),
 (3,'Teller','Handles customer transactions','active','2025-07-13 09:48:29','2025-07-13 09:48:29'),
 (4,'Auditor','Can view reports and logs','active','2025-07-13 09:48:29','2025-07-13 09:48:29'),
 (5,'Support','Provides customer support','inactive','2025-07-13 09:48:29','2025-07-13 09:48:29');
/*!40000 ALTER TABLE `core_mex_authorities` ENABLE KEYS */;


--
-- Definition of table `core_mex_currencies`
--

DROP TABLE IF EXISTS `core_mex_currencies`;
CREATE TABLE `core_mex_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(10) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code` (`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_currencies`
--

/*!40000 ALTER TABLE `core_mex_currencies` DISABLE KEYS */;
INSERT INTO `core_mex_currencies` (`id`,`currency_code`,`currency_name`,`symbol`,`photo`) VALUES 
 (1,'USD','US Dollar','$','uploads/WoZ18DocfF1KQK7Kl2oUh1SmnA6lJ1dn6vMkyoYd.jpg'),
 (2,'EUR','Euro','Ôé¼','uploads/RUFCwERnHn3LN93CgsKkYmftBxYfAyGfisac0UsV.jpg'),
 (3,'GBP','British Pound','?ú','uploads/Smx6FP57VXJpHFaQzy96m4dVPw5OjQfr67dHERH8.jpg'),
 (4,'JPY','Japanese Yen','?Ñ','uploads/15L3TX7GW3KbdfUzgCqWSaCIaY7aHr0T2W4vQIsi.jpg'),
 (5,'BDT','Bangladeshi Taka','Óº?','uploads/Vbphad3wa6neT4CfNdtSwnESbnKHbmn839e6zBeS.jpg');
/*!40000 ALTER TABLE `core_mex_currencies` ENABLE KEYS */;


--
-- Definition of table `core_mex_customers`
--

DROP TABLE IF EXISTS `core_mex_customers`;
CREATE TABLE `core_mex_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_type` varchar(50) DEFAULT NULL,
  `id_number` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `id_proof_document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_customers`
--

/*!40000 ALTER TABLE `core_mex_customers` DISABLE KEYS */;
INSERT INTO `core_mex_customers` (`id`,`name`,`id_type`,`id_number`,`phone`,`address`,`id_proof_document`,`created_at`) VALUES 
 (1,'Rahim Uddin','Passport','P12345678','01710000000','Dhaka, Bangladesh','rahim_passport.pdf','2025-07-09 10:04:06'),
 (2,'Karim Ali','NID','NID98765432','01820000000','Chittagong, Bangladesh','karim_nid.pdf','2025-07-09 10:04:06'),
 (3,'Anika Begum','Passport','P87654321','01930000000','Sylhet, Bangladesh','anika_passport.pdf','2025-07-09 10:04:06'),
 (4,'Jamal Hossain','NID','NID12345678','01640000000','Khulna, Bangladesh','jamal_nid.pdf','2025-07-09 10:04:06'),
 (5,'Sabrina Yasmin','Passport','P56781234','01550000000','Rajshahi, Bangladesh','sabrina_passport.pdf','2025-07-09 10:04:06');
/*!40000 ALTER TABLE `core_mex_customers` ENABLE KEYS */;


--
-- Definition of table `core_mex_exchange_rates`
--

DROP TABLE IF EXISTS `core_mex_exchange_rates`;
CREATE TABLE `core_mex_exchange_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_from` int(11) NOT NULL,
  `currency_to` int(11) NOT NULL,
  `rate` decimal(15,6) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_from` (`currency_from`),
  KEY `currency_to` (`currency_to`),
  CONSTRAINT `core_mex_exchange_rates_ibfk_1` FOREIGN KEY (`currency_from`) REFERENCES `core_mex_currencies` (`id`),
  CONSTRAINT `core_mex_exchange_rates_ibfk_2` FOREIGN KEY (`currency_to`) REFERENCES `core_mex_currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_exchange_rates`
--

/*!40000 ALTER TABLE `core_mex_exchange_rates` DISABLE KEYS */;
INSERT INTO `core_mex_exchange_rates` (`id`,`currency_from`,`currency_to`,`rate`,`effective_date`) VALUES 
 (1,1,5,'105.500000','2025-07-08'),
 (2,2,5,'120.750000','2025-07-08'),
 (3,3,5,'140.250000','2025-07-08'),
 (4,4,5,'0.950000','2025-07-08'),
 (5,5,1,'0.009500','2025-07-08');
/*!40000 ALTER TABLE `core_mex_exchange_rates` ENABLE KEYS */;


--
-- Definition of table `core_mex_invoices`
--

DROP TABLE IF EXISTS `core_mex_invoices`;
CREATE TABLE `core_mex_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `core_mex_invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `core_mex_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_invoices`
--

/*!40000 ALTER TABLE `core_mex_invoices` DISABLE KEYS */;
INSERT INTO `core_mex_invoices` (`id`,`customer_id`,`invoice_date`,`total_amount`,`status`) VALUES 
 (1,1,'2025-07-01','5000.00','Paid'),
 (2,2,'2025-07-02','3000.00','Unpaid'),
 (3,3,'2025-07-03','4500.50','Paid'),
 (4,4,'2025-07-04','7000.00','Pending'),
 (5,5,'2025-07-05','1200.00','Cancelled'),
 (6,3,'2020-03-11','87.00','3'),
 (7,3,'2020-03-11','87.00','3'),
 (8,3,'2020-03-11','87.00','3'),
 (9,1,'2025-07-22','5000.00','paid'),
 (10,3,'2020-03-11','87.00','3'),
 (11,3,'2020-03-11','87.00','3'),
 (12,3,'2020-03-11','87.00','3'),
 (13,3,'2020-03-11','87.00','3'),
 (14,1,'2025-07-22','3000.00','1'),
 (15,1,'2025-07-22','3000.00','1'),
 (16,1,'2025-07-22','5000.00','paid'),
 (17,1,'2025-07-22','5000.00','paid'),
 (18,1,'2025-07-22','5000.00','paid'),
 (19,1,'2025-07-22','5000.00','paid'),
 (20,1,'2025-07-22','5000.00','paid'),
 (21,1,'2025-07-22','5000.00','paid'),
 (22,1,'1980-06-02','8.00','3'),
 (23,1,'1990-02-02','2.00','2'),
 (24,1,'1983-02-23','10.00','1'),
 (25,2,'1977-07-27','27.00','5'),
 (26,4,'1989-12-18','74.00','3'),
 (27,1,'2025-07-10','10000.00','1'),
 (28,3,'1984-11-16','98.00','3');
/*!40000 ALTER TABLE `core_mex_invoices` ENABLE KEYS */;


--
-- Definition of table `core_mex_invoice_details`
--

DROP TABLE IF EXISTS `core_mex_invoice_details`;
CREATE TABLE `core_mex_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `rate` decimal(15,2) DEFAULT NULL,
  `vat` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `core_mex_invoice_details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `core_mex_invoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_invoice_details`
--

/*!40000 ALTER TABLE `core_mex_invoice_details` DISABLE KEYS */;
INSERT INTO `core_mex_invoice_details` (`id`,`invoice_id`,`description`,`qty`,`rate`,`vat`) VALUES 
 (1,1,'Currency Exchange Fee',1,'5000.00','5000.00'),
 (2,2,'Service Charge',1,'3000.00','3000.00'),
 (3,3,'Foreign Transaction Fee',1,'4500.50','4500.50'),
 (4,4,'Late Payment Fee',1,'7000.00','7000.00'),
 (5,5,'Discount Applied',1,'1200.00','1200.00'),
 (6,7,'Maxime vel dignissim',152,'44.00','26.00'),
 (7,8,'Maxime vel dignissim',152,'44.00','26.00'),
 (8,9,'USD Exchange',2,'1000.00','0.00'),
 (9,10,'Maxime vel dignissim',152,'44.00','26.00'),
 (10,11,'Maxime vel dignissim',152,'44.00','26.00'),
 (11,12,'Maxime vel dignissim',152,'44.00','26.00'),
 (12,13,'Maxime vel dignissim',152,'44.00','26.00'),
 (13,14,'Item A',2,'1000.00','5.00'),
 (14,15,'Item A',2,'1000.00','5.00'),
 (15,16,'USD Exchange',2,'1000.00','0.00'),
 (16,17,'USD Exchange',2,'1000.00','0.00'),
 (17,18,'USD Exchange',2,'1000.00','0.00'),
 (18,19,'USD Exchange',2,'1000.00','0.00'),
 (19,20,'USD Exchange',2,'1000.00','0.00'),
 (20,21,'USD Exchange',2,'1000.00','0.00'),
 (21,21,'EURO Exchange',3,'950.00','50.00'),
 (22,22,'Maxime vel dignissim',152,'44.00','26.00'),
 (23,22,'Veritatis alias dolo',367,'56.00','98.00'),
 (24,25,'Nihil quod nesciunt',178,'74.00','92.00'),
 (25,27,'Lates updated rubbles',100,'10.00','0.00'),
 (26,28,'Eos in cumque volup',251,'83.00','86.00');
/*!40000 ALTER TABLE `core_mex_invoice_details` ENABLE KEYS */;


--
-- Definition of table `core_mex_money_receipts`
--

DROP TABLE IF EXISTS `core_mex_money_receipts`;
CREATE TABLE `core_mex_money_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(50) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `issued_by` varchar(100) DEFAULT NULL,
  `issued_date` datetime DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_number` (`receipt_number`),
  KEY `fk_receipt_transaction` (`transaction_id`),
  CONSTRAINT `fk_receipt_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `core_mex_transactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mex_money_receipts`
--
INSERT INTO `core_mex_money_receipts` (
  `receipt_number`,
  `transaction_id`,
  `customer_id`,
  `agent_id`,
  `total_amount`,
  `payment_method`,
  `status`,
  `issued_by`,
  `issued_date`,
  `notes`
) VALUES
('RCPT-10001', 1, 101, 201, 250.00, 'Credit Card', 1, 'Alice Smith', '2025-08-01 10:15:00', 'Payment for invoice INV-001'),
('RCPT-10002', 2, 102, 202, 180.50, 'Cash', 1, 'Bob Johnson', '2025-08-02 14:30:00', 'Partial payment'),
('RCPT-10003', 3, 103, NULL, 320.75, 'Bank Transfer', 2, 'Charlie Brown', '2025-08-03 09:45:00', 'Paid via online banking'),
('RCPT-10004', 4, 104, 203, 500.00, 'Debit Card', 1, 'Diana Prince', '2025-08-04 16:00:00', 'Full payment'),
('RCPT-10005', 5, 105, NULL, 100.00, 'Mobile Payment', 3, 'Edward Nigma', '2025-08-05 11:20:00', 'Payment received through mobile app');


/*!40000 ALTER TABLE `core_mex_money_receipts` DISABLE KEYS */;



--
-- Definition of table `core_mex_money_receipt_details`
--

DROP TABLE IF EXISTS `core_mex_money_receipt_details`;
CREATE TABLE `core_mex_money_receipt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) NOT NULL DEFAULT 0,
  `currency_id` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` decimal(18,2) NOT NULL,
  `exchange_rate` decimal(18,6) DEFAULT NULL,
  `equivalent_amount` decimal(18,2) DEFAULT NULL,
  `fee` decimal(18,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_receipt_details` (`receipt_id`),
  CONSTRAINT `fk_receipt_details` FOREIGN KEY (`receipt_id`) REFERENCES `core_mex_money_receipts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mex_money_receipt_details`
--

/*!40000 ALTER TABLE `core_mex_money_receipt_details` DISABLE KEYS */;
INSERT INTO `core_mex_money_receipt_details` (`id`,`receipt_id`,`currency_id`,`amount`,`exchange_rate`,`equivalent_amount`,`fee`,`created_at`) VALUES 
 (1,1,0,'1000.00','0.920000','920.00','5.00','2025-07-12 11:31:40'),
 (2,2,0,'500.00','0.920000','460.00','2.50','2025-07-12 11:31:40'),
 (3,3,0,'750.00','92.000000','69000.00','10.00','2025-07-12 11:31:40'),
 (4,4,0,'1200.00','0.920000','1104.00','7.00','2025-07-12 11:31:40'),
 (5,5,0,'300.00','90.000000','27000.00','1.50','2025-07-12 11:31:40'),
 (6,13,1,'500.00','100.000000','50000.00','0.00','2025-07-13 10:16:01'),
 (7,15,1,'500.00','100.000000','50000.00','0.00','2025-07-13 10:17:58'),
 (8,16,1,'500.00','100.000000','50000.00','0.00','2025-07-13 10:28:49'),
 (9,17,1,'500.00','100.000000','50000.00','0.00','2025-07-13 10:28:57'),
 (10,20,5,'42.00','69.000000','83.00','63.00','2025-07-13 10:52:43'),
 (11,21,2,'36.00','24.000000','87.00','100.00','2025-07-13 10:57:18'),
 (12,22,3,'81.00','59.000000','10.00','73.00','2025-07-13 10:59:43'),
 (13,23,1,'40.00','58.000000','73.00','57.00','2025-07-13 11:01:25'),
 (14,24,0,'50.00','95.000000','62.00','2.00','2025-07-13 11:05:41'),
 (15,24,0,'63.00','22.000000','42.00','51.00','2025-07-13 11:05:41'),
 (16,25,0,'1000.00','1.000000','1000.00','10.00','2025-07-21 10:39:20'),
 (17,27,0,'1000.00','1.000000','1000.00','10.00','2025-07-21 10:41:47'),
 (18,27,0,'1500.00','1.200000','1800.00','15.00','2025-07-21 10:41:47'),
 (19,28,0,'1000.00','1.000000','1000.00','10.00','2025-07-21 10:43:18'),
 (20,28,0,'1500.00','1.200000','1800.00','15.00','2025-07-21 10:43:18'),
 (21,30,0,'1000.00','1.000000','1000.00','10.00','2025-07-21 12:47:20'),
 (22,30,0,'1500.00','1.200000','1800.00','15.00','2025-07-21 12:47:20'),
 (23,31,0,'85.00','24.000000','88.00','31.00','2025-07-21 13:07:35'),
 (24,33,5,'42.00','69.000000','83.00','63.00','2025-07-21 13:08:14'),
 (25,38,0,'85.00','24.000000','88.00','31.00','2025-07-21 13:09:46'),
 (26,51,3,'41.00','7.000000','29.00','2.00','2025-07-21 13:24:20'),
 (27,53,3,'41.00','7.000000','29.00','2.00','2025-07-21 13:26:31'),
 (28,53,2,'68.00','53.000000','34.00','53.00','2025-07-21 13:26:31'),
 (29,54,1,'67.00','5.000000','99.00','78.00','2025-07-21 13:26:50'),
 (30,54,3,'2.00','24.000000','87.00','31.00','2025-07-21 13:26:50'),
 (31,55,2,'4.00','57.000000','26.00','46.00','2025-07-22 09:41:19'),
 (32,56,5,'49.00','87.000000','26.00','70.00','2025-07-22 09:42:58'),
 (33,57,1,'36.00','69.000000','66.00','47.00','2025-07-23 08:53:41'),
 (34,58,4,'94.00','17.000000','28.00','26.00','2025-07-23 08:58:55'),
 (35,58,4,'1.00','27.000000','20.00','66.00','2025-07-23 08:58:55'),
 (36,59,1,'100.00','87.000000','85.00','54.00','2025-07-23 10:13:04');
/*!40000 ALTER TABLE `core_mex_money_receipt_details` ENABLE KEYS */;



--
-- Definition of table `core_mex_money_stock_adjustment_details`
--

DROP TABLE IF EXISTS `core_mex_money_stock_adjustment_details`;
CREATE TABLE `core_mex_money_stock_adjustment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `core_mex_money_stock_adjustment_details_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `core_mex_money_stock_adjustments` (`id`),
  CONSTRAINT `core_mex_money_stock_adjustment_details_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `core_mex_currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_money_stock_adjustment_details`
--

/*!40000 ALTER TABLE `core_mex_money_stock_adjustment_details` DISABLE KEYS */;
INSERT INTO `core_mex_money_stock_adjustment_details` (`id`,`adjustment_id`,`currency_id`,`quantity`) VALUES 
 (1,1,1,'1000.00'),
 (2,2,2,'500.00'),
 (3,3,3,'300.00'),
 (4,4,4,'200.00'),
 (5,5,5,'100.00');
/*!40000 ALTER TABLE `core_mex_money_stock_adjustment_details` ENABLE KEYS */;


--
-- Definition of table `core_mex_money_stock_adjustment_types`
--

DROP TABLE IF EXISTS `core_mex_money_stock_adjustment_types`;
CREATE TABLE `core_mex_money_stock_adjustment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_money_stock_adjustment_types`
--

/*!40000 ALTER TABLE `core_mex_money_stock_adjustment_types` DISABLE KEYS */;
INSERT INTO `core_mex_money_stock_adjustment_types` (`id`,`name`,`description`) VALUES 
 (1,'Addition','Stock added due to purchase or correction'),
 (2,'Subtraction','Stock reduced due to sale or correction'),
 (3,'Correction','Stock corrected after audit'),
 (4,'Damaged','Stock damaged and removed'),
 (5,'Theft','Stock lost due to theft');
/*!40000 ALTER TABLE `core_mex_money_stock_adjustment_types` ENABLE KEYS */;


--
-- Definition of table `core_mex_money_stock_adjustments`
--

DROP TABLE IF EXISTS `core_mex_money_stock_adjustments`;
CREATE TABLE `core_mex_money_stock_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_type_id` int(11) NOT NULL,
  `adjustment_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_type_id` (`adjustment_type_id`),
  CONSTRAINT `core_mex_money_stock_adjustments_ibfk_1` FOREIGN KEY (`adjustment_type_id`) REFERENCES `core_mex_money_stock_adjustment_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_money_stock_adjustments`
--

/*!40000 ALTER TABLE `core_mex_money_stock_adjustments` DISABLE KEYS */;
INSERT INTO `core_mex_money_stock_adjustments` (`id`,`adjustment_type_id`,`adjustment_date`,`remarks`) VALUES 
 (1,1,'2025-07-01','Added new stock after purchase'),
 (2,2,'2025-07-02','Reduced stock after sale'),
 (3,3,'2025-07-03','Corrected stock after audit'),
 (4,4,'2025-07-04','Removed damaged currency notes'),
 (5,5,'2025-07-05','Lost stock due to theft');
/*!40000 ALTER TABLE `core_mex_money_stock_adjustments` ENABLE KEYS */;


--
-- Definition of table `core_mex_money_stocks`
--

DROP TABLE IF EXISTS `core_mex_money_stocks`;
CREATE TABLE `core_mex_money_stocks` (
  `id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `qty` decimal(18,2) NOT NULL,
  `transaction_type` enum('IN','OUT') NOT NULL,
  `remarks` text DEFAULT NULL,
  `purchase_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `receipt_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_money_stocks`
--

/*!40000 ALTER TABLE `core_mex_money_stocks` DISABLE KEYS */;
INSERT INTO `core_mex_money_stocks` (`id`,`currency_id`,`qty`,`transaction_type`,`remarks`,`purchase_id`,`order_id`,`receipt_id`) VALUES 
 (1,1,'1200.00','IN','USD from purchase #1',0,0,NULL),
 (2,2,'700.00','IN','EUR from purchase #2',0,0,NULL),
 (3,3,'950.00','IN','GBP from purchase #3',0,0,NULL),
 (4,1,'200.00','OUT','USD given to client',0,0,NULL),
 (5,4,'2500.00','IN','Other currency added from bulk deal',0,0,NULL),
 (6,1,'10.00','IN','USD purchase',8,0,NULL),
 (7,2,'5.00','IN','EUR purchase',8,0,NULL),
 (8,1,'10.00','IN','USD purchase',9,0,NULL),
 (9,2,'5.00','IN','EUR purchase',9,0,NULL),
 (10,4,'241.00','IN',NULL,19,0,NULL),
 (11,1,'100.00','IN','First batch',20,0,NULL),
 (12,2,'50.00','IN','Second batch',20,0,NULL),
 (13,1,'100.00','IN','First batch',21,0,NULL),
 (14,2,'50.00','IN','Second batch',21,0,NULL),
 (15,1,'-1000.00','OUT','USD transaction',27,0,NULL),
 (16,2,'-1500.00','OUT','EUR transaction',27,0,NULL),
 (17,1,'-1000.00','OUT','USD transaction',28,0,NULL),
 (18,2,'-1500.00','OUT','EUR transaction',28,0,NULL),
 (19,1,'-1000.00','OUT','USD transaction',30,0,NULL),
 (20,2,'-1500.00','OUT','EUR transaction',30,0,NULL),
 (21,1,'100.00','IN','First batch',27,0,NULL),
 (22,2,'50.00','IN','Second batch',27,0,NULL),
 (23,1,'100.00','IN','First batch',30,0,NULL),
 (24,2,'50.00','IN','Second batch',30,0,NULL),
 (25,4,'568.00','IN','Purchase',31,0,NULL),
 (26,4,'43.00','IN','Purchase',31,0,NULL),
 (27,3,'623.00','IN','Purchase',31,0,NULL),
 (28,1,'415.00','IN','Purchase',32,0,NULL),
 (29,4,'988.00','IN','Purchase',32,0,NULL),
 (30,3,'-41.00','OUT','Seals',53,0,NULL),
 (31,2,'-68.00','OUT','Seals',53,0,NULL),
 (32,1,'-67.00','OUT','Seals',54,0,NULL),
 (33,3,'-2.00','OUT','Seals',54,0,NULL),
 (34,2,'-4.00','OUT','Seals',55,0,NULL),
 (35,5,'-49.00','OUT','Seals',56,0,NULL),
 (36,1,'561.00','IN','Purchase',33,0,NULL),
 (37,1,'0.00','OUT','Seals',21,0,NULL),
 (38,2,'0.00','OUT','Seals',21,0,NULL),
 (39,1,'0.00','OUT','Seals',22,0,NULL),
 (40,1,'0.00','OUT','Seals',22,0,NULL),
 (41,1,'0.00','OUT','Seals',25,0,NULL),
 (42,1,'0.00','OUT','Seals',27,0,NULL),
 (43,1,'0.00','OUT','Seals',28,0,NULL),
 (44,1,'-36.00','OUT','Seals',57,0,NULL),
 (45,1,'651.00','IN','Purchase',34,0,NULL),
 (46,4,'-94.00','OUT','Seals',58,0,NULL),
 (47,4,'-1.00','OUT','Seals',58,0,NULL),
 (48,1,'673.00','IN','Purchase',35,0,NULL),
 (49,2,'639.00','IN','Purchase',35,0,NULL),
 (50,1,'607.00','IN','Purchase',36,0,NULL),
 (51,2,'928.00','IN','Purchase',36,0,NULL),
 (52,1,'100.00','IN','Purchase',37,0,NULL),
 (53,1,'-100.00','OUT','Seals',59,0,NULL),
 (54,1,'-500.00','OUT','Seals',9,0,NULL),
 (55,2,'-600.00','OUT','Seals',9,0,NULL),
 (56,1,'-500.00','OUT','Seals',10,0,NULL),
 (57,2,'-600.00','OUT','Seals',10,0,NULL),
 (58,5,'100.00','IN','Purchase',42,NULL,NULL);
/*!40000 ALTER TABLE `core_mex_money_stocks` ENABLE KEYS */;


--
-- Definition of table `core_mex_orders`
--

DROP TABLE IF EXISTS `core_mex_orders`;
CREATE TABLE `core_mex_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(10,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT 0.00,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_orders`
--

/*!40000 ALTER TABLE `core_mex_orders` DISABLE KEYS */;
INSERT INTO `core_mex_orders` (`id`,`customer_id`,`order_date`,`order_total`,`status_id`,`paid_amount`,`remarks`,`created_at`,`updated_at`) VALUES 
 (1,101,'2025-07-01','500.00',1,'500.00','First order','2025-07-27 09:55:21','2025-07-27 09:55:21'),
 (2,102,'2025-07-05','750.00',2,'400.00','Partial payment','2025-07-27 09:55:21','2025-07-27 09:55:21'),
 (3,103,'2025-07-10','1200.00',1,'1200.00','Paid in full','2025-07-27 09:55:21','2025-07-27 09:55:21'),
 (4,104,'2025-07-15','900.00',3,'0.00','Pending payment','2025-07-27 09:55:21','2025-07-27 09:55:21'),
 (5,105,'2025-07-20','650.00',2,'650.00','Completed','2025-07-27 09:55:21','2025-07-27 09:55:21'),
 (6,1,'2025-07-28','1500.00',2,'1000.00','Urgent delivery','2025-07-28 03:30:14','2025-07-28 03:30:14'),
 (7,1,'2025-07-28','1500.00',2,'1000.00','Urgent delivery','2025-07-28 03:30:52','2025-07-28 03:30:52'),
 (8,1,'2025-07-28','1500.00',2,'1000.00','Urgent delivery','2025-07-28 03:31:28','2025-07-28 03:31:28'),
 (9,1,'2025-07-28','1500.00',2,'1000.00','Urgent delivery','2025-07-28 03:33:26','2025-07-28 03:33:26'),
 (10,1,'2025-07-28','1500.00',2,'1000.00','Urgent delivery','2025-07-28 03:34:37','2025-07-28 03:34:37');
/*!40000 ALTER TABLE `core_mex_orders` ENABLE KEYS */;


--
-- Definition of table `core_mex_order_details`
--

DROP TABLE IF EXISTS `core_mex_order_details`;
CREATE TABLE `core_mex_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `core_mex_order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `core_mex_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_order_details`
--

/*!40000 ALTER TABLE `core_mex_order_details` DISABLE KEYS */;
INSERT INTO `core_mex_order_details` (`id`,`order_id`,`currency_id`,`qty`,`rate`,`vat`) VALUES 
 (1,1,1,2,'250.00','25.00'),
 (2,2,1,1,'750.00','75.00'),
 (3,3,2,3,'400.00','60.00'),
 (4,4,1,2,'450.00','90.00'),
 (5,5,3,1,'650.00','65.00'),
 (6,9,1,10,'50.00','5.00'),
 (7,9,2,20,'30.00','3.00'),
 (8,10,1,10,'50.00','5.00'),
 (9,10,2,20,'30.00','3.00');
/*!40000 ALTER TABLE `core_mex_order_details` ENABLE KEYS */;



--
-- Definition of table `core_mex_payments`
--

DROP TABLE IF EXISTS `core_mex_payments`;
CREATE TABLE core_mex_payments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'কোন ইউজার পেমেন্ট করলো',
    amount DECIMAL(10,2) NOT NULL COMMENT 'কত টাকা পেমেন্ট হলো',
    currency VARCHAR(10) NOT NULL COMMENT 'মুদ্রার নাম (e.g., BDT, USD)',
    transaction_id VARCHAR(255) NOT NULL COMMENT 'গেটওয়ে থেকে পাওয়া ট্রান্সাকশন আইডি',
    payment_method VARCHAR(50) NOT NULL COMMENT 'যেভাবে পেমেন্ট হয়েছে (e.g., stripe, bkash)',
    payment_status VARCHAR(20) NOT NULL COMMENT 'পেমেন্ট সফল কিনা (e.g., success, failed, pending)',
    payment_date DATETIME NOT NULL COMMENT 'কখন পেমেন্ট হয়েছে',
    invoice_no VARCHAR(100) DEFAULT NULL COMMENT 'ইনভয়েস নম্বর (যদি থাকে)',
    description TEXT DEFAULT NULL COMMENT 'কেন পেমেন্ট করা হলো',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'রেকর্ড কখন তৈরি হলো',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'রেকর্ড কখন আপডেট হলো'
);
--
-- Dumping data for table `core_mex_payments`
--

/*!40000 ALTER TABLE `core_mex_payments` DISABLE KEYS */;
INSERT INTO core_mex_payments (
    user_id, amount, currency, transaction_id, payment_method, payment_status, payment_date, invoice_no, description
) VALUES (
    101, 1500.00, 'BDT', 'TXN123456789', 'bkash', 'success', '2025-08-15 14:30:00', 'INV-20250815-001', 'Monthly subscription payment'
);

--
-- Definition of table `core_mex_purchases`
--

DROP TABLE IF EXISTS `core_mex_purchases`;
CREATE TABLE `core_mex_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `purchase_total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_purchases`
--

/*!40000 ALTER TABLE `core_mex_purchases` DISABLE KEYS */;
INSERT INTO `core_mex_purchases` (`id`,`agent_id`,`purchase_date`,`remarks`,`purchase_total`,`status_id`) VALUES 
 (1,101,'2025-07-10','USD purchase from market','1200.00',1),
 (2,102,'2025-07-11','EUR buy-in','800.00',2),
 (3,103,'2025-07-12','GBP acquisition','950.00',3),
 (4,104,'2025-07-13','Client exchange USD','600.00',4),
 (5,105,'2025-07-14','Bulk currency deal','2500.00',5),
 (6,1,'2025-07-17','First purchase','1500.00',0),
 (7,1,'2025-07-17','First purchase','1500.00',0),
 (8,1,'2025-07-17','First purchase','1500.00',0),
 (9,1,'2025-07-17','First purchase','1500.00',0),
 (10,5,'1991-02-01','Beatae est facere do','27.00',0),
 (11,5,'1991-02-01','Beatae est facere do','27.00',0),
 (12,4,'1993-11-03','Rem dolorem ex nostr','69.00',0),
 (13,1,'1993-11-03','Rem dolorem ex nostr','69.00',0),
 (14,4,'2017-12-09','Libero accusamus sae','22.00',0),
 (15,4,'1981-12-01','Commodi laborum In','23.00',0),
 (16,2,'2024-07-17','Aut expedita perfere','55.00',0),
 (17,2,'2024-07-17','Aut expedita perfere','55.00',0),
 (18,2,'2011-11-05','Nisi do aperiam aut','96.00',0),
 (19,4,'1998-12-12','Quod ab harum porro','7.00',0),
 (20,1,'2025-07-21','Monthly currency purchase','1500.00',1),
 (21,6,'2025-07-21','Monthly currency purchase','1500.00',1),
 (22,1,'1976-06-01','Iure illo consequatu','52.00',1),
 (23,2,'1976-06-10','Iure illo consequatu','20000.00',3),
 (24,1,'2006-02-24','Harum consequuntur i','55.00',1),
 (25,4,'1976-02-07','Eiusmod omnis eum fu','13.00',4),
 (26,3,'1983-11-29','Accusantium nisi aut','54.00',3),
 (27,6,'2025-07-21','Monthly currency purchase','1500.00',1),
 (28,3,'1983-11-29','Accusantium nisi aut','54.00',3),
 (29,3,'1983-11-29','Accusantium nisi aut','54.00',3),
 (30,1,'2025-07-21','Monthly currency purchase','1500.00',2),
 (31,2,'2003-04-01','Quasi ut illo ex ess','92.00',2),
 (32,4,'2020-11-22','Porro qui sit moles','70.00',5),
 (33,5,'1988-06-19','Velit voluptas reru','52.00',1),
 (34,3,'1998-07-28','Laboriosam in dolor','83.00',3),
 (35,1,'2009-10-08','Eveniet consequatur','10.00',4),
 (36,2,'1996-01-14','Reprehenderit pariat','62.00',3),
 (37,1,'1990-04-30','Qui est qui non perf','69.00',3),
 (42,2,'2025-08-03',NULL,'1000.00',1);
/*!40000 ALTER TABLE `core_mex_purchases` ENABLE KEYS */;


--
-- Definition of table `core_mex_purchase_details`
--

DROP TABLE IF EXISTS `core_mex_purchase_details`;
CREATE TABLE `core_mex_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `qty` decimal(18,2) NOT NULL,
  `rate` decimal(18,2) NOT NULL,
  `vat` decimal(18,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `core_mex_purchase_details_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `core_mex_purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_purchase_details`
--

/*!40000 ALTER TABLE `core_mex_purchase_details` DISABLE KEYS */;
INSERT INTO `core_mex_purchase_details` (`id`,`purchase_id`,`currency_id`,`qty`,`rate`,`vat`) VALUES 
 (6,1,1,'1200.00','1.00','0.00'),
 (7,2,2,'700.00','1.14','5.00'),
 (8,3,3,'950.00','1.25','0.00'),
 (9,4,1,'600.00','1.00','0.00'),
 (10,5,4,'2500.00','0.95','10.00'),
 (11,6,1,'10.00','100.00','5.00'),
 (12,7,1,'10.00','100.00','5.00'),
 (13,8,1,'10.00','100.00','5.00'),
 (14,8,2,'5.00','200.00','10.00'),
 (15,9,1,'10.00','100.00','5.00'),
 (16,9,2,'5.00','200.00','10.00'),
 (17,10,5,'325.00','84.00','49.00'),
 (18,11,5,'325.00','84.00','49.00'),
 (19,12,5,'180.00','79.00','32.00'),
 (20,13,5,'180.00','79.00','32.00'),
 (21,14,4,'33.00','24.00','72.00'),
 (22,15,4,'321.00','37.00','81.00'),
 (23,16,5,'324.00','88.00','14.00'),
 (24,17,5,'324.00','88.00','14.00'),
 (25,18,3,'893.00','5.00','70.00'),
 (26,19,4,'241.00','14.00','56.00'),
 (27,20,1,'100.00','10.00','5.00'),
 (28,20,2,'50.00','20.00','2.50'),
 (29,21,1,'100.00','10.00','5.00'),
 (30,21,2,'50.00','20.00','2.50'),
 (31,27,1,'100.00','10.00','5.00'),
 (32,27,2,'50.00','20.00','2.50'),
 (33,29,3,'742.00','42.00','28.00'),
 (34,30,1,'100.00','10.00','5.00'),
 (35,30,2,'50.00','20.00','2.50'),
 (36,31,4,'568.00','38.00','65.00'),
 (37,31,4,'43.00','95.00','47.00'),
 (38,31,3,'623.00','68.00','25.00'),
 (39,32,1,'415.00','37.00','91.00'),
 (40,32,4,'988.00','45.00','11.00'),
 (41,33,1,'561.00','90.00','98.00'),
 (42,34,1,'651.00','20.00','65.00'),
 (43,35,1,'673.00','48.00','95.00'),
 (44,35,2,'639.00','67.00','91.00'),
 (45,36,1,'607.00','47.00','1.00'),
 (46,36,2,'928.00','12.00','75.00'),
 (47,37,1,'100.00','10.00','0.00'),
 (49,42,5,'100.00','10.00','0.00');
/*!40000 ALTER TABLE `core_mex_purchase_details` ENABLE KEYS */;



--
-- Definition of table `core_mex_statuses`
--

DROP TABLE IF EXISTS `core_mex_statuses`;
CREATE TABLE `core_mex_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_statuses`
--

/*!40000 ALTER TABLE `core_mex_statuses` DISABLE KEYS */;
INSERT INTO `core_mex_statuses` (`id`,`name`,`description`) VALUES 
 (1,'Active','The record is active and valid'),
 (2,'Inactive','The record is inactive'),
 (3,'Pending','The record is pending approval'),
 (4,'Cancelled','The record is cancelled'),
 (5,'Completed','The record is completed');
/*!40000 ALTER TABLE `core_mex_statuses` ENABLE KEYS */;


--
-- Definition of table `core_mex_suppliers`
--

DROP TABLE IF EXISTS `core_mex_suppliers`;
CREATE TABLE `core_mex_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mex_suppliers`
--

/*!40000 ALTER TABLE `core_mex_suppliers` DISABLE KEYS */;
INSERT INTO `core_mex_suppliers` (`id`,`name`,`contact_person`,`phone_number`,`email`,`address`,`country`) VALUES 
 (1,'Global Money Exchange Ltd.','Mahmud Hossain','+8801711000001','mahmud@globalexchange.com','23 Gulshan-2, Dhaka','Bangladesh'),
 (2,'QuickForex Pvt Ltd.','Rina Akter','+8801711000002','rina@quickforex.com','45 Motijheel, Dhaka','Bangladesh'),
 (3,'Sky Money Transfer','John Smith','+44 2071234567','john@skymoney.co.uk','12 Oxford Street, London','United Kingdom'),
 (4,'Eastern Exchange LLC','Ali Hamed','+971 501234567','ali@easternex.ae','Bur Dubai, Dubai','UAE'),
 (5,'Bangla Remit Ltd.','Sajib Rahman','+8801711000005','sajib@banglaremit.com','Chittagong Road, Narayanganj','Bangladesh');
/*!40000 ALTER TABLE `core_mex_suppliers` ENABLE KEYS */;


--
-- Definition of table `core_mex_transactions`
--

DROP TABLE IF EXISTS `core_mex_transactions`;
CREATE TABLE `core_mex_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  `total_amount_paid` decimal(18,2) NOT NULL,
  `total_received` decimal(18,2) NOT NULL,
  `status` enum('PENDING','COMPLETED','FAILED','CANCELLED') DEFAULT 'PENDING',
  `payment_method` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mex_transactions`
--

/*!40000 ALTER TABLE `core_mex_transactions` DISABLE KEYS */;
INSERT INTO `core_mex_transactions` (`id`,`customer_id`,`agent_id`,`transaction_date`,`total_amount_paid`,`total_received`,`status`,`payment_method`,`remarks`,`created_at`,`updated_at`) VALUES 
 (1,1,101,'2025-07-12 11:06:13','1000.00','920.00','COMPLETED','cash','USD to EUR','2025-07-12 11:06:13','2025-07-12 11:06:13'),
 (2,2,102,'2025-07-12 11:06:13','500.00','460.00','COMPLETED','card','USD to GBP','2025-07-12 11:06:13','2025-07-12 11:06:13'),
 (3,3,103,'2025-07-12 11:06:13','750.00','690.00','PENDING','bank_transfer','EUR to INR','2025-07-12 11:06:13','2025-07-12 11:06:13'),
 (4,4,101,'2025-07-12 11:06:13','1200.00','1104.00','FAILED','cash','USD to CAD','2025-07-12 11:06:13','2025-07-12 11:06:13'),
 (5,5,104,'2025-07-12 11:06:13','300.00','270.00','COMPLETED','mobile_wallet','USD to BDT','2025-07-12 11:06:13','2025-07-12 11:06:13');
/*!40000 ALTER TABLE `core_mex_transactions` ENABLE KEYS */;


--
-- Definition of table `core_mex_transactions_details`
--

DROP TABLE IF EXISTS `core_mex_transactions_details`;
CREATE TABLE `core_mex_transactions_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `source_currency` varchar(3) NOT NULL,
  `target_currency` varchar(3) NOT NULL,
  `source_amount` decimal(18,2) NOT NULL,
  `exchange_rate` decimal(18,6) NOT NULL,
  `target_amount` decimal(18,2) NOT NULL,
  `fee_amount` decimal(18,2) DEFAULT 0.00,
  `transaction_type` enum('BUY','SELL') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_transaction_detail` (`transaction_id`),
  CONSTRAINT `fk_transaction_detail` FOREIGN KEY (`transaction_id`) REFERENCES `core_mex_transactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mex_transactions_details`
--

/*!40000 ALTER TABLE `core_mex_transactions_details` DISABLE KEYS */;
INSERT INTO `core_mex_transactions_details` (`id`,`transaction_id`,`source_currency`,`target_currency`,`source_amount`,`exchange_rate`,`target_amount`,`fee_amount`,`transaction_type`,`created_at`) VALUES 
 (1,1,'USD','EUR','1000.00','0.920000','920.00','5.00','SELL','2025-07-12 11:06:13'),
 (2,2,'USD','GBP','500.00','0.920000','460.00','2.50','SELL','2025-07-12 11:06:13'),
 (3,3,'EUR','INR','750.00','92.000000','69000.00','10.00','BUY','2025-07-12 11:06:13'),
 (4,4,'USD','CAD','1200.00','0.920000','1104.00','7.00','SELL','2025-07-12 11:06:13'),
 (5,5,'USD','BDT','300.00','90.000000','27000.00','1.50','SELL','2025-07-12 11:06:13');
/*!40000 ALTER TABLE `core_mex_transactions_details` ENABLE KEYS */;



--
-- Definition of table `core_mfg_bom_details`
--

DROP TABLE IF EXISTS `core_mfg_bom_details`;
CREATE TABLE `core_mfg_bom_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bom_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `cost` float NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mfg_bom_details`
--

/*!40000 ALTER TABLE `core_mfg_bom_details` DISABLE KEYS */;
INSERT INTO `core_mfg_bom_details` (`id`,`bom_id`,`product_id`,`qty`,`cost`,`uom_id`) VALUES 
 (1,1,400,200,100,1),
 (2,1,401,100,10,2),
 (3,1,402,10,50,3),
 (4,3,49,13,30,1),
 (5,3,17,14,2500,1);
/*!40000 ALTER TABLE `core_mfg_bom_details` ENABLE KEYS */;


--
-- Definition of table `core_mfg_bom_finished_goods`
--

DROP TABLE IF EXISTS `core_mfg_bom_finished_goods`;
CREATE TABLE `core_mfg_bom_finished_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `cost` float NOT NULL,
  `bom_id` int(10) unsigned NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mfg_bom_finished_goods`
--

/*!40000 ALTER TABLE `core_mfg_bom_finished_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mfg_bom_finished_goods` ENABLE KEYS */;


--
-- Definition of table `core_mfg_bom_raw_materials`
--

DROP TABLE IF EXISTS `core_mfg_bom_raw_materials`;
CREATE TABLE `core_mfg_bom_raw_materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `cost` float NOT NULL,
  `bom_id` int(10) unsigned NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mfg_bom_raw_materials`
--

/*!40000 ALTER TABLE `core_mfg_bom_raw_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mfg_bom_raw_materials` ENABLE KEYS */;


--
-- Definition of table `core_mfg_bom_secondary_products`
--

DROP TABLE IF EXISTS `core_mfg_bom_secondary_products`;
CREATE TABLE `core_mfg_bom_secondary_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  `uom` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mfg_bom_secondary_products`
--

/*!40000 ALTER TABLE `core_mfg_bom_secondary_products` DISABLE KEYS */;
INSERT INTO `core_mfg_bom_secondary_products` (`id`,`product_id`,`qty`,`price`,`uom`) VALUES 
 (1,500,5,400,5);
/*!40000 ALTER TABLE `core_mfg_bom_secondary_products` ENABLE KEYS */;


--
-- Definition of table `core_mfg_boms`
--

DROP TABLE IF EXISTS `core_mfg_boms`;
CREATE TABLE `core_mfg_boms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` varchar(45) NOT NULL,
  `labour_cost` float NOT NULL,
  `date` datetime DEFAULT NULL,
  `remark` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mfg_boms`
--

/*!40000 ALTER TABLE `core_mfg_boms` DISABLE KEYS */;
INSERT INTO `core_mfg_boms` (`id`,`code`,`name`,`product_id`,`qty`,`labour_cost`,`date`,`remark`) VALUES 
 (1,'100','T-Shirt',1,'100',2000,NULL,NULL),
 (2,'343','BM-3',47,'3',45,NULL,NULL),
 (3,'3532','BM93',47,'34',432,NULL,NULL);
/*!40000 ALTER TABLE `core_mfg_boms` ENABLE KEYS */;


--
-- Definition of table `core_mfg_production_details`
--

DROP TABLE IF EXISTS `core_mfg_production_details`;
CREATE TABLE `core_mfg_production_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `production_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mfg_production_details`
--

/*!40000 ALTER TABLE `core_mfg_production_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mfg_production_details` ENABLE KEYS */;


--
-- Definition of table `core_mfg_productions`
--

DROP TABLE IF EXISTS `core_mfg_productions`;
CREATE TABLE `core_mfg_productions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `production_datetime` datetime NOT NULL,
  `bom_id` int(10) unsigned NOT NULL,
  `labor_cost` float NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  `total_cost` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_mfg_productions`
--

/*!40000 ALTER TABLE `core_mfg_productions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mfg_productions` ENABLE KEYS */;


--
-- Definition of table `core_migrations`
--

DROP TABLE IF EXISTS `core_migrations`;
CREATE TABLE `core_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_migrations`
--

/*!40000 ALTER TABLE `core_migrations` DISABLE KEYS */;
INSERT INTO `core_migrations` (`id`,`migration`,`batch`) VALUES 
 (6,'2014_10_12_000000_create_users_table',1),
 (7,'2014_10_12_100000_create_password_reset_tokens_table',1),
 (8,'2014_10_12_100000_create_password_resets_table',1),
 (9,'2019_08_19_000000_create_failed_jobs_table',1),
 (10,'2019_12_14_000001_create_personal_access_tokens_table',1),
 (17,'2024_07_02_044553_create_personal_access_tokens_table',3),
 (18,'0001_01_01_000000_create_users_table',4),
 (19,'0001_01_01_000001_create_cache_table',4),
 (20,'0001_01_01_000002_create_jobs_table',4);
/*!40000 ALTER TABLE `core_migrations` ENABLE KEYS */;





--
-- Definition of table `core_money_receipts`
--

DROP TABLE IF EXISTS `core_money_receipts`;
CREATE TABLE `core_money_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `remark` text DEFAULT NULL,
  `receipt_total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_money_receipts`
--

/*!40000 ALTER TABLE `core_money_receipts` DISABLE KEYS */;
INSERT INTO `core_money_receipts` (`id`,`created_at`,`updated_at`,`customer_id`,`remark`,`receipt_total`,`discount`,`vat`) VALUES 
 (28,'2024-01-03 13:07:18','2024-01-03 13:07:18',1,'',1426.95,NULL,NULL),
 (29,'2024-01-03 13:09:58','2024-01-03 13:09:58',1,'',1426.95,NULL,NULL),
 (30,'2025-04-12 18:42:59','2025-04-12 18:42:59',1,'Na',199,NULL,NULL),
 (31,'2025-04-12 18:45:44','2025-04-12 18:45:44',1,'Na',199,NULL,NULL),
 (32,'2025-04-13 09:03:47','2025-04-13 09:03:47',1,'Na',0,NULL,NULL),
 (33,'2025-04-13 09:08:55','2025-04-13 09:08:55',1,'Na',0,NULL,NULL),
 (34,'2025-04-13 09:09:46','2025-04-13 09:09:46',1,'Na',0,NULL,NULL),
 (35,'2025-04-13 09:11:19','2025-04-13 09:11:19',1,'Na',0,NULL,NULL),
 (36,'2025-04-13 10:14:53','2025-04-13 10:14:53',10,'Na',0,NULL,NULL),
 (37,'2025-04-13 12:36:04','2025-04-13 12:36:04',1,'Na',0,NULL,NULL),
 (38,'2025-04-13 13:43:22','2025-04-13 13:43:22',8,'Na',0,NULL,NULL),
 (39,'2025-04-13 18:26:18','2025-04-13 18:26:18',1,'Na',1000,NULL,NULL),
 (40,'2025-04-13 18:27:34','2025-04-13 18:27:34',1,'Na',333,NULL,NULL);
/*!40000 ALTER TABLE `core_money_receipts` ENABLE KEYS */;

--
-- Definition of table `core_money_receipt_details`
--

DROP TABLE IF EXISTS `core_money_receipt_details`;
CREATE TABLE `core_money_receipt_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money_receipt_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `qty` double NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_money_receipt_details`
--

/*!40000 ALTER TABLE `core_money_receipt_details` DISABLE KEYS */;
INSERT INTO `core_money_receipt_details` (`id`,`money_receipt_id`,`product_id`,`price`,`qty`,`vat`,`discount`) VALUES 
 (1,1,36,100,1,0,0),
 (2,7,0,2500,2,0,0),
 (3,7,0,180,1,0,0),
 (4,7,0,999,1,0,0),
 (5,8,36,2500,1,0,0),
 (6,25,0,180,2,0,0),
 (7,25,0,999,1,0,0),
 (8,26,46,180,2,0,0),
 (9,26,47,999,1,0,0),
 (10,27,46,180,2,0,0),
 (11,27,47,999,1,0,0),
 (12,28,46,180,2,0,0),
 (13,28,47,999,1,0,0),
 (14,29,46,180,2,0,0),
 (15,29,47,999,1,0,0),
 (16,31,1,299,3,0,0),
 (17,31,2,399,2,0,0),
 (18,32,50,2000,0,0,0),
 (19,33,50,200,1,0,0),
 (20,34,50,200,1,0,0),
 (21,34,84,400,1,0,0),
 (22,35,50,300,1,0,0),
 (23,35,55,300,1,0,0),
 (24,36,87,200,1,0,0),
 (25,36,62,100,3,0,0),
 (26,37,50,355,1,0,0),
 (27,37,82,355,3,0,0),
 (28,38,57,300000,1,0,0),
 (29,39,50,323,1,0,0),
 (30,40,50,333,1,0,0);
/*!40000 ALTER TABLE `core_money_receipt_details` ENABLE KEYS */;

--
-- Definition of table `core_order_details`
--

--
-- Definition of table `core_orders`
--

DROP TABLE IF EXISTS `core_orders`;
CREATE TABLE `core_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `order_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `shipping_address` text DEFAULT NULL,
  `order_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT 1,
  `discount` float DEFAULT 0,
  `vat` float DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `table_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_orders`
--

/*!40000 ALTER TABLE `core_orders` DISABLE KEYS */;
INSERT INTO `core_orders` (`id`,`customer_id`,`order_date`,`delivery_date`,`shipping_address`,`order_total`,`paid_amount`,`remark`,`status_id`,`discount`,`vat`,`created_at`,`updated_at`,`table_id`) VALUES 
 (2,1,'2021-12-13 00:00:00','2021-12-13 00:00:00','na',0,0,'Na',1,0,0,'2021-12-14 12:40:41','2021-12-14 12:40:41',0),
 (3,1,'2021-12-13 00:00:00','2021-12-13 00:00:00','na',0,0,'Na',1,0,0,'2021-12-14 12:40:41','2021-12-14 12:40:41',0),
 (4,2,'2021-12-13 00:00:00','2021-12-13 00:00:00','na',0,0,'Na',1,0,0,'2021-12-14 12:40:41','2021-12-14 12:40:41',0),
 (5,1,'2021-12-13 00:00:00','2021-12-13 00:00:00','na',0,0,'Na',1,0,0,'2021-12-14 12:40:41','2021-12-14 12:40:41',0),
 (6,1,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,'',2,0,0,'2023-12-05 17:54:41','2023-12-05 17:54:41',0),
 (7,3,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,NULL,NULL,'2021-12-14 07:02:07','2021-12-14 07:02:07',0),
 (8,2,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:03:51','2021-12-14 07:03:51',0),
 (9,1,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:05:32','2021-12-14 07:05:32',0),
 (10,1,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:06:21','2021-12-14 07:06:21',0),
 (11,3,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:07:13','2021-12-14 07:07:13',0),
 (12,2,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:10:25','2021-12-14 07:10:25',0),
 (13,1,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:13:06','2021-12-14 07:13:06',0),
 (14,1,'2021-12-14 00:00:00','2021-12-14 00:00:00','Mirpur',0,0,NULL,1,0,0,'2021-12-14 07:14:27','2021-12-14 07:14:27',0),
 (15,3,'2021-12-15 00:00:00','2021-12-15 00:00:00','Rampura',0,0,'Testing',1,0,0,'2021-12-15 18:48:59','2021-12-15 18:48:59',0),
 (16,1,'2022-01-06 00:00:00','2022-01-06 00:00:00','Rampura',0,0,'NA',1,0,0,'2022-01-06 12:39:11','2022-01-06 12:39:11',0),
 (17,1,'2022-01-06 00:00:00','2022-01-06 00:00:00','Rampura',0,0,'NA',1,0,0,'2022-01-06 12:43:37','2022-01-06 12:43:37',0),
 (18,1,'2022-01-06 00:00:00','2022-01-06 00:00:00','Rampura',0,0,'NA',1,0,0,'2022-01-06 15:14:42','2022-01-06 15:14:42',0),
 (19,1,'2022-01-08 00:00:00','2022-01-08 00:00:00','Rampura',0,0,'NA',1,0,0,'2022-01-08 09:05:54','2022-01-08 09:05:54',0),
 (20,1,'2022-01-08 00:00:00','2022-01-08 00:00:00','Rampura',0,0,'NA',3,0,0,'2023-12-05 18:07:44','2023-12-05 18:07:44',0),
 (21,1,'2022-01-08 00:00:00','2022-01-08 00:00:00','Rampura',0,0,'NA',4,0,0,'2023-12-05 18:06:48','2023-12-05 18:06:48',0),
 (22,8,'2023-12-24 00:00:00','2023-12-24 00:00:00','Mohammadpur',1636.95,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (23,1,'2023-12-27 00:00:00','2023-12-27 00:00:00','Rampura, Banasree',1426.95,0,'Na',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (24,4,'2024-01-03 00:00:00','2024-01-03 00:00:00','Dhanmondi, Dhaka',12304.95,0,'Test',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (25,1,'2024-03-13 00:00:00','2024-03-13 00:00:00','na',0,0,NULL,1,0,0,'2024-03-13 08:26:34','2024-03-13 08:26:34',0),
 (26,2,'2024-03-13 00:00:00','2024-03-13 00:00:00','na',0,0,NULL,1,0,0,'2024-03-13 08:40:15','2024-03-13 08:40:15',0),
 (27,23,'2024-03-21 00:00:00','2024-03-24 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-05-12 11:46:43','2024-05-12 11:46:43',0),
 (28,23,'2024-03-21 00:00:00','2024-03-24 00:00:00','Rampura',100,0,NULL,1,0,0,'2024-05-12 11:48:18','2024-05-12 11:48:18',0),
 (29,23,'2024-03-21 00:00:00','2024-03-24 00:00:00','Rampura',100,0,NULL,1,0,0,'2024-05-12 11:48:50','2024-05-12 11:48:50',0),
 (30,23,'2024-03-21 00:00:00','2024-03-24 00:00:00','Rampura',100,0,NULL,1,0,0,'2024-05-12 11:48:54','2024-05-12 11:48:54',0),
 (31,23,'2024-03-21 00:00:00','2024-03-24 00:00:00','Rampura',100,0,NULL,1,0,0,'2024-05-12 11:48:57','2024-05-12 11:48:57',0),
 (32,1,'2024-05-14 00:00:00','2024-05-14 00:00:00','Rampura',100,0,NULL,1,0,0,'2024-05-12 12:40:03','2024-05-12 12:40:03',0),
 (33,2,'2025-03-06 00:00:00','2025-03-06 00:00:00','',2625,0,'NA',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (34,2,'2025-03-10 00:00:00','2025-03-10 00:00:00','',21000,0,'Test3ddd',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (35,6,'2025-03-15 00:00:00','2025-03-15 00:00:00','',13125,0,'Test44444',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (36,3,'2025-03-17 00:00:00','2025-03-17 00:00:00','',2625,0,'Test',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (37,10,'2025-03-19 00:00:00','2025-03-19 00:00:00','',23625,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (38,0,'1970-01-01 00:00:00','1970-01-01 00:00:00','',0,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (39,0,'1970-01-01 00:00:00','1970-01-01 00:00:00','',0,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (40,1,'2025-04-09 00:00:00','2025-04-09 00:00:00','Shipping address',60308.78,0,'ECommerce',1,1865.22,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (41,1,'2025-04-09 00:00:00','2025-04-09 00:00:00','Shipping address',2910,0,'ECommerce',1,90,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (42,1,'2025-04-10 00:00:00','2025-04-10 00:00:00','Shipping address',9991.97,0,'ECommerce',1,309.03,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (43,3,'2025-04-10 00:00:00','2025-04-10 00:00:00','',525,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (44,0,'2025-04-10 00:00:00','1970-01-01 00:00:00','',1575,0,'Test',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (45,1,'2025-04-12 00:00:00','2025-04-12 00:00:00','',6825,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),
 (46,1,'2025-04-19 00:00:00','2025-04-19 00:00:00','Shipping address',17460,0,'ECommerce',1,540,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `core_orders` ENABLE KEYS */;


DROP TABLE IF EXISTS `core_order_details`;
CREATE TABLE `core_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  `vat` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_order_details`
--

/*!40000 ALTER TABLE `core_order_details` DISABLE KEYS */;
INSERT INTO `core_order_details` (`id`,`order_id`,`product_id`,`qty`,`price`,`vat`,`discount`,`created_at`,`updated_at`) VALUES 
 (1,1,17,1,16,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (2,1,18,1,40,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (3,2,18,4,40,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (4,2,17,2,16,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (5,3,17,2,16,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (6,3,18,1,40,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (7,4,17,1,16,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (8,4,18,1,40,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (9,5,17,1,16,0,0,'2021-12-14 12:45:23','2021-12-14 12:45:23'),
 (10,14,18,1,30,0,0,'2021-12-14 07:14:27','2021-12-14 07:14:27'),
 (11,14,17,1,15,0,0,'2021-12-14 07:14:27','2021-12-14 07:14:27'),
 (12,15,18,1,40,0,0,'2021-12-15 18:48:59','2021-12-15 18:48:59'),
 (13,15,17,2,16,0,0,'2021-12-15 18:48:59','2021-12-15 18:48:59'),
 (14,16,28,1,5000,0,0,'2022-01-06 12:39:11','2022-01-06 12:39:11'),
 (15,16,29,1,342,0,0,'2022-01-06 12:39:11','2022-01-06 12:39:11'),
 (16,17,29,1,342,0,0,'2022-01-06 12:43:37','2022-01-06 12:43:37'),
 (17,17,28,1,5000,0,0,'2022-01-06 12:43:37','2022-01-06 12:43:37'),
 (18,17,20,1,110,0,0,'2022-01-06 12:43:37','2022-01-06 12:43:37'),
 (19,18,28,10,5000,0,0,'2022-01-06 15:14:42','2022-01-06 15:14:42'),
 (20,19,30,1,7999,0,0,'2022-01-08 09:05:54','2022-01-08 09:05:54'),
 (21,19,31,1,4444,0,0,'2022-01-08 09:05:54','2022-01-08 09:05:54'),
 (22,19,20,1,110,0,0,'2022-01-08 09:05:55','2022-01-08 09:05:55'),
 (23,20,29,1,342,0,0,'2022-01-08 09:06:58','2022-01-08 09:06:58'),
 (24,20,20,1,110,0,0,'2022-01-08 09:06:58','2022-01-08 09:06:58'),
 (25,20,30,1,7999,0,0,'2022-01-08 09:06:58','2022-01-08 09:06:58'),
 (26,20,32,1,5555,0,0,'2022-01-08 09:06:58','2022-01-08 09:06:58'),
 (27,21,29,1,342,0,0,'2022-01-08 09:07:27','2022-01-08 09:07:27'),
 (28,21,28,1,5000,0,0,'2022-01-08 09:07:27','2022-01-08 09:07:27'),
 (29,21,31,1,4444,0,0,'2022-01-08 09:07:27','2022-01-08 09:07:27'),
 (30,21,32,2,5555,0,0,'2022-01-08 09:07:27','2022-01-08 09:07:27'),
 (31,21,30,1,7999,0,0,'2022-01-08 09:07:27','2022-01-08 09:07:27'),
 (32,21,20,1,110,0,0,'2022-01-08 09:07:28','2022-01-08 09:07:28'),
 (40,25,18,1,180,0,0,'2024-03-13 08:26:34','2024-03-13 08:26:34'),
 (41,25,17,1,2500,0,0,'2024-03-13 08:26:34','2024-03-13 08:26:34'),
 (42,26,18,1,180,0,0,'2024-03-13 08:40:15','2024-03-13 08:40:15'),
 (43,26,17,1,2500,0,0,'2024-03-13 08:40:15','2024-03-13 08:40:15'),
 (44,32,17,1,100,0,0,'2024-05-12 12:40:03','2024-05-12 12:40:03'),
 (45,33,17,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (46,34,52,1,20000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (47,35,17,5,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (48,36,17,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (49,37,17,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (50,37,52,1,20000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (51,40,0,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (52,40,0,1,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (53,40,0,1,20000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (54,40,0,1,4500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (55,40,0,1,1500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (56,40,0,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (57,40,0,1,50,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (58,40,0,1,10000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (59,40,0,1,12000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (60,40,0,1,450,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (61,40,0,1,23,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (62,40,0,1,2300,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (63,40,0,1,1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (64,40,0,1,850,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (65,40,0,1,5000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (66,40,0,1,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (67,41,0,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (68,41,0,1,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (69,42,0,1,2500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (70,42,0,1,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (71,42,0,1,1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (72,42,0,1,2300,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (73,42,0,1,5000,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (74,43,56,1,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (75,44,56,3,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (76,45,56,13,500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (77,46,0,2,4500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (78,46,0,2,4500,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `core_order_details` ENABLE KEYS */;



--
-- Definition of table `core_password_reset_tokens`
--

DROP TABLE IF EXISTS `core_password_reset_tokens`;
CREATE TABLE `core_password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_password_reset_tokens`
--

/*!40000 ALTER TABLE `core_password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_password_reset_tokens` ENABLE KEYS */;


--
-- Definition of table `core_personal_access_tokens`
--

DROP TABLE IF EXISTS `core_personal_access_tokens`;
CREATE TABLE `core_personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_personal_access_tokens_token_unique` (`token`),
  KEY `core_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_personal_access_tokens`
--

/*!40000 ALTER TABLE `core_personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_personal_access_tokens` ENABLE KEYS */;


--
-- Definition of table `core_persons`
--

DROP TABLE IF EXISTS `core_persons`;
CREATE TABLE `core_persons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `position_id` int(10) unsigned NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  `doj` date NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_persons`
--

/*!40000 ALTER TABLE `core_persons` DISABLE KEYS */;
INSERT INTO `core_persons` (`id`,`name`,`position_id`,`sex`,`dob`,`doj`,`mobile`,`address`,`inactive`) VALUES 
 (1,'Jahidul Islam',1,0,'2000-01-01','2021-01-01','677657657567','Rampura',0);
/*!40000 ALTER TABLE `core_persons` ENABLE KEYS */;


--
-- Definition of table `core_positions`
--

DROP TABLE IF EXISTS `core_positions`;
CREATE TABLE `core_positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `grade` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_positions`
--

/*!40000 ALTER TABLE `core_positions` DISABLE KEYS */;
INSERT INTO `core_positions` (`id`,`name`,`grade`,`department_id`) VALUES 
 (1,'Programmer',6,2),
 (2,'System Analyst',3,1);
/*!40000 ALTER TABLE `core_positions` ENABLE KEYS */;


--
-- Definition of table `core_product_brands`
--

DROP TABLE IF EXISTS `core_product_brands`;
CREATE TABLE `core_product_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_product_brands`
--

/*!40000 ALTER TABLE `core_product_brands` DISABLE KEYS */;
INSERT INTO `core_product_brands` (`id`,`name`) VALUES 
 (1,'RFL'),
 (2,'Bengal');
/*!40000 ALTER TABLE `core_product_brands` ENABLE KEYS */;


--
-- Definition of table `core_product_categories`
--

DROP TABLE IF EXISTS `core_product_categories`;
CREATE TABLE `core_product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `section_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_product_categories`
--

/*!40000 ALTER TABLE `core_product_categories` DISABLE KEYS */;
INSERT INTO `core_product_categories` (`id`,`name`,`section_id`,`created_at`,`updated_at`) VALUES 
 (2,'Vegetables',3,'2022-01-11 12:46:24',NULL),
 (3,'Fish',3,'2022-01-11 12:46:24',NULL),
 (4,'Drugs',3,'2022-01-11 12:46:24',NULL),
 (5,'Cameras',1,'2022-01-11 12:46:24',NULL),
 (6,'Computers, Tablets & Laptops',1,'2022-01-11 12:46:24',NULL),
 (7,'Mobile Phone',1,'2022-01-11 12:46:24',NULL),
 (8,'Sound & Vision',1,'2022-01-11 12:46:24',NULL),
 (9,'Women\'s',2,'2022-01-11 12:46:24',NULL),
 (10,'Men\'s',2,'2022-01-11 12:46:24',NULL),
 (11,'Kids',2,'2022-01-11 12:46:24',NULL),
 (12,'Cosmatics',4,'2022-01-11 12:46:24',NULL),
 (13,'T-Shirt',2,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `core_product_categories` ENABLE KEYS */;


--
-- Definition of table `core_product_category`
--

DROP TABLE IF EXISTS `core_product_category`;
CREATE TABLE `core_product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `section_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_product_category`
--

/*!40000 ALTER TABLE `core_product_category` DISABLE KEYS */;
INSERT INTO `core_product_category` (`id`,`name`,`section_id`,`created_at`,`updated_at`) VALUES 
 (2,'Vegetables',3,'2022-01-11 12:46:24',NULL),
 (3,'Fish',3,'2022-01-11 12:46:24',NULL),
 (4,'Drugs',3,'2022-01-11 12:46:24',NULL),
 (5,'Cameras',1,'2022-01-11 12:46:24',NULL),
 (6,'Computers, Tablets & Laptops',1,'2022-01-11 12:46:24',NULL),
 (7,'Mobile Phone',1,'2022-01-11 12:46:24',NULL),
 (8,'Sound & Vision',1,'2022-01-11 12:46:24',NULL),
 (9,'Women\'s',2,'2022-01-11 12:46:24',NULL),
 (10,'Men\'s',2,'2022-01-11 12:46:24',NULL),
 (11,'Kids',2,'2022-01-11 12:46:24',NULL),
 (12,'Cosmatics',4,'2022-01-11 12:46:24',NULL),
 (13,'T-Shirt',2,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `core_product_category` ENABLE KEYS */;


--
-- Definition of table `core_product_sections`
--

DROP TABLE IF EXISTS `core_product_sections`;
CREATE TABLE `core_product_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `unit_id` int(10) unsigned DEFAULT NULL,
  `photo` varchar(145) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_product_sections`
--

/*!40000 ALTER TABLE `core_product_sections` DISABLE KEYS */;
INSERT INTO `core_product_sections` (`id`,`name`,`unit_id`,`photo`,`icon`) VALUES 
 (1,'Electronices',1,NULL,NULL),
 (2,'Clothings',1,NULL,NULL),
 (3,'Food and Beverages',1,NULL,NULL),
 (4,'Health & Beauty',1,NULL,NULL),
 (5,'Sports & Leisure',1,NULL,NULL),
 (6,'Books & Entertainments',1,NULL,NULL);
/*!40000 ALTER TABLE `core_product_sections` ENABLE KEYS */;


--
-- Definition of table `core_product_types`
--

DROP TABLE IF EXISTS `core_product_types`;
CREATE TABLE `core_product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_product_types`
--

/*!40000 ALTER TABLE `core_product_types` DISABLE KEYS */;
INSERT INTO `core_product_types` (`id`,`name`) VALUES 
 (1,'Finished Goods'),
 (2,'Raw Materials'),
 (3,'Consumable Materials');
/*!40000 ALTER TABLE `core_product_types` ENABLE KEYS */;


--
-- Definition of table `core_product_units`
--

DROP TABLE IF EXISTS `core_product_units`;
CREATE TABLE `core_product_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_product_units`
--

/*!40000 ALTER TABLE `core_product_units` DISABLE KEYS */;
INSERT INTO `core_product_units` (`id`,`name`,`photo`,`icon`) VALUES 
 (1,'Electronics',NULL,NULL),
 (2,'Grocery',NULL,NULL);
/*!40000 ALTER TABLE `core_product_units` ENABLE KEYS */;


--
-- Definition of table `core_products`
--

DROP TABLE IF EXISTS `core_products`;
CREATE TABLE `core_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `offer_price` double DEFAULT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `regular_price` double NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `product_category_id` int(10) unsigned NOT NULL,
  `product_section_id` int(10) unsigned NOT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `star` int(10) unsigned DEFAULT NULL,
  `is_brand` tinyint(1) DEFAULT 0,
  `offer_discount` float DEFAULT 0,
  `uom_id` int(10) unsigned NOT NULL,
  `weight` float DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `product_type_id` int(10) unsigned NOT NULL,
  `product_unit_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_products`
--

/*!40000 ALTER TABLE `core_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_products` ENABLE KEYS */;


-
--
-- Definition of table `core_purchases`
--

DROP TABLE IF EXISTS `core_purchases`;
CREATE TABLE `core_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `purchase_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `shipping_address` text NOT NULL,
  `purchase_total` double NOT NULL,
  `paid_amount` double DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `discount` float DEFAULT 0,
  `vat` float DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_purchases`
--

/*!40000 ALTER TABLE `core_purchases` DISABLE KEYS */;
INSERT INTO `core_purchases` (`id`,`supplier_id`,`purchase_date`,`delivery_date`,`shipping_address`,`purchase_total`,`paid_amount`,`remark`,`status_id`,`discount`,`vat`,`created_at`,`updated_at`) VALUES 
 (1,1,'2023-12-24 00:00:00','2023-12-24 00:00:00','Rangpur',18375,0,'Na',1,0,0,'2024-03-31 16:17:58','2024-03-31 16:17:42'),
 (2,2,'2023-12-24 00:00:00','2023-12-24 00:00:00','',22050,0,'',1,0,0,'2024-03-31 16:17:58','2024-03-31 16:17:42'),
 (3,1,'2023-12-24 00:00:00','2023-12-24 00:00:00','',2121,0,'',1,0,0,'2024-03-31 16:17:58','2024-03-31 16:17:42'),
 (4,1,'2023-12-24 00:00:00','2023-12-24 00:00:00','',9450,0,'',1,0,0,'2024-03-31 16:17:58','2024-03-31 16:17:42'),
 (5,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-03-31 10:20:36','2024-03-31 10:20:36'),
 (6,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-03-31 10:25:03','2024-03-31 10:25:03'),
 (7,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-03-31 10:26:17','2024-03-31 10:26:17'),
 (8,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-04-01 09:52:29','2024-04-01 09:52:29'),
 (9,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-04-01 09:53:48','2024-04-01 09:53:48'),
 (10,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-04-01 09:56:29','2024-04-01 09:56:29'),
 (11,1,'2024-03-10 00:00:00','2024-03-10 00:00:00','Rampura',0,0,NULL,1,0,0,'2024-04-01 10:22:59','2024-04-01 10:22:59'),
 (12,2,'2024-04-03 00:00:00','2024-04-03 00:00:00','Test',0,0,NULL,1,0,0,'2024-04-02 09:48:06','2024-04-02 09:48:06'),
 (13,2,'2024-04-03 00:00:00','2024-04-03 00:00:00','Test',0,0,NULL,1,0,0,'2024-04-02 09:49:37','2024-04-02 09:49:37'),
 (14,2,'2024-04-03 00:00:00','2024-04-03 00:00:00','Test',0,0,NULL,1,0,0,'2024-04-02 09:50:35','2024-04-02 09:50:35'),
 (15,2,'2024-04-03 00:00:00','2024-04-03 00:00:00','Test',0,0,NULL,1,0,0,'2024-04-02 09:51:47','2024-04-02 09:51:47'),
 (16,1,'2024-06-04 00:00:00','2024-06-04 00:00:00','Test',2987.25,0,'  NA',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (17,2,'2024-06-05 00:00:00','2024-06-05 00:00:00','',42183.75,0,'',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (18,1,'2024-01-01 00:00:00','2024-01-05 00:00:00','Rampura',100,1000,'NA',1,0,0,'2024-07-10 12:27:24','2024-07-10 12:27:24'),
 (19,1,'2024-01-01 00:00:00','2024-01-05 00:00:00','Rampura',100,1000,'NA',1,0,0,'2024-07-14 12:46:30','2024-07-14 12:46:30'),
 (20,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3621.45,3621.45,'NA',1,0,0,'2024-07-14 12:58:16','2024-07-14 12:58:16'),
 (21,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:01:43','2024-07-14 13:01:43'),
 (22,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:04:31','2024-07-14 13:04:31'),
 (23,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:07:02','2024-07-14 13:07:02'),
 (24,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:08:00','2024-07-14 13:08:00'),
 (25,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:08:10','2024-07-14 13:08:10'),
 (26,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:08:20','2024-07-14 13:08:20'),
 (27,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:09:04','2024-07-14 13:09:04'),
 (28,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:09:31','2024-07-14 13:09:31'),
 (29,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:09:52','2024-07-14 13:09:52'),
 (30,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:10:11','2024-07-14 13:10:11'),
 (31,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:10:14','2024-07-14 13:10:14'),
 (32,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:10:31','2024-07-14 13:10:31'),
 (33,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:10:55','2024-07-14 13:10:55'),
 (34,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:14:34','2024-07-14 13:14:34'),
 (35,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:15:05','2024-07-14 13:15:05'),
 (36,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:15:07','2024-07-14 13:15:07'),
 (37,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:15:31','2024-07-14 13:15:31'),
 (38,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:15:33','2024-07-14 13:15:33'),
 (39,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:16:00','2024-07-14 13:16:00'),
 (40,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:16:01','2024-07-14 13:16:01'),
 (41,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:16:02','2024-07-14 13:16:02'),
 (42,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',37117.5,37117.5,'NA',1,0,0,'2024-07-14 13:16:05','2024-07-14 13:16:05'),
 (43,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:16:20','2024-07-14 13:16:20'),
 (44,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:17:23','2024-07-14 13:17:23'),
 (45,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:17:31','2024-07-14 13:17:31'),
 (46,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:18:13','2024-07-14 13:18:13'),
 (47,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',3622.5,3622.5,'NA',1,0,0,'2024-07-14 13:18:22','2024-07-14 13:18:22'),
 (48,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:18:42','2024-07-14 13:18:42'),
 (49,1,'2024-07-14 00:00:00','2024-07-14 00:00:00','na',29872.5,29872.5,'NA',1,0,0,'2024-07-14 13:19:35','2024-07-14 13:19:35'),
 (50,4,'2025-03-10 00:00:00','2025-03-10 00:00:00','',119700,0,'Testk',1,0,0,'2025-03-10 15:58:37','2025-03-10 15:58:37'),
 (51,4,'2025-03-19 00:00:00','2025-03-19 00:00:00','',16800,0,'',1,0,0,'2025-03-19 14:29:20','2025-03-19 14:29:20'),
 (52,1,'2025-04-10 00:00:00','2025-04-10 00:00:00','',2100,0,'testing',1,0,0,'2025-04-10 18:23:24','2025-04-10 18:23:24'),
 (53,1,'2025-04-12 00:00:00','2025-04-12 00:00:00','',3150,0,'',1,0,0,'2025-04-12 16:39:29','2025-04-12 16:39:29');
/*!40000 ALTER TABLE `core_purchases` ENABLE KEYS */;

-
-- Definition of table `core_purchase_details`
--

DROP TABLE IF EXISTS `core_purchase_details`;
CREATE TABLE `core_purchase_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  `vat` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_purchase_details`
--

/*!40000 ALTER TABLE `core_purchase_details` DISABLE KEYS */;
INSERT INTO `core_purchase_details` (`id`,`purchase_id`,`product_id`,`qty`,`price`,`vat`,`discount`,`created_at`,`updated_at`) VALUES 
 (1,1,17,50,200,0,0,NULL,NULL),
 (2,1,18,30,250,0,0,NULL,NULL),
 (3,2,17,20,210,0,0,NULL,NULL),
 (4,2,40,70,240,0,0,NULL,NULL),
 (5,3,39,10,202,0,0,NULL,NULL),
 (6,4,40,30,300,0,0,NULL,NULL),
 (7,10,1,4,200,0,0,NULL,NULL),
 (8,15,18,1,180,0,0,NULL,NULL),
 (9,15,50,1,345,0,0,NULL,NULL),
 (10,15,17,1,2500,0,0,NULL,NULL),
 (11,16,50,1,345,0,0,NULL,NULL),
 (12,16,17,1,2500,0,0,NULL,NULL),
 (13,17,17,14,2500,0,0,NULL,NULL),
 (14,17,50,15,345,0,0,NULL,NULL),
 (15,50,52,6,19000,0,0,NULL,NULL),
 (16,51,17,3,4000,0,0,NULL,NULL),
 (17,51,52,1,4000,0,0,NULL,NULL),
 (18,52,56,100,20,0,0,NULL,NULL),
 (19,53,56,10,300,0,0,NULL,NULL);
/*!40000 ALTER TABLE `core_purchase_details` ENABLE KEYS */;



--
-- Definition of table `core_rest_tables`
--

DROP TABLE IF EXISTS `core_rest_tables`;
CREATE TABLE `core_rest_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `photo` varchar(45) DEFAULT NULL,
  `seats` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_rest_tables`
--

/*!40000 ALTER TABLE `core_rest_tables` DISABLE KEYS */;
INSERT INTO `core_rest_tables` (`id`,`name`,`status`,`photo`,`seats`) VALUES 
 (1,'Table 1',0,'1.png',6),
 (2,'Table 2',1,'2.jpeg',5),
 (3,'Table 3',2,'3.jpg',2),
 (4,'Table 4',1,'4.jpeg',4),
 (5,'Table 5',1,'5.jpg',2),
 (6,'Table 6',1,'6.jpg',12),
 (7,'Table 7',1,'10-jpg.jpg',10),
 (8,'Guest 1',1,'6-png.png',5);
/*!40000 ALTER TABLE `core_rest_tables` ENABLE KEYS */;


--
-- Definition of table `core_roles`
--

DROP TABLE IF EXISTS `core_roles`;
CREATE TABLE `core_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_roles`
--

/*!40000 ALTER TABLE `core_roles` DISABLE KEYS */;
INSERT INTO `core_roles` (`id`,`name`,`updated_at`,`created_at`) VALUES 
 (1,'Admin','2024-03-02 04:59:14','2024-03-02 10:59:14'),
 (2,'Manager','2024-02-28 12:10:59','2024-02-28 12:10:59'),
 (4,'Guest','2024-03-07 10:24:21','2024-03-07 10:24:21'),
 (5,'Demo1','2024-03-07 12:25:34','2024-06-09 12:38:21'),
 (12,'Dem34','2024-06-11 05:29:21','2024-06-11 05:29:21');
/*!40000 ALTER TABLE `core_roles` ENABLE KEYS */;


--
-- Definition of table `core_room_types`
--

DROP TABLE IF EXISTS `core_room_types`;
CREATE TABLE `core_room_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_room_types`
--

/*!40000 ALTER TABLE `core_room_types` DISABLE KEYS */;
INSERT INTO `core_room_types` (`id`,`name`) VALUES 
 (1,'Single'),
 (2,'Double');
/*!40000 ALTER TABLE `core_room_types` ENABLE KEYS */;


--
-- Definition of table `core_rooms`
--

DROP TABLE IF EXISTS `core_rooms`;
CREATE TABLE `core_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `room_type_id` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_rooms`
--

/*!40000 ALTER TABLE `core_rooms` DISABLE KEYS */;
INSERT INTO `core_rooms` (`id`,`name`,`code`,`room_type_id`,`price`) VALUES 
 (1,'Double South Side 200sft 2nd floor- 322','322',2,2000),
 (2,'Single 100sft non ac -324','324',1,500);
/*!40000 ALTER TABLE `core_rooms` ENABLE KEYS */;


--
-- Definition of table `core_round63`
--

DROP TABLE IF EXISTS `core_round63`;
CREATE TABLE `core_round63` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `roll` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_round63`
--

/*!40000 ALTER TABLE `core_round63` DISABLE KEYS */;
INSERT INTO `core_round63` (`id`,`name`,`contact`,`email`,`roll`) VALUES 
 (1,'Naiyem','01515618932','mdnaiyem@gmail.com','1286770');
/*!40000 ALTER TABLE `core_round63` ENABLE KEYS */;


--
-- Definition of table `core_sections`
--

DROP TABLE IF EXISTS `core_sections`;
CREATE TABLE `core_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_sections`
--

/*!40000 ALTER TABLE `core_sections` DISABLE KEYS */;
INSERT INTO `core_sections` (`id`,`name`) VALUES 
 (1,'Electronices'),
 (2,'Clothings'),
 (3,'Food and Beverages'),
 (4,'Health & Beauty'),
 (5,'Sports & Leisure'),
 (6,'Books & Entertainments');
/*!40000 ALTER TABLE `core_sections` ENABLE KEYS */;


--
-- Definition of table `core_sessions`
--

DROP TABLE IF EXISTS `core_sessions`;
CREATE TABLE `core_sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_sessions_user_id_index` (`user_id`),
  KEY `core_sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_sessions`
--

/*!40000 ALTER TABLE `core_sessions` DISABLE KEYS */;
INSERT INTO `core_sessions` (`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) VALUES 
 ('8a20HUzKZ3RpGk4iUgtOgIn6p4aGj6E09yOTYBab',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia3ZuMGdrTDlBNFY5cVRMakRRbTlBYXZpY0c4ZWlLRmhwYlZPRFdjMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750761262),
 ('LMrcJxtmie0CSsCtGsgAcuiAsKs40ij8KaxyHHLu',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZlTTAyeUc0ZXRYRVVadXp1THptS05TcTRGUkJ3MlM1VjR0NG9yciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750587687),
 ('PZDecWs1QmCO9tPtRNqk71F0hSfdJ6pdDGzXUvUz',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3pGVmhTcGxDd3h6SEJuY2FIUWM3cDVhcW1iZ09semZGOVlYNjJIZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3QvRGlkYXIvYXBpX2NoZWNrL3B1YmxpYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750761432);
/*!40000 ALTER TABLE `core_sessions` ENABLE KEYS */;


--
-- Definition of table `core_shippers`
--

DROP TABLE IF EXISTS `core_shippers`;
CREATE TABLE `core_shippers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_person` varchar(45) NOT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_shippers`
--

/*!40000 ALTER TABLE `core_shippers` DISABLE KEYS */;
INSERT INTO `core_shippers` (`id`,`name`,`contact_person`,`contact_no`) VALUES 
 (1,'Sundarban Courier ','Mr. Jahid','343243242');
/*!40000 ALTER TABLE `core_shippers` ENABLE KEYS */;


--
-- Definition of table `core_site_album_details`
--

DROP TABLE IF EXISTS `core_site_album_details`;
CREATE TABLE `core_site_album_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_album_id` int(10) unsigned NOT NULL,
  `photo` varchar(245) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_album_details`
--

/*!40000 ALTER TABLE `core_site_album_details` DISABLE KEYS */;
INSERT INTO `core_site_album_details` (`id`,`site_album_id`,`photo`,`name`,`description`,`inactive`) VALUES 
 (1,1,'./uploads/posts/1548841158.jpg','Intellect Software Ltd','Leading Software Company',0),
 (2,1,'1548843065.jpg','Intellect Cloud POS','Intellect Enterprise Resource Planning (ERP) is business management&#8230;',0),
 (3,1,'1548841332.jpg','Education and Training','For many people, gaining new skills through accredited&#8230;',0),
 (4,2,'1548867137.svg','Food and Beverage',NULL,0),
 (5,2,'1548867301.svg','Retail Goods',NULL,0),
 (6,2,'1548867424.svg','Energy, Oil and Gas',NULL,0),
 (7,2,'1548867363.svg','Chemical Goods',NULL,0),
 (8,2,'1548867453.svg','Consumer Packaged Goods',NULL,0),
 (9,3,'15488786820.jpg','Screenshot1',NULL,0),
 (10,3,'15488786821.jpg','Screenshot2',NULL,0),
 (11,4,'15488797600.jpg','POS1',NULL,0),
 (12,4,'15488797601.jpg','POS2',NULL,0),
 (13,4,'15488797602.jpg','POS3',NULL,0);
/*!40000 ALTER TABLE `core_site_album_details` ENABLE KEYS */;


--
-- Definition of table `core_site_albums`
--

DROP TABLE IF EXISTS `core_site_albums`;
CREATE TABLE `core_site_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_albums`
--

/*!40000 ALTER TABLE `core_site_albums` DISABLE KEYS */;
INSERT INTO `core_site_albums` (`id`,`name`,`created_at`,`description`,`photo`) VALUES 
 (1,'Main Slider',NULL,'Na',NULL),
 (2,'INDUSTRY SECTORS',NULL,'We cover different industry sectors, from food and beverage, chemical, retail, durable goods and more. Check the full list.',NULL),
 (3,'Screenshot - Home Page',NULL,NULL,NULL),
 (4,'POS',NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_site_albums` ENABLE KEYS */;


--
-- Definition of table `core_site_attributes`
--

DROP TABLE IF EXISTS `core_site_attributes`;
CREATE TABLE `core_site_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_attributes`
--

/*!40000 ALTER TABLE `core_site_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_site_attributes` ENABLE KEYS */;


--
-- Definition of table `core_site_clients`
--

DROP TABLE IF EXISTS `core_site_clients`;
CREATE TABLE `core_site_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(300) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_clients`
--

/*!40000 ALTER TABLE `core_site_clients` DISABLE KEYS */;
INSERT INTO `core_site_clients` (`id`,`name`,`photo`,`review`,`website`) VALUES 
 (1,'Karnaphuli Group','1548871087-png.png','Na','https://www.karnaphuli.com/'),
 (2,'Doreen','1548871127-png.png','Na','https://doreen.com/');
/*!40000 ALTER TABLE `core_site_clients` ENABLE KEYS */;


--
-- Definition of table `core_site_menu_sub_details`
--

DROP TABLE IF EXISTS `core_site_menu_sub_details`;
CREATE TABLE `core_site_menu_sub_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `site_menu_sub_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_menu_sub_details`
--

/*!40000 ALTER TABLE `core_site_menu_sub_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_site_menu_sub_details` ENABLE KEYS */;


--
-- Definition of table `core_site_menu_subs`
--

DROP TABLE IF EXISTS `core_site_menu_subs`;
CREATE TABLE `core_site_menu_subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_menu_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `has_child` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_menu_subs`
--

/*!40000 ALTER TABLE `core_site_menu_subs` DISABLE KEYS */;
INSERT INTO `core_site_menu_subs` (`id`,`site_menu_id`,`name`,`link`,`has_child`) VALUES 
 (1,2,'POS ERP','pos-erp',0),
 (2,2,'ERP-Garments','garment-erp',0),
 (3,2,'ERP-General Insurance','general-insurance-erp',0),
 (4,2,'ERP-Education','education-erp',0),
 (5,2,'ERP Manufacturing','manufacturing-erp',0),
 (6,2,'ERP Hospital','hospital-erp',0),
 (7,2,'ERP Texttile','texttile-erp',0),
 (8,2,'ERP Real Estate','real-estate-erp',0),
 (9,8,'Web publising','webpublishing',0),
 (10,8,'Javascript Library','javascript-library',0),
 (11,8,'Server Side','server-side',0);
/*!40000 ALTER TABLE `core_site_menu_subs` ENABLE KEYS */;


--
-- Definition of table `core_site_menus`
--

DROP TABLE IF EXISTS `core_site_menus`;
CREATE TABLE `core_site_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `has_child` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_menus`
--

/*!40000 ALTER TABLE `core_site_menus` DISABLE KEYS */;
INSERT INTO `core_site_menus` (`id`,`name`,`link`,`has_child`) VALUES 
 (1,'Home','/',0),
 (2,'Software','./software.html',1),
 (3,'Service','./service.html',0),
 (4,'Partner','./partner.html',0),
 (5,'Client','./client.html',0),
 (6,'About','./about.html',0),
 (7,'Contact','/contact.html',0),
 (8,'Blog','./blog.html',1);
/*!40000 ALTER TABLE `core_site_menus` ENABLE KEYS */;


--
-- Definition of table `core_site_pages`
--

DROP TABLE IF EXISTS `core_site_pages`;
CREATE TABLE `core_site_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `link` varchar(45) DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT 0,
  `slug` varchar(145) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_pages`
--

/*!40000 ALTER TABLE `core_site_pages` DISABLE KEYS */;
INSERT INTO `core_site_pages` (`id`,`name`,`link`,`inactive`,`slug`,`description`,`photo`) VALUES 
 (1,'POS ERP','http',0,NULL,'Integrated solution from production to point of sale for any retials business including\r\n                                supershop, clothing, pharmacy, restaurant/food, electronics, library, jewellery,\r\n                                furniture, tiles &amp; sanitary etc',NULL);
/*!40000 ALTER TABLE `core_site_pages` ENABLE KEYS */;


--
-- Definition of table `core_site_post_categories`
--

DROP TABLE IF EXISTS `core_site_post_categories`;
CREATE TABLE `core_site_post_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_post_categories`
--

/*!40000 ALTER TABLE `core_site_post_categories` DISABLE KEYS */;
INSERT INTO `core_site_post_categories` (`id`,`name`) VALUES 
 (1,'Business'),
 (2,'Software');
/*!40000 ALTER TABLE `core_site_post_categories` ENABLE KEYS */;


--
-- Definition of table `core_site_post_details`
--

DROP TABLE IF EXISTS `core_site_post_details`;
CREATE TABLE `core_site_post_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_post_id` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(245) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_post_details`
--

/*!40000 ALTER TABLE `core_site_post_details` DISABLE KEYS */;
INSERT INTO `core_site_post_details` (`id`,`site_post_id`,`description`,`photo`,`name`) VALUES 
 (1,1,'Product multi-dimensional measurement unit',NULL,NULL),
 (2,1,'Convenience of buying and selling products according to batch / lot\r\n                                        number',NULL,NULL),
 (3,1,'Advantages of Product Metrics',NULL,NULL),
 (4,1,'Business data will never be lost or ',NULL,NULL),
 (5,1,'Buying from multiple branches can be sold through the same software',NULL,NULL),
 (6,1,'The software will never slow down, if the data is high or even from the remote\r\n                                        location.',NULL,NULL),
 (7,2,'Accounting Management',NULL,NULL),
 (8,2,'Payroll Management',NULL,NULL),
 (9,2,' Inventory Management',NULL,NULL),
 (10,2,'Purchase Management',NULL,NULL),
 (11,2,'Production & Distribution Management',NULL,NULL),
 (12,2,' Human Resource Management',NULL,NULL),
 (13,2,' Customer Relationship Management',NULL,NULL),
 (14,2,'Sales Management',NULL,NULL),
 (15,2,'Barcode Creator',NULL,NULL),
 (16,2,'Cloud Backup Server',NULL,NULL),
 (17,4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\r\n                                        himenaeos. Nulla nunc dui, tristique in semper vel.',NULL,'Super Design Layout '),
 (18,4,'Intellect Cloud pos software can be automated update after the release new\r\n                                        version of software. Update for the better performace and better userfriendly.',NULL,'Regular Updates & Support'),
 (19,4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\r\n                                        himenaeos nulla nunc dui.',NULL,'Responsive Web Design');
/*!40000 ALTER TABLE `core_site_post_details` ENABLE KEYS */;


--
-- Definition of table `core_site_posts`
--

DROP TABLE IF EXISTS `core_site_posts`;
CREATE TABLE `core_site_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(245) DEFAULT NULL,
  `site_album_id` int(10) unsigned DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT 0,
  `post_category_id` int(10) unsigned DEFAULT NULL,
  `post_page_id` int(10) unsigned DEFAULT NULL,
  `photo` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_posts`
--

/*!40000 ALTER TABLE `core_site_posts` DISABLE KEYS */;
INSERT INTO `core_site_posts` (`id`,`name`,`description`,`slug`,`site_album_id`,`inactive`,`post_category_id`,`post_page_id`,`photo`) VALUES 
 (1,'Explain why its best','There are several kind of information we have for why we are best. Some the best features\r\n                                we provide for you that are the world wide challenging features. Some best features are\r\n                                given below.',NULL,3,0,1,1,NULL),
 (2,'Great way to Include with POS','With integrated POS software, the following business software is listed together.',NULL,4,0,1,1,NULL),
 (3,'ERP - POS','Integrated solution from production to point of sale for any retials business including\r\n                                supershop, clothing, pharmacy, restaurant/food, electronics, library, jewellery,\r\n                                furniture, tiles &amp; sanitary etc',NULL,5,0,1,1,'1548843653.jpg'),
 (4,'Intellect Cloud POS Software - features','Responsive & optimized for mobile devices. Completely without coding skills!',NULL,NULL,0,NULL,NULL,'15488780820.jpg');
/*!40000 ALTER TABLE `core_site_posts` ENABLE KEYS */;


--
-- Definition of table `core_site_product_categories`
--

DROP TABLE IF EXISTS `core_site_product_categories`;
CREATE TABLE `core_site_product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_product_categories`
--

/*!40000 ALTER TABLE `core_site_product_categories` DISABLE KEYS */;
INSERT INTO `core_site_product_categories` (`id`,`name`) VALUES 
 (1,'ERP'),
 (2,'OTHER SOFTWARES');
/*!40000 ALTER TABLE `core_site_product_categories` ENABLE KEYS */;


--
-- Definition of table `core_site_product_uoms`
--

DROP TABLE IF EXISTS `core_site_product_uoms`;
CREATE TABLE `core_site_product_uoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_product_uoms`
--

/*!40000 ALTER TABLE `core_site_product_uoms` DISABLE KEYS */;
INSERT INTO `core_site_product_uoms` (`id`,`name`) VALUES 
 (1,'Piece');
/*!40000 ALTER TABLE `core_site_product_uoms` ENABLE KEYS */;


--
-- Definition of table `core_site_products`
--

DROP TABLE IF EXISTS `core_site_products`;
CREATE TABLE `core_site_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `site_product_category_id` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(345) DEFAULT NULL,
  `regular_price` float DEFAULT NULL,
  `offer_price` float DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT NULL,
  `current_stock` float DEFAULT NULL,
  `site_product_uom_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_products`
--

/*!40000 ALTER TABLE `core_site_products` DISABLE KEYS */;
INSERT INTO `core_site_products` (`id`,`name`,`site_product_category_id`,`description`,`photo`,`regular_price`,`offer_price`,`inactive`,`current_stock`,`site_product_uom_id`,`slug`,`icon`) VALUES 
 (1,'POS ERP',1,' Integrated solution from production to point of sale for any retials business including supershop, clothing, pharmacy, restaurant/food, electronics, library, jewellery, furniture, tiles & sanitary etc','1548843653.jpg',0,0,0,0,1,'pos-erp',''),
 (2,'ERP - GARMENTS',1,'Intellect Garments ERP is one of the leading ERP solution provider, especially for Garments industries which is integrated with different modules that cover all the…','1548855465.jpg',0,0,0,0,1,'garments-erp',NULL),
 (3,'ERP - GENERAL INSURANCE',1,'Our Insurance software so flexible that you will reach your business goals in no time. Stop struggling with legacy systems! Our intellect software will help…','1548855650.jpg',0,0,0,0,1,'genaral-insurance-erp',NULL),
 (4,'ERP - EDUCATION',1,'Intellect education management software is used by teachers, students, and school/college/university administrators for organization and collaboration, and to facilitate learning. School software is','1548856590.jpg',0,0,0,0,1,'education-erp',NULL),
 (5,'ERP - MANUFACTURING',1,'Intellect ERP gives a company an integrated real-time view of its core business processes such as production, order processing, and inventory management, tied together by…','1548856850.jpg',0,0,0,0,1,'manufacturing-erp',NULL),
 (6,'ERP - HOSPITAL',1,'Intellect Hospital Management Software is a comprehensive and integrated hospital management software, designed to manage all aspects of hospital operations.(i.e. Outpatient and Inpatient management, Patient…','1548857774.jpg',0,0,0,0,1,'hospital-erp',NULL),
 (7,'ERP - MERCHANDISING',1,'Merchandising, CONTROL Retail Management System and POS also takes care of Retail CRM, Inventory Management, online trading, Sales & Profit Analysis, Order Entry & Invoicing,…','1548858095.jpg',0,0,0,0,1,'merchandising-erp',NULL),
 (8,'ERP - TEXTILE',1,'The Intellect ERP (enterprise resource planning) software solutions - seek to integrate the business processes involving eight critical areas in the textile production planning which…','1548858372.jpg',0,0,0,0,1,'texttile-erp',NULL),
 (9,'ERP - REAL ESTATE',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater','1548858645.jpg',0,0,0,0,1,'real-estate-erp',NULL),
 (10,'Accounting',2,'Accounting Software includes general journal, creating bill & invoice, all financial reports (Trial Balance, Income Statement, Balance Sheet) and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M19 2H5c-1.103 0-2 .897-2 2v16c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2V4c0-1.103-.897-2-2-2zM5 20V4h14l.001 16H5z\"></path><path d=\"M7 12h2v2H7zm0 4h2v2H7zm4-4h2v2h-2zM7 6h10v4H7zm4 10h2v2h-2zm4-4h2v6h-2z\"></path>',0,0,0,0,1,'accounting',NULL),
 (11,'HR & Accounting',2,'Human Resource Management System includes person management, payroll, attendance, leave & holiday, shift & schedule, accounting and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M9.715 12c1.151 0 2-.849 2-2s-.849-2-2-2-2 .849-2 2 .848 2 2 2z\"></path><path d=\"M20 4H4c-1.103 0-2 .841-2 1.875v12.25C2 19.159 2.897 20 4 20h16c1.103 0 2-.841 2-1.875V5.875C22 4.841 21.103 4 20 4zm0 14-16-.011V6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (12,'Diagnostic Application',2,'Diagnostic Application includes pharmacy management, radioloy reporting management, sample collection and reporting management and so on','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M15.794 11.09c.332-.263.648-.542.947-.84l.136-.142c.283-.293.552-.598.801-.919l.062-.075c.255-.335.486-.688.702-1.049l.128-.22c.205-.364.395-.737.559-1.123.02-.047.035-.095.055-.142.147-.361.274-.731.383-1.109.02',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (13,'Doctors Prescription',2,'Doctors Prescription Application includes appointment scheduling, visit fee collection, create and print prescription and so on..','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M8.434 20.566c1.335 0 2.591-.52 3.535-1.464l7.134-7.133a5.008 5.008 0 0 0-.001-7.072 4.969 4.969 0 0 0-3.536-1.463c-1.335 0-2.59.52-3.534 1.464l-7.134 7.133a5.01 5.01 0 0 0-.001 7.072 4.971 4.971 0 0 0 3.537 1.46',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (14,'Asset Management',2,'Asset Management System includes asset and components, operation schedule, material & service requisition and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"m20.772 13.155-1.368-4.104A2.995 2.995 0 0 0 16.559 7H7.441a2.995 2.995 0 0 0-2.845 2.051l-1.368 4.104A2.001 2.001 0 0 0 2 15v3c0 .738.404 1.376 1 1.723V21a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1v-1h12v1a1 1 0 0 0 1 1h1a1 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (15,'Inventory Management',2,'Inventory Management System includes stock management, warehouse management, stock adjustment, requisition management, stock reporting and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M21.993 7.95a.96.96 0 0 0-.029-.214c-.007-.025-.021-.049-.03-.074-.021-.057-.04-.113-.07-.165-.016-.027-.038-.049-.057-.075-.032-.045-.063-.091-.102-.13-.023-.022-.053-.04-.078-.061-.039-.032-.075-.067-.12-.094-.',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (16,'RealTime Attendance System',2,'Biometric System Application includes registration with finger print and webcam device, Bio-Metric verification, real time data storage, system & security and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M5.962 17.674C7 19.331 7 20.567 7 22h2c0-1.521 0-3.244-1.343-5.389l-1.695 1.063zM16.504 3.387C13.977 1.91 7.55.926 4.281 4.305c-3.368 3.481-2.249 9.072.001 11.392.118.122.244.229.369.333.072.061.146.116.205.184l1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (17,'Project Management',2,'Project Management Application includes person management, task & team management, asset management, costing, reporting and so o','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M5 22h14c1.103 0 2-.897 2-2V5c0-1.103-.897-2-2-2h-2a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1H5c-1.103 0-2 .897-2 2v15c0 1.103.897 2 2 2zM5 5h2v2h10V5h2v15H5V5z\"></path><path d=\"m11 13.586-1.793-1.793-1.414 1.414L11 16.414l5',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (18,'Logistics Management',2,'Logistics Management System includes procurement & delivery management, transportation & route management, storage of goods & transportation flow, navigation, billing and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M14.844 20H6.5C5.121 20 4 18.879 4 17.5S5.121 15 6.5 15h7c1.93 0 3.5-1.57 3.5-3.5S15.43 8 13.5 8H8.639a9.812 9.812 0 0 1-1.354 2H13.5c.827 0 1.5.673 1.5 1.5s-.673 1.5-1.5 1.5h-7C4.019 13 2 15.019 2 17.5S4.019 22 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (19,'E-Commerce Solution',2,'E-Commerce Solution includes website, management of product, order, purchase, warehouse, customer, supplier, payment gateway and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M4 20h2V10a1 1 0 0 1 1-1h12V7a1 1 0 0 0-1-1h-3.051c-.252-2.244-2.139-4-4.449-4S6.303 3.756 6.051 6H3a1 1 0 0 0-1 1v11a2 2 0 0 0 2 2zm6.5-16c1.207 0 2.218.86 2.45 2h-4.9c.232-1.14 1.243-2 2.45-2z\"></path><path d=\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (20,'Visa Processing Software',2,'Our Visa Processing Software includes customer registration, deed and document management, visa & ticket processing step management, invoice & payment, status report and so on.','<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"48\" height=\"48\" viewBox=\"0 0 24 24\" class=\"text-primary\" fill=\"currentColor\"><path d=\"M3 18h18v2H3zm18.509-9.473a1.61 1.61 0 0 0-2.036-1.019L15 9 7 6 5 7l6 4-4 2-4-2-1 1 4 4 14.547-5.455a1.611 1.611 0 0 0 .962-2.018z\"></path></svg>',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_site_products` ENABLE KEYS */;


--
-- Definition of table `core_site_routes`
--

DROP TABLE IF EXISTS `core_site_routes`;
CREATE TABLE `core_site_routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `inactive` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `site_menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_route` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_routes`
--

/*!40000 ALTER TABLE `core_site_routes` DISABLE KEYS */;
INSERT INTO `core_site_routes` (`id`,`name`,`src`,`inactive`,`site_menu_id`) VALUES 
 (1,'pos-erp','views/pages/ERP-POS.php',0,2),
 (2,'garment-erp','views/pages/ERP-Garments.php',0,2),
 (3,'education-erp','views/pages/ERP-Education.php',0,2),
 (4,'general-insurance-erp','views/pages/ERP-General-Insurance.php',0,2),
 (5,'manufacturing-erp','views/pages/ERP-Manufacturing.php',0,2),
 (6,'hospital-erp','views/pages/ERP-Hospital.php',0,2),
 (7,'texttile-erp','views/pages/ERP-Textitle.php',0,2),
 (8,'real-estate-erp','views/pages/ERP-Real-Estate.php',0,2);
/*!40000 ALTER TABLE `core_site_routes` ENABLE KEYS */;


--
-- Definition of table `core_site_service_categories`
--

DROP TABLE IF EXISTS `core_site_service_categories`;
CREATE TABLE `core_site_service_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_service_categories`
--

/*!40000 ALTER TABLE `core_site_service_categories` DISABLE KEYS */;
INSERT INTO `core_site_service_categories` (`id`,`name`) VALUES 
 (1,'Software Enable Service');
/*!40000 ALTER TABLE `core_site_service_categories` ENABLE KEYS */;


--
-- Definition of table `core_site_services`
--

DROP TABLE IF EXISTS `core_site_services`;
CREATE TABLE `core_site_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `regular_price` float DEFAULT 0,
  `offer_price` float DEFAULT 0,
  `icon` varchar(45) DEFAULT NULL,
  `inactive` tinyint(3) unsigned DEFAULT 0,
  `photo` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_site_services`
--

/*!40000 ALTER TABLE `core_site_services` DISABLE KEYS */;
INSERT INTO `core_site_services` (`id`,`name`,`category_id`,`description`,`regular_price`,`offer_price`,`icon`,`inactive`,`photo`) VALUES 
 (1,'Software Quality Assurance',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater',0,0,NULL,0,'1548863121.png'),
 (2,'Software forensic',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater',0,0,NULL,0,'1548863180.png'),
 (3,'Database Migration',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater',0,0,NULL,0,'1548863362.png'),
 (4,'Setup Own Hosting',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater',0,0,NULL,0,'1548863484.png'),
 (5,'Cloud Backup Service',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greate',0,0,NULL,0,'1548862800.png'),
 (6,'Software Upgrade and Maintenance',1,'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater',0,0,NULL,0,'1548863512.png'),
 (7,'Incredibly Responsive',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.',0,0,'<i class=\"fa fa-laptop v-icon\"></i>',0,NULL),
 (8,'Fully Customizible',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.',0,0,'<i class=\"fa fa-leaf v-icon\"></i>',0,NULL),
 (9,'Interactive Elements',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.',0,0,'<i class=\"fa fa-scissors v-icon\"></i>',0,NULL);
/*!40000 ALTER TABLE `core_site_services` ENABLE KEYS */;


--
-- Definition of table `core_status`
--

DROP TABLE IF EXISTS `core_status`;
CREATE TABLE `core_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_status`
--

/*!40000 ALTER TABLE `core_status` DISABLE KEYS */;
INSERT INTO `core_status` (`id`,`name`) VALUES 
 (1,'Processing'),
 (2,'Shifted'),
 (3,'Delivered'),
 (4,'Invoiced');
/*!40000 ALTER TABLE `core_status` ENABLE KEYS */;


--
-- Definition of table `core_stock_adjustment_details`
--

DROP TABLE IF EXISTS `core_stock_adjustment_details`;
CREATE TABLE `core_stock_adjustment_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_stock_adjustment_details`
--

/*!40000 ALTER TABLE `core_stock_adjustment_details` DISABLE KEYS */;
INSERT INTO `core_stock_adjustment_details` (`id`,`adjustment_id`,`product_id`,`qty`,`price`) VALUES 
 (1,2,20,5,400),
 (2,3,20,50,400),
 (3,4,28,70,6650),
 (4,4,20,30,300);
/*!40000 ALTER TABLE `core_stock_adjustment_details` ENABLE KEYS */;


--
-- Definition of table `core_stock_adjustment_types`
--

DROP TABLE IF EXISTS `core_stock_adjustment_types`;
CREATE TABLE `core_stock_adjustment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `factor` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_stock_adjustment_types`
--

/*!40000 ALTER TABLE `core_stock_adjustment_types` DISABLE KEYS */;
INSERT INTO `core_stock_adjustment_types` (`id`,`name`,`factor`) VALUES 
 (1,'Is Outdated',-1),
 (2,'Is Damaged',-1),
 (3,'Material Missing',-1),
 (4,'Product Is Obsolete',-1),
 (5,'Existing Inventory',1),
 (6,'Fixed/Found Inventory',1);
/*!40000 ALTER TABLE `core_stock_adjustment_types` ENABLE KEYS */;


--
-- Definition of table `core_stock_adjustments`
--

DROP TABLE IF EXISTS `core_stock_adjustments`;
CREATE TABLE `core_stock_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(10) unsigned NOT NULL,
  `remark` text NOT NULL,
  `adjustment_type_id` int(10) unsigned NOT NULL,
  `werehouse_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_stock_adjustments`
--

/*!40000 ALTER TABLE `core_stock_adjustments` DISABLE KEYS */;
INSERT INTO `core_stock_adjustments` (`id`,`adjustment_at`,`user_id`,`remark`,`adjustment_type_id`,`werehouse_id`) VALUES 
 (1,'2021-12-28 00:00:00',1,'ddd',2,1),
 (2,'2021-12-28 00:00:00',1,'ddd',2,1),
 (3,'2021-12-28 00:00:00',1,'ddddfd',6,1),
 (4,'2021-12-28 00:00:00',1,'NA',6,2);
/*!40000 ALTER TABLE `core_stock_adjustments` ENABLE KEYS */;


--
-- Definition of table `core_stocks`
--

DROP TABLE IF EXISTS `core_stocks`;
CREATE TABLE `core_stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `qty` float NOT NULL,
  `transaction_type_id` int(10) unsigned NOT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `warehouse_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_stocks`
--

/*!40000 ALTER TABLE `core_stocks` DISABLE KEYS */;
INSERT INTO `core_stocks` (`id`,`product_id`,`qty`,`transaction_type_id`,`remark`,`created_at`,`warehouse_id`) VALUES 
 (14,50,1,3,'Purchase','2024-06-04 12:47:19',1),
 (15,17,1,3,'Purchase','2024-06-04 12:47:19',1),
 (16,17,14,3,'Purchase','2024-06-05 09:22:00',1),
 (17,50,15,3,'Purchase','2024-06-05 09:22:00',1),
 (18,17,-1,6,'Damage','0000-00-00 00:00:00',1),
 (19,50,2,4,'selse return','0000-00-00 00:00:00',1),
 (20,50,2,2,'yj','0000-00-00 00:00:00',1),
 (21,17,2,1,'ytjk','0000-00-00 00:00:00',1),
 (22,17,-1,1,'Order','0000-00-00 00:00:00',0),
 (23,52,6,3,'Purchase','2025-03-10 15:58:37',1),
 (24,52,-1,1,'Order','0000-00-00 00:00:00',0),
 (25,52,3,5,'Test','0000-00-00 00:00:00',2),
 (26,50,-2,6,'Tst','0000-00-00 00:00:00',1),
 (27,17,-5,1,'Order','0000-00-00 00:00:00',0),
 (28,17,-1,1,'Order','0000-00-00 00:00:00',0),
 (29,17,-1,1,'Order','0000-00-00 00:00:00',0),
 (30,52,-1,1,'Order','0000-00-00 00:00:00',0),
 (31,17,3,3,'Purchase','2025-03-19 14:29:20',2),
 (32,52,1,3,'Purchase','2025-03-19 14:29:20',2),
 (33,50,10,3,'None','2025-04-09 18:16:31',3),
 (34,56,100,3,'Purchase','2025-04-10 18:23:24',1),
 (35,0,-2,1,'Order','0000-00-00 00:00:00',0),
 (36,17,-1,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (37,56,-1,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (38,56,-1,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (39,56,-1,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (40,56,-1,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (41,56,-13,2,'Sales Delivery','0000-00-00 00:00:00',0),
 (42,56,10,3,'Purchase','2025-04-12 16:39:29',1);
/*!40000 ALTER TABLE `core_stocks` ENABLE KEYS */;


--
-- Definition of table `core_students`
--

DROP TABLE IF EXISTS `core_students`;
CREATE TABLE `core_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fathers_name` varchar(45) NOT NULL,
  `mothers_name` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_students`
--

/*!40000 ALTER TABLE `core_students` DISABLE KEYS */;
INSERT INTO `core_students` (`id`,`name`,`fathers_name`,`mothers_name`,`dob`,`contact_no`,`address`,`photo`) VALUES 
 (1,'Mahedi Hassan','Abdur Rahman','Amena Akter','2024-01-19','','Rampura ','1.png');
/*!40000 ALTER TABLE `core_students` ENABLE KEYS */;


--
-- Definition of table `core_suppliers`
--

DROP TABLE IF EXISTS `core_suppliers`;
CREATE TABLE `core_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `photo` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_suppliers`
--

/*!40000 ALTER TABLE `core_suppliers` DISABLE KEYS */;
INSERT INTO `core_suppliers` (`id`,`name`,`mobile`,`email`,`photo`) VALUES 
 (1,'Md. Shahin','56879898','shahin@yahoo.com','1.jpeg'),
 (2,'kulsum','07154545','kulsum@gmail.com','2.png'),
 (4,'Jahid','3654533','jahid@gmail.com','4.jpg'),
 (9,'rahim','1123334','aa@gmail.com','9.png'),
 (10,'kuddush','678798','kuddush@gmail.com',NULL),
 (15,'ismail riyad4','04555545','karim@.com',NULL),
 (21,'Abdul','3534354','kader@gmail.com',NULL),
 (22,'Jahidul Islam','3423423','kader@gmail.com',NULL),
 (24,'Kader','34343','kader@gmail.com',NULL),
 (36,'Jahidul Islam','343433333333333','kader@gmail.com','6-png.png'),
 (37,'Naiyem Limited','343243243444','naiyem','images-png.png');
/*!40000 ALTER TABLE `core_suppliers` ENABLE KEYS */;


--
-- Definition of table `core_tailor_dress_parameters`
--

DROP TABLE IF EXISTS `core_tailor_dress_parameters`;
CREATE TABLE `core_tailor_dress_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dress_id` int(10) unsigned NOT NULL,
  `default_size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_dress_parameters`
--

/*!40000 ALTER TABLE `core_tailor_dress_parameters` DISABLE KEYS */;
INSERT INTO `core_tailor_dress_parameters` (`id`,`name`,`dress_id`,`default_size`) VALUES 
 (1,'Chest',1,NULL),
 (2,'Waist',1,NULL),
 (3,'Seat',1,NULL),
 (4,'Bicep',1,NULL),
 (5,'Shirt Length',1,NULL),
 (6,'Shoulder Width',1,NULL),
 (7,'Sleeve Length',1,NULL),
 (8,'Cuff Circumference',1,NULL),
 (9,'Collar Size',2,NULL);
/*!40000 ALTER TABLE `core_tailor_dress_parameters` ENABLE KEYS */;


--
-- Definition of table `core_tailor_dresses`
--

DROP TABLE IF EXISTS `core_tailor_dresses`;
CREATE TABLE `core_tailor_dresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_dresses`
--

/*!40000 ALTER TABLE `core_tailor_dresses` DISABLE KEYS */;
INSERT INTO `core_tailor_dresses` (`id`,`name`,`price`) VALUES 
 (1,'Shirt',1000),
 (2,'Kamiz',1200),
 (3,'Pants',1100),
 (4,'Borka',2500),
 (5,'Panjabi',1300);
/*!40000 ALTER TABLE `core_tailor_dresses` ENABLE KEYS */;


--
-- Definition of table `core_tailor_order_details`
--

DROP TABLE IF EXISTS `core_tailor_order_details`;
CREATE TABLE `core_tailor_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dress_id` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `qty` double NOT NULL,
  `discount` double NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_order_details`
--

/*!40000 ALTER TABLE `core_tailor_order_details` DISABLE KEYS */;
INSERT INTO `core_tailor_order_details` (`id`,`dress_id`,`price`,`qty`,`discount`,`order_id`) VALUES 
 (1,1,1000,1,0,1);
/*!40000 ALTER TABLE `core_tailor_order_details` ENABLE KEYS */;


--
-- Definition of table `core_tailor_order_measurements`
--

DROP TABLE IF EXISTS `core_tailor_order_measurements`;
CREATE TABLE `core_tailor_order_measurements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `measurement_id` int(10) unsigned NOT NULL,
  `size` varchar(10) NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  `dress_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_order_measurements`
--

/*!40000 ALTER TABLE `core_tailor_order_measurements` DISABLE KEYS */;
INSERT INTO `core_tailor_order_measurements` (`id`,`order_id`,`measurement_id`,`size`,`uom_id`,`dress_id`) VALUES 
 (1,1,1,'34',1,1),
 (2,1,2,'33',1,1),
 (3,1,5,'22',1,1);
/*!40000 ALTER TABLE `core_tailor_order_measurements` ENABLE KEYS */;


--
-- Definition of table `core_tailor_orders`
--

DROP TABLE IF EXISTS `core_tailor_orders`;
CREATE TABLE `core_tailor_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) NOT NULL,
  `paid_amount` double DEFAULT NULL,
  `order_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivery_datetime` datetime NOT NULL,
  `order_total` double DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_orders`
--

/*!40000 ALTER TABLE `core_tailor_orders` DISABLE KEYS */;
INSERT INTO `core_tailor_orders` (`id`,`customer_name`,`paid_amount`,`order_datetime`,`delivery_datetime`,`order_total`,`shipping_address`,`remark`,`mobile`,`discount`) VALUES 
 (1,'Jahidul Islam',500,'0000-00-00 00:00:00','2024-01-20 00:00:00',950,'Rampura','','3434343234',50);
/*!40000 ALTER TABLE `core_tailor_orders` ENABLE KEYS */;


--
-- Definition of table `core_tailor_uoms`
--

DROP TABLE IF EXISTS `core_tailor_uoms`;
CREATE TABLE `core_tailor_uoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abbr` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `inactive` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_tailor_uoms`
--

/*!40000 ALTER TABLE `core_tailor_uoms` DISABLE KEYS */;
INSERT INTO `core_tailor_uoms` (`id`,`abbr`,`name`,`inactive`) VALUES 
 (1,'inc','Inch',0),
 (2,'ft','Foot',0),
 (3,'yd','yard',0),
 (4,'piece','piece',0);
/*!40000 ALTER TABLE `core_tailor_uoms` ENABLE KEYS */;


--
-- Definition of table `core_thanas`
--

DROP TABLE IF EXISTS `core_thanas`;
CREATE TABLE `core_thanas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_thanas`
--

/*!40000 ALTER TABLE `core_thanas` DISABLE KEYS */;
INSERT INTO `core_thanas` (`id`,`name`,`district_id`) VALUES 
 (1,'Chatkhil',2),
 (2,'Ramgonj',2),
 (3,'Mijdi Sadar',2),
 (4,'Begomganj',2);
/*!40000 ALTER TABLE `core_thanas` ENABLE KEYS */;


--
-- Definition of table `core_transaction_types`
--

DROP TABLE IF EXISTS `core_transaction_types`;
CREATE TABLE `core_transaction_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_transaction_types`
--

/*!40000 ALTER TABLE `core_transaction_types` DISABLE KEYS */;
INSERT INTO `core_transaction_types` (`id`,`name`) VALUES 
 (1,'Sales Order'),
 (2,'Sales Delivery'),
 (3,'Sales Return'),
 (4,' Purchase Order'),
 (5,'Purchase Return'),
 (6,'Positive Stock Adjustment'),
 (7,'Negative Stock Adjustment');
/*!40000 ALTER TABLE `core_transaction_types` ENABLE KEYS */;


--
-- Definition of table `core_uoms`
--

DROP TABLE IF EXISTS `core_uoms`;
CREATE TABLE `core_uoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_uoms`
--

/*!40000 ALTER TABLE `core_uoms` DISABLE KEYS */;
INSERT INTO `core_uoms` (`id`,`name`) VALUES 
 (1,'Piece'),
 (2,'Kg'),
 (3,'Pack'),
 (4,'Litter'),
 (5,'Gram'),
 (6,'Ton'),
 (7,'Box3'),
 (8,'Blister'),
 (9,'Blister2'),
 (10,'NewOne'),
 (11,'NewOne'),
 (12,'NewOne'),
 (13,'NewOne'),
 (14,'NewOne'),
 (15,'NewOne');
/*!40000 ALTER TABLE `core_uoms` ENABLE KEYS */;


--
-- Definition of table `core_user_deposits`
--

DROP TABLE IF EXISTS `core_user_deposits`;
CREATE TABLE `core_user_deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_at` datetime DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_user_deposits`
--

/*!40000 ALTER TABLE `core_user_deposits` DISABLE KEYS */;
INSERT INTO `core_user_deposits` (`id`,`user_id`,`amount`,`created_at`,`transaction_at`,`note`,`created_by`) VALUES 
 (1,158,100,'2024-04-04 11:22:32','2024-04-04 00:00:00','NA',127),
 (2,186,10000,'2024-04-04 11:22:39','1970-01-01 06:00:00','',186),
 (3,160,-5e17,'2024-04-04 11:23:50','1970-01-01 06:00:00','',186),
 (4,194,1009,'2024-04-04 11:44:18','1970-01-01 06:00:00','NA',194),
 (5,197,10000,'2024-04-04 11:56:20','1970-01-01 06:00:00','',197),
 (6,199,1,'2024-04-04 11:56:29','1970-01-01 06:00:00','Na',199),
 (7,196,1000,'2024-04-04 11:56:49','1970-01-01 06:00:00','',196),
 (8,197,-1,'2024-04-04 11:57:17','1970-01-01 06:00:00','',197),
 (9,196,150,'2024-04-04 11:57:31','1970-01-01 06:00:00','',127),
 (10,203,5000,'2024-04-04 11:57:52','2024-04-04 00:00:00','Eid Gift',203),
 (11,204,0,'2024-04-04 11:58:09','2024-04-04 00:00:00','xero_xero',91),
 (12,200,9999,'2024-04-04 11:58:26','1970-01-01 06:00:00','',200),
 (13,199,4000,'2024-04-15 10:48:13','2024-04-15 00:00:00','',127),
 (14,201,3000,'2024-04-15 10:48:32','1970-01-01 06:00:00','',127),
 (15,191,500,'2024-12-19 18:42:46','1970-01-01 06:00:00','',207),
 (16,192,500,'2024-12-19 18:43:01','1970-01-01 06:00:00','',207),
 (17,191,100,'2024-12-19 18:43:52','1970-01-01 06:00:00','',207),
 (18,213,2000,'2024-12-19 18:44:52','1970-01-01 06:00:00','',207),
 (19,208,3555,'2024-12-19 18:45:04','1970-01-01 06:00:00','',207),
 (20,204,344,'2024-12-19 18:45:11','1970-01-01 06:00:00','',207),
 (21,206,456,'2024-12-19 18:45:16','1970-01-01 06:00:00','',207),
 (22,207,4555,'2024-12-19 18:45:21','1970-01-01 06:00:00','',207),
 (23,209,456,'2024-12-19 18:45:26','1970-01-01 06:00:00','',207),
 (24,210,455,'2024-12-19 18:45:34','1970-01-01 06:00:00','',207),
 (25,211,4322,'2024-12-19 18:45:39','1970-01-01 06:00:00','',207),
 (26,212,3556,'2024-12-19 18:45:49','1970-01-01 06:00:00','',207);
/*!40000 ALTER TABLE `core_user_deposits` ENABLE KEYS */;


--
-- Definition of table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
CREATE TABLE `core_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `photo` varchar(50) DEFAULT NULL,
  `verify_code` varchar(50) DEFAULT NULL,
  `inactive` tinyint(1) unsigned DEFAULT 0,
  `mobile` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `remember_token` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_users`
--

/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` (`id`,`name`,`role_id`,`password`,`email`,`full_name`,`created_at`,`photo`,`verify_code`,`inactive`,`mobile`,`updated_at`,`ip`,`email_verified_at`,`remember_token`) VALUES 
 (191,'Dola',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','samdola81@gmail.com','Samsunnahar','2025-01-18 18:36:54',NULL,NULL,0,'01832482305',NULL,'192.168.150.38',NULL,NULL),
 (192,'samira',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','samira@gmail.com','Samira Akter','2025-01-18 18:36:54',NULL,NULL,0,'01881432313',NULL,'192.168.150.59',NULL,NULL),
 (194,'dibbo',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','jkp.jakaria@gmail.com','jkp','2025-01-18 18:36:54',NULL,NULL,0,'01642527454',NULL,'192.168.150.47',NULL,NULL),
 (196,'akhi',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','akhi26713@gmail.cm','Aminur Rahman','2025-01-18 18:36:54',NULL,NULL,0,'01946357571',NULL,'192.168.150.49',NULL,NULL),
 (197,'tasmin',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','tanim@gmail.com','Rifat Ahammed Tanim','2025-01-18 18:36:54',NULL,NULL,0,'01900000000',NULL,'192.168.150.50',NULL,NULL),
 (199,'MD. HAFIJUL ISLAM',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','imdhafijul453@gmail.com','Md.Hafijul Islam','2025-01-18 18:36:54',NULL,NULL,0,'01755747048',NULL,'192.168.150.55',NULL,NULL),
 (200,'kamruzzaman',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','olba@gmail.com','Javed ','2025-01-18 18:36:54',NULL,NULL,0,'01869546555',NULL,'192.168.150.22',NULL,NULL),
 (201,'Tasmin Jahan',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','Tasminjahan875@gmail.com','Tasmin Jahan','2025-01-18 18:36:54',NULL,NULL,0,'01623578437',NULL,'192.168.150.50',NULL,NULL),
 (204,'sabbir',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','sabbir.001@outlook.com','Sabbir Ahmed','2025-01-18 18:36:54',NULL,NULL,0,'01752485143',NULL,'192.168.150.53',NULL,NULL),
 (206,'jahid3',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','jahid1@yahoo.com','Jahidul Islam','2025-05-15 17:07:42',NULL,NULL,0,NULL,'2024-07-04 05:52:52','::1',NULL,NULL),
 (207,'admin',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','towhid1@outlook.com','Towhidul Islam','2024-12-19 18:25:39',NULL,NULL,0,NULL,'2024-07-04 06:03:13','::1',NULL,NULL),
 (208,'didar',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','mddidar199911@gmail.com','Didar','2025-01-18 18:36:54',NULL,NULL,0,'01315451430',NULL,'192.168.150.52',NULL,NULL),
 (209,'alifa',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','alifa@yahoo.com','Alifa','2025-01-18 18:36:54',NULL,NULL,0,'01758917270',NULL,'192.168.150.57',NULL,NULL),
 (210,'hasan',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','hasanmd993@gmail.com','Md Hasan','2025-01-18 17:48:36',NULL,NULL,0,'01822304694',NULL,'192.168.150.7',NULL,NULL),
 (211,'Hamid',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','hamidyahoo22@gmail.com',' Abdul Hamid','2025-01-18 18:36:54',NULL,NULL,0,'01764577191',NULL,'192.168.150.47',NULL,NULL),
 (212,'anayet',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','anayetmd2018@gmail.com','Md. Anayet Hossain','2025-01-18 18:36:54',NULL,NULL,0,'01622737936',NULL,'192.168.150.47',NULL,NULL),
 (213,'azmir',1,'$2y$10$5wp0Z4ssl5zEdSbjLrdZ8exgNZR5HjP7XxzMp7qzsjShbWQujJfHG','azmir@yahoo.com','Azmir','2025-01-18 18:36:54',NULL,NULL,0,'3432432',NULL,'192.168.150.47',NULL,NULL),
 (215,'jahid',NULL,'$2y$12$pLMRWsC7HuR6rrCtn7ieWeNmuPulq1ioyxhsvP.Qk2PP7fZ/C3ouu','jahid@yahoo.com',NULL,'2025-05-15 17:19:14',NULL,NULL,0,NULL,'2025-05-15 11:07:47',NULL,NULL,'ZOpOEImPeImORQvKcXZFHac0R7ZkqevZ5yBa26tBQmNNtPzSjrupikjHF7xa');
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;


--
-- Definition of table `core_users0`
--

DROP TABLE IF EXISTS `core_users0`;
CREATE TABLE `core_users0` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_users0`
--

/*!40000 ALTER TABLE `core_users0` DISABLE KEYS */;
INSERT INTO `core_users0` (`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (1,'admin','jahid1@yahoo.com',NULL,'$2y$10$02LIGz04kyyFni4VVy619ehpI4JmYcDu9TGziPZwvSOxquyb.kFzC',NULL,'2024-06-12 04:46:24','2024-06-12 04:46:24');
/*!40000 ALTER TABLE `core_users0` ENABLE KEYS */;


--
-- Definition of table `core_vendors`
--

DROP TABLE IF EXISTS `core_vendors`;
CREATE TABLE `core_vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `photo` varchar(45) NOT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_vendors`
--

/*!40000 ALTER TABLE `core_vendors` DISABLE KEYS */;
INSERT INTO `core_vendors` (`id`,`name`,`mobile`,`photo`,`address`) VALUES 
 (1,'Abdur Rahman','23432432','1.jpeg','Testsa fsa fsdaf'),
 (2,'Jahidul Islam','23432432342','2.png','Test');
/*!40000 ALTER TABLE `core_vendors` ENABLE KEYS */;


--
-- Definition of table `core_warehouses`
--

DROP TABLE IF EXISTS `core_warehouses`;
CREATE TABLE `core_warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `core_warehouses`
--

/*!40000 ALTER TABLE `core_warehouses` DISABLE KEYS */;
INSERT INTO `core_warehouses` (`id`,`name`,`city`,`contact`) VALUES 
 (1,'Tajgon','Dhaka','4543534534'),
 (2,'Rangpur','Rangpur','324242342'),
 (3,'Badda','Rampura','3434334324');
/*!40000 ALTER TABLE `core_warehouses` ENABLE KEYS */;


--
-- Definition of table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `contact` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manufacturer`
--

/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` (`id`,`name`,`contact`) VALUES 
 (2,'ISL','2345454'),
 (3,'IDB','9390033'),
 (5,'APCL','23432432');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;


--
-- Definition of trigger `ad_manufacturer`
--

DROP TRIGGER /*!50030 IF EXISTS */ `ad_manufacturer`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `ad_manufacturer` AFTER DELETE ON `manufacturer` FOR EACH ROW begin
  delete from product where manufacturer_id=old.id;
end $$

DELIMITER ;

--
-- Definition of table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `manufacturer_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`,`name`,`price`,`manufacturer_id`) VALUES 
 (3,'HRM',100000,2),
 (4,'ERP',3000000,2),
 (5,'Car',900000,3),
 (7,'Headphone',2000,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE `receipts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipts`
--

/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
INSERT INTO `receipts` (`id`,`student_id`,`amount`,`created_at`) VALUES 
 (1,1,2000,'2025-02-03 11:28:00'),
 (2,3,3000,'2025-02-03 11:28:00'),
 (3,1,2000,'2025-02-03 11:28:00');
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`,`name`) VALUES 
 (1,'Admin'),
 (2,'Manager'),
 (3,'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`id`,`name`,`mobile`) VALUES 
 (1,'Jahid','3434333'),
 (2,'Rahim','4543434'),
 (3,'Karim','4343432');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`password`,`role_id`) VALUES 
 (1,'jahid2','111111',1),
 (2,'Test333','333333',2),
 (3,'rahim','111111',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `users1`
--

DROP TABLE IF EXISTS `users1`;
CREATE TABLE `users1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(50) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users1`
--

/*!40000 ALTER TABLE `users1` DISABLE KEYS */;
INSERT INTO `users1` (`id`,`name`,`created_at`,`password`,`inactive`) VALUES 
 (1,'jahid','2025-02-01 10:50:26','111111',0),
 (2,'rasel','2025-02-01 10:50:26','444444',0),
 (3,'karim','2025-02-01 10:50:26','222222',0);
/*!40000 ALTER TABLE `users1` ENABLE KEYS */;


--
-- Definition of view `v_product_list1`
--

DROP TABLE IF EXISTS `v_product_list1`;
DROP VIEW IF EXISTS `v_product_list1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_list1` AS select `p`.`id` AS `id`,`p`.`name` AS `product_name`,`m`.`name` AS `mfg_name` from (`product` `p` join `manufacturer` `m`) where `m`.`id` = `p`.`manufacturer_id` and `p`.`price` > 5000;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
