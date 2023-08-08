ALTER TABLE `tenDB`.`profile` 
DROP FOREIGN KEY `Account_profile`;
ALTER TABLE `tenDB`.`profile` 
ADD COLUMN `Password` VARCHAR(45) NOT NULL AFTER `Account`,
ADD COLUMN `Role` INT NOT NULL AFTER `Password`,
CHANGE COLUMN `Phone` `Phone` BIGINT NOT NULL ,
DROP INDEX `Account_idx` ;
;
DROP TABLE `tenDB`.`account`
;
ALTER TABLE `tenDB`.`designate` 
RENAME TO  `tenDB`.`designate_list` 
;
ALTER TABLE `swp391_g1`.`service` 
CHANGE COLUMN `ServiceID` `DesignateID` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `Description` `Description` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL , RENAME TO  `swp391_g1`.`designate` 
;
ALTER TABLE `swp391_g1`.`product` 
ADD COLUMN `Name` VARCHAR(100) NOT NULL AFTER `ProductID`,
ADD COLUMN `Category` INT NOT NULL AFTER `Name`,
ADD COLUMN `Quantity` INT NOT NULL AFTER `Price`
;
CREATE TABLE `swp391_g1`.`normal_priority_patient_list` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `ProfileID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ProfileID_idx` (`ProfileID` ASC) VISIBLE,
  CONSTRAINT `ProfileID_nppl`
    FOREIGN KEY (`ProfileID`)
    REFERENCES `swp391_g1`.`profile` (`ProfileID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
CREATE TABLE `swp391_g1`.`first_priority_patient_list` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Booking_date` DATE NOT NULL,
  `Booking_time` TIME NOT NULL,
  `Appointment_date` DATE NOT NULL,
  `Appointment_time` TIME NOT NULL,
  `ProfileID` INT NOT NULL,
  `DoctorID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ProfileID_idx` (`ProfileID` ASC) VISIBLE,
  INDEX `DoctorID_idx` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `ProfileID_fppl`
    FOREIGN KEY (`ProfileID`)
    REFERENCES `swp391_g1`.`profile` (`ProfileID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DoctorID_fppl`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `swp391_g1`.`doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
ALTER TABLE `swp391_g1`.`normal_priority_patient_list` 
DROP FOREIGN KEY `ProfileID_nppl`
;
ALTER TABLE `swp391_g1`.`normal_priority_patient_list` 
CHANGE COLUMN `ProfileID` `PatientID` INT NOT NULL ,
ADD INDEX `PatientID_nppl_idx` (`PatientID` ASC) VISIBLE,
DROP INDEX `ProfileID_idx` 
;
ALTER TABLE `swp391_g1`.`normal_priority_patient_list` 
ADD CONSTRAINT `PatientID_nppl`
  FOREIGN KEY (`PatientID`)
  REFERENCES `swp391_g1`.`patient` (`PatientID`);
ALTER TABLE `swp391_g1`.`first_priority_patient_list` 
DROP FOREIGN KEY `ProfileID_fppl`
;
ALTER TABLE `swp391_g1`.`first_priority_patient_list` 
CHANGE COLUMN `ProfileID` `PatientID` INT NOT NULL ,
ADD INDEX `PatientID_fppl_idx` (`PatientID` ASC) VISIBLE,
DROP INDEX `ProfileID_idx` 
;
ALTER TABLE `swp391_g1`.`first_priority_patient_list` 
ADD CONSTRAINT `PatientID_fppl`
  FOREIGN KEY (`PatientID`)
  REFERENCES `swp391_g1`.`patient` (`PatientID`)
;
ALTER TABLE `swp391_g1`.`product` 
DROP COLUMN `Image`
;
CREATE TABLE `swp391_g1`.`product_image` (
  `ProductID` INT NOT NULL,
  `Image_name` VARCHAR(100) NOT NULL,
  `Path` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ProductID`, `Image_name`),
  CONSTRAINT `ProductID_image`
    FOREIGN KEY (`ProductID`)
    REFERENCES `swp391_g1`.`product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
DROP TABLE `swp391_g1`.`designate_list`
;
CREATE TABLE `swp391_g1`.`designate_list` (
  `CaseID` INT NOT NULL,
  `DesignateID` INT NOT NULL,  
  `Status` INT NOT NULL ,
  `Result` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`CaseID`, `DesignateID`),
  INDEX `DesignateID_list_idx` (`DesignateID` ASC) VISIBLE,
  CONSTRAINT `CaseID_list`
    FOREIGN KEY (`CaseID`)
    REFERENCES `swp391_g1`.`case` (`CaseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DesignateID_list`
    FOREIGN KEY (`DesignateID`)
    REFERENCES `swp391_g1`.`designate` (`DesignateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
CREATE TABLE `swp391_g1`.`news_image` (
  `NewsID` INT NOT NULL,
  `Image_name` VARCHAR(100) NOT NULL,
  `Path` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`NewsID`, `Image_name`),
  CONSTRAINT `NewsID_image`
    FOREIGN KEY (`NewsID`)
    REFERENCES `swp391_g1`.`news` (`NewsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
ALTER TABLE `swp391_g1`.`news` 
CHANGE COLUMN `Description` `Title` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `Content` `Content` VARCHAR(100) NOT NULL ,
ADD COLUMN `Date` DATE NOT NULL AFTER `Content`,
ADD COLUMN `Author` VARCHAR(45) NOT NULL AFTER `Date`;
;



