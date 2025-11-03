--Jose Melo
--11/2/2025
--DBA 120

--Question 1:

SELECT SYSDATE AS "DATE" 
FROM DUAL;


--Question 2:

SELECT empno, ename, salary, ROUND((salary * 1.15), 0) AS New_Salary
FROM emp;


--Question 3:

SELECT 
    empno, 
    ename, 
    salary, 
    ROUND((salary * 1.15), 0) AS New_Salary, 
    ROUND(salary * 1.15) - salary AS Increase
FROM emp;


--Question 4:

 SELECT 
    ENAME,
    HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 6), 'MONDAY'), 'fmDay, "the" fmDDth "of" Month, YYYY') AS REVIEW
FROM 
    EMP;
 
--I couldn't figure out how to make the date number written out rather than the number itself


--Question 5:

SELECT 
    ENAME,
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE), 0) AS MONTHS_WORKED
FROM emp;
ORDER BY MONTHS_WORKED;


--Question 6:

SELECT 
    ENAME || ' earns ' || TO_CHAR(SALARY, '$999,999.99') || 
    ' monthly but wants ' || TO_CHAR(SALARY * 3, '$999,999.99') AS "Dream Salaries"
FROM emp;


--Question 7:

SELECT 
    ENAME,
    LPAD(TO_CHAR(SALARY), 15, '$') AS SALARY
FROM emp;


--Question 8:

SELECT 
    INITCAP(ENAME) AS "Name",
    LENGTH(ENAME) AS "Length"
FROM 
    EMP
WHERE 
    SUBSTR(ENAME, 1, 1) IN ('J', 'A', 'M');


--Question 9:

SELECT
  ENAME,
  HIREDATE,
  TO_CHAR(HIREDATE, 'DAY') AS DAY
FROM emp
ORDER BY TO_CHAR(HIREDATE, 'D');


--Question 10:

SELECT
    ENAME,
    NVL(TO_CHAR(COMM), 'No Commission')
FROM emp;



--Question 11:

SELECT 
    ENAME || ' ' || RPAD('*', ROUND(SALARY / 100), '*') AS "EMPLOYEE_AND_THEIR_SALARIES"
FROM 
    EMP
ORDER BY 
    SALARY DESC;


--Question 12:

SELECT 
    JOB,
    CASE 
        WHEN LOWER(JOB) = 'president' THEN 'A'
        WHEN LOWER(JOB) = 'manager'   THEN 'B'
        WHEN LOWER(JOB) = 'analyst'   THEN 'C'
        WHEN LOWER(JOB) = 'salesman'  THEN 'D'
        WHEN LOWER(JOB) = 'clerk'     THEN 'E'
        ELSE 'O'
    END AS "G"
FROM 
    EMP
ORDER BY 
    CASE 
        WHEN LOWER(JOB) = 'president' THEN 1
        WHEN LOWER(JOB) = 'manager'   THEN 2
        WHEN LOWER(JOB) = 'analyst'   THEN 3
        WHEN LOWER(JOB) = 'salesman'  THEN 4
        WHEN LOWER(JOB) = 'clerk'     THEN 5
        ELSE 6

    END;
