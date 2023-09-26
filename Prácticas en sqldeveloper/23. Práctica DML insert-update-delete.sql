CREATE TABLE PRODUCTOS
(
 CODIGO NUMBER NOT NULL, 
 NOMBRE VARCHAR2(100) NOT NULL, 
 PRECIO NUMBER NOT NULL, 
 UNIDADES NUMBER,
 FECHA_ALTA DATE
);

// INSERT: Insertar los siguientes datos en la tabla, indicando todas las columnas
Código 1
Nombre tornillos
Precio 100
Unidades 10
Fecha_alta 01-09-2017

INSERT INTO PRODUCTOS (CODIGO, NOMBRE, PRECIO, UNIDADES, FECHA_ALTA) VALUES (1, 'Tornillos', 100, 10, '01-09-2017');

// Insertar los siguientes datos en la tabla, sin indicar las columnas
Código 2
Nombre Tuercas
Precio 50
Unidades 5
Fecha_alta 01-10-2009

INSERT INTO PRODUCTOS VALUES (2, 'Tuercas', 50, 5, '01-10-2019');


// Insertar los siguientes datos en la tabla
Código 3
Nombre Martillo
Precio 90

INSERT INTO PRODUCTOS (CODIGO, NOMBRE, PRECIO) VALUES (2, 'Martillo', 90);

// ¿Este INSERT funciona? En el caso de que no funcione, solucionarlo
/*
INSERT INTO PRODUCTOS (CODIGO,NOMBRE,unidades)
VALUES (4,'Arandela',10);
*/

INSERT INTO PRODUCTOS (CODIGO, NOMBRE, unidades) VALUES (4, 'Arandela', 10); -- precio no puede ser NULL

ALTER TABLE PRODUCTOS
MODIFY PRECIO NUMBER NULL; -- para que tolere null

INSERT INTO PRODUCTOS (CODIGO, NOMBRE, PRECIO, UNIDADES) VALUES (4, 'Arandela', NULL,10); 


CREATE TABLE PRODUCTOS2
(CODE NUMBER,
NAME VARCHAR2(100));

// Insertar en la tabla PRODUCTOS2 las filas de la tabla PRODUCTOS que tengan más de 8 unidades. Comprobar las filas

INSERT INTO PRODUCTOS2 (CODE, NAME)
                SELECT CODIGO, PRODUCTO FROM PRODUCTOS WHERE UNIDADES>8;

// Modificar el campo NOMBRE de la tabla PRODUCTOS y poner en mayúsculas el nombre de aquellas filas que valgan más de 50. Comprobar el resultado
ALTER TABLE PRODUCTOS
RENAME COLUMN NOMBRE TO PRODUCTO;


UPDATE PRODUCTOS
SET PRODUCTO = UPPER(PRODUCTO)
    WHERE PRECIO>50;

// Modificar el precio de la tabla productos de aquellas filas cuyo nombre comienza por ‘T’. Debemos incrementarlo en 5. Comprobar el resultado
UPDATE PRODUCTOS
SET PRECIO = PRECIO + 5
    WHERE UPPER(PRODUCTO) LIKE 'T%';

// Borrar las filas de la tabla productos que tengan menos de 10 unidades o un valor nulo. Comprobar el resultado
DELETE PRODUCTOS
WHERE UNIDADES < 10 OR UNIDADES IS NULL;


// Truncar la tabla PRODUCTOS2. Comprobar el resultado
TRUNCATE TABLE PRODUCTOS2;

SELECT * FROM PRODUCTOS;
SELECT * FROM PRODUCTOS2;