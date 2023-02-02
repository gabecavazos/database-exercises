USE join_example_db;
SHOW TABLES;

SELECT * 
FROM users;

SELECT *
FROM roles;

-- Show only intersecting data
SELECT u.name,
		u.email,
		r.name AS role_name
FROM users AS u
JOIN roles AS r ON u.role_id=r.id;

-- left join to get info from left table and intersecting
SELECT u.name,
		u.email,
		r.name AS role_name
FROM users AS u
LEFT JOIN roles AS r ON u.role_id=r.id;

-- right join to get info from right table and intersecting
SELECT u.name,
		u.email,
		r.name AS role_name
FROM users AS u
RIGHT JOIN roles AS r ON u.role_id=r.id;

-- Use count and the appropriate join type to get a list of roles 
-- along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT COUNT(u.role_id),
		r.name AS role_name
FROM users AS u
RIGHT JOIN roles AS r ON u.role_id=r.id
GROUP BY role_name;

-- associatve tables and joins
USE employees;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

-- EMPLOYEES DATABASE
USE employees;

SELECT emp_no, dept_no
FROM dept_manager;

-- Q2
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm 
	ON e.emp_no=dm.emp_no
JOIN departments AS d 
	ON dm.dept_no=d.dept_no
WHERE dm.to_date like '9999%'
ORDER BY Department_Name;

-- Q3
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm 
	ON e.emp_no=dm.emp_no
JOIN departments AS d 
	ON dm.dept_no=d.dept_no
WHERE dm.to_date like '9999%'
	AND e.gender LIKE 'F'
ORDER BY Department_Name;

-- Q4
SELECT t.title AS Title, COUNT(t.emp_no) AS Count
FROM titles AS t
JOIN dept_emp AS de
	ON t.emp_no=de.emp_no
JOIN departments AS d
	ON d.dept_no=de.dept_no
WHERE d.dept_name LIKE 'Customer Service'
AND de.to_date LIKE '9999%'
GROUP BY Title
ORDER BY Title;

-- Q5
SELECT d.dept_name AS Department_Name
,CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
,s.salary AS salary
FROM employees AS e
	JOIN dept_manager AS dm 
		ON e.emp_no=dm.emp_no
	JOIN departments AS d 
		ON dm.dept_no=d.dept_no
	JOIN salaries AS s
		ON s.emp_no=e.emp_no
WHERE s.to_date like '9999%'
AND dm.to_date LIKE '9999%'
ORDER BY Department_Name;

-- Q6
SELECT de.dept_no AS dept_no
,d.dept_name AS Department_Name
,COUNT(de.emp_no) AS num_employees
FROM dept_emp AS de
	JOIN departments AS d
		ON de.dept_no=d.dept_no
WHERE de.to_date LIKE '9999%'
GROUP BY Department_Name
ORDER BY dept_no;

-- Q7 *** couldn't run MAX(AVG(s.salary))
SELECT d.dept_name AS dept_name
, AVG(s.salary) AS average_salary
FROM salaries AS s
	JOIN dept_emp AS de
		ON de.emp_no=s.emp_no
	JOIN departments AS d
		ON d.dept_no=de.dept_no
WHERE s.to_date like '9999%'
GROUP BY dept_name;

-- w/ subquery
SELECT dept_name, MAX(average_salary) 
FROM (
  SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
  FROM salaries AS s
    JOIN dept_emp AS de ON de.emp_no=s.emp_no
    JOIN departments AS d ON d.dept_no=de.dept_no
  WHERE s.to_date like '9999%'
  GROUP BY dept_name
) AS subquery 
GROUP BY dept_name;

-- second try
SELECT dept_name, AVG(average_salary)
FROM (
  SELECT dept_name, average_salary
  FROM (
    SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
    FROM salaries AS s
      JOIN dept_emp AS de ON de.emp_no=s.emp_no
      JOIN departments AS d ON d.dept_no=de.dept_no
    WHERE s.to_date like '9999%'
    GROUP BY dept_name
  ) AS subquery1
  WHERE average_salary = (SELECT MAX(average_salary) 
                          FROM (
                            SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
                            FROM salaries AS s
                              JOIN dept_emp AS de ON de.emp_no=s.emp_no
                              JOIN departments AS d ON d.dept_no=de.dept_no
                            WHERE s.to_date like '9999%'
                            GROUP BY dept_name
                          ) AS subquery2)
) AS subquery3
GROUP BY dept_name;

-- This query finds the department with the highest average salary by using nested subqueries. 
-- The innermost query calculates the average salary for each department.
-- The next subquery selects only the department with the maximum average salary. 
-- The outermost query returns the department name 
-- and average salary for the department with the highest average salary.

-- Q8 ** find the max salary of all employees in the marketing department 
-- then order them by max salary and show the first result

SELECT e.first_name, e.last_name, max(s.salary) AS max_salary
FROM employees AS e
	JOIN salaries AS s
		ON s.emp_no=e.emp_no
	JOIN dept_emp AS de
		ON de.emp_no=e.emp_no
	JOIN departments AS d
		ON d.dept_no=de.dept_no
WHERE s.to_date LIKE '9999%'
AND d.dept_name LIKE 'Marketing'
GROUP BY e.first_name, e.last_name
ORDER BY max_salary DESC LIMIT 1;

SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
	JOIN salaries AS s
		ON s.emp_no=e.emp_no
	JOIN dept_emp AS de
		ON de.emp_no=e.emp_no
	JOIN departments AS d
		ON d.dept_no=de.dept_no
WHERE s.to_date LIKE '9999%'
AND d.dept_name LIKE 'Marketing'
AND s.salary = (
  SELECT MAX(salary)
  FROM employees AS e
    JOIN salaries AS s
      ON s.emp_no=e.emp_no
    JOIN dept_emp AS de
      ON de.emp_no=e.emp_no
    JOIN departments AS d
      ON d.dept_no=de.dept_no
  WHERE s.to_date LIKE '9999%'
  AND d.dept_name LIKE 'Marketing'
);
-- The subquery inside the main query retrieves the maximum salary for employees in the 'Marketing' department. 
-- The main query then filters the results to return only the employee with the highest salary.

-- Q9
SELECT e.first_name,e.last_name,s.salary,d.dept_name
FROM employees AS e
	JOIN salaries AS s
		ON s.emp_no=e.emp_no
	JOIN dept_manager AS dm
		ON dm.emp_no=e.emp_no
	JOIN departments as d
		ON d.dept_no=dm.dept_no
WHERE dm.to_date like '9999%'
GROUP BY e.first_name, e.last_name, d.dept_name, s.salary
ORDER BY s.salary DESC LIMIT 1;

-- Q10
SELECT d.dept_name, round(AVG(s.salary),0) AS average_salary
FROM salaries AS s
	RIGHT JOIN dept_emp AS de
		ON de.emp_no=s.emp_no
	RIGHT JOIN departments AS d
		ON d.dept_no=de.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;

        
