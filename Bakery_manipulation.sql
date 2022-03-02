-- Data Manipulation

-- Customers
SELECT * FROM `customers`;

INSERT INTO `customers` (`customerFName`,`customerLName`, `customerPhone`, `customerEmail`, `customerZIP`)
VALUES (:fnameInput, :lnameInput, :phoneInput, :emailInput, :zipInput);

UPDATE `customers`
SET `customerFName` = :fnameInput, `customerLName`, = :lnameInput, `customerPhone` = :inputPhone, `customerEmail` = :inputEmail, `customerZIP` = :inputZip)
WHERE `customerID` = :customerIDInput;

DELETE FROM `customers` WHERE `customerID` = :customerIDInput;


-- Employees
SELECT * FROM `employees`;

INSERT INTO 'employees' (`employeeFName`, `employeeLName`, `employeePhone`, `employeeManager`)
VALUES (:fnameInput, :lnameInput, :inputPhone, :managerInput);

UPDATE `employees`
SET `employeeFName` = :fnameInput, `employeeLName` = :lnameInput, `employeePhone` = :inputPhone, `employeeManager` = managerInput)
WHERE `employeeID` = :employeeIDInput;

DELETE FROM `employees` WHERE `employeeID` = :employIDInput;


-- Orders
SELECT * FROM `orders`;

INSERT INTO `orders` (`employeeID`, `customerID`, `orderDate`, `orderPrice`) 
VALUES (:employeeID, :customerID, :orderDate, :orderPrice);

UPDATE `orders`
SET `employeeID` = :employeeID, `customerID` = :cusomerID, `orderDate` = :orderDate, `orderPrice` = :orderPrice
WHERE `orderID`= :orderID;

DELETE FROM `orders` WHERE `orderID` = :orderID;


-- ProductCategories
INSERT INTO `productCategories` (`categoryName`)
VALUES (:categoryName);

UPDATE `productCategories`
SET `categoryName` = :categoryName
WHERE `categoryID` = :categoryID;

DELETE FROM `productCategories` WHERE `categotyID` = :categoryID;


-- Products
SELECT * FROM `products`;

INSERT INTO `products` (`productName`, `productPrice`, `productCalorie`,`productCategory`)
VALUES (:productName, :productPrice, :productCalorie, :productCategory);

UPDATE `products`
SET `productName` = :productName, `productPrice` = :productPrice, `productCalorie` = :productCalorie, `productCategory` = :productCategory
WHERE `productID` = :productID;

DELETE FROM `products` WHERE `productID` = :productID;


-- ProductOrders

SELECT * FROM `productOrders`;

INSERT INTO `productOrders` (`orderID`, `productID`)
VALUES (:orderID, :productID);

UPDATE `productOrders`
SET `orderID` = :orderID, `productID` = :productID
WHERE (`orderID`, `productID`) = (:orderID, :productID);

DELETE FROM `productOrders` WHERE (`orderID`, `productID`) = (:orderID, :productID);
