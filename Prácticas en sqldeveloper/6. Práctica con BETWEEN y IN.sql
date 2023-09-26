// Averiguar los empleados que están entre el departamento 40 y el 60
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID BETWEEN 40 AND 60;

// Visualizar los empleados que entraron entre 2002 y 2004
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '01-01-02' AND '31-12-04';

// Indica los apellidos de los empleados que empiezan desde ‘D’ hasta ‘G’
SELECT LAST_NAME AS "Apellido" FROM EMPLOYEES WHERE LAST_NAME BETWEEN 'D' AND 'G';

// Averiguar los empleados de los departamentos 30,60 y 90. Hay que usar la cláusula IN
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (30,60,90);

// Averiguar los empleados que tienen el tipo de trabajo IT_PROG y PU_CLERK.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG','PU_CLERK');

// Indica las ciudades que están en Inglaterra (UK) y Japón (JP). Tabla LOCATIONS
SELECT CITY AS "Ciudades en Inglaterra y Japon",COUNTRY_ID AS "Country ID" FROM LOCATIONS WHERE COUNTRY_ID IN ('UK','JP');