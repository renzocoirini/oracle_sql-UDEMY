// Visualizar el nombre del país y el nombre de la región. (tablas COUNTRIES y REGIONS). Usar un natural join
SELECT C.COUNTRY_NAME AS "Nombre del país", R.REGION_NAME AS "Nombre de la región"
FROM COUNTRIES C
NATURAL JOIN REGIONS R;
    
// Usando el ejemplo anterior visualizar también el nombre de la ciudad añadiendo una nueva tabla (LOCATIONS)
SELECT R.REGION_NAME AS "Nombre de la región", C.COUNTRY_NAME AS "Nombre del país", L.CITY AS "Nombre de la ciudad"
FROM COUNTRIES C
NATURAL JOIN REGIONS R
NATURAL JOIN LOCATIONS L;

// Indicar el nombre del departamento y la media de sus salarios
SELECT D.DEPARTMENT_NAME AS "Nombre del departamento", ROUND(AVG(E.SALARY),2) AS "Media de los salarios"
FROM DEPARTMENTS D JOIN EMPLOYEES E
    USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;

// Mostrar el nombre del departamento, el del manager a cargo y la ciudad a la que pertenece. Debemos usar la cláusula ON y/o la cláusula USING para realizar la operación 
SELECT D.DEPARTMENT_NAME AS "Nombre del departamento", E.FIRST_NAME AS "Manager a cargo", L.CITY AS "Ciudad a la que pertenece"
FROM DEPARTMENTS D 
JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID=E.DEPARTMENT_ID)
JOIN LOCATIONS L
    USING (LOCATION_ID);

// Mostrar job_title, el department_name, el last_name de empleado y hire_date de todos los empleados que entraron entre el 2000 y el 2004. Usar cláusulas using
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

// Mostrar el nombre de la región y el número de departamentos en cada una de las regiones
SELECT R.REGION_NAME AS "Región", COUNT(D.DEPARTMENT_ID) AS "Número de departamentos"
FROM REGIONS R
NATURAL JOIN COUNTRIES
NATURAL JOIN LOCATIONS
NATURAL JOIN DEPARTMENTS D
GROUP BY REGION_NAME;

// Mostrar el nombre del empleado, el departamento y el país donde trabaja (debemos usar la cláusual using)
-- voy haciendo conexiones entre las tablas
SELECT E.FIRST_NAME AS "Nombre", D.DEPARTMENT_NAME AS "Departamento", C.COUNTRY_NAME AS "País donde trabaja"
FROM EMPLOYEES E
JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
JOIN LOCATIONS L
    USING (LOCATION_ID)
JOIN COUNTRIES C
    USING (COUNTRY_ID);