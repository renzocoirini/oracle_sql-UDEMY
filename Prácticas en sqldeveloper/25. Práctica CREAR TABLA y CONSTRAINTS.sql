// Crear la siguiente tabla usando el comando CREATE TABLE
CREATE TABLE PRACTICA1
(
COD_MATRICULA NUMBER,
NOMBRE VARCHAR2(20),
APELLIDO1 VARCHAR2(20),
APELLIDO2 VARCHAR2(20),
EDADI NUMBER,
FECHA_MATRICULA DATE
);

// Comprobar con el comando DESC que existe y que tiene esa estructura
DESC PRACTICA1;
-- la tiene

// Crear una tabla denominada CENTROS, con la siguiente estructura.
CREATE TABLE CENTROS
(
CODIGO_CENTRO NUMBER,
NOMBRE VARCHAR2(100),
PROVINCIA VARCHAR2(100) DEFAULT 'MADRID',
FECHA_ALTA DATE DEFAULT SYSDATE,
NUM_ALUMNOS NUMBER DEFAULT 0
);

// Insertar una fila que no tengo los tres últimos campos y comprobar que lo genera de forma automática.
INSERT INTO CENTROS (CODIGO_CENTRO, NOMBRE) VALUES (1,'INGENIERIA');
SELECT * FROM CENTROS; -- se pusieron los valores de DEFAULT

// Crear la siguiente tabla con las características indicadas
    /*
    Tabla CURSOS
    ? COD_CURSO NUMBER Y CLAVE PRIMARIA
    ? NOMBRE VARCHAR2(100) NO PUEDE SER NULO Y DEBE SER ÚNICO
    ? RESPONSABLE VARCHAR2(100)
    o Insertar algunas filas y comprobar que funciona la calve primaria y la clave única/not null
    */
CREATE TABLE CURSOS
(
COD_CURSO NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(100) NOT NULL UNIQUE,
RESPONSABLE VARCHAR2(100)
);
DESC CURSOS;
-- creada correctamente

// chequeo columna COD_CURSO (primary key)
    INSERT INTO CURSOS VALUES (1,'RENZO','JOSEFINA'); -- creado correctamente 
    INSERT INTO CURSOS VALUES (1,'JUAN','ROSA'); -- da error:
/*
 Error que empieza en la línea: 47 del comando :
    INSERT INTO CURSOS VALUES (1,'JUAN','ROSA')
Informe de error -
ORA-00001: restricción única (HR.SYS_C008258) violada
*/
    
// chequeo columna NOMBRE (UNIQUE y NOT NULL)
    INSERT INTO CURSOS (COD_CURSO,NOMBRE,RESPONSABLE) VALUES (2,NULL,'MARIA');-- da error:
/*
Error que empieza en la línea: 56 del comando -
    INSERT INTO CURSOS (COD_CURSO,NOMBRE,RESPONSABLE) VALUES (2,NULL,'MARIA')
Error en la línea de comandos : 56 Columna : 65
Informe de error -
Error SQL: ORA-01400: no se puede realizar una inserción NULL en ("HR"."CURSOS"."NOMBRE")
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
*/

    INSERT INTO CURSOS VALUES (2,'RENZO','JOSEFINA'); -- da error porque RENZO ya se uso en la clave UNIQUE
/*
Error que empieza en la línea: 68 del comando :
    INSERT INTO CURSOS VALUES (2,'RENZO','JOSEFINA')
Informe de error -
ORA-00001: restricción única (HR.SYS_C008259) violada
*/
    
SELECT * FROM CURSOS;