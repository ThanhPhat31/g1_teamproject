DROP SCHEMA IF EXISTS `swp391`;
CREATE SCHEMA `swp391` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE `swp391`.`profile` (
  `ProfileID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MiddleName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DoB` date NOT NULL,
  `Gender` tinyint NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Mail` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Account` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` int NOT NULL,
  `Image` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `swp391`.`doctor` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `ProfileID` int NOT NULL,
  `Position` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Department` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `ProfileID_idx` (`ProfileID`),
  CONSTRAINT `ProfileID_doctor` FOREIGN KEY (`ProfileID`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `swp391`.`patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `ProfileID` int NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `ProfileID_idx` (`ProfileID`),
  CONSTRAINT `ProfileID_patient` FOREIGN KEY (`ProfileID`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `medicine` (
  `MedicineID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`MedicineID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `swp391`.`news` (
  `NewsID` int NOT NULL AUTO_INCREMENT,
  `Category` int NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Content` VARCHAR(3000) NOT NULL,
  `Date` date NOT NULL,
  `Author` varchar(45) NOT NULL,
  `Image1` varchar(45) NOT NULL,
  `Image2` varchar(45) NOT NULL,
  PRIMARY KEY (`NewsID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `designate` (
  `DesignateID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`DesignateID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `swp391`.`first_priority_patient_list` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Booking_date` date NOT NULL,
  `Booking_time` time NOT NULL,
  `Appointment_date` date NOT NULL,
  `Appointment_time` time NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DoctorID_idx` (`DoctorID`),
  KEY `PatientID_fppl_idx` (`PatientID`),
  CONSTRAINT `DoctorID_fppl` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `PatientID_fppl` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `swp391`.`normal_priority_patient_list` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `PatientID` int NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID_nppl_idx` (`PatientID`),
  CONSTRAINT `PatientID_nppl` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `swp391`.`case` (
  `CaseID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Status` int NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Result` varchar(100) NOT NULL,
  `DoctorID` int NOT NULL,
  `PatientID` int NOT NULL,
  PRIMARY KEY (`CaseID`),
  KEY `DoctorID_case_idx` (`DoctorID`),
  KEY `PatientID_case_idx` (`PatientID`),
  CONSTRAINT `DoctorID_case` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PatientID_case` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `swp391`.`contact` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Message` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `swp391`.`designate_list` (
  `CaseID` int NOT NULL,
  `DesignateID` int NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Result` varchar(100) NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`CaseID`,`DesignateID`),
  KEY `DesignateID_list_idx` (`DesignateID`),
  CONSTRAINT `CaseID_list` FOREIGN KEY (`CaseID`) REFERENCES `case` (`CaseID`),
  CONSTRAINT `DesignateID_list` FOREIGN KEY (`DesignateID`) REFERENCES `designate` (`DesignateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `swp391`.`product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Price` bigint NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Productname` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Category` int NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `swp391`.`order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `PatientID_Order_idx` (`PatientID`),
  CONSTRAINT `PatientID_Order` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `swp391`.`orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `Quantity` int NOT NULL,
  `Total` int DEFAULT NULL,
  `ProductID` int NOT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID_OrderDetail_idx` (`OrderID`),
  KEY `ProductID_OrderDetail_idx` (`ProductID`),
  CONSTRAINT `OrderID_OrderDetail` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `ProductID_OrderDetail` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `swp391`.`prescription` (
  `MedicineID` int NOT NULL,
  `CaseID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`MedicineID`,`CaseID`),
  KEY `CaseID_prescription_idx` (`CaseID`),
  CONSTRAINT `CaseID_prescription` FOREIGN KEY (`CaseID`) REFERENCES `case` (`CaseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MedicineID_prescription` FOREIGN KEY (`MedicineID`) REFERENCES `medicine` (`MedicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `swp391`.`service` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Content` varchar(1000) NOT NULL,
  `Image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
