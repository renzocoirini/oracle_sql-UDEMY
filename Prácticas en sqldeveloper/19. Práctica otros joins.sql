// Indicar el nombre del empleado y el de su jefe (SELF_JOIN de la tabla EMPLOYEES)
SELECT TRABAJADOR.FIRST_NAME AS "Trabajador", JEFE.FIRST_NAME AS "Jefe"
FROM EMPLOYEES TRABAJADOR
JOIN EMPLOYEES JEFE
ON TRABAJADOR.MANAGER_ID = JEFE.EMPLOYEE_ID;
-- Me quedé con dudas de por qué es así y no al reves

// Indica el DEPARTMENT_NAME y la suma de salarios de ese departamento ordenados ascendentemente y que aparezcan también los DEPARTMENT_NAME que no tengan empleados.
SELECT D.DEPARTMENT_NAME AS "Nombre del departamento", ROUND(SUM(E.SALARY),2) AS "Salarios del departamento"
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY "Salarios del departamento";

// Visualizar la ciudad y el nombre del departamento, incluidas aquellas ciudades que no tengan departamentos
SELECT L.CITY AS "Ciudad", D.DEPARTMENT_NAME AS "Nombre del departamento"
FROM DEPARTMENTS D
RIGHT OUTER JOIN LOCATIONS L
ON D.LOCATION_ID=L.LOCATION_ID;




