DROP TABLE product;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Price` bigint NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Productname` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Category` int NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `designate_list` 
ADD COLUMN `Description` VARCHAR(100) NULL AFTER `DesignateID`,
ADD COLUMN `Result` VARCHAR(100) NOT NULL AFTER `Description`,
ADD COLUMN `Status` INT NOT NULL AFTER `Result`;
ALTER TABLE `designate` 
DROP COLUMN `Result`,
DROP COLUMN `Status`,
DROP COLUMN `Description`;