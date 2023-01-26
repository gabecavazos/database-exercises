use employees;
-- Q2
SELECT DISTINCT title FROM titles
ORDER BY title DESC LIMIT 10;
-- Q3
SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date like '199%'
AND birth_date like '%12-25'
ORDER BY hire_date LIMIT 5;
-- alselm cappello, utz mandell, bouchung schreiter, 
-- baocai kushner, petter stroustrup
-- Q4
SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date like '199%'
AND birth_date like '%12-25'
ORDER BY hire_date LIMIT 5 OFFSET 50;
-- 5 results multiplied by 10 pages = 50 lines skiped
-- 5*10=50