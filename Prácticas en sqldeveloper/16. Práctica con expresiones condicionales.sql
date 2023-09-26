// Visualizar los siguientes datos con CASE.
-- Si el departamento es 50 ponemos Transporte
-- Si el departamento es 90 ponemos Dirección
-- Cualquier otro número ponemos “Otro departamento”

SELECT DEPARTMENT_ID AS "Departamento",
CASE DEPARTMENT_ID
    WHEN 50 THEN 'Transporte'
    WHEN 90 THEN 'Dirección'
    ELSE 'Otro departamento'
END AS "Actividad"
FROM EMPLOYEES;

// Mostrar de la tabla LOCATIONS, la ciudad y el país. Ponemos los siguientes datos dependiendo de COUNTRY_ID.
-- Si es US y CA ponemos América del Norte
-- Si es CH, UK, DE,IT ponemos Europa
-- Si es BR ponemos América del Sur
-- Si no es ninguno ponemos ‘Otra zona’

SELECT CITY AS "Ciudad", COUNTRY_ID AS "ID País",
CASE
    WHEN COUNTRY_ID IN ('US','CA') THEN 'América del Norte'
    WHEN COUNTRY_ID IN ('CH','UK','DE','IT') THEN 'Europa'
    WHEN COUNTRY_ID = 'BR' THEN 'América del Sur'
    ELSE 'Otra zona'
END AS "Región"
FROM LOCATIONS;

// Realizar el primer ejercicio con DECODE en vez de con CASE

SELECT DEPARTMENT_ID AS "Departamento",
DECODE (DEPARTMENT_ID, 50, 'Transporte', 90, 'Dirección', 'Otro departamento') AS "Actividad"
FROM EMPLOYEES;