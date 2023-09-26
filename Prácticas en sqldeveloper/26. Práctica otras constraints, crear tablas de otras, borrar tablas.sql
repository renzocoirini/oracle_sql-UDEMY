// Crear la siguiente tabla PAISES
/*
COD_PAIS NUMBER PRIMARY KEY
NOMBRE VARCHAR2(100) NOT NULL (TENEMOS QUE CREAR UNA CONSTRAINT DE TIPO CHECK QUE OBLIGUE A PONER EL DATO EN MAYÚSCULAS)
*/
CREATE TABLE PAISES
(
COD_PAIS NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(100) NOT NULL CHECK (NOMBRE=UPPER(NOMBRE))
); -- Table PAISES creado.

// Crear la siguiente tabla CIUDADES con las siguientes características
/*
COD_CIUDAD NUMBER PRIMARY KEY
NOMBRE VARCHAR2(100) NOT NULL (TENEMOS QUE CREAR UNA CONSTRAINT DE TIPO CHECK QUE OBLIGUE A PONER EL DATO EN MAYÚSCULAS)
POBLACION NUMBER NOT NULL (EL VALOR DEBE SER MAYOR A 0)
COD_PAIS NUMBER (DEBE SER FOREIGN KEY DE LA TABLA CIUDADES)
*/

CREATE TABLE CIUDADES
(
COD_CIUDAD NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(100) NOT NULL CHECK (NOMBRE=UPPER(NOMBRE)),
POBLACION NUMBER NOT NULL CHECK (POBLACION > 0),
COD_PAIS NUMBER,
CONSTRAINT FK_COD_PAIS FOREIGN KEY (COD_PAIS) REFERENCES PAISES (COD_PAIS)
); -- Table CIUDADES creado.

DESC CIUDADES;

// Insertar una fila en PAISES, por ejemplo 28, ESTADOS UNIDOS
INSERT INTO PAISES VALUES (28,'ESTADOS UNIDOS'); -- 1 fila insertadas.

// Insertar otra fila con el nombre en minúsculas, por ejemplo 29, Francia. Debe generar un error de CHEK.
INSERT INTO PAISES VALUES (29,'Francia'); -- Error:
/* Error que empieza en la línea: 31 del comando :
INSERT INTO PAISES VALUES (29,'Francia')
Informe de error -
ORA-02290: restricción de control (HR.SYS_C008261) violada */

// Grabar la fila correctamente.
INSERT INTO PAISES VALUES (29,'FRANCIA'); -- 1 fila insertadas.

// Insertar alguna fila en la tabla CIUDADES, por ejemplo (1,NUEVA YORK,4000000,18) Debe funcionar correctamente porque cumple todas las constraints
INSERT INTO CIUDADES VALUES (1,'NUEVA YORK',4000000,18);
SELECT * FROM PAISES WHERE COD_PAIS = 18; -- el ejemplo dado no lo puedo agregar porque no existe un COD_PAIS en tabla PAISES igual a 18

INSERT INTO CIUDADES VALUES (1,'NUEVA YORK',4000000,28); -- 1 fila insertadas.

// Intentar insertar una fila de algún país que no exista. Por ejemplo (2,ROMA,3000000,40). Debe generar un error ya que el país 40 no existe en la tabla PAISES
INSERT INTO CIUDADES VALUES (2,'ROMA',3000000,40); -- da error:
/* Error que empieza en la línea: 51 del comando :
INSERT INTO CIUDADES VALUES (2,'ROMA',3000000,40)
Informe de error -
ORA-02291: restricción de integridad (HR.FK_COD_PAIS) violada - clave principal no encontrada */

// Insertar ITALIA con el código 40 en la tabla PAISES
INSERT INTO PAISES VALUES (40,'ITALIA'); -- 1 fila insertadas.
INSERT INTO PAISES VALUES (3,'ARGENTINA');

// Volver a insertar la fila con ROMA. Debería funcionar.
INSERT INTO CIUDADES VALUES (2,'ROMA',3000000,40); -- 1 fila insertadas.

// Intentar grabar una ciudad con el nombre en minúsculas. Debe generar un error
INSERT INTO CIUDADES VALUES (2,'Casilda',3000000,28); -- da error:
/* Error que empieza en la línea: 64 del comando :
INSERT INTO CIUDADES VALUES (2,'Casilda',3000000,28)
Informe de error -
ORA-02290: restricción de control (HR.SYS_C008277) violada */ 

// Intentar grabar una ciudad con una población de 0. Debe generar un error
INSERT INTO CIUDADES VALUES (2,'Casilda',0,28); -- da error:
/* Error que empieza en la línea: 71 del comando :
INSERT INTO CIUDADES VALUES (2,'Casilda',0,28)
Informe de error -
ORA-02290: restricción de control (HR.SYS_C008278) violada */ 

// Insertamos varias ciudades con poblaciones entre 1.000.000 y 5.000.000
INSERT INTO CIUDADES VALUES (3,'LOS ANGELES ',3245678,28);
INSERT INTO CIUDADES VALUES (4,'CHICAGO',2132456,28);
INSERT INTO CIUDADES VALUES (5,'MARSELLA',4567890,29);
INSERT INTO CIUDADES VALUES (6,'VENECIA',1789123,40);
INSERT INTO CIUDADES VALUES (7,'FLORENCIA',3987654,40);

// Creamos una tabla denominada CIUDADES_PEQUE, basada en CIUDADES, pero solo con las que tengan una población inferior a 2.000.000. Lo hacemos mediante la opción de crear una tabla basada en otra
CREATE TABLE CIUDADES_PEQUE
AS SELECT * FROM CIUDADES
WHERE POBLACION < 2000000; -- Table CIUDADES_PEQUE creado.


// Añadimos la clave primaria a CIUDADES_PEQUE sobre la columna CODIGO
ALTER TABLE CIUDADES_PEQUE
ADD CONSTRAINT PRIMARY KEY (COD_CIUDAD);

ALTER TABLE CIUDADES_PEQUE
MODIFY COD_CIUDAD PRIMARY KEY; -- Table CIUDADES_PEQUE alterado.

// Añadimos una nueva columna a la tabla llamada BANDERA de tipo VARCHAR2(100)
ALTER TABLE CIUDADES_PEQUE
ADD BANDERA VARCHAR2(100);

// Añadimos alguna fila y comprobamos el resultado
INSERT INTO CIUDADES_PEQUE VALUES (1,'Casilda',45000,3,'Blanca'); -- 1 fila insertadas.

// Eliminamos la columna BANDERA
ALTER TABLE CIUDADES_PEQUE
DROP (BANDERA); -- Table CIUDADES_PEQUE alterado.

// Borramos la tabla CIUDADES_PEQUE
DROP TABLE CIUDADES_PEQUE; -- Table CIUDADES_PEQUE borrado.