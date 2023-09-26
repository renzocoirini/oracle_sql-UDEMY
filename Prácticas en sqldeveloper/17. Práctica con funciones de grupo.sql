// Indicar el número de empleados del departamento 50
SELECT COUNT(EMPLOYEE_ID) AS "Empleados del departamento 50"
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50;

// Indicar el número de empleados que entraron en el año 2007 a trabajar
SELECT COUNT(EMPLOYEE_ID) AS "Empleados que ingresaron en 2007"
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01-01-2007' AND '31-12-2007';

// Indicar la diferencia entre el sueldo más alto y al mínimo
SELECT MAX(SALARY) AS "Salario mayor", MIN(SALARY) AS "Salario menor", MAX(SALARY)-MIN(SALARY) AS "Diferencia entre sueldo mayor y menor"
FROM EMPLOYEES;

// Visualizar la suma del salario del departamento 100
SELECT DEPARTMENT_ID AS "ID departamento", SUM(SALARY) AS "Suma de salario del departamento 100"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;
-- No comprendo por qué no funciona

SELECT SUM(SALARY) AS "Suma de salario del departamento 100"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

// Mostrar el salario medio por departamento, con dos decimales
SELECT DEPARTMENT_ID AS "ID departamento", ROUND(AVG(SALARY),2) AS "Salario medio"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

// Mostrar el country_id y el número de ciudades que hay en ese país.
SELECT COUNTRY_ID AS "ID pais", COUNT(CITY) AS "Cantidad de ciudades"
FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY COUNT(CITY) DESC;

// Mostrar el promedio de salario de los empleados por departamento que tengan comisión
SELECT DEPARTMENT_ID AS "ID departamento", ROUND(AVG(SALARY),2) AS "Salario promedio"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL AND DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY "Salario promedio" DESC;

// Mostrar los años en que ingresaron más de 10 empleados
SELECT TO_CHAR(HIRE_DATE,'YYYY') AS "Año de ingreso", COUNT(EMPLOYEE_ID) AS "Número de empleados"
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
HAVING COUNT (TO_CHAR(HIRE_DATE,'YYYY'))>10
ORDER BY "Año de ingreso";

// Mostrar por departamento y año el número de empleados que ingresaron
SELECT DEPARTMENT_ID AS "Departamento", TO_CHAR(HIRE_DATE,'YYYY') AS "Año", COUNT(EMPLOYEE_ID) AS "Empleados que ingresaron"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE,'YYYY')
ORDER BY "Empleados que ingresaron" DESC;


// Mostrar los departament_id de los departamentos que tienen managers que tienen a cargo más de 5 empleados
SELECT DISTINCT DEPARTMENT_ID AS "Departamentos con managers con más de 5 personas a cargo"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID
HAVING COUNT(EMPLOYEE_ID)>5;




