// Indicar el número de días que los empleados llevan en la empresa
SELECT FIRST_NAME AS "Empleado", HIRE_DATE AS "Fecha ingreso", ROUND (SYSDATE-HIRE_DATE,0) AS "Días en la empresa" FROM EMPLOYEES ORDER BY SYSDATE-HIRE_DATE;

// Indicar la fecha que será dentro de 15 días
SELECT SYSDATE+15 AS "Fecha dentro de 15 días" FROM DUAL FETCH FIRST 1 ROWS ONLY;

// ¿Cuántos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT ROUND(MONTHS_BETWEEN('24-12-2023',SYSDATE),1) AS "Meses para navidad" FROM EMPLOYEES FETCH FIRST 1 ROWS ONLY;

// Indicar la fecha de entrada de un empleado y el último día del mes que entró
SELECT FIRST_NAME AS "Empleado", HIRE_DATE AS "Fecha ingreso", LAST_DAY(HIRE_DATE) AS "Último día del mes de ingreso" FROM EMPLOYEES ORDER BY HIRE_DATE;

// Utilizando la función ROUND, indicar los empleados que entraron en los últimos 15 días de cada mes
SELECT FIRST_NAME AS "Nombre", LAST_NAME AS "Apellido", HIRE_DATE AS "Fecha ingreso", ROUND (HIRE_DATE,'MONTH') AS "Redondeo" FROM EMPLOYEES WHERE ROUND(HIRE_DATE,'MONTH')>HIRE_DATE;
