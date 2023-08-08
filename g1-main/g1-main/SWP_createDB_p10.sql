CREATE TABLE `order` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(100) NOT NULL,
  `PatientID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `PatientID_Order_idx` (`PatientID` ASC) VISIBLE,
  CONSTRAINT `PatientID_Order`
    FOREIGN KEY (`PatientID`)
    REFERENCES `swp391_g1`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `orderdetail` (
  `OrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NOT NULL,
  `Total` INT NULL,
  `ProductID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  INDEX `OrderID_OrderDetail_idx` (`OrderID` ASC) VISIBLE,
  INDEX `ProductID_OrderDetail_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `OrderID_OrderDetail`
    FOREIGN KEY (`OrderID`)
    REFERENCES `swp391_g1`.`order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ProductID_OrderDetail`
    FOREIGN KEY (`ProductID`)
    REFERENCES `swp391_g1`.`product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
