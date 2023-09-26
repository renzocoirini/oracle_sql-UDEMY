// Crear la consulta para visualizar los siguientes datos, usando el operador de concatenación
-- DATOS
-- El empleado Donald del departamento 50 tiene un salario de 2600
-- El empleado Douglas del departamento 50 tiene un salario de 2600

SELECT 'El empleado ' || FIRST_NAME || ' del departamento ' || DEPARTMENT_ID || ' tiene un salario de ' || SALARY AS DATOS FROM EMPLOYEES;

// Crear la siguiente consulta
-- La calle 1297 Via Cola di Rie pertenece a la ciudad:Roma

SELECT 'La calle ' || STREET_ADDRESS || ' pertenece a la ciudad: ' || CITY AS "Calle y Ciudad" FROM LOCATIONS;