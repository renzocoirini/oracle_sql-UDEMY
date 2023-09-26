// Mostrar los compañeros que trabajan en el mismo departamento que John Chen
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'John' AND LAST_NAME = 'Chen'; -- subconsulta

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'John' AND LAST_NAME = 'Chen');

// ¿Qué departamentos tienen su sede en Toronto?
SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS WHERE CITY = 'Toronto');

// Visualizar los empleados que tengan más de 5 empleados a su cargo.
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(*)>5);

// ¿En qué ciudad trabaja Guy Himuro?
SELECT CITY
FROM LOCATIONS
WHERE CITY = (SELECT L.CITY FROM EMPLOYEES E
                            JOIN DEPARTMENTS D
                                USING (DEPARTMENT_ID)
                            JOIN LOCATIONS L
                                USING (LOCATION_ID)
                            WHERE E.FIRST_NAME='Guy' AND E.LAST_NAME='Himuro');

// ¿Qué empleados tienen el salario mínimo?
SELECT MIN(SALARY) FROM EMPLOYEES; -- subconsulta

SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

// Mostrar los detalles de los departamentos en los cuales el salario máximo sea mayor a 10000.
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > 10000; -- subconsulta

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY > 10000);

// Indicar los tipos de trabajo de los empleados que entraron en la empresa entre 2002 y 2003
SELECT JOB_ID AS "Tipo de trabajo", HIRE_DATE AS "Fecha de ingreso"
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') BETWEEN '2002' AND '2003'
ORDER BY HIRE_DATE;
