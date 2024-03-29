-- Funcion ventas $$ por medio de pago

DELIMITER //
CREATE FUNCTION VENTAS_PAGO(PAGO INT)
RETURNS INT
READS SQL DATA
BEGIN 
	DECLARE TOTAL INT;
    SET TOTAL = (
		SELECT SUM(AMOUNT)
		FROM TICKET 
		WHERE ID_PAY LIKE PAGO);
    RETURN TOTAL;
END //
DELIMITER ;

SELECT VENTAS_PAGO(1) AS VENTAS_TC;
SELECT VENTAS_PAGO(2) AS VENTAS_TD;
SELECT VENTAS_PAGO(3) AS VENTAS_CASH;

-- Funcion compras $$ por proveedor

DELIMITER //
CREATE FUNCTION COMPRAS_PROVEEDOR(PROVEEDOR INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE TOTAL INT;
	SET TOTAL = (
		SELECT SUM(AMOUNT)
        FROM PURCHASE
        WHERE ID_SUPPLIER LIKE PROVEEDOR);
	RETURN TOTAL;
END //
DELIMITER ;

SELECT COMPRAS_PROVEEDOR(1) AS COMPRAS_DELNORTE;
SELECT COMPRAS_PROVEEDOR(2) AS COMPRAS_PRISMA;
SELECT COMPRAS_PROVEEDOR(3) AS COMPRAS_JUANCITO;

-- Funcion cantidad de ventas por empleado

DELIMITER // 
CREATE FUNCTION VENTAS_EMPLEADOS(EMPLEADO INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE TOTAL INT;
    SET TOTAL = (
		SELECT COUNT(ID_EMPLOYEE)
        FROM ORDERS
        WHERE ID_EMPLOYEE LIKE EMPLEADO);
	RETURN TOTAL;
END;
//

SELECT VENTAS_EMPLEADOS(1) AS VENTAS_EMPLEADO;
SELECT VENTAS_EMPLEADOS(2) AS VENTAS_EMPLEADO;
SELECT VENTAS_EMPLEADOS(3) AS VENTAS_EMPLEADO;

