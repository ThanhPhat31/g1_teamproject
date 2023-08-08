ALTER TABLE `medicine` 
ADD COLUMN `Price` INT NOT NULL AFTER `Description`;
ALTER TABLE `prescription` 
ADD COLUMN `Quantity` INT NOT NULL AFTER `CaseID`;
ALTER TABLE `service` 
ADD COLUMN `Image` VARCHAR(45) NULL AFTER `Content`;
