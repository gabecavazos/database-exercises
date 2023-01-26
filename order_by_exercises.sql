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