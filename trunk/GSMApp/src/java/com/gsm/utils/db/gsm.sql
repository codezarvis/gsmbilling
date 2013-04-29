-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-29 13:21:00
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for gsm_db
DROP DATABASE IF EXISTS `gsm_db`;
CREATE DATABASE IF NOT EXISTS `gsm_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gsm_db`;


-- Dumping structure for table gsm_db.appuser
DROP TABLE IF EXISTS `appuser`;
CREATE TABLE IF NOT EXISTS `appuser` (
  `id` int(10) NOT NULL auto_increment,
  `guid` varchar(256) default NULL,
  `username` varchar(256) default NULL,
  `password` varchar(256) default NULL,
  `question` varchar(256) default NULL,
  `answer` varchar(256) default NULL,
  `number` varchar(256) default NULL,
  `email` varchar(256) default NULL,
  `userrole` varchar(256) default NULL,
  `createdby` varchar(256) default NULL,
  `createdon` date default NULL,
  `modifiedby` varchar(256) default NULL,
  `modifiedon` date default NULL,
  `active` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- Dumping data for table gsm_db.appuser: ~26 rows (approximately)
/*!40000 ALTER TABLE `appuser` DISABLE KEYS */;
INSERT INTO `appuser` (`id`, `guid`, `username`, `password`, `question`, `answer`, `number`, `email`, `userrole`, `createdby`, `createdon`, `modifiedby`, `modifiedon`, `active`) VALUES
	(4, '7c0e8865-3dfa-42df-ac2b-7861fb62d6e5', 'admin', 'admin', 'What is the name of ur first pet?', 'jenny', '9177832288', 'sushmaindukuri@hotmail.com', 'admin', '1', '2013-03-28', '1', '2013-03-28', 1),
	(22, '004af930-e8c8-4e2f-80a5-cae6b7714684', 'rahul', '10011', 'What is ur native place?', 'wb', NULL, NULL, 'operator', '1', '2013-04-12', '1', '2013-04-12', 1),
	(23, 'd014bee2-fae7-4ed7-8996-e5d357530a82', ' rohan', ' 10022', 'What is the name of ur first pet?', 'duggu', NULL, NULL, 'operator', '1', '2013-04-12', '1', '2013-04-12', 1),
	(24, '8c83f973-e161-41c3-8e39-8ddc26519fcc', 'sushma', '12211', NULL, NULL, '9177832288', 'sushmaindukuri@hotmail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(25, 'dda83136-da7f-41ef-a7a9-e440d13d56a7', 'rishi', '12212', NULL, NULL, '998988999', 'rishi11@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(27, 'b7c74f2d-10e6-47fe-a710-15d66f103815', 'siddharth', ' 12214', NULL, NULL, ' 99877661', ' sid@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(28, '869afc77-2dc1-4401-b0be-c7267d73e824', 'ram', '12215', NULL, NULL, '7788992210', 'ram@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(29, 'bd20124f-bbfe-43c4-b17c-234f70f80de1', 'sudha', '13311', NULL, NULL, '900889977', 'sudhavv@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(30, '1af328d2-9cd5-48a9-a3e0-4cd02a153578', 'asish', '13312', NULL, NULL, '7900088777', 'asish11@mm.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(31, 'b66cf3f6-1d4b-4100-b19c-9565267a3ec8', 'sirisha', '13313', NULL, NULL, '988997777 ', 'siri@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(32, '730e96b7-5116-4529-a003-ef15fc9e7390', 'shyam', '13314', NULL, NULL, '788996655', 'shyam112@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(33, 'd15e265f-720b-44d4-bcb5-f080de7cd217', 'shwetha', '13315', NULL, NULL, '9887700991', 'shwethakn@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(34, '44d036de-bed4-4a7e-b5c1-e7b6999831b9', 'sri', '10011', NULL, NULL, NULL, NULL, 'operator', '1', '2013-04-12', '1', '2013-04-12', 1),
	(35, '15c855ba-986c-45b6-9bc6-23b1688a2131', 'sriram', '18009', NULL, NULL, '890009999', 'sriram@mail.com', 'client', '1', '2013-04-12', '1', '2013-04-12', 1),
	(36, 'c501d2bb-37a1-4d31-a0d6-0f9d4cf36d13', 'ajay', '12001', NULL, NULL, NULL, NULL, 'operator', '1', '2013-04-12', '1', '2013-04-12', 1),
	(37, '4439a0fe-3b05-43e7-ab69-82b14566b17f', 'venny', '12009', NULL, NULL, '900112244', 'aaa', 'client', '1', '2013-04-13', '1', '2013-04-13', 1),
	(38, '93dfdeb6-9d39-4aa4-92be-1f43c2a92f22', 'anu', '56900', NULL, NULL, '900887771', 'sushmaindukuri@hotmail.com', 'client', '1', '2013-04-15', '1', '2013-04-15', 1),
	(39, 'e470a12e-8d4f-4a9d-b86e-829158697600', 'viaan', '78800', NULL, NULL, '9001188811', 'sushmaindukuri@hotmail.com', 'client', '1', '2013-04-16', '1', '2013-04-16', 1),
	(40, 'b0f7d336-d919-475d-b363-4cbd1061d397', 'aaa', '87700', NULL, NULL, '099111111', 'sushmaindukuri@hotmail.com', 'client', '1', '2013-04-16', '1', '2013-04-16', 1),
	(41, 'ccff4b53-5460-4661-940b-99ba170362f8', 'asish', '50099', NULL, NULL, NULL, NULL, 'operator', '1', '2013-04-16', '1', '2013-04-16', 1),
	(42, 'babff723-3623-43cd-aa2a-b4fc83bd46d8', 'sonu', '899001', NULL, NULL, '9001181811', 'sowjanyadatla17@gmail.com', 'client', '1', '2013-04-23', '1', '2013-04-23', 1),
	(43, '46053d65-10e8-4891-9119-dd9925fc80d9', 'dinesh', '90011', NULL, NULL, NULL, NULL, 'operator', '1', '2013-04-21', '1', '2013-04-21', 1),
	(44, '39a4cf8d-d1b6-4253-bc79-784f0fce989e', 'aaa', '45211', NULL, NULL, '9800118811', 'sushmaindukuri@hotmail.com', 'client', '1', '2013-04-21', '1', '2013-04-21', 1),
	(45, 'd3669d52-9de5-4b12-b1cc-ea3fa6912265', 'bbb', '01288', NULL, NULL, '901122299', 'bbbbbb.cm', 'client', '1', '2013-03-03', '1', '2013-03-03', 1),
	(46, '937947b7-e8c0-4935-9035-98b46692d8b3', 'ccc', '67677', NULL, NULL, '900191111', 'hsgjgshsgjgsj', 'client', '1', '2013-04-24', '1', '2013-04-24', 1),
	(47, '0f575c21-9078-41b1-b6dd-71fce2cbc4a7', 'pratima', '01122', NULL, NULL, '8297278007', 'hjgjgghgd', 'client', '1', '2013-05-25', '1', '2013-05-25', 1);
/*!40000 ALTER TABLE `appuser` ENABLE KEYS */;


-- Dumping structure for table gsm_db.client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) NOT NULL auto_increment,
  `guid` varchar(50) default NULL,
  `servicenum` varchar(50) default NULL,
  `firstname` varchar(256) default NULL,
  `lastname` varchar(256) default NULL,
  `address` varchar(256) default NULL,
  `area` varchar(256) default NULL,
  `wardnum` varchar(256) default NULL,
  `mobile` varchar(256) default NULL,
  `email` varchar(256) default NULL,
  `meternum` varchar(256) default NULL,
  `createdby` int(11) default NULL,
  `createdon` date default NULL,
  `modifiedby` int(11) default NULL,
  `modifiedon` date default NULL,
  `active` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table gsm_db.client: ~19 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id`, `guid`, `servicenum`, `firstname`, `lastname`, `address`, `area`, `wardnum`, `mobile`, `email`, `meternum`, `createdby`, `createdon`, `modifiedby`, `modifiedon`, `active`) VALUES
	(16, '14bb63cb-f676-41f5-b006-616f178c950a', '12211', 'sushma', 'indukuri', 'R.R.Towers,\r\nS.Dhara', 'N.E', '29', '9177832288', 'sushmaindukuri@hotmail.com', '2455', 1, '2013-04-12', 1, '2013-04-12', 1),
	(17, '829374a4-92a7-4f75-8ff3-7c2814e1eaa2', '12212', 'rishi', 'sen', 'S.S.Towers', 'N.E', '29', '998988999', 'rishi11@mail.com', '2366', 1, '2013-04-12', 1, '2013-04-12', 1),
	(19, '8b45fc79-6bd9-42c7-ab64-a1e361641dc9', ' 12214', 'siddharth', 'roy', 'Aven Castle', 'N.E', '29', ' 99877661', ' sid@mail.com', '2144', 1, '2013-04-12', 1, '2013-04-12', 1),
	(20, '6189cdbf-08f7-4b0b-b356-89858f6097db', '12215', 'ram', 'kk', 'MVR Apts', 'N.E', '29', '7788992210', 'ram@mail.com', '2188', 1, '2013-04-12', 1, '2013-04-12', 1),
	(21, '552260a0-2bc2-497b-95a5-de92d91bdc3f', '13311', 'sudha', 'vv', 'Ozone heights', 'dabagardens', '44', '900889977', 'sudhavv@mail.com', '2690', 1, '2013-04-12', 1, '2013-04-12', 1),
	(22, 'ec7c8fe4-ebab-4d7f-9887-eecfdd0990fd', '13312', 'asish', 'sen', '50-11-2,\r\nss ngr', 'dabagardens', '44', '7900088777', 'asish11@mm.com', '2998', 1, '2013-04-12', 1, '2013-04-12', 1),
	(23, 'a4519660-0ed3-4f33-adc2-a1075b57c506', '13313', 'sirisha', 'sri', 'SVS Hts', 'dabagardens', '44', '988997777 ', 'siri@mail.com', '2694', 1, '2013-04-12', 1, '2013-04-12', 1),
	(24, '0c6648b4-536e-48fa-a81c-b344c177f26c', '13314', 'shyam', 'Va', 'EVC Apts', 'dabagardens', '44', '788996655', 'shyam112@mail.com', '3887', 1, '2013-04-12', 1, '2013-04-12', 1),
	(25, 'bdc1c560-12b7-40cc-bed9-bab61565f9f5', '13315', 'shwetha', 'kn', 'door num:9-11-211/6', 'dabagardens', '44', '9887700991', 'shwethakn@mail.com', '2340', 1, '2013-04-12', 1, '2013-04-12', 1),
	(26, '8e0aae43-88c8-4044-8f68-e583f00aee07', '18009', 'sriram', 'ss', 'ozone Apts', 'mvp', '66', '890009999', 'sriram@mail.com', '1220', 1, '2013-04-12', 1, '2013-04-12', 1),
	(27, '58e96289-bb99-4251-90ec-8d107cc9eedf', '12209', 'venny', 'kv', 'GHJ Hts', 'mvp', '66', '900112244', 'aaa', '9008', 1, '2013-04-13', 1, '2013-04-13', 1),
	(28, 'f687dee4-9f7e-4515-aa54-047d048dc781', '56900', 'anu', 'patel', 'SSN Apts', 'mdhrwada', '75', '900887771', 'sushmaindukuri@hotmail.com', '19800', 1, '2013-04-15', 1, '2013-04-15', 1),
	(29, '58731b01-9046-45ee-9a5f-5f4205d26f68', '78800', 'viaan', 'ss', 'assssjjkk', 'mdhrwada', '75', '9001188811', 'sushmaindukuri@hotmail.com', '21101', 1, '2013-04-16', 1, '2013-04-16', 1),
	(30, '7a519daf-e255-4bad-bbf0-87d8025e0b4d', '87700', 'aaa', 'aaa', 'wdcwe', 'mdhrwada', '75', '099111111', 'sushmaindukuri@hotmail.com', '12312', 1, '2013-04-16', 1, '2013-04-16', 1),
	(31, '6562c38e-d266-4b3d-9d91-b3329898fff9', '899001', 'sonu', 'datla', 'sramiknagar', 'gjwk', '88', '9001181811', 'sowjanyadatla17@gmail.com', '09987', 1, '2013-04-23', 1, '2013-04-23', 1),
	(32, '513b3349-ff41-4c49-899f-b33d069b10d3', '45211', 'aaa', 'aaa', 'sngr', 'srinagar', '112', '9800118811', 'sushmaindukuri@hotmail.com', '04552', 1, '2013-04-21', 1, '2013-04-21', 1),
	(33, '4490e69d-c7f2-437e-b61d-5d252776ce41', '01288', 'bbb', 'bbb', 'snagr', 'srinagar', '112', '901122299', 'bbbbbb.cm', '58899', 1, '2013-03-03', 1, '2013-03-03', 1),
	(34, 'deddfb28-55ad-4dd4-9e51-9980cc55ab23', '67677', 'ccc', 'ccc', 'snagar', 'srinagar', '112', '900191111', 'hsgjgshsgjgsj', '177881', 1, '2013-04-24', 1, '2013-04-24', 1),
	(35, '9ff4744c-c8c9-4405-873e-dd506e0e9cef', '01122', 'pratima', 'soni', 'srnagar', 'srinagar', '112', '8297278007', 'hjgjgghgd', '90011', 1, '2013-05-25', 1, '2013-05-25', 1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


-- Dumping structure for table gsm_db.meteroperator
DROP TABLE IF EXISTS `meteroperator`;
CREATE TABLE IF NOT EXISTS `meteroperator` (
  `id` varchar(256) NOT NULL default '',
  `guid` varchar(256) default NULL,
  `operatorname` varchar(256) default NULL,
  `area` varchar(256) default NULL,
  `wardnum` varchar(256) default NULL,
  `city` varchar(256) default NULL,
  `createdon` date default NULL,
  `createdby` int(11) default NULL,
  `modifiedon` date default NULL,
  `modifiedby` int(11) default NULL,
  `active` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table gsm_db.meteroperator: ~5 rows (approximately)
/*!40000 ALTER TABLE `meteroperator` DISABLE KEYS */;
INSERT INTO `meteroperator` (`id`, `guid`, `operatorname`, `area`, `wardnum`, `city`, `createdon`, `createdby`, `modifiedon`, `modifiedby`, `active`) VALUES
	(' 10022', '49f4b893-d8d0-4763-9633-55cf5bbc187c', ' rohan', 'dabagardens', '44', 'vsp', '2013-04-12', 1, '2013-04-12', 1, 1),
	('10011', 'f5a30ad6-d6bf-46c7-a532-ca767b8549ff', 'rahul', 'mvp', '66', 'vsp', '2013-04-12', 1, '2013-04-12', 1, 1),
	('12001', '19768a90-6134-4ba3-8781-b3df7d4cde09', 'ajay', 'mdhrwada', '75', 'vsp', '2013-04-12', 1, '2013-04-12', 1, 1),
	('50099', '228fb1c7-13d9-4976-a5f7-4e455174437f', 'asish', 'gjwk', '88', 'vsp', '2013-04-16', 1, '2013-04-16', 1, 1),
	('90011', '9c1cd409-f845-43fb-afd8-a281ae5c6228', 'dinesh', 'srinagar', '112', 'vsp', '2013-04-21', 1, '2013-04-21', 1, 1);
/*!40000 ALTER TABLE `meteroperator` ENABLE KEYS */;


-- Dumping structure for table gsm_db.payments
DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) NOT NULL auto_increment,
  `guid` varchar(256) default NULL,
  `meterId` varchar(256) default NULL,
  `clientName` varchar(256) default NULL,
  `bank` varchar(256) default NULL,
  `cardNum` varchar(256) default NULL,
  `billDate` date default NULL,
  `billAmount` double default NULL,
  `amntPaid` double default NULL,
  `balance` double default NULL,
  `createdon` date default NULL,
  `createdby` int(11) default NULL,
  `modifiedon` date default NULL,
  `modifiedby` int(11) default NULL,
  `active` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table gsm_db.payments: ~7 rows (approximately)
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `guid`, `meterId`, `clientName`, `bank`, `cardNum`, `billDate`, `billAmount`, `amntPaid`, `balance`, `createdon`, `createdby`, `modifiedon`, `modifiedby`, `active`) VALUES
	(2, 'db45550e-58ee-4491-9498-c2e4ba2890da', '2998', 'asish', 'SBI', '199008899881', '2013-03-13', 93, 102, -9, '2013-04-13', 1, '2013-04-13', 1, 1),
	(3, 'cc29df5a-2f28-48ed-838d-aa19af54fd15', '9008', 'venny', 'SBI', '12290088722', '2013-03-13', 192, 180, 12, '2013-04-13', 1, '2013-04-13', 1, 1),
	(4, '4ce554b2-e86a-4455-a77f-03421bf28260', '9008', 'venny', 'SBI', '1009911222', '2013-04-13', 164, 155, 9, '2013-04-13', 1, '2013-04-13', 1, 1),
	(5, 'b0e7232a-97df-48f9-a098-f9bb4e953712', '2188', 'ram', 'SBI', '1229900111', '2013-03-13', 82.5, 82, 0.5, '2013-04-13', 1, '2013-04-13', 1, 1),
	(6, 'd3561610-05a8-44cb-bd2a-b5abc43e2d35', '2188', 'ram', 'SBI', '12233009111', '2013-04-12', 218, 218, 0, '2013-04-13', 1, '2013-04-13', 1, 1),
	(7, '30a86f4c-49bf-4423-9f56-8a909b5b18a6', '2188', 'ram', 'SBI', '122099888', '2013-02-12', 82.5, 122, -39.5, '2013-04-13', 1, '2013-04-13', 1, 1),
	(8, '8546c117-d2f5-451c-bccd-78ce3f64d822', '19800', 'anu', 'SBI', '1900112211', '2013-04-15', 196, 226.75, -30.75, '2013-04-16', 1, '2013-04-16', 1, 1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;


-- Dumping structure for table gsm_db.units
DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) NOT NULL auto_increment,
  `guid` varchar(256) default NULL,
  `meterNumber` varchar(256) default NULL,
  `readingdate` date default NULL,
  `previousReading` int(11) default NULL,
  `currentReading` int(11) unsigned default NULL,
  `totalUnits` int(11) default NULL,
  `totalPrice` double default NULL,
  `status` varchar(50) default NULL,
  `createdon` date default NULL,
  `createdby` int(11) default NULL,
  `modifiedon` date default NULL,
  `modifiedby` int(11) default NULL,
  `active` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table gsm_db.units: ~28 rows (approximately)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `guid`, `meterNumber`, `readingdate`, `previousReading`, `currentReading`, `totalUnits`, `totalPrice`, `status`, `createdon`, `createdby`, `modifiedon`, `modifiedby`, `active`) VALUES
	(21, '2fef7165-d154-4d1e-bc90-4a92cfb0cc3d', '2188', '2013-02-12', 0, 55, 55, 82.5, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(22, 'b891f907-ee77-4c51-9ba1-372315130a1b', '2188', '2013-03-10', 55, 110, 55, 82.5, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(23, '3b03755f-419e-4181-9f48-c470583a40d0', '2188', '2013-04-12', 110, 219, 109, 218, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(24, '2ff849ee-ebfb-4e3a-8824-5fc4dcd76075', '2998', '2013-02-12', 0, 96, 96, 192, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(25, '46b3b2fb-918e-41f4-83f8-c51642d66b81', '2998', '2013-03-10', 96, 158, 62, 93, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(26, 'a0f38a46-4e16-4886-9c5c-4917019d9b52', '2998', '2013-04-12', 158, 211, 53, 79.5, 'pending', '2013-04-12', 1, '2013-04-12', 1, 1),
	(27, '12835a62-7d72-4d72-b9d9-ab5b5fb99fa0', '2340', '2013-02-12', 0, 68, 68, 102, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(28, '817a79b2-4beb-4294-b63b-e69c5a467c91', '2340', '2013-03-10', 68, 144, 76, 152, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(29, '5e32975f-ca40-4f3b-8970-3082ddd9f2a1', '2340', '2013-04-12', 144, 211, 67, 100.5, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(30, '4ef27de5-cc29-4a70-8144-71eec059172f', '1220', '2013-04-12', 0, 86, 86, 172, 'Paid', '2013-04-12', 1, '2013-04-12', 1, 1),
	(31, 'fb5614c3-f46d-414f-918b-a7bd6f7a5fa6', '9008', '2013-03-13', 0, 96, 96, 192, 'Paid', '2013-04-13', 1, '2013-04-13', 1, 1),
	(32, 'e023f3a3-ede1-4b43-bb37-a4d3bcd5a263', '9008', '2013-04-13', 96, 178, 82, 164, 'Paid', '2013-04-13', 1, '2013-04-13', 1, 1),
	(33, '1d18ca1b-c798-425f-8f50-a31538f2c953', '19800', '2013-04-15', 0, 98, 98, 196, 'Paid', '2013-04-15', 1, '2013-04-15', 1, 1),
	(34, '7981be8b-0811-4007-b969-d41f078c5658', '09987', '2013-04-20', 0, 67, 67, 100.5, 'pending', '2013-04-20', 1, '2013-04-20', 1, 1),
	(35, '6707b776-e8c7-4294-b15e-032a6e3f2cf5', '04552', '2013-03-03', 0, 78, 78, 156, 'pending', '2013-03-03', 1, '2013-03-03', 1, 1),
	(36, '3b9996ac-9c13-40de-86fe-17a7ab35a868', '04552', '2013-03-03', 78, 78, 0, 0, 'pending', '2013-03-03', 1, '2013-03-03', 1, 1),
	(37, '2b117636-7046-4bb9-8a42-75a07a7df075', '58899', '2013-03-03', 0, 55, 55, 82.5, 'pending', '2013-03-03', 1, '2013-03-03', 1, 1),
	(38, 'b3748b83-e5f3-4c59-8f00-f02bf2ff1540', '58899', '2013-04-24', 55, 188, 133, 266, 'pending', '2013-04-24', 1, '2013-04-24', 1, 1),
	(39, 'a48c3e6d-ea4b-467b-a19b-fb336bb988ae', '58899', '2013-04-24', 188, 188, 0, 0, 'pending', '2013-04-24', 1, '2013-04-24', 1, 1),
	(40, 'e01c41ea-ca7b-4181-9f0f-7a210747b36f', '177881', '2013-04-24', 0, 67, 67, 100.5, 'pending', '2013-04-24', 1, '2013-04-24', 1, 1),
	(41, '2ed75412-87d8-401a-b734-12c23273b6f9', '177881', '2013-04-24', 67, 67, 0, 0, 'pending', '2013-04-24', 1, '2013-04-24', 1, 1),
	(42, '4bb1524b-7724-4d34-a8fe-46c72f103832', '90011', '2013-05-25', 0, 87, 87, 174, 'pending', '2013-05-25', 1, '2013-05-25', 1, 1),
	(45, '4bc82d13-3bf0-460e-b6d6-d772ebeb3b2a', '90011', '2013-06-01', 194, 194, 0, 0, 'pending', '2013-06-01', 1, '2013-06-01', 1, 1),
	(48, '7747d0b2-79df-468b-adc2-8d965c056736', '90011', '2013-07-01', 277, 277, 0, 0, 'pending', '2013-07-01', 1, '2013-07-01', 1, 1);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
