CREATE TABLE `account` (
  `Account` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Role` int NOT NULL,
  PRIMARY KEY (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `profile` (
  `ProfileID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MiddleName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DoB` date NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Mail` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone` bigint DEFAULT NULL,
  `Account` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ProfileID`),
  KEY `Account_idx` (`Account`),
  CONSTRAINT `Account_profile` FOREIGN KEY (`Account`) REFERENCES `account` (`Account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `ProfileID` int NOT NULL,
  `Position` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Department` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Status` int NOT NULL,
  
  PRIMARY KEY (`DoctorID`),
  KEY `ProfileID_idx` (`ProfileID`),
  CONSTRAINT `ProfileID_doctor` FOREIGN KEY (`ProfileID`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `ProfileID` int NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `ProfileID_idx` (`ProfileID`),
  CONSTRAINT `ProfileID_patient` FOREIGN KEY (`ProfileID`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `case` (
  `CaseID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Status` int NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DoctorID` int NOT NULL,
  `PatientID` int NOT NULL,
  PRIMARY KEY (`CaseID`),
  KEY `DoctorID_case_idx` (`DoctorID`),
  KEY `PatientID_case_idx` (`PatientID`),
  CONSTRAINT `DoctorID_case` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PatientID_case` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `service` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Price` bigint NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `medicine` (
  `MedicineID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MedicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `designate` (
  `CaseID` int NOT NULL,
  `ServiceID` int NOT NULL,
  PRIMARY KEY (`CaseID`,`ServiceID`),
  KEY `ServiceID_designate_idx` (`ServiceID`),
  CONSTRAINT `CaseID_designate` FOREIGN KEY (`CaseID`) REFERENCES `case` (`CaseID`),
  CONSTRAINT `ServiceID_designate` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `prescription` (
  `MedicineID` int NOT NULL,
  `CaseID` int NOT NULL,
  PRIMARY KEY (`MedicineID`,`CaseID`),
  KEY `CaseID_prescription_idx` (`CaseID`),
  CONSTRAINT `CaseID_prescription` FOREIGN KEY (`CaseID`) REFERENCES `case` (`CaseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MedicineID_prescription` FOREIGN KEY (`MedicineID`) REFERENCES `medicine` (`MedicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Price` bigint NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci