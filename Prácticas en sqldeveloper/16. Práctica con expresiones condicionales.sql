// Visualizar los siguientes datos con CASE.
-- Si el departamento es 50 ponemos Transporte
-- Si el departamento es 90 ponemos Direcci�n
-- Cualquier otro n�mero ponemos �Otro departamento�

SELECT DEPARTMENT_ID AS "Departamento",
CASE DEPARTMENT_ID
    WHEN 50 THEN 'Transporte'
    WHEN 90 THEN 'Direcci�n'
    ELSE 'Otro departamento'
END AS "Actividad"
FROM EMPLOYEES;

// Mostrar de la tabla LOCATIONS, la ciudad y el pa�s. Ponemos los siguientes datos dependiendo de COUNTRY_ID.
-- Si es US y CA ponemos Am�rica del Norte
-- Si es CH, UK, DE,IT ponemos Europa
-- Si es BR ponemos Am�rica del Sur
-- Si no es ninguno ponemos �Otra zona�

SELECT CITY AS "Ciudad", COUNTRY_ID AS "ID Pa�s",
CASE
    WHEN COUNTRY_ID IN ('US','CA') THEN 'Am�rica del Norte'
    WHEN COUNTRY_ID IN ('CH','UK','DE','IT') THEN 'Europa'
    WHEN COUNTRY_ID = 'BR' THEN 'Am�rica del Sur'
    ELSE 'Otra zona'
END AS "Regi�n"
FROM LOCATIONS;

// Realizar el primer ejercicio con DECODE en vez de con CASE

SELECT DEPARTMENT_ID AS "Departamento",
DECODE (DEPARTMENT_ID, 50, 'Transporte', 90, 'Direcci�n', 'Otro departamento') AS "Actividad"
FROM EMPLOYEES;