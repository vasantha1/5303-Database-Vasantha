-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2015 at 05:30 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vgundeti`
--

-- --------------------------------------------------------

--
-- Table structure for table `Applied_for`
--

CREATE TABLE IF NOT EXISTS `Applied_for` (
  `Date` date NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `company_id` varchar(11) NOT NULL,
  `Job_Category` varchar(30) NOT NULL,
  `Paid` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`User_ID`,`company_id`,`Job_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Applied_for`
--

INSERT INTO `Applied_for` (`Date`, `User_ID`, `company_id`, `Job_Category`, `Paid`) VALUES
('2015-12-04', 'M02', '301', 'Database administrator', 'Yes'),
('2015-04-08', 'M02', '303', 'Database administrator', 'Yes'),
('2015-12-01', 'M04', '301', 'Tester', 'Yes'),
('2015-11-19', 'M04', '303', 'Tester', 'Yes'),
('2015-11-28', 'M05', '301', 'Tester', 'Yes'),
('2015-10-09', 'M05', '304', 'Tester', 'Yes'),
('2015-12-03', 'M06', '301', 'Developer', 'Yes'),
('2015-11-06', 'M06', '304', 'Developer', 'Yes'),
('2015-12-04', 'M07', '301', 'Database administrator', 'Yes'),
('2015-12-04', 'M09', '301', 'Developer', 'Yes'),
('2015-06-24', 'M09', '302', 'Developer', 'Yes'),
('2015-11-21', 'M09', '304', 'Developer', 'Yes'),
('2015-11-06', 'M10', '302', 'Tester', 'Yes'),
('2015-07-10', 'M11', '305', 'Dentist', 'Yes'),
('2015-12-01', 'M12', '306', 'Cashier', 'Yes'),
('2015-10-10', 'M14', '307', 'Sales manager', 'Yes'),
('2015-11-10', 'M16', '308', 'Manager', 'Yes'),
('2015-07-16', 'M17', '307', 'Sales manager', 'Yes'),
('2015-12-02', 'M18', '305', 'Dentist', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `Charge_Company`
--

CREATE TABLE IF NOT EXISTS `Charge_Company` (
  `Company_Id` varchar(32) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Charge_Company`
--

