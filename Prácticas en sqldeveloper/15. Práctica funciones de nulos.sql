// De la tabla LOCATIONS visualizar el nombre de la ciudad y el estadoprovincia. En el caso de que no tenga que aparezca el texto “No tiene”
SELECT NVL(CITY,'No tiene') AS "Ciudad", NVL(STATE_PROVINCE,'No tiene') AS "Estadoprovincia" FROM LOCATIONS;

// Visualizar el salario de los empleados incrementado en la comisión (PCT_COMMISSION). Si no tiene comisión solo debe salir el salario
SELECT SALARY AS "Salario", NVL2(COMMISSION_PCT,SALARY+SALARY*COMMISSION_PCT,SALARY) AS "Salario incrementado en caso de comisión" FROM EMPLOYEES ORDER BY "Salario incrementado en caso de comisión" DESC;

// Seleccionar el nombre del departamento y el manager_id. Si no tiene, debe salir un -1
SELECT NVL(DEPARTMENT_NAME,-1) AS "Nombre del departamento", NVL(MANAGER_ID,-1) AS "ID del manager" FROM DEPARTMENTS;

// De la tabla LOCATIONS, devolver NULL si la ciudad y la provincia son iguales. Si no son iguales devolver la CITY.
SELECT CITY AS "Ciudad", STATE_PROVINCE AS "Provincia", NULLIF(CITY,STATE_PROVINCE)FROM LOCATIONS;