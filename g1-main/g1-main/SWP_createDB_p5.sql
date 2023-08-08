ALTER TABLE `first_priority_patient_list` 
ADD COLUMN `Status` INT NOT NULL AFTER `DoctorID`;
ALTER TABLE `normal_priority_patient_list` 
ADD COLUMN `Status` INT NOT NULL AFTER `PatientID`;
ALTER TABLE `product` 
ADD COLUMN `Image` VARCHAR(100) NOT NULL AFTER `Description`;
DROP TABLE `product_image`;
CREATE TABLE `service` (
  `ServiceID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `Content` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ServiceID`));
ALTER TABLE `case` 
ADD COLUMN `Time` TIME NOT NULL AFTER `Date`;
DROP TABLE `news_image`;
ALTER TABLE `swp391_g1`.`news` 
ADD COLUMN `Image1` VARCHAR(45) NOT NULL AFTER `Author`,
ADD COLUMN `Image2` VARCHAR(45) NOT NULL AFTER `Image1`;