// Indicar el n�mero de d�as que los empleados llevan en la empresa
SELECT FIRST_NAME AS "Empleado", HIRE_DATE AS "Fecha ingreso", ROUND (SYSDATE-HIRE_DATE,0) AS "D�as en la empresa" FROM EMPLOYEES ORDER BY SYSDATE-HIRE_DATE;

// Indicar la fecha que ser� dentro de 15 d�as
SELECT SYSDATE+15 AS "Fecha dentro de 15 d�as" FROM DUAL FETCH FIRST 1 ROWS ONLY;

// �Cu�ntos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT ROUND(MONTHS_BETWEEN('24-12-2023',SYSDATE),1) AS "Meses para navidad" FROM EMPLOYEES FETCH FIRST 1 ROWS ONLY;

// Indicar la fecha de entrada de un empleado y el �ltimo d�a del mes que entr�
SELECT FIRST_NAME AS "Empleado", HIRE_DATE AS "Fecha ingreso", LAST_DAY(HIRE_DATE) AS "�ltimo d�a del mes de ingreso" FROM EMPLOYEES ORDER BY HIRE_DATE;

// Utilizando la funci�n ROUND, indicar los empleados que entraron en los �ltimos 15 d�as de cada mes
SELECT FIRST_NAME AS "Nombre", LAST_NAME AS "Apellido", HIRE_DATE AS "Fecha ingreso", ROUND (HIRE_DATE,'MONTH') AS "Redondeo" FROM EMPLOYEES WHERE ROUND(HIRE_DATE,'MONTH')>HIRE_DATE;
