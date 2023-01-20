-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2023 at 03:32 PM
-- Server version: 10.3.31-MariaDB-0+deb10u1
-- PHP Version: 7.0.33-57+0~20211119.61+debian10~1.gbp5d8ba5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `491875_3_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `hashtag`
--

CREATE TABLE `hashtag` (
  `ID` int(11) NOT NULL,
  `hashtag` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hashtag`
--

INSERT INTO `hashtag` (`ID`, `hashtag`) VALUES
(1, 'reptiliensitter:in gesucht'),
(2, 'reptiliensitting anbieten'),
(3, 'reptilien verkauf'),
(4, 'reptilienpaarung'),
(5, 'schlangen'),
(6, 'echsen'),
(7, 'schildkröten'),
(8, 'amphibien');

-- --------------------------------------------------------

--
-- Table structure for table `inserat`
--

CREATE TABLE `inserat` (
  `ID` int(11) NOT NULL,
  `titel` varchar(100) NOT NULL,
  `bild` varchar(100) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `stadt` int(11) NOT NULL,
  `beschreibung` text NOT NULL,
  `user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inserat`
--

INSERT INTO `inserat` (`ID`, `titel`, `bild`, `adresse`, `stadt`, `beschreibung`, `user`, `status`, `timestamp`) VALUES
(27, 'Norberts Time to shine', 'https://cdn.prod.www.spiegel.de/images/8f5b4014-7261-4291-bff9-36ec9891db87_w1200_r1_fpx64_fpy50.jpg', 'Hier wohne ich', 1, ' \r\nMeine Schlange Norbert ist manchmal etwas eine Diva. Meistens ist er aber doch sehr lieb. Er mag es besonders, wenn man ihm  ein paar Mäuse serviert, mit denen er sich dan austoben kann. Könntest du dir vorstellen auf ihn aufzupassen?', 18, 1, '2022-09-12 16:16:11'),
(28, 'Princess Chamelea', 'https://www.chameleonschool.com/wp-content/uploads/2019/02/Friendly-Chameleon.jpg', 'Princess Street 10, 8000 ', 1, 'Hallo meine Chameleon Freund/innen. Ich suche eine offene, liebenswürdige, flexible, stubenreine Person. Die sich vorstellen könnte, auf meine Princess aufzupassen. Der Zeitrahmen entspräche 2 x in der Woche für 4 Stund. Melde dich bei mir! ', 19, 1, '2022-09-12 16:24:04'),
(35, 'Frosch in Need for a Sitter', 'https://www.tierchenwelt.de/images/stories/fotos/amphibien_reptilien/froesche/frosch_huepft_l.jpg', 'Froggyfrog Strasse 10, 3012 ', 1, 'Mein Frosch Galdof sucht jemanden der in den Sommerferien ihn füttern könnte. Er wäre froh über einen Sitter den ihn auch etwas in der Hand halten könnte. Würmer und Fliegen sind always welcome. Hättest du Zeit? Termine wären direkt zu besprechen. ', 16, 1, '2022-09-13 09:05:17'),
(36, 'Gecko ledig sucht', 'https://images.pexels.com/photos/11547193/pexels-photo-11547193.jpeg', 'Holzikofenweg 8, 3007 Bern ', 2, 'Hier seht ihr ein Bild von meinem Goldschatz Osiris. Osiris ist eher scheu und braucht nich enorm viel Aufmerksamkeit. Am liebsten verkricht er sich hinter seinen Steinen. Ich hoffe jemanden zu finden der die selbe Rasse Geko hat, natürlich in weiblicher Form. Um den Schönheiten Zweisamkeit zu schenken! Interessiert? Ihr seht meine Email.', 24, 1, '2022-09-13 12:09:12'),
(37, 'Bomba braucht ein neues Zuhause :( ', 'https://i.natgeofe.com/n/671ea18d-3185-42a9-8e64-a8470befbe11/01-turtle-day-photo-ark_2x1.jpg', 'Bikinibottom Strasse, 8708 Zürich', 2, 'Leider kann ich meine Schildkröte Bomba nicht mehr behalten. Mein Partner leidet an der seltene Schildkröten Allergie. Nun bin ich hier, und hoffe auf einen neuen liebenden halter. Bei Interesse gerne melden! ', 26, 0, '2022-09-13 15:11:35'),
(38, 'Lele der Leguan', 'https://www.zooroyal.de/magazin/wp-content/uploads/2017/02/3ifymzdtduy-jairo-alzate-leguan.jpg', 'Waldheimstrasse 500', 3, 'Mein liebster Lele, ist auf der Suche nach einer Person, die jeden Mittwoch mit ihm eine Stunde spazieren gehen würde. Könntest du dir vorstellen, diese Schritte zu wagen? Dann melde dich bei mir, bei der vorhandenen Email Adresse.', 45, 1, '2022-09-16 12:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `inserat_hat_hashtag`
--

CREATE TABLE `inserat_hat_hashtag` (
  `ID` int(11) NOT NULL,
  `inserat_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inserat_hat_hashtag`
--

INSERT INTO `inserat_hat_hashtag` (`ID`, `inserat_id`, `hashtag_id`) VALUES
(1, 27, 1),
(2, 27, 5),
(3, 28, 1),
(4, 28, 6),
(5, 35, 1),
(6, 35, 8),
(7, 36, 4),
(8, 36, 6),
(9, 37, 3),
(10, 37, 7),
(139, 38, 1),
(140, 38, 6);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Token` varchar(42) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`ID`, `User_ID`, `Token`, `Timestamp`) VALUES
(26, 55, 'hSKlnku9fP2PYJ49cDRzUPR2gzoMzbCzu68x6W8fKt', '2023-01-20 14:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `stadt`
--

CREATE TABLE `stadt` (
  `ID` int(11) NOT NULL,
  `stadt` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stadt`
--

INSERT INTO `stadt` (`ID`, `stadt`) VALUES
(1, 'Bern'),
(2, 'Chur'),
(3, 'Zürich'),
(4, 'basel'),
(5, 'st.gallen'),
(6, 'genf'),
(7, 'lugano'),
(8, 'luzern'),
(9, 'zug'),
(10, 'lausanne'),
(11, 'freiburg'),
(12, 'solothurn'),
(13, 'neuchâtel'),
(14, 'winterthur'),
(15, 'schaffhausen');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `name`, `email`, `password`) VALUES
(16, 'Herbert Lulatsch ', 'Herbert.Lulatsch@gmail.com', '$2y$10$/E8Lc0FoICrSlKl.cBRgUOvAR.mJpwI3CN93QUiA.m9wCAc1uM8j.'),
(18, 'Cindy', 'cindybelle@sunrise.ch', '$2y$10$Qrtxsn2fv2LbiC/R5oUEq.BOy3SFxpMMM1xWepjd5gi2lDuxGtLE6'),
(19, 'Merwin', 'MerwinSchnee@sunset.ch', '$2y$10$jrZgpHNx0GF0fBq7ALbEmeVE0TAEdgNY6zJuwm4yd7i01RD6Fp0yy'),
(20, 'May', 'MaySommer@gmail.com', '$2y$10$V8BNTbmfaz.4B2Y8MYWjDOftzDUhJAEMv/sqqWZ3YS5BwHUnj7Jxa'),
(23, 'Max', 'max@gitszwei.ch', '$2y$10$09pR6A8/qGiMCekoYucDke1FJL6ZCrY3HzLhsBTwk09GtsqD44LWa'),
(24, 'Oliver', 'Oliver-Schmaus@schmausi.ch', '$2y$10$S02/dbn7KaSdfPFNgRRw0es.TaQCVKqZ5UNI2zAfJWEQg2bgI9FC.'),
(26, 'Leila', 'Leilabene@benebene.ch', '$2y$10$mzCD8fNdH20QaUgkiFb3zOPuYr7.Sk.W0C4JxofoABTJXIEnKxYha'),
(27, 'Stephan Heuschreck', 'Stephanschreck@hotmail.ch', '$2y$10$NVTnYkrjTv1MGazU5ZxpMeu1FnL5NurYzXCzRclQuCQY7RsnZayke'),
(44, 'maggie', 'maggiebraun@gmail.com', '$2y$10$mGMbBOOLKtsL3RcjTVBYbO9hvFT/JLEN.8gerf0mOYL7uyN6dxyre'),
(45, 'carina', 'carini@hot.sexy', '$2y$10$PwF2Cvwwr606ZzhNXmcPFup77kSB6TBeXOSeu6thZIwCTw81LC.0O'),
(46, 'replover', 'replover@gmail.com', '$2y$10$/ygJUaUe3LwuFagWYRrDn.YdCKpuDu63k7jjicMWtfn4qp7Co.HN2'),
(47, 'Reptilea', 'reptilea@gmail.com', '$2y$10$rU2fz9j4UwxsmbVVxUzz4e1tcJGCZaXKmKx.UR6Kb/K3P.aaDWXH2'),
(55, 'test', 'test@email.com', '$2y$10$ritD849PpVRASv.M7ZpU.ubukvRSOuCGZZGPPx529uCodgEITI6U6'),
(56, 'test 2', 'test2@email.com', '$2y$10$3atr1Rnz6lf4G/jo2gLItu5XTDISLLjQ/kqmPYgRNPQaceEaGS0yK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inserat`
--
ALTER TABLE `inserat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `stadt` (`stadt`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `inserat_hat_hashtag`
--
ALTER TABLE `inserat_hat_hashtag`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `session_userid` (`User_ID`);

--
-- Indexes for table `stadt`
--
ALTER TABLE `stadt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hashtag`
--
ALTER TABLE `hashtag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `inserat`
--
ALTER TABLE `inserat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `inserat_hat_hashtag`
--
ALTER TABLE `inserat_hat_hashtag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `stadt`
--
ALTER TABLE `stadt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
