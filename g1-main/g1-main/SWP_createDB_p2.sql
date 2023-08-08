ALTER TABLE `swp391_g1`.`product` 
ADD COLUMN `Image` VARCHAR(100) NULL AFTER `Description`;

CREATE TABLE `swp391_g1`.`news` (
  `NewsID` INT NOT NULL AUTO_INCREMENT,
  `Category` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Content` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NewsID`));
