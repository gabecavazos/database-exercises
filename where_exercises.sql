USE employees;
-- Q2
SELECT first_name FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');
-- 709
-- Q3
SELECT first_name FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya'
OR first_name = 'Maya';
-- 709
-- Q4
SELECT first_name FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
AND gender = 'M';
-- 441
-- Q5
SELECT first_name FROM employees
WHERE last_name like 'E%';
-- 7330
-- Q6
SELECT first_name FROM employees
WHERE last_name like 'E%'
or last_name like '%E';
-- 30723
SELECT first_name FROM employees
WHERE last_name like '%e';
-- 24292
-- Q7
SELECT first_name FROM employees
WHERE last_name like 'E%'
AND last_name like '%E';
-- 899
-- Q8
SELECT * FROM employees ORDER BY birth_date DESC LIMIT 2;
SELECT first_name FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';
-- 135214
SELECT first_name FROM employees
WHERE hire_date like '199%';
-- 135214
-- Q9
SELECT first_name FROM employees
WHERE birth_date like '19%-12-25';
-- 842
-- Q10
SELECT first_name FROM employees
WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31'
AND birth_date like '19%-12-25';
-- 362
-- Q11
SELECT first_name FROM employees
WHERE last_name like '%q%';
-- 1873
-- Q12
SELECT first_name FROM employees
WHERE last_name like '%q%'
AND NOT last_name like '%qu%';
-- 547