// Crear una vista llamada CIUDADES_GRANDES con las ciudades que tengan más de 3.000.000 de habitantes
CREATE VIEW CIUDADES_GRANDES
AS SELECT * FROM CIUDADES
WHERE POBLACION > 3000000; -- View CIUDADES_GRANDES creado.

// Comprobar que funciona
SELECT * FROM CIUDADES_GRANDES;
/*  1	NUEVA YORK	    4000000	28
    3	LOS ANGELES 	3245678	28
    5	MARSELLA	    4567890	29
    7	FLORENCIA	    3987654	40          */

// Crear una vista llamada CIUDADES_USA con las ciudades de Estados Unidos (código 18 según la práctica anterior)
CREATE VIEW CIUDADES_USA
AS SELECT * FROM CIUDADES
WHERE COD_PAIS = 28; -- View CIUDADES_USA creado.

// Comprobar que funciona
SELECT * FROM CIUDADES_USA;
/*      1	NUEVA YORK	    4000000	28
        3	LOS ANGELES 	3245678	28
        4	CHICAGO	        2132456	28     */

// Borrar las dos vistas
DROP VIEW CIUDADES_GRANDES; -- View CIUDADES_GRANDES borrado.
DROP VIEW CIUDADES_USA; -- View CIUDADES_USA borrado.

// Crear un índice en la tabla ciudades sobre el nombre de la ciudad
CREATE INDEX INDEXCIUD ON CIUDADES (NOMBRE); -- Index INDEXCIUD creado.

// Crear una secuencia denominada SEQ1, que comience por 1 y que devuelve números de 5 en cinco.
CREATE SEQUENCE SEQ1 INCREMENT BY 5
MINVALUE 1 CACHE 30; -- Sequence SEQ1 creado.

SELECT SEQ1.NEXTVAL FROM DUAL;

// Insertar un par de países usando la secuencia como clave primaria, en vez de poner un número directamente
INSERT INTO PAISES VALUES (SEQ1.NEXTVAL,'PERU');
INSERT INTO PAISES VALUES (SEQ1.NEXTVAL,'BOLIVIA');
INSERT INTO PAISES VALUES (SEQ1.NEXTVAL,'URUGUAY');

// Comprobar el resultado
SELECT * FROM PAISES ORDER BY COD_PAIS;

/*      1	PERU
        6	BOLIVIA
        11	URUGUAY
        28	ESTADOS UNIDOS
        29	FRANCIA
        40	ITALIA             */