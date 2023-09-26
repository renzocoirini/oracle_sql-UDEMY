// En la tabla LOCATIONS, averiguar las ciudades que son de Canada o Estados unidos (Country_id=CA o US) y que la longitud del nombre de la calle sea superior a 15

SELECT * FROM LOCATIONS WHERE COUNTRY_ID IN ('CA','US') AND LENGTH(STREET_ADDRESS)>15;

// Muestra la longitud del nombre y el salario anual (por 14) para los empleados cuyo apellido contenga el carácter 'b' después de la 3ª posición.

SELECT FIRST_NAME AS "Nombre",LENGTH(FIRST_NAME) AS "Longitud de nombre", LAST_NAME, SALARY*14 AS "Salario anual" FROM EMPLOYEES WHERE INSTR(LAST_NAME,'b')>3;

// Averiguar los empleados que ganan entre 4000 y 7000 euros y que tienen alguna 'a' en el nombre. (Debemos usar INSTR y da igual que sea mayúscula que minúsculas) y que tengan comisión.

SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 4000 AND 7000 AND INSTR(UPPER(FIRST_NAME),'A')<>0 AND COMMISSION_PCT IS NOT NULL ORDER BY SALARY;

// Visualizar las iniciales de nombre y apellidos separados por puntos.

SELECT FIRST_NAME AS "Nombre",LAST_NAME AS "Apellido", CONCAT((SUBSTR(FIRST_NAME,1,1)),CONCAT('.',SUBSTR(LAST_NAME,1,1))) AS "Iniciales" FROM EMPLOYEES ORDER BY LAST_NAME;

// Mostrar empleados donde el nombre o apellido comienza con S..
SELECT * FROM EMPLOYEES WHERE INSTR(FIRST_NAME,'S')<>0 OR INSTR(LAST_NAME,'S')<>0;

// Visualizar el nombre del empleado, su salario, y con asteriscos, el número miles de dólares que gana. Se asocia ejemplo. (PISTA: se puede usar RPAD. Ordenado por salario
SELECT FIRST_NAME AS "Nombre", SALARY AS "Salario", RPAD('*',SALARY/1000,'*') AS "Ranking" FROM EMPLOYEES ORDER BY SALARY DESC;