INSERT INTO `Charge_Company` (`Company_Id`, `Amount`) VALUES
('301', 5),
('302', 5),
('303', 5),
('304', 5),
('305', 5),
('306', 5),
('307', 5),
('308', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Charge_Users`
--

CREATE TABLE IF NOT EXISTS `Charge_Users` (
  `User_ID` varchar(10) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Charge_Users`
--

INSERT INTO `Charge_Users` (`User_ID`, `Amount`) VALUES
('M01', 0),
('M02', 10),
('M03', 0),
('M04', 10),
('M05', 10),
('M06', 10),
('M07', 10),
('M08', 0),
('M09', 10),
('M10', 10),
('M11', 10),
('M12', 10),
('M13', 0),
('M14', 10),
('M15', 0),
('M16', 10),
('M17', 10),
('M18', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE IF NOT EXISTS `Company` (
  `Company_Id` varchar(20) NOT NULL,
  `Company_Name` varchar(30) NOT NULL,
  `Street_Address` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(10) NOT NULL,
  `Zip_Code` int(20) NOT NULL,
  `Telephone` bigint(20) NOT NULL,
  `Company_Description` varchar(100) NOT NULL,
  `Interviews_Given` int(10) NOT NULL,
  `Resumes_Downloaded` int(10) NOT NULL,
  `Date of Last Download` date NOT NULL,
  `Outstanding Balance` double NOT NULL,
  PRIMARY KEY (`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`Company_Id`, `Company_Name`, `Street_Address`, `City`, `State`, `Zip_Code`, `Telephone`, `Company_Description`, `Interviews_Given`, `Resumes_Downloaded`, `Date of Last Download`, `Outstanding Balance`) VALUES
('301', 'Infosys', '3200 windy hill road', 'atlanta', 'georgia', 30339, 7707353456, 'building and implementing great ideas', 3, 3, '2015-11-30', 4532),
('302', 'TCS', '1240 E.Diehl Road,Suite 560', 'Naperville', 'chicago', 60563, 6305059100, 'leading provider of highly flexible financial management software', 4, 5, '2015-11-29', 5643),
('303', 'wipro', '2 Tower Center Blvd #2200', 'East Bruns', 'New Jersy', 8816, 7325091500, 'delivers the best expertise effectively and efficiently', 6, 9, '2015-11-30', 5123),
('304', 'Tech Mahindra', '2140 Lake Park Blvd # 300', 'Richardson', 'texas', 75080, 9729912900, 'offering innovative and customer centric IT services', 7, 7, '2015-11-26', 5783),
('305', 'United Regional Hospital', '2100 Brook Ave', 'wichita falls', 'Texas', 76308, 6324561234, 'providing services', 5, 8, '2015-11-28', 4678),
('306', 'Bank of america', '810 Lamar Street', 'Wichita falls', 'Texas', 76308, 9407234581, 'Banking services', 5, 8, '2015-11-17', 5432),
('307', 'Funny', '4700 taft blvd', 'wichita falls', 'texas', 76308, 9403312445, 'Businees management', 3, 4, '2015-11-17', 4123),
('308', 'Hill top', '2100 mcarthar blvd', 'dallas', 'Texas', 76408, 9165474444, 'food services', 2, 5, '2015-11-17', 6732);

-- --------------------------------------------------------

--
-- Table structure for table `Employee_stuff`
--

CREATE TABLE IF NOT EXISTS `Employee_stuff` (
  `User_ID` varchar(10) NOT NULL,
  `Start_Date` date NOT NULL,
  `Hourly_Rate` float NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee_stuff`
--

INSERT INTO `Employee_stuff` (`User_ID`, `Start_Date`, `Hourly_Rate`) VALUES
('M03', '2011-12-21', 90),
('M05', '2013-10-08', 60),
('M08', '2013-12-15', 80),
('M13', '2014-06-03', 50),
('M15', '2014-07-14', 63);

-- --------------------------------------------------------

--
-- Table structure for table `Interviews`
--

CREATE TABLE IF NOT EXISTS `Interviews` (
  `Job_Category_ID` varchar(20) NOT NULL,
  `Company_Id` varchar(20) NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `customer` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Completed` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`Job_Category_ID`,`Company_Id`,`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Interviews`
--

INSERT INTO `Interviews` (`Job_Category_ID`, `Company_Id`, `User_ID`, `customer`, `Date`, `Completed`) VALUES
('401', '301', 'M02', 'helderman sumaya', '2015-12-04', 'No'),
('401', '301', 'M07', 'develaar paolo', '2015-12-09', 'No'),
('401', '303', 'M02', 'develaar paolo', '2015-05-05', 'Yes'),
('402', '305', 'M11', 'haase milouda', '2014-11-24', 'Yes'),
('402', '305', 'M18', 'vanvenrooij florijn', '2015-12-06', 'No'),
('403', '308', 'M16', 'vreugdenhil donato', '2015-12-10', 'No'),
('404', '306', 'M12', 'helderman sumaya', '2015-12-03', 'Yes'),
('405', '307', 'M14', 'vanvenrooij florijn', '2015-12-16', 'No'),
('405', '307', 'M17', 'vanvenrooij florijn', '2015-12-02', 'Yes'),
('406', '301', 'M04', 'haase milouda', '2015-12-08', 'No'),
('406', '301', 'M05', 'develaar paolo', '2015-12-01', 'Yes'),
('406', '302', 'M10', 'vreugdenhil donato', '2015-12-08', 'No'),
('406', '303', 'M04', 'helderman sumaya', '2015-12-08', 'No'),
('406', '304', 'M05', 'develaar paolo', '2015-12-10', 'No'),
('407', '301', 'M06', 'develaar paolo', '2015-12-21', 'No'),
('407', '301', 'M09', 'develaar paolo', '2014-12-17', 'No'),
('407', '302', 'M09', 'helderman sumaya', '2015-08-15', 'Yes'),
('407', '304', 'M06', 'vreugdenhil donato', '2014-12-01', 'Yes'),
('407', '304', 'M09', 'develaar paolo', '2015-12-01', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `Job_Categories`
--

CREATE TABLE IF NOT EXISTS `Job_Categories` (
  `Job_Category_ID` varchar(20) NOT NULL,
  `Job_Category_Name` varchar(40) NOT NULL,
  `Parent_Category` varchar(40) NOT NULL,
  `Sub_Categories` varchar(40) NOT NULL,
  PRIMARY KEY (`Job_Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Job_Categories`
--

INSERT INTO `Job_Categories` (`Job_Category_ID`, `Job_Category_Name`, `Parent_Category`, `Sub_Categories`) VALUES
('401', 'Computers', 'IT', 'Database administrator'),
('402', 'Health Science', 'Medical', 'Dentist'),
('403', 'Food Service', 'Restaurant', 'Manager'),
('404', 'Finance', 'Banking', 'Cashier'),
('405', 'Business', 'Marketing', 'Sales manager'),
('406', 'Computers', 'IT', 'Tester'),
('407', 'Computers', 'IT', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `Posted_Jobs`
--

CREATE TABLE IF NOT EXISTS `Posted_Jobs` (
  `Job_Category_Id` varchar(20) NOT NULL,
  `Date_Posted` date NOT NULL,
  `Document` varchar(30) NOT NULL,
  `Job_Category` varchar(30) NOT NULL,
  `Company_Id` varchar(20) NOT NULL,
  `Job_Description` text,
  PRIMARY KEY (`Job_Category_Id`,`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Posted_Jobs`
--

INSERT INTO `Posted_Jobs` (`Job_Category_Id`, `Date_Posted`, `Document`, `Job_Category`, `Company_Id`, `Job_Description`) VALUES
('401', '2015-12-04', 'xxxx', 'Database administrator', '301', NULL),
('401', '2015-01-24', 'jkk', 'Database administrator', '303', NULL),
('402', '2015-05-20', 'hjk', 'Dentist', '305', NULL),
('403', '2015-08-26', 'gbh', 'Manager', '308', NULL),
('404', '2015-12-04', 'hhh', 'Cashier', '306', NULL),
('405', '2015-06-18', 'hjn ', 'Sales manager', '307', NULL),
('406', '2015-11-03', 'hjn ', 'Tester', '301', NULL),
('406', '2015-10-09', 'jmm', 'Tester', '302', NULL),
('406', '2015-11-14', 'hjj', 'Tester', '303', NULL),
('406', '2015-09-15', 'hjk', 'Tester', '304', NULL),
('407', '2015-12-04', 'rgb', 'Developer', '301', NULL),
('407', '2015-12-04', 'hijk', 'Developer', '302', NULL),
('407', '2015-10-14', 'hjjj', 'Developer', '304', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE IF NOT EXISTS `Roles` (
  `User_ID` varchar(10) NOT NULL,
  `Role` varchar(20) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`User_ID`, `Role`) VALUES
('M01', 'Employee'),
('M02', 'Jobseeker'),
('M03', 'Employee'),
('M04', 'Jobseeker'),
('M05', 'Jobseeker'),
('M06', 'Jobseeker'),
('M07', 'Jobseeker'),
('M08', 'Employee'),
('M09', 'Jobseeker'),
('M10', 'Jobseeker'),
('M11', 'Jobseeker'),
('M12', 'Jobseeker'),
('M13', 'Employee'),
('M14', 'Jobseeker'),
('M15', 'Employee'),
('M16', 'Jobseeker'),
('M17', 'Jobseeker'),
('M18', 'Jobseeker');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `User_ID` varchar(32) NOT NULL,
  `last` varchar(30) NOT NULL,
  `first` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int(20) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `picture` blob NOT NULL,
  `SSN` int(20) NOT NULL,
  `Credit_Card_no` bigint(32) NOT NULL,
  `Expiration_Month` int(10) NOT NULL,
  `Expiration_Year` year(4) NOT NULL,
  `CVC` int(10) NOT NULL,
  `Document` varchar(128) NOT NULL,
  `Date_Posted` date NOT NULL,
  `Desired_Job_Categories` varchar(100) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `last`, `first`, `street`, `city`, `state`, `zip`, `phone`, `email`, `password`, `picture`, `SSN`, `Credit_Card_no`, `Expiration_Month`, `Expiration_Year`, `CVC`, `Document`, `Date_Posted`, `Desired_Job_Categories`) VALUES
('M01', 'helderman', 'sumaya', '2753 steenweg', 'leeuwarden', 'flevoland', 70474, '(226)-413-8052', 'sumaya.helderman@example.com', 'heat', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f38302e6a7067, 1233655679, 347055608872034, 10, 2016, 832, '', '0000-00-00', ''),
('M02', 'van doorne', 'serah', '3199 domplein', 'borger-odoorn', 'groningen', 28976, '(817)-242-0703', 'serah.van doorne@example.com', 'moreno', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f38392e6a7067, 1203455679, 347054608872034, 2, 2019, 613, '', '2015-12-04', 'Database administrator'),
('M03', 'davelaar', 'paolo', '3816 choorstraat', 'amersfoort', 'limburg', 10808, '(927)-754-9456', 'paolo.davelaar@example.com', 'helloo', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f32322e6a7067, 1293455679, 347053608872034, 6, 2018, 260, '', '0000-00-00', ''),
('M04', 'pauw', 'oktay', '4957 veeartsenijpad', 'oirschot', 'noord-brabant', 51804, '(704)-511-2406', 'oktay.pauw@example.com', 'duffman', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f35362e6a7067, 1283455679, 347052608872034, 12, 2015, 905, '', '2015-12-01', 'Tester'),
('M05', 'coppes', 'necmettin', '5996 korte nieuwstraat', 'krimpen aan den ijss', 'utrecht', 35806, '(974)-901-3423', 'necmettin.coppes@example.com', '1020', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f34332e6a7067, 1273455679, 347051608872034, 10, 2017, 632, '', '2015-11-28', 'Tester'),
('M06', 'grob', 'nataÅ¡a', '3525 wijde begijnestraat', 'asten', 'zuid-holland', 15124, '(526)-591-4424', 'nataÅ¡a.grob@example.com', 'dingdong', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f38322e6a7067, 1263455679, 347051608872034, 8, 2016, 815, '', '2015-12-03', 'Developer'),
('M07', 'voorhorst', 'mischa', '7791 stadsbuitengracht', 'harlingen', 'utrecht', 50678, '(289)-663-3956', 'mischa.voorhorst@example.com', 'wxcvbn', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f32352e6a7067, 1253455679, 347051608872034, 3, 2017, 496, '', '2015-12-04', 'Database administrator'),
('M08', 'haase', 'milouda', '2624 trans', 'oostzaan', 'drenthe', 51450, '(856)-543-3378', 'milouda.haase@example.com', 'williams', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f34382e6a7067, 1243455679, 347050608872034, 9, 2016, 234, '', '0000-00-00', ''),
('M09', 'van eert', 'meine', '3792 servetstraat', 'noord-beveland', 'limburg', 17557, '(280)-033-7688', 'meine.van eert@example.com', 'noway', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f332e6a7067, 1233455677, 347049608872034, 12, 2019, 431, '', '2015-12-04', 'Developer'),
('M10', 'van aart', 'mariella', '6018 poortstraat', 'uitgeest', 'drenthe', 83212, '(128)-481-1936', 'mariella.van aart@example.com', 'anchor', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f33322e6a7067, 1233455676, 347048608872034, 8, 2020, 172, '', '2015-11-06', 'Tester'),
('M11', 'mikkers', 'kenan', '1182 domplein', 'de bilt', 'noord-holland', 20646, '(400)-279-6366', 'kenan.mikkers@example.com', 'immortal', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f32342e6a7067, 1233455675, 347047608872034, 4, 2017, 145, '', '2015-07-10', 'Dentist'),
('M12', 'visch', 'gerharda', '1763 bokstraat', 'dalfsen', 'flevoland', 73978, '(294)-207-6941', 'gerharda.visch@example.com', 'climber', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f38302e6a7067, 1233455674, 347046608872034, 4, 2016, 110, '', '2015-12-01', 'Cashier'),
('M13', 'van venrooij', 'florijn', '6420 haverstraat', 'venray', 'utrecht', 44125, '(608)-165-0367', 'florijn.van venrooij@example.com', 'loverboy', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f33332e6a7067, 1233455673, 347045608872034, 9, 2019, 105, '', '0000-00-00', ''),
('M14', 'kee', 'faouzi', '6915 veeartsenijpad', 'woensdrecht', 'noord-holland', 53952, '(300)-062-1718', 'faouzi.kee@example.com', 'grace', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f342e6a7067, 1233455672, 347044608872034, 11, 2018, 109, '', '2015-10-10', 'Sales manager'),
('M15', 'vreugdenhil', 'donato', '8269 stadhuisbrug', 'losser', 'flevoland', 33924, '(139)-766-0138', 'donato.vreugdenhil@example.com', 'cameron1', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f39382e6a7067, 1233455671, 347043608872034, 8, 2018, 118, '', '0000-00-00', ''),
('M16', 'obdam', 'ashana', '1139 f.c. dondersstraat', 'boekel', 'zuid-holland', 86329, '(300)-120-8260', 'ashana.obdam@example.com', 'chat', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f31392e6a7067, 1233455670, 347042608872034, 6, 2015, 112, '', '2015-11-10', 'Manager'),
('M17', 'balfoort', 'armaan', '4428 monseigneur van de weteringstraat', 'lopik', 'groningen', 89509, '(738)-587-7228', 'armaan.balfoort@example.com', 'picher', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f312e6a7067, 1233455679, 347041608872034, 1, 2016, 102, '', '2015-07-16', 'Sales manager'),
('M18', 'mast', 'abdÃkadir', '4952 furkabaan', 'bussum', 'friesland', 56381, '(940)-183-0515', 'abdÃ¼lkadir.mast@example.com', 'hendrix', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f37352e6a7067, 1233455678, 347040608872034, 12, 2017, 101, '', '2015-12-02', 'Dentist'),
('M19', 'carter', 'julia', '1386 wycliff ave', 'bathurst', 'tasmania', 89584, '07-4814-7839', 'julia.carter@example.com', '7grout', '', 1333455676, 312040608872034, 12, 2019, 910, 'null', '2015-05-01', 'Dentist'),
('M20', 'jackson', 'amy', '4700 taft', 'wichitafalls', 'texas', 76308, '9406134856', 'amyjackson@gmail.com', '12345', 0x6e756c6c, 2147483647, 347055608812334, 7, 2016, 714, '', '0000-00-00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
