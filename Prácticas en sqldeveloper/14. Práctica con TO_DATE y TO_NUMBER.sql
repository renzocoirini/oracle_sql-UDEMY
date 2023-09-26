// Convertir las siguientes cadenas a números: '1210.73' y ‘$127.2’
SELECT TO_NUMBER('1210.73','9999.99') AS "Char to number" FROM DUAL;
SELECT TO_NUMBER('$127.2','$999.9') AS "Char to number" FROM DUAL;

// Convertir los 3 primeros caracteres del número de teléfono en números y multiplicarlos por 2.
SELECT PHONE_NUMBER, TO_NUMBER(SUBSTR(PHONE_NUMBER,1,3),'999')*2 AS "Char to number" FROM EMPLOYEES ORDER BY TO_NUMBER(SUBSTR(PHONE_NUMBER,1,3),'999')*2 DESC;

// Convertir las siguientes cadenas en fecha (NOTA: el mes lo debemos poner en el idioma que tengamos en el SqlDeveloper. Por ejemplo, en español sería:
    -- 10 DE FEBRERO DE 2018
    -- FACTURA: MARZO0806

En ingles sería:
    -- 10 DE FEBRUARY DE 2018
    -- FACTURA: MARCH0806 
    
SELECT TO_DATE('10 DE FEBRERO DE 2018','DD "DE" MONTH "DE" YYYY') FROM DUAL;
SELECT TO_DATE('FACTURA: MARZO0806','"FACTURA:" MONTHDDYY') FROM DUAL;
