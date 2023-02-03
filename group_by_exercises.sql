USE employees;

-- Q2
SELECT DISTINCT(title)
FROM titles;
-- there are 7 distinct titles

-- Q3
SELECT last_name
FROM employees
WHERE last_name like 'E%e'
GROUP BY last_name;

-- Q4
SELECT first_name, last_name
FROM employees
WHERE last_name like 'E%e'
GROUP BY last_name, first_name;

-- Q5
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name like '%qu%';
-- Chleq, Lindqvist, Qiwen

-- Q6
SELECT DISTINCT(last_name), COUNT(first_name) AS no_with_same_ln
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name like '%qu%'
GROUP By last_name;


-- Q7
SELECT gender, COUNT(*) AS gender_count
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
GROUP BY gender;
-- to get gender count by name
SELECT first_name, gender, COUNT(*) 
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
GROUP BY first_name, gender
ORDER BY first_name;

-- Q8
-- Usernames vs Employees
SELECT 
COUNT(
	LOWER(
		CONCAT(
		SUBSTR(first_name,1,1)
		,SUBSTR(last_name,1,4)
		,'_'
		,lpad(MONTH(birth_date),2,0)
		,SUBSTR(YEAR(birth_date),2,2)
		)
	)
)AS username, COUNT(*) AS employees
FROM employees
;

-- # of employees with the same username
SELECT 
	LOWER(
		CONCAT(
		SUBSTR(first_name,1,1)
		,SUBSTR(last_name,1,4)
		,'_'
		,lpad(MONTH(birth_date),2,0)
		,SUBSTR(YEAR(birth_date),2,2)
		)
	)
AS username, COUNT(*) AS employees
FROM employees
GROUP BY username
;
-- There are duplicate usernames, 17

-- ****** BONUS *******

SELECT emp_no, AVG(salary)
FROM salaries
WHERE to_date < now()
GROUP BY emp_no;

--
SELECT dept_no, count(emp_no) as employees
FROM dept_emp
WHERE to_date > now()
GROUP BY dept_no;

--

SELECT emp_no, count(salary) as salaries
FROM salaries
GROUP BY emp_no;

--

SELECT emp_no, count(salary) as salaries, MAX(salary)
FROM salaries
GROUP BY emp_no
LIMIT 10;

--
SELECT emp_no, count(salary) as salaries, MIN(salary)
FROM salaries
GROUP BY emp_no
LIMIT 10;
--

SELECT emp_no, stddev(salary)
FROM salaries
GROUP BY emp_no
LIMIT 10;

--

SELECT emp_no, count(salary) as salaries, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

--

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) Between 80000 and 90000;