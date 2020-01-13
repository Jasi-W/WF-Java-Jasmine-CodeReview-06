-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Jan 2020 um 14:22
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `school3`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `class_ID` int(10) NOT NULL,
  `class_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `class`
--

INSERT INTO `class` (`class_ID`, `class_name`) VALUES
(1, '1 A'),
(2, '2 A'),
(3, '3 A'),
(4, '4 A');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enrollment`
--

CREATE TABLE `enrollment` (
  `fk_teacher` int(10) NOT NULL,
  `fk_student` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `student_ID` int(10) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fk_class` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `student`
--

INSERT INTO `student` (`student_ID`, `firstname`, `lastname`, `email`, `fk_class`) VALUES
(1, 'Barbara', 'Frankfurter', 'barbara.frankfurter@school.at', 1),
(2, 'Nicole', 'Pfeiffer', 'nicole.pfeiffer@school.at', 1),
(3, 'Stefan', 'Schulze', 'stefan.schulze@school.at', 0),
(4, 'Anton', 'Seiler', 'anton.seiler@school.at', 2),
(5, 'Thomas', 'Fassl', 'thomas.fassl@school.at', 2),
(6, 'Franz', 'Dach', 'franz.dach@school.at', 0),
(7, 'Tanja', 'Bauer', 'tanja.bauer@school.at', 3),
(8, 'Max', 'Hofer', 'max.hofer@school.at', 3),
(9, 'Anna', 'Hauer', 'anna.hauer@school.at', 4),
(10, 'Philip', 'Krause', 'philip.krause@school.at', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `teacher_ID` int(10) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fk_class` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teacher`
--

INSERT INTO `teacher` (`teacher_ID`, `firstname`, `lastname`, `email`, `fk_class`) VALUES
(1, 'Wolfgang', 'Hartmann', 'wolfgang.hartmann@school.at', 1),
(2, 'Karin', 'Fiedler', 'karin.fiedler@school.at', 2),
(3, 'Thorsten', 'Kaiser', 'thorsten.kaiser@school.at', 3),
(4, 'Diana', 'Schering', 'diana.schering@school.at', 4);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_ID`);

--
-- Indizes für die Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD KEY `fk_student` (`fk_student`),
  ADD KEY `fk_teacher` (`fk_teacher`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_ID`),
  ADD KEY `fk_class` (`fk_class`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `class`
--
ALTER TABLE `class`
  MODIFY `class_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `student_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`fk_student`) REFERENCES `class` (`class_ID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`fk_teacher`) REFERENCES `teacher` (`teacher_ID`);

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_class` FOREIGN KEY (`fk_class`) REFERENCES `class` (`class_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
