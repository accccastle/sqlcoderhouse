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
    PRICE decimal,
    ID_PRODUCT int NOT NULL,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
    );
    
-- Alter Table Menu
ALTER TABLE Menu ADD DISH_NAME varchar(100);
ALTER TABLE Menu ADD DISH_INGREDIENTS varchar(10);
ALTER TABLE Menu MODIFY COLUMN ID_PRODUCT int;

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
    
/*Stock table
CREATE TABLE Stock(
	STOCK int PRIMARY KEY,
    ID_PRODUCT int,
    FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
    );

ALTER TABLE STOCK ADD QUANTITY INT;
ALTER TABLE STOCK ADD PRODUCT_NAME VARCHAR(100);

DROP TABLE STOCK; 
*/
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
    
-- Insert Branches
INSERT INTO Branches VALUES (NULL,'Belgrano','Av Cabildo 1238');
INSERT INTO Branches VALUES (NULL,'Palermo','Costa Rica 6038');
INSERT INTO Branches VALUES (NULL,'Monserrat','Av Rivadavia 1298');

-- Insert Employees
INSERT INTO Employees VALUES (NULL,'ROBERTO','GOMEZ','MAÑANA','COCINA');
INSERT INTO Employees VALUES (NULL,'MIGUEL','ROMERO','TARDE','COCINA');
INSERT INTO Employees VALUES (NULL,'ROMINA','SOSA','NOCHE','COCINA');
INSERT INTO Employees VALUES (NULL,'ALBERTO','DIAZ','MAÑANA','MOZO');
INSERT INTO Employees VALUES (NULL,'MANUEL','PEREZ','TARDE','MOZO');
INSERT INTO Employees VALUES (NULL,'GREGORIO','TORRES','NOCHE','MOZO');
INSERT INTO Employees VALUES (NULL,'SIMON','FLORES','MAÑANA','AYUDANTE');
INSERT INTO Employees VALUES (NULL,'DANIELA','ACOSTA','TARDE','AYUDANTE');
INSERT INTO Employees VALUES (NULL,'FLORENCIA','ROJAS','NOCHE','AYUDANTE');

-- Insert Menu
INSERT INTO Menu VALUES (NULL,1460,NULL,'Empanada carbon activado','16,24');
INSERT INTO Menu VALUES (NULL,2620,NULL,'Dumplings','19,18,12');
INSERT INTO Menu VALUES (NULL,2490,NULL,'Baos','17,27,22');
INSERT INTO Menu VALUES (NULL,2630,NULL,'Nachos','25,7,12');
INSERT INTO Menu VALUES (NULL,2630,NULL,'Tacos poblanos','25,12');
INSERT INTO Menu VALUES (NULL,2690,NULL,'Palta masala','25,32,26');
INSERT INTO Menu VALUES (NULL,2620,NULL,'Berenjena gratinada','23,30,29');
INSERT INTO Menu VALUES (NULL,2540,NULL,'Samosas','14,13');
INSERT INTO Menu VALUES (NULL,4060,NULL,'Spaghetti asiático','31,10,29');
INSERT INTO Menu VALUES (NULL,4060,NULL,'Ravioles de boniato','15,16');
INSERT INTO Menu VALUES (NULL,3740,NULL,'Mezze bowl','5,14,33');
INSERT INTO Menu VALUES (NULL,3830,NULL,'Hamburguesa Sacro','9,1,4');
INSERT INTO Menu VALUES (NULL,2050,NULL,'Tartita de chocolate','8,22');
INSERT INTO Menu VALUES (NULL,2110,NULL,'Palta lime pie','25,20,28');

-- Insert Payment
INSERT INTO Payment VALUES(NULL,'CREDIT','TC');
INSERT INTO Payment VALUES(NULL,'DEBIT','DEB');
INSERT INTO Payment VALUES(NULL,'CASH','CH');

-- Insert Suppliers
INSERT INTO Suppliers VALUES (NULL,'Frutas del Norte');
INSERT INTO Suppliers VALUES (NULL,'Verduleria Prisma');
INSERT INTO Suppliers VALUES (NULL,'Verduras Juancito'); 

-- Insert Clients Table Data Import
-- Insert Orders Table Data Import
-- Insert Products Table Data Import
-- Insert Purchase Table Data Import
-- Insert Ticket Table Data Import   