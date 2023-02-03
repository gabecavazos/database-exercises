USE employees;
-- Q1

SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE 
	(SELECT hire_date 
    FROM employees
    WHERE emp_no=101010);
    
-- Q2

SELECT title
FROM titles t
JOIN employees e
USING (emp_no)
WHERE e.first_name IN
	(SELECT e.first_name
	FROM employees as e
	WHERE e. first_name LIKE 'Aamod')
  AND t.to_date > now()
  GROUP BY t.title;
  
-- Q3
-- not using a subquery is probably the easiest way
SELECT first_name,last_name
	FROM employees e
	JOIN salaries s
	USING (emp_no)
WHERE s.to_date < now()
GROUP BY emp_no;

-- Using subquery
SELECT first_name,last_name
FROM employees e
WHERE emp_no IN (
    SELECT emp_no
	FROM salaries s
	WHERE s.to_date < now()
)
GROUP BY emp_no;

-- 300024

-- Q4

SELECT first_name,last_name
FROM employees e
WHERE gender in (
	SELECT gender
	FROM employees e
	JOIN dept_manager dm
	USING (emp_no)
		WHERE e.gender LIKE 'F'
		AND dm.to_date > now()
);
-- Bezalel	Simmel ,Anneke Preusig, Tzvetan	Zielinski, Sumant	Peac, Duangkaew	Piveteau, Mary	Sluis, 
-- Cristinel	Bouloucos, Kazuhide	Peha, Bojan	Montemayor, Suzette	Pettey

-- Q5 
SELECT first_name,last_name,emp_no
FROM employees e 
JOIN salaries s
USING (emp_no)
WHERE s.salary > 
	(SELECT AVG(salary)
	FROM salaries s)
and s.to_date > now();

-- Q6
SELECT std(salary)
FROM salaries
WHERE to_date > now();

SELECT MAX(salary)
FROM salaries;

SELECT COUNT(salary)
FROM salaries
WHERE (SELECT stddev(
(SELECT (Max(salary))
FROM salaries
)) < 1);

WITH avg_salary AS (
  SELECT AVG(salary) avg_salary
  FROM salaries
  WHERE to_date LIKE '9999%'
),
stddev_salary AS (
  SELECT STDDEV(salary) stddev_salary
  FROM salaries
  WHERE to_date LIKE '9999%'
),
max_salary AS (
  SELECT MAX(salary) max_salary
  FROM salaries
  WHERE to_date LIKE '9999%'
)
SELECT COUNT(*) count
FROM salaries s
JOIN avg_salary a ON 1=1
JOIN stddev_salary d ON 1=1
JOIN max_salary m ON 1=1
WHERE s.to_date LIKE '9999%'
AND s.salary BETWEEN (m.max_salary - d.stddev_salary) AND (m.max_salary + d.stddev_salary);

SELECT COUNT(*) count
FROM salaries s
WHERE to_date > now() 
AND salary BETWEEN 
((SELECT MAX(salary)FROM salaries WHERE to_date > now())	- 
        (SELECT stddev(salary) FROM salaries WHERE to_date > now()))
AND 
((SELECT MAX(salary)FROM salaries WHERE to_date > now())	+ 
	(SELECT stddev(salary)FROM salaries WHERE to_date > now())
)
;

-- BONUS **********

-- Q1

SELECT dept_name
FROM departments d
JOIN dept_manager dm
USING (dept_no)
WHERE emp_no IN (
	SELECT emp_no
    FROM employees e
    JOIN dept_manager dm
    USING (emp_no)
    WHERE dm.to_date > now()
    AND e.gender LIKE 'F')
AND dm.to_date > now()
GROUP BY dept_name;

-- Q2

