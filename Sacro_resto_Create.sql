CREATE SCHEMA sacro_resto;

USE sacro_resto;

-- Clients table
CREATE TABLE Clients(
	ID_CLIENT int NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100)
    );

-- Employees table
CREATE TABLE Employees(
	ID_EMPLOYEE int NOT NULL auto_increment PRIMARY KEY,
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100),
    SHIFT varchar(50),
    JOB varchar(100)
    );
    
-- Branches table
CREATE TABLE Branches(
	ID_BRANCH int NOT NULL auto_increment PRIMARY KEY,
    NAME_BRANCH varchar(100),
    ADDRESS varchar(200)
    );

-- Payment table
CREATE TABLE Payment(
	ID_PAY int NOT NULL auto_increment PRIMARY KEY,
    NAME_PAY varchar(100),
    SHORT_NAME varchar(10)
    );
 
 -- Products table
CREATE TABLE Products(
	ID_PRODUCT int NOT NULL auto_increment PRIMARY KEY,
    NAME_PRODUCT varchar(150),
    SHORT_NAME varchar(20)
    );
 
-- Suppliers table
CREATE TABLE Suppliers(
	ID_SUPPLIER int NOT NULL auto_increment PRIMARY KEY,
    NAME_SUPPLIER varchar(200)
    );
    
-- Menu table
CREATE TABLE Menu(
	ID_DISH int NOT NULL auto_increment PRIMARY KEY,
    DISH_NAME varchar(100),
    PRICE decimal
    );    

-- Dish ingredients table

create table Dish_ingredients(
	ID int not null auto_increment primary key,
	ID_DISH int not null,
	ID_PRODUCT int not null,
	foreign key(id_dish) references menu(id_dish),
	foreign key(id_product) references products(id_product)
	);

-- Orders table    
CREATE TABLE Orders(
	ID_ORDER int NOT NULL auto_increment PRIMARY KEY,
    ID_EMPLOYEE int,
    ID_CLIENT int,
    ID_BRANCH int,
    ID_DISH int,
    FOREIGN KEY(ID_EMPLOYEE) REFERENCES EMPLOYEES(ID_EMPLOYEE),
    FOREIGN KEY(ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT),
    FOREIGN KEY(ID_BRANCH) REFERENCES BRANCHES(ID_BRANCH),
    FOREIGN KEY(ID_DISH) REFERENCES MENU(ID_DISH)
    );
    
-- Ticket table
CREATE TABLE Ticket(
	ID_BILL int NOT NULL auto_increment PRIMARY KEY,
    ID_PAY int,
    ID_ORDER int,
    AMOUNT decimal,
    DATE date,
    FOREIGN KEY(ID_PAY) REFERENCES PAYMENT(ID_PAY), 
    FOREIGN KEY(ID_ORDER) REFERENCES ORDERS(ID_ORDER)
    );
 
-- Stock table 
CREATE TABLE Stock(
	ID_STOCK int PRIMARY KEY NOT NULL auto_increment,
    ID_PRODUCT int,
    NAME_PRODUCT varchar(100),
	STOCK int,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
    );
    
-- Purchase table
CREATE TABLE Purchase(
	ID_INVOICE int NOT NULL auto_increment PRIMARY KEY,
    ID_PRODUCT int,
    ID_SUPPLIER int,
	ADD_STOCK int,
    AMOUNT decimal,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT),
    FOREIGN KEY(ID_SUPPLIER) REFERENCES SUPPLIERS(ID_SUPPLIER)
	);
    
-- Log table

CREATE TABLE _log(
	ID_LOG INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ENTITY VARCHAR(20),
    ID_ENTITY INT,
    DATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    USER VARCHAR (200) NOT NULL,
    ACTION VARCHAR(100) NOT NULL
);


SELECT * FROM Branches;
SELECT * FROM Clients;
SELECT * FROM Dish_Ingredients;
SELECT * FROM Employees;
SELECT * FROM Menu;
SELECT * FROM Orders;
SELECT * FROM Payment;
SELECT * FROM Products;
SELECT * FROM Purchase;
SELECT * FROM Stock;
SELECT * FROM Suppliers;
SELECT * FROM Ticket;