// Visualizar las ciudades donde hay departamentos, de la tabla locations. No deben salir repetidos
SELECT DISTINCT CITY AS "Ciudad" FROM LOCATIONS;

// Visualizar los distintos tipos de JOB_ID por departamento de la tabla Employees.
SELECT DISTINCT JOB_ID AS "ID trabajo", DEPARTMENT_ID AS "ID departamento" FROM EMPLOYEES;