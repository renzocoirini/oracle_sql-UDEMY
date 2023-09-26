// Listar las ciudades de la tabla LOCATIONS no tienen STATE_PROVINCE
SELECT * FROM LOCATIONS WHERE STATE_PROVINCE IS NULL;

// Averiguar el nombre, salario y comisi�n de aquellos empleados que tienen comisi�n. Tambi�n debemos visualizar una columna calculada denominada �Sueldo Total�, que sea el sueldo m�s la comisi�n
SELECT FIRST_NAME AS "Name", SALARY AS "Salario", COMMISSION_PCT AS "Comisi�n", SALARY+SALARY*COMMISSION_PCT AS "Sueldo Total" FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;