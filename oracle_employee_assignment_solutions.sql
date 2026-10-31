-- Oracle SQL Practice Assignment: Employees
-- 17 queries covering filtering, pattern matching, NULL handling, sorting,
-- string functions, and inserting a row.
-- Database: Oracle | Client: DBeaver (or any Oracle SQL client)
-- Prerequisite: EMPLOYEES table with columns EMP_ID, FIRST_NAME, LAST_NAME,
-- EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID, MANAGER_ID.
-- Note: Question 9 modifies data. Run only once to avoid duplicate EMP_ID 156.
-- Note: INSERT requires sufficient quota on the table's tablespace (ORA-01950).

-- 1. Employees with IDs between 100 and 105 (inclusive).
SELECT *
FROM EMPLOYEES
WHERE EMP_ID BETWEEN 100 AND 105;

-- 2. Employees with IDs 151, 152, 153, 154, or 155.
SELECT *
FROM EMPLOYEES
WHERE EMP_ID IN (151, 152, 153, 154, 155);

-- 3. First name begins with P or p.
SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE 'P%';

-- 4. First name ends with A or a.
SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%A';

-- 5. First name contains A or a anywhere.
SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%A%';

-- 6. Third character of first name is E or e.
SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '__E%';

-- 7. Employees without an assigned manager.
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 8. Employees with an assigned manager.
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 9. Insert an employee without an assigned manager.
-- Run once; requires INSERT privileges and tablespace quota.
INSERT INTO EMPLOYEES (
    EMP_ID, FIRST_NAME, LAST_NAME, EMAIL,
    HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID, MANAGER_ID
) VALUES (
    156, 'John', 'Doe', 'john@example.com',
    DATE '2026-01-15', 'IT_PROG', 8000, 60, NULL
);
COMMIT;

-- 10. Employees whose job is AD_VP or IT_PROG.
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'IT_PROG');

-- 11. Employees ordered by last name, ascending.
SELECT *
FROM EMPLOYEES
ORDER BY LAST_NAME ASC;

-- 12. Employees ordered by hire date, newest first.
SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- 13. Department ascending, then salary descending within each department.
SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

-- 14. Display last names in lowercase (does not update stored data).
SELECT EMP_ID, LOWER(LAST_NAME) AS LOWERCASE_LAST_NAME
FROM EMPLOYEES;

-- 15. Display first names in uppercase (does not update stored data).
SELECT EMP_ID, UPPER(FIRST_NAME) AS UPPERCASE_FIRST_NAME
FROM EMPLOYEES;

-- 16. Display first and last names in title case.
SELECT EMP_ID,
       INITCAP(FIRST_NAME) AS FORMATTED_FIRST_NAME,
       INITCAP(LAST_NAME) AS FORMATTED_LAST_NAME
FROM EMPLOYEES;

-- 17. Find last name Smith regardless of letter case.
SELECT *
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) = 'SMITH';
