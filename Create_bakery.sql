-- Data Definition Queries

-- Drop Existing Tables

DROP TABLE IF EXISTS `productOrders`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `productCategories`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `customers`;


-- Create Tables

CREATE TABLE `customers` (
    `customerID` INT(11) NOT NULL AUTO_INCREMENT,
    `customerFName` VARCHAR(255) NOT NULL,
    `customerLName` VARCHAR(255) NOT NULL,
    `customerPhone` VARCHAR(255) NOT NULL,
    `customerEmail` VARCHAR(255) NOT NULL,
    `customerZIP` INT(11) NOT NULL,
    PRIMARY KEY(`customerID`)
) ENGINE = InnoDB;

CREATE TABLE `employees` (
    `employeeID` INT(11) NOT NULL AUTO_INCREMENT,
    `employeeFName` VARCHAR(255) NOT NULL,
    `employeeLName` VARCHAR(255) NOT NULL,
    `employeePhone` VARCHAR(255) NOT NULL,
    `employeeManager` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY(`employeeID`)
) ENGINE = InnoDB;

CREATE TABLE `orders` (
    `orderID` INT(11) NOT NULL AUTO_INCREMENT,
    `employeeID` INT(11),
    `customerID` INT(11) NOT NULL,
    `orderDate` DATE NOT NULL,
    `orderPrice` INT(11) NOT NULL,
    PRIMARY KEY(`orderID`),
    FOREIGN KEY(`employeeID`) REFERENCES `employees` (`employeeID`)
        ON DELETE SET NULL,
    FOREIGN KEY(`customerID`) REFERENCES `customers` (`customerID`)
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `productCategories` (
    `categoryID` INT(11) NOT NULL AUTO_INCREMENT,
    `categoryName` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`categoryID`)
) ENGINE = InnoDB;

CREATE TABLE `products` (
    `productID` INT(11) NOT NULL AUTO_INCREMENT,
    `productName` VARCHAR(255) NOT NULL,
    `productPrice` INT(11) NOT NULL,
    `productCalorie` INT(11) NOT NULL,
    `productCategory` INT(11) NOT NULL,
    PRIMARY KEY(`productID`),
    FOREIGN KEY(`productCategory`) REFERENCES `productCategories` (`categoryID`)
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `productOrders` (
    `orderID` INT(11) NOT NULL,
    `productID` INT(11) NOT NULL,
    PRIMARY KEY(`orderID`, `productID`),
    FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
        ON DELETE CASCADE,
    FOREIGN KEY (`productID`) REFERENCES `products` (`productID`)
        ON DELETE CASCADE
) ENGINE = InnoDB;


-- Populate Tables


-- Customers
INSERT INTO `customers` (`customerFName`,`customerLName`, `customerPhone`, `customerEmail`, `customerZIP`) VALUES
('Lady', 'Gaga', '555-053-4242', 'ladygaga@ga.ga', 10001),
('Doja', 'Cat', '555-365-2228', 'doja@cat.net', 10002),
('Donald', 'Duck', '555-000-5050', 'donald@email.com', 10003),
('Bugs', 'Bunny', '555-222-1234', 'bugs@email.com', 10004);

-- Employees
INSERT INTO `employees` (`employeeFName`, `employeeLName`, `employeePhone`, `employeeManager`) VALUES
('Connor', 'Beer', '555-555-5551', 1),
('Elif', 'Seker', '555-555-5552', 1),
('Wilford', 'Brimley', '555-555-5553', 0),
('Humphrey', 'Bogart', '555-555-5554', 0),
('Rufus', 'Cat', '555-555-5555', 0),
('Romona', 'Pest', '555-555-5556', 0);

-- Orders
INSERT INTO `orders` (`employeeID`, `customerID`, `orderDate`, `orderPrice`) VALUES
(1, 1, '2022-02-02', 15),
(4, 3, '2022-02-02', 23),
(3, 2, '2022-02-03', 7),
(2, 4, '2022-02-03', 12);

-- Product Categories
INSERT INTO `productCategories` (`categoryName`) VALUES
('Drink'),
('Cake'),
('Pastry'),
('Icecream'),
('Bread'),
('Baked Good'),
('Cookie'),
('Pie'),
('Muffin'),
('Cupcake');

-- Products
INSERT INTO `products` (`productName`, `productPrice`, `productCalorie`, `productCategory`) VALUES
('Brownie', 4, 200, 6),
('Apple Pie', 12, 800, 8),
('Blueberry Muffin', 3, 130, 9),
('Red Velvet Cupcake', 15, 1200, 10),
('Coffee', 2, 1, 1),
('Milk', 2, 250, 1),
('Chocolate Chip Cookie', 1, 100, 7),
('Maple Bar', 2, 150, 3),
('Mint Chocolate Chip Icecream', 3, 250, 4),
('Cheesecake', 12, 1000, 2);

-- Product Orders
INSERT INTO `productOrders` (`orderID`, `productID`) VALUES
(1, 1),
(1, 8),
(1, 5),
(2, 6),
(3, 7),
(4, 3),
(4, 6);