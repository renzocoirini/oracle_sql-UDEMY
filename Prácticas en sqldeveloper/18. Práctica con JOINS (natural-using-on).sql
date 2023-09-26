// Visualizar el nombre del pa�s y el nombre de la regi�n. (tablas COUNTRIES y REGIONS). Usar un natural join
SELECT C.COUNTRY_NAME AS "Nombre del pa�s", R.REGION_NAME AS "Nombre de la regi�n"
FROM COUNTRIES C
NATURAL JOIN REGIONS R;
    
// Usando el ejemplo anterior visualizar tambi�n el nombre de la ciudad a�adiendo una nueva tabla (LOCATIONS)
SELECT R.REGION_NAME AS "Nombre de la regi�n", C.COUNTRY_NAME AS "Nombre del pa�s", L.CITY AS "Nombre de la ciudad"
FROM COUNTRIES C
NATURAL JOIN REGIONS R
NATURAL JOIN LOCATIONS L;

// Indicar el nombre del departamento y la media de sus salarios
SELECT D.DEPARTMENT_NAME AS "Nombre del departamento", ROUND(AVG(E.SALARY),2) AS "Media de los salarios"
FROM DEPARTMENTS D JOIN EMPLOYEES E
    USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;

// Mostrar el nombre del departamento, el del manager a cargo y la ciudad a la que pertenece. Debemos usar la cl�usula ON y/o la cl�usula USING para realizar la operaci�n 
SELECT D.DEPARTMENT_NAME AS "Nombre del departamento", E.FIRST_NAME AS "Manager a cargo", L.CITY AS "Ciudad a la que pertenece"
FROM DEPARTMENTS D 
JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID=E.DEPARTMENT_ID)
JOIN LOCATIONS L
    USING (LOCATION_ID);

// Mostrar job_title, el department_name, el last_name de empleado y hire_date de todos los empleados que entraron entre el 2000 y el 2004. Usar cl�usulas using
SELECT J.JOB_TITLE AS "Trabajo", D.DEPARTMENT_NAME AS "Nombre del departamento", E.LAST_NAME AS "Apellido", E.HIRE_DATE AS "Fecha de ingreso"
FROM EMPLOYEES E 
JOIN JOBS J
    USING (JOB_ID)
JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
WHERE TO_CHAR(HIRE_DATE,'yyyy') BETWEEN 2000 AND 2004
ORDER BY "Fecha de ingreso";

// Mostrar el job_title y la media de los salarios de cada uno, siempre que la media supere los 7000
SELECT J.JOB_TITLE AS "Trabajo", ROUND(AVG(E.SALARY),2) AS "Media de los salarios"
FROM EMPLOYEES E JOIN JOBS J
    USING (JOB_ID)
GROUP BY JOB_TITLE
HAVING ROUND(AVG(E.SALARY),2) > 7000
ORDER BY "Media de los salarios" DESC;

// Mostrar el nombre de la regi�n y el n�mero de departamentos en cada una de las regiones
SELECT R.REGION_NAME AS "Regi�n", COUNT(D.DEPARTMENT_ID) AS "N�mero de departamentos"
FROM REGIONS R
NATURAL JOIN COUNTRIES
NATURAL JOIN LOCATIONS
NATURAL JOIN DEPARTMENTS D
GROUP BY REGION_NAME;

// Mostrar el nombre del empleado, el departamento y el pa�s donde trabaja (debemos usar la cl�usual using)
-- voy haciendo conexiones entre las tablas
SELECT E.FIRST_NAME AS "Nombre", D.DEPARTMENT_NAME AS "Departamento", C.COUNTRY_NAME AS "Pa�s donde trabaja"
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
JOIN LOCATIONS L
    USING (LOCATION_ID)
JOIN COUNTRIES C
    USING (COUNTRY_ID);