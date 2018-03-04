-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2018 at 02:15 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `society`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`id3799439_church`@`%` PROCEDURE `addMember` (IN `add_SID` INT, IN `add_family_id` INT, IN `add_date` DATE, IN `add_tel` VARCHAR(10), IN `add_group_no` INT, IN `add_address` VARCHAR(100))  begin

		insert into members(SID,FAMILY_ID,PAY,START,TEL_NUM,GROUP_NO,ADDRESS)
			values(add_SID,add_family_id,0,add_date,add_tel,add_group_no,add_address);

		update result SET money=money+600;
end$$

CREATE DEFINER=`id3799439_church`@`%` PROCEDURE `storeDeth` (IN `add_SID` INT, IN `add_name` VARCHAR(50), IN `add_give_date` DATE)  begin
	insert into DEATH(SID,NAME,GIVE_MONEY,GIVE_DATE)
		values(add_SID,add_name,100,add_give_date);

	delete from MEMBERS_DETAILS where name=add_name AND FAMILY_ID IN 
		(select FAMILY_ID from members where SID = add_SID);

	update result SET money=money-1000;

	update members SET pay = pay - 1000;

end$$

CREATE DEFINER=`id3799439_church`@`%` PROCEDURE `storeDon` (IN `add_SID` INT, IN `add_date` DATE, IN `add_comment` VARCHAR(50))  begin 
	insert into donation (SID,PRICE,DON_DATE,COMMENT)
		values(add_SID,100,add_date,add_comment);
	UPDATE members SET PAY=PAY+100 WHERE SID=add_SID;

	update result SET money = money+100;

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`user_name`, `password`, `valid`, `last_login`) VALUES
('abc', '123', 0, '2017-11-08 05:01:08'),
('shehan', '123', 1, '2017-12-10 11:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `change_money`
--

CREATE TABLE `change_money` (
  `add_money` int(11) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  `comment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `death`
--

CREATE TABLE `death` (
  `SID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `GIVE_MONEY` int(11) DEFAULT NULL,
  `GIVE_DATE` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `SID` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `DON_DATE` date DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `SID` int(11) NOT NULL,
  `FAMILY_ID` int(11) DEFAULT NULL,
  `PAY` int(11) DEFAULT NULL,
  `START` date DEFAULT NULL,
  `TEL_NUM` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `GROUP_NO` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`SID`, `FAMILY_ID`, `PAY`, `START`, `TEL_NUM`, `ADDRESS`, `GROUP_NO`, `last_login`) VALUES
(2, 1, 0, '1991-05-09', 'null', '264', 1, NULL),
(9, 8, 0, '1991-09-05', 'null', '273', 1, NULL),
(13, 9, 0, '1991-05-09', 'null', '273', 1, NULL),
(23, 4, 0, '1991-05-09', 'null', '265', 1, NULL),
(24, 5, 0, '1991-05-10', 'null', '265/A', 1, NULL),
(122, 21, 0, '1999-07-23', 'null', '310/1/A BATHIYA MW HUNUPITIYA', 1, NULL),
(124, 0, 0, '2001-06-09', 'null', '559 WANAWASALA KELANIYA', 1, NULL),
(1, 4, 0, '1991-05-10', 'null', '377', 2, '2017-11-30 18:48:02'),
(4, 7, 0, '1991-05-09', 'null', '238/A', 2, '2017-11-07 09:40:33'),
(6, 6, 0, '1991-05-16', 'null', '238/B', 2, NULL),
(7, 10, 0, '1991-05-09', 'null', '273', 2, NULL),
(30, 6, 0, '1991-05-09', 'null', '263', 2, NULL),
(31, 0, 0, '1991-05-09', 'null', '374/1', 2, NULL),
(65, 0, 0, '2008-07-24', 'null', '239', 2, NULL),
(82, 0, 0, '1991-05-09', 'null', '376', 2, NULL),
(102, 0, 0, '1991-08-25', 'null', '374', 2, '2017-11-30 18:43:20'),
(114, 39, 0, '1995-06-10', 'null', '317/8', 2, NULL),
(139, 0, 0, '2016-09-04', 'null', '257/2', 3, NULL),
(11, 14, 0, '1991-05-17', 'null', '245/D', 3, '2017-11-30 18:20:00'),
(12, 11, 0, '1991-05-18', 'null', '245/D', 3, NULL),
(60, 9, 0, '1991-05-02', 'null ', '257', 3, NULL),
(61, 24, 0, '2002-11-22', 'null ', '250', 3, NULL),
(63, 0, 0, '2002-11-22', 'null ', '247/D', 3, NULL),
(71, 13, 0, '1991-05-17', 'null ', '245/D', 3, NULL),
(79, 17, 0, '1991-05-10', 'null ', '245/B', 3, NULL),
(83, 21, 0, '1991-05-29', 'null ', '249/D ', 3, NULL),
(84, 19, 0, '1991-05-29', 'null ', '247/C ', 3, NULL),
(62, 0, 0, '2005-07-31', 'null ', 'null ', 3, NULL),
(64, 20, 0, '1991-05-08', 'null ', '249 ', 3, NULL),
(118, 0, 0, '1998-12-27', 'null ', '247/D/1', 3, NULL),
(129, 26, 0, '2004-04-05', 'null ', '256/A ', 3, NULL),
(134, 43, 0, '2012-03-17', 'null', '386/C', 4, NULL),
(135, 0, 0, '2012-03-18', 'null ', '226/H ', 4, NULL),
(137, 0, 0, '2012-03-21', 'null ', '230/A', 4, NULL),
(14, 20, 0, '1991-05-15', 'null ', '385', 4, NULL),
(21, 35, 0, '1991-05-11', 'null ', '238/C ', 4, NULL),
(34, 0, 0, '2004-03-04', 'null ', '236/2', 4, NULL),
(40, 52, 0, '2002-11-26', 'null ', '230', 4, NULL),
(41, 20, 0, '2002-11-09', 'null ', '382/G', 4, NULL),
(42, 12, 0, '2017-07-20', 'null ', '231/A', 4, NULL),
(33, 24, 0, '1991-05-09', 'null ', '382', 4, NULL),
(44, 2, 0, '1991-05-10', 'null ', '226/1', 4, NULL),
(46, 4, 0, '1991-05-10', 'null ', '226', 4, NULL),
(47, 19, 0, '2002-09-01', 'null ', '236/3', 4, NULL),
(48, 31, 0, '1991-05-10', 'null ', '241', 4, NULL),
(49, 32, 0, '1991-05-10', 'null ', '235/1', 4, NULL),
(51, 34, 0, '1991-05-09', 'NULL ', '238', 4, NULL),
(54, 3, 0, '1991-05-14', 'null ', '226', 4, NULL),
(15, 3, 0, '1991-05-07', 'null ', '218', 5, NULL),
(16, 1, 0, '1991-05-20', 'null', '219', 5, NULL),
(18, 12, 0, '1991-05-09', 'null', '411', 5, NULL),
(19, 9, 0, '1991-07-31', 'null', '416', 5, NULL),
(39, 14, 0, '1991-05-05', 'null', '418', 5, NULL),
(66, 20, 0, '1991-05-11', 'null', '413', 5, NULL),
(87, 0, 0, '2003-08-17', 'null', '394', 5, NULL),
(88, 5, 0, '1991-05-23', 'null', '218', 5, NULL),
(91, 9, 0, '2015-10-04', 'null', '220', 5, NULL),
(93, 0, 0, '0000-00-00', 'null', '218', 5, NULL),
(141, 0, 0, '2017-02-16', 'null', '330/2', 6, NULL),
(136, 0, 0, '2012-03-14', 'null', '175', 6, NULL),
(138, 13, 0, '2016-07-31', 'null', '402', 7, NULL),
(72, 13, 0, '1991-05-16', 'NULL ', '231/B', 4, NULL),
(74, 6, 0, '1991-05-12', 'NULL ', '229/A', 4, NULL),
(76, 12, 0, '1991-05-13', 'NULL ', '231', 4, NULL),
(85, 22, 0, '0000-00-00', 'NULL ', '385/B', 4, NULL),
(86, 29, 0, '1991-05-28', 'NULL ', '236', 4, NULL),
(112, 0, 0, '2006-08-10', 'null ', '236', 4, NULL),
(128, 0, 0, '2002-09-11', 'NULL ', '226', 4, NULL),
(130, 0, 0, '0000-00-00', 'null ', '226/2/A/1', 4, NULL),
(56, 5, 0, '1991-05-10', 'null', '190/A', 6, NULL),
(57, 20, 0, '2002-09-04', 'null', '156', 6, NULL),
(59, 19, 0, '1991-05-10', 'null', '210/A', 6, NULL),
(77, 2, 0, '2001-08-10', 'null', '211', 6, NULL),
(78, 1, 0, '2002-09-03', 'null', '213', 6, NULL),
(81, 16, 0, '2002-09-03', 'null', '210/E', 6, NULL),
(20, 21, 0, '1991-05-11', 'null', '210', 6, NULL),
(126, 32, 0, '2002-09-03', 'null', '210/A', 6, NULL),
(140, 1, 0, '2016-11-12', 'null', '141', 6, NULL),
(142, 17, 0, '2017-03-04', 'null', '156/A', 6, NULL),
(17, 6, 0, '1991-05-10', 'null', '406', 7, NULL),
(32, 17, 0, '1991-05-04', 'null', '399', 7, NULL),
(35, 9, 0, '1991-05-10', 'null', '59/5', 7, NULL),
(37, 5, 0, '1991-05-09', 'null', '402/A', 7, NULL),
(92, 1, 0, '1991-05-11', 'null', '402/A', 7, NULL),
(95, 15, 0, '1991-05-08', 'null', '417', 7, NULL),
(96, 19, 0, '1991-07-10', 'null', '406', 7, NULL),
(99, 10, 0, '1991-07-19', 'null', '405/A', 7, NULL),
(103, 18, 0, '1991-09-10', 'null', '405/5/6', 7, NULL),
(106, 12, 0, '1992-11-28', 'null', '405/A', 7, '2017-11-30 18:43:57'),
(110, 14, 0, '1994-05-24', 'null', '401/A', 7, NULL),
(116, 0, 0, '1993-07-21', 'null', '404', 7, NULL),
(115, 11, 0, '1998-07-20', 'null', '402/B/2', 7, NULL),
(117, 25, 0, '1998-07-20', 'null', '404/1', 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members_details`
--

CREATE TABLE `members_details` (
  `FAMILY_ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members_details`
--

INSERT INTO `members_details` (`FAMILY_ID`, `NAME`) VALUES
(1, 'M RAMYALATHA'),
(2, 'P.A ALEKSANDER PERERA'),
(3, 'STELA'),
(4, 'P.A ROI PERERA'),
(4, 'VINITHA RANGINI'),
(6, 'A PERERA'),
(6, 'P.A KASUN PERERA'),
(6, 'P.A WANNAN PERERA'),
(7, 'A ANTONY PERERA'),
(7, 'A PRINS PERERA'),
(7, 'ANNE PRIYANKA'),
(7, 'M MALANI'),
(7, 'SHENEN PERERA'),
(7, 'SHEWON PERERA'),
(9, 'D JENET JAYAKODI'),
(11, 'A PUSHPAKA JAYANTHA'),
(11, 'P.M KURUMBA PITIYA'),
(12, 'A MARY LILIYAN PERERA'),
(12, 'HESHANI NAYOMI'),
(12, 'KALISTES ROHITHA'),
(12, 'LUDES TEKLA'),
(13, 'M INIT REETA PERERA'),
(13, 'ROLAND J MELDER'),
(14, 'DUNUWEERAGE REMAND'),
(14, 'SRIYAN LOKUGAMAGE'),
(15, 'H.A MARY AGNAS'),
(16, 'DHAMMIKA KRISHANTHI'),
(16, 'M.S.AGNAS P JAYAWARDHANA'),
(16, 'W.W.M.E TIKIRI BANDARA'),
(17, 'D.D MALANI'),
(17, 'K.A.D VIKTER DANSTEN'),
(18, 'ASHANI PERERA'),
(18, 'L.A.M KUSUMAWATHI'),
(18, 'SRIYAN CHAMINDA PERERA'),
(18, 'UWANI NISHEKA PERERA'),
(18, 'YOKAN PERERA'),
(19, 'S.G.K.D.J KALISTAS SAMARATHUNGA'),
(20, 'H.D MARY'),
(20, 'SIDNI SHANTHA'),
(20, 'SRIYANTHA PRINSI'),
(21, 'P MARVIN PERERA'),
(21, 'REETA PERERA'),
(23, 'H.D AGNAS'),
(23, 'JASTIN JAYAWARDHANA'),
(23, 'P.A JUDE JAYAWARDHANA'),
(24, 'P.A KEVIRU PERERA'),
(24, 'P.A MIKEL PERERA'),
(24, 'P.A PRADEEP PERERA'),
(24, 'P.A VINUDHI PERERA'),
(24, 'V.H.D DHANUSHKI NIROSHANI'),
(30, 'AMESH PALPOLA'),
(30, 'CHANDHANI PALPOLA'),
(30, 'DHILSHAN MADHAWA PALPOLA'),
(30, 'KANI PALPOLA'),
(30, 'KANISIES PALPOLA'),
(31, 'P.A CHAMPA VEERAVANSHA'),
(31, 'RICHAD ANSLI'),
(32, 'D.M RAJAPAKSHA'),
(32, 'P.A.M JESMIN PERERA'),
(33, 'GANEGODA'),
(33, 'THERES PERERA'),
(34, 'MARY'),
(34, 'SHELI RANGI MARVIN PERERA'),
(35, 'STELA W PRANSIS'),
(35, 'V.A PRANSIS'),
(37, 'IRESHA DULANI PERERA'),
(37, 'P.A NIHAL PERERA'),
(37, 'PERERA'),
(39, 'C.D.R ALVIS'),
(39, 'DARSHANI SIRIMANNA'),
(39, 'DHAMAYANTHI'),
(39, 'LESTAR HARSHADA ALVIS'),
(39, 'R.M GEEN'),
(40, 'DAYANI'),
(40, 'M NEVIL BERNAD PERERA'),
(40, 'PERERA'),
(41, 'M ALWIS'),
(41, 'TRISI ALWIS'),
(41, 'W.G.M DA ALWIS'),
(42, 'K.K WEERASINHA'),
(42, 'W ASANKA SAMEN PERERA'),
(43, 'K DAYANIEES PERERA'),
(43, 'P.A NISHAD MILAN'),
(43, 'P.A SURESH TRIWANKA'),
(43, 'T.K REETA'),
(44, 'M ANK RUBERA'),
(44, 'P.M ANASTA PERERA'),
(46, 'M.D JEREM'),
(46, 'P.M JESMIN'),
(47, 'K.A.D.M R DEEPTHIKA'),
(47, 'W.A.A.D CLODE PERERA'),
(47, 'W.A.A.D JUDE ACHINTHANA PERERA'),
(47, 'W.A.D.D NETHMINI PERERA'),
(48, 'D.P VIJETHUNGA'),
(48, 'M JOSHEP PERERA'),
(49, 'P.A MARY PRINSI PERERA'),
(49, 'W.A AROSHA PERERA'),
(49, 'W.A RENUKA PERERA'),
(49, 'W.D JOSHEP PERERA'),
(51, 'ANJALO LAKMAL '),
(51, 'P.A JORGE STEWEN PERERA'),
(51, 'PRITHI NANAYAKKARA'),
(54, 'K.D JERAD'),
(54, 'MARY PATRISIYA'),
(55, 'D.A VINIPRIDA SILWA'),
(55, 'M.D DILINI CHATHURIKA SILWA'),
(55, 'M.D DINUKA NIWANTHA SILWA'),
(55, 'M.D GRATION CAMILAS SILWA'),
(55, 'W.A KONSI'),
(55, 'W.A MIKAL'),
(56, 'ANASTA ALWIS'),
(56, 'D.A.CAMILS SILWA'),
(56, 'PUMAL SILWA'),
(56, 'SURANGA SAMPATH'),
(57, 'DAHAM SANJEEWA'),
(57, 'M.G KALISTES SILWA'),
(57, 'MARY'),
(57, 'NIMESH CHANAKA'),
(57, 'NIROSHA PRIYANKA PERERA'),
(60, 'U.D ADMAN'),
(60, 'U.D JASAPIN NANAYAKKARA'),
(61, 'J.M MILTAN PRIYANKARA'),
(61, 'S.A VAYALAT'),
(62, 'FRANSIS THILAKARATHNA'),
(62, 'HELEN THILAKARATHNA'),
(62, 'MARLIN VINISHIDA'),
(63, 'DULASHA NETHMINI'),
(63, 'E.A CHALAT PERERA'),
(63, 'KAMANI MALKANTHI'),
(63, 'MADUWANTHI'),
(63, 'RAMANI AKASHI'),
(63, 'RANISHA PERERA'),
(63, 'U KINSLI JAYALATH PERERA'),
(64, 'P.A ANUSHIKA'),
(64, 'P.A FRANSIS PERERA'),
(64, 'P.A RANIL'),
(64, 'R.D SOMAWATHI'),
(65, 'ANYA THILAKARATHNA'),
(65, 'INDRANI THILAKARATHNA'),
(65, 'NEEL THILAKARATHNA'),
(65, 'SHANIKA THILAKARATHNA'),
(65, 'SHIRANI THILAKARATHNA'),
(65, 'SRIMALI'),
(66, 'NISHAN HARSHA'),
(66, 'ROSI PITASAN'),
(66, 'S.G.K.D NIMAL ANTANI'),
(66, 'SHEHANI'),
(70, 'B.K LIYO RODRIGU'),
(70, 'MANGALIKA'),
(70, 'NIPUN RUDRIGU'),
(70, 'PATHANGA RUDRIGU'),
(70, 'ROSHANI KUSHALYA'),
(70, 'SUPUN MALITH RUDRIGU'),
(71, 'A NELKA SHAMINI'),
(71, 'A RANGITH SILWA'),
(71, 'P MARY PERERA'),
(71, 'W.L.D PERERA'),
(72, 'M.D SILWESTER'),
(72, 'W.L.D.M PATRISIYA PERERA'),
(74, 'ANTONI AMARASINHA'),
(74, 'CHITHRANI PERERA'),
(74, 'WASANTHA PERERA'),
(76, 'W SHANIKA'),
(76, 'W SUGITH SHANAKA'),
(76, 'W.L.T.L.J PERERA'),
(76, 'W.S.STANLI DIYAS'),
(77, 'M.J PERERA'),
(77, 'S SURUPI'),
(77, 'SADAMINI'),
(77, 'SAMAN ROHITHA'),
(77, 'YOHAN SHALUKA'),
(78, 'H MARVIN ANTONY'),
(78, 'S ROS MARY PERERA'),
(79, 'ETHOL NANCY PERERA'),
(79, 'M.J HENRY PERERA'),
(79, 'SHEHAN SHAMAN MARIO'),
(80, 'B.M VAYALAT ABESIRIWARDANA'),
(80, 'J.A.D PRIYANKARA'),
(80, 'J.A.D SHASHIKA NURANGA'),
(81, 'LAKSHIKA'),
(81, 'PATRISHIYA'),
(81, 'RANGITH'),
(83, 'B.K RUDRIGU'),
(83, 'W KALYANI'),
(84, 'P.A SOMAWATHI PERERA'),
(85, 'H.G.A MALANI'),
(85, 'MAHESHIKA'),
(85, 'MANOJ SURANGA'),
(85, 'THARANGA MANOJ'),
(85, 'W.A FRANSIS'),
(86, 'AKANAYAKA'),
(86, 'MANOJ RUDRIGU'),
(86, 'NIMAL RUDRIGU'),
(87, 'ISHARA'),
(87, 'JONS PERERA'),
(87, 'M.W ROSMIN'),
(87, 'MONIKA PERERA'),
(87, 'SAMEERA DILSHAN'),
(88, 'NETHULI'),
(88, 'SENURA'),
(88, 'SURANGA'),
(88, 'THUSHARI'),
(88, 'U.D ANI'),
(88, 'W.M.S FONSEKA'),
(91, 'KAVISHKA PERERA'),
(91, 'LILI JAYAWARDANA'),
(91, 'NILMINI PERERA'),
(91, 'S.M ANTHONY POL PERERA'),
(92, 'M PERERA'),
(92, 'M.A PRINSI'),
(93, 'NIMANTHA DINESH'),
(93, 'NIMESH SADARUWAN'),
(93, 'NIRMALI MADUWANTHI'),
(93, 'P.D TEKLA IRIN'),
(93, 'W ROBAT FONSEKA'),
(95, 'D DEEPA AMARASINHA'),
(95, 'S.G.K.D.P VILFRAD'),
(96, 'K.G.D MARY SILVIYA'),
(96, 'P.D ALOSIES'),
(98, 'B DILIKA RUDRIGU'),
(98, 'B.J.P.N RUDRIGU'),
(98, 'P.I.C RUDRIGU'),
(98, 'W.D ANA'),
(99, 'M ANI PERERA'),
(102, 'M HILDA PERERA'),
(102, 'N PERERA'),
(103, 'H DILINI PERERA'),
(103, 'MARIYO LAKMAL'),
(103, 'P.A PERERA'),
(106, 'G CHALAT PRANANDU'),
(106, 'G THOMAS PERERA'),
(106, 'Q.W SUNIL SHANTHA'),
(106, 'R.W RAMYALATHA'),
(106, 'SAHAN RUKSHAN'),
(106, 'SAVIN RANESH'),
(110, 'A.C GUNATHILAKA'),
(110, 'F.G.L GUNATHILAKA'),
(112, 'P.A CAMILAS PERERA'),
(114, 'M.A.D SHELTAN'),
(114, 'SEETHA'),
(115, 'K.D BRIJET'),
(115, 'P.A HARSHA'),
(115, 'P.A PRAMODI MADUSANKA'),
(115, 'P.A SHELTAN PERERA'),
(116, 'ANTHONY REX'),
(116, 'RUKSHAN NILANKA'),
(116, 'SHIROMI'),
(117, 'JESIKA KRISTOPER'),
(117, 'M.A.D SUDATH'),
(117, 'SHASHIKA MADURANGA'),
(118, 'ISHANI'),
(118, 'ISURINI'),
(118, 'K.M SENIVIRATHNA'),
(118, 'ROSHANI'),
(118, 'U.G.D PERERA'),
(122, 'M SARANGA SILVA'),
(122, 'M.D SAWMYA SILVA'),
(122, 'M.D SEHAN SILWA'),
(122, 'M.D.S SILWA'),
(122, 'W.A PRIYANI'),
(124, 'JAYANTHA FONSEKA'),
(124, 'MORIN SILWA'),
(124, 'NUWANTHA FONSEKA'),
(126, 'M PERERA'),
(126, 'M RAJAPAKSHA'),
(126, 'M.G RAJAPAKSHA'),
(126, 'M.K RAJAPAKSHA'),
(128, 'CHATHURANGA'),
(128, 'MARY WIKRAMASINHA'),
(128, 'SHIRANTHA WIKRAMASINHA'),
(128, 'T.A.M SILVESTER'),
(129, 'H.B KAUSHALYA KRISHANTHI'),
(129, 'H.B MAHINDAPALA'),
(129, 'J.I PERERA'),
(130, 'D.L SUDESH PRIYANTHA'),
(130, 'NAYANA DAMAYANTHI'),
(130, 'REETA MAGRAT'),
(130, 'SHUNULI PERERA'),
(130, 'VINDYA PERERA'),
(133, 'K.A.D JAGATH PRASANNA'),
(133, 'K.A.D JASTIN'),
(133, 'STELA MIYURIYAL'),
(134, 'S.K LASANTHIKA'),
(134, 'S.K SUGATH'),
(134, 'W.A MARY TYHERESA'),
(135, 'B.D PATRIK'),
(135, 'CHITHRANGANI GANEGAMAGE'),
(135, 'DULAJ SULVIN'),
(135, 'UMESHA MADUSHAN'),
(136, 'D.M RUUPASINHA'),
(136, 'LORAN PERERA'),
(137, 'ANTONY UPUL KUMARASEKARA'),
(137, 'CRISTINA BUDDIMA'),
(137, 'MARIYAN MUDDIKA'),
(137, 'ROSMALY AKANAYAKA'),
(138, 'DULAKSHA MANGIKA PERERA'),
(138, 'DULMI MAHEESHA PERERA'),
(138, 'DUMINDA LANKA PERERA'),
(138, 'VIMALKA MANJARI'),
(139, 'J DULSI MARY PERERA'),
(139, 'K.L ADWARD ANTONY'),
(140, 'ISA WARNAKULASURUYA'),
(140, 'MOKEL WARNAKULASURIYA'),
(140, 'RAMONA PRANANDU'),
(140, 'THISHANKA IDUNIL'),
(140, 'W JANAKA PRANANDU'),
(140, 'WENUKA PRANANDU'),
(141, 'DUMINDA SAGARA PRANANDU'),
(141, 'ETHEL REETA PRANANDU'),
(142, 'AYESHA DILRUKSHI'),
(142, 'CHRISTI ALOSIES SILVA'),
(142, 'MHESHA CHALANI'),
(142, 'SRIMATHI SANDAYA KUMARI');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `money` int(11) DEFAULT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`money`, `last_update`) VALUES
(0, '2017-11-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `death`
--
ALTER TABLE `death`
  ADD PRIMARY KEY (`SID`,`NAME`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `members_details`
--
ALTER TABLE `members_details`
  ADD PRIMARY KEY (`FAMILY_ID`,`NAME`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
