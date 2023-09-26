// Indicar los empleados que entraron en Mayo en la empresa. Debemos buscar por la abreviatura del mes
SELECT FIRST_NAME ||' '|| LAST_NAME AS "Empleado", HIRE_DATE AS "Fecha ingreso" FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'MON')='MAY' ORDER BY HIRE_DATE;

// Indicar los empleados que entraron en el a�o 2007 usando la funci�n to_char
SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=2007 ORDER BY HIRE_DATE;

// �Qu� d�a de la semana (en letra) era el d�a que naciste?
SELECT TO_CHAR(TO_DATE('20-02-2001'),'DAY') FROM DUAL;

// Averiguar los empleados que entraron en el mes de Junio. Debemos preguntar por el mes en letra. Nota: La funci�n TO_CHAR puede devolver espacios a la derecha)
SELECT * FROM EMPLOYEES WHERE RTRIM(TO_CHAR(HIRE_DATE,'MON'))='JUN' ORDER BY HIRE_DATE;

// Visualizar el salario de los empleados con dos decimales y en d�lares y tambi�n en la moneda local (el ejemplo es con euros, suponiendo que el cambio est� en 0,79$)
SELECT TO_CHAR(SALARY,'$99999.99') AS "Salario en d�lares", TO_CHAR(SALARY*0.79,'L99999.99') AS "Salario en euros" FROM EMPLOYEES ORDER BY SALARY DESC;

