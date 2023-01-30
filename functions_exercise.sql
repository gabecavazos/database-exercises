USE employees;
-- Q2
SELECT first_name, last_name FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;
-- Irena Reutenauer
-- Vidya Awdeh
-- Q3
SELECT first_name, last_name FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;
-- Irena Acton
-- Vidya Akiyama
-- Q4
SELECT first_name, last_name FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;
-- Irena Acton
-- Vidya Akiyama
-- Q5
SELECT first_name, last_name, emp_no FROM employees
WHERE last_name like 'E%'
AND last_name like '%E'
ORDER BY emp_no;
-- 899
-- 10021, Ramzi Erde
-- Q6
SELECT first_name, last_name, emp_no, hire_date FROM employees
WHERE last_name like 'E%'
AND last_name like '%E'
ORDER BY hire_date DESC;
-- 899
-- Teiji Eldridge, Sergi Erde

-- Q7
SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date like '199%'
AND birth_date like '%12-25'
ORDER BY birth_date, hire_date DESC;

SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date like '199%'
AND birth_date like '%12-25'
ORDER BY birth_date DESC, hire_date;
-- 362
-- Khun Bernini is oldest and last
-- Alselm Cappello is youngest and hired first

-- **********************************************************
-- Functions
-- ******************************************************
-- Q2 
SELECT first_name, last_name, emp_no, hire_date, concat(first_name,' ',last_name) AS full_name
FROM employees
WHERE last_name like 'E%e';

-- Q3

SELECT first_name, last_name, UPPER(concat(first_name,' ',last_name)) AS full_name
FROM employees
WHERE last_name like 'E%e';

-- Q4

SELECT first_name, last_name, birth_date, hire_date, datediff(curdate(),hire_date) AS working_days FROM employees
WHERE hire_date like '199%'
AND birth_date like '%12-25';

-- Q5

SELECT Max(salary), Min(salary)
FROM salaries
WHERE to_date like '9999%';

SELECT Max(salary), Min(salary)
FROM salaries
WHERE to_date > NOW();

-- Q6

SELECT LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4),'_', lpad(MONTH(birth_date),2,0), SUBSTR(YEAR(birth_date),2,2))) AS username, first_name, last_name, birth_date
FROM employees LIMIT 5;
-- lpad(target,length desired, replacement car)


