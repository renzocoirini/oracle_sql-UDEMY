// Abrir otro SqlDeveloper y entrar también como el usuario HR
// Entrar en el primer SqlDeveloper
// Realizar un insert en la tabla productos
-- INSERT INTO productos2 (code,name ) VALUES (1,'CLAVOS' );

INSERT INTO productos2 (code,name ) VALUES (1,'CLAVOS' );

// Comprobar que lo podemos ver

SELECT * FROM PRODUCTOS2;
COMMIT; -- se ve

// Acceder al otro SqlDeveloper. ¿Podemos ver la fila?
No se puede visualizar

// Volver al primer SqlDeveloper y realizar un commit

// Volvemos a acceder al otro SqlDeveloper. ¿Podemos ver ahora la fila?
Se ve la fila agregada

// Regresemos al primer SqlDeveloper
    -- Hacer un DELETE de la fila
DELETE FROM PRODUCTOS2
WHERE CODE=1;
    -- Comprobar que se ha borrado
SELECT * FROM PRODUCTOS2; -- no se ve
    -- Realizar un ROLLBACK
ROLLBACK;
    -- Comprobar que se ha recuperado.
SELECT * FROM PRODUCTOS2; -- se ve

// Vamos a probar un SAVEPOINT
    -- Realizamos estas dos operaciones
-- INSERT INTO productos2 ( code,name ) VALUES (2,'ARANDELAS' );
INSERT INTO productos2 ( code,name ) VALUES (2,'ARANDELAS' );
-- INSERT INTO productos2 ( code,name ) VALUES (3,'ESCARPIAS' );
INSERT INTO productos2 ( code,name ) VALUES (3,'ESCARPIAS' );
    -- Ponemos un SAVEPOINT
SAVEPOINT A;
    -- Comprobar que vemos las inserciones
SELECT * FROM PRODUCTOS2; -- se ve las dos inserciones
    -- Hacemos ahora esta operación
-- UPDATE PRODUCTOS2 SET NAME='TORNILLOS' WHERE CODE=3;
UPDATE PRODUCTOS2 SET NAME='TORNILLOS' WHERE CODE=3;
    -- Realizar una ROLLBACK hasta el SAVEPOINT anterior.
ROLLBACK TO SAVEPOINT A;
    -- Comprobar que solo ha desaparecido el UPDATE.
SELECT * FROM PRODUCTOS2; -- se volvió a llamar 'Escarpias' en code=3
    -- Hacer un COMMIT
COMMIT; -- en el otro sqldeveloper se ve el resultado luego del commit