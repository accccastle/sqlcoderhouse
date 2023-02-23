CREATE SCHEMA sacro_resto;

-- Clients table
CREATE TABLE Clients(
	ID_CLIENT int NOT NULL auto_increment PRIMARY KEY,
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100),
    CUIL_CUIT varchar(50)
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
 
 -- Ticket table
CREATE TABLE Ticket(
	ID_BILL int NOT NULL auto_increment PRIMARY KEY,
    ID_PAY int,
    ID_CLIENT int,
    AMOUNT decimal,
    DATE date,
    FOREIGN KEY(ID_PAY) REFERENCES PAYMENT(ID_PAY), 
    FOREIGN KEY(ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT)
    );

-- Suppliers table
CREATE TABLE Suppliers(
	ID_SUPPLIER int NOT NULL auto_increment PRIMARY KEY,
    NAME_SUPPLIER varchar(200)
    );
    
-- Menu table    
CREATE TABLE Menu(
	ID_DISH int NOT NULL auto_increment PRIMARY KEY,
    PRICE decimal,
    ID_PRODUCT int,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
    );

-- Orders table    
CREATE TABLE Orders(
	ID_ORDER int NOT NULL auto_increment PRIMARY KEY,
    ID_EMPLOYEE int,
    ID_CLIENT int,
    ID_BRANCH int,
    ID_PAY int,
    ID_DISH int,
    ID_BILL int,
    FOREIGN KEY(ID_EMPLOYEE) REFERENCES EMPLOYEES(ID_EMPLOYEE),
    FOREIGN KEY(ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT),
    FOREIGN KEY(ID_BRANCH) REFERENCES BRANCHES(ID_BRANCH),
    FOREIGN KEY(ID_PAY) REFERENCES PAYMENT(ID_PAY),
    FOREIGN KEY(ID_DISH) REFERENCES MENU(ID_DISH),
    FOREIGN KEY(ID_BILL) REFERENCES TICKET(ID_BILL)
    );

-- Purchase table
CREATE TABLE Purchase(
	ID_INVOICE int NOT NULL auto_increment PRIMARY KEY,
    ID_PRODUCT int,
    ID_SUPPLIER int,
    AMOUNT decimal,
    STOCK int,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT),
    FOREIGN KEY(ID_SUPPLIER) REFERENCES SUPPLIERS(ID_SUPPLIER)
	);

-- Stock table
CREATE TABLE Stock(
	STOCK int PRIMARY KEY,
    ID_PRODUCT int
    );
    
    
