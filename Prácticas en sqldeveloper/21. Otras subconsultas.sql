// Seleccionar el nombre, salario y departamento de los empleados que ganen mas que cualquiera de los salarios máximos de los departamentos 50, 60 y 70. Usar el operador ANY
SELECT FIRST_NAME AS "Nombre", SALARY AS "Salario", DEPARTMENT_ID AS "Departamento"
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID IN (50,60,70))
ORDER BY SALARY DESC;

// Indicar el nombre de los departamentos cuyo salario medio sea superior a 9000. Usar el operador IN
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING AVG(SALARY)>9000);

// Indicar el nombre del empleado, el nombre del departamento, el salario de los empleados que tengan el salario máximo de su departamento. Ordenado por salario descendentemente. Usar el operador IN
SELECT FIRST_NAME AS "Nombre", DEPARTMENT_NAME AS "Departamento", SALARY AS "Salario"
FROM DEPARTMENTS
JOIN EMPLOYEES
USING (DEPARTMENT_ID)
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                    FROM EMPLOYEES
                                    GROUP BY DEPARTMENT_ID)
ORDER BY SALARY DESC;


// Realizar la misma consulta anterior pero usando una subconsulta sincronizada
SELECT FIRST_NAME AS "Nombre", DEPARTMENT_ID AS "Departamento", SALARY AS "Salario"
FROM EMPLOYEES EMP -- EMP es el alias de la tabla PRINCIPAL que voy a usar en la subconsulta
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID=EMP.DEPARTMENT_ID)
ORDER BY SALARY DESC;


// Indicar los datos de los empleados que ganen más que todos los empleados del departamento 100. Usar el operador ALL
SELECT *
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID=100);

// Mostrar los empleados que tienen el mayor salario de su departamento. Usar subconsultas sincronizadas.
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES EMP
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID=EMP.DEPARTMENT_ID);

// Visualizar las ciudades en las que haya algún departamento. Debemos usar consultas sincronizadas y el operador EXISTS
SELECT CITY FROM LOCATIONS LOC
WHERE EXISTS (SELECT * FROM DEPARTMENTS WHERE LOCATION_ID=LOC.LOCATION_ID);

// Visualizar el nombre de las regiones donde no hay departamentos. Usar subconsultas sincronizadas y el operador NOT EXISTS
SELECT REGION_NAME FROM REGIONS REG
WHERE NOT EXISTS (SELECT * FROM COUNTRIES
                    NATURAL JOIN LOCATIONS
                    NATURAL JOIN DEPARTMENTS
                    WHERE REGION_ID=REG.REGION_ID);

