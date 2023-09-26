// Realizar una SELECT para visualizar el siguiente resultado. El impuesto es el 20% del salario.
SELECT FIRST_NAME,SALARY AS "Bruto",SALARY*0.2 AS "Impuestos",SALARY-SALARY*0.2 AS "Neto" FROM EMPLOYEES;

//  Visualizar el salario anual de cada empleado, por 14 pagas. Debemos visualizar las columnas como Nombre, Salario y Salario Anual
SELECT FIRST_NAME AS "Nombre",SALARY AS "Salario",SALARY*14 AS "Salario anual" FROM EMPLOYEES;
