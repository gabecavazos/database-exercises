USE employees;

-- Q1
SELECT e.first_name, e.last_name, e.hire_date, de.dept_no,
IF(de.to_date < now(), de.to_date, 'current employee') AS is_current_employee,
IF(de.to_date > now(), null, de.to_date) AS fire_date
FROM employees e
JOIN dept_emp de
USING (emp_no)
;

-- Q2
SELECT first_name, last_name, 
       CASE 
         WHEN substr(last_name,1,1) LIKE '[A-H]%' THEN 'A-H' 
         WHEN substr(last_name,1,1) LIKE '[I-Q]%' THEN 'I-Q' 
         WHEN substr(last_name,1,1) LIKE '[R-Z]%' THEN 'R-Z' 
       END AS alpha_group
FROM employees;

SELECT first_name, last_name, 
       CASE 
         WHEN last_name LIKE 'A%' THEN 'A-H' 
         WHEN last_name LIKE 'B%' THEN 'A-H' 
         WHEN last_name LIKE 'C%' THEN 'A-H' 
         WHEN last_name LIKE 'D%' THEN 'A-H' 
         WHEN last_name LIKE 'E%' THEN 'A-H' 
         WHEN last_name LIKE 'F%' THEN 'A-H' 
         WHEN last_name LIKE 'G%' THEN 'A-H' 
         WHEN last_name LIKE 'H%' THEN 'A-H' 
         WHEN last_name LIKE 'I%' THEN 'I-Q' 
         WHEN last_name LIKE 'J%' THEN 'I-Q' 
         WHEN last_name LIKE 'K%' THEN 'I-Q' 
         WHEN last_name LIKE 'L%' THEN 'I-Q' 
         WHEN last_name LIKE 'M%' THEN 'I-Q' 
         WHEN last_name LIKE 'N%' THEN 'I-Q' 
         WHEN last_name LIKE 'O%' THEN 'I-Q' 
         WHEN last_name LIKE 'P%' THEN 'I-Q' 
         WHEN last_name LIKE 'Q%' THEN 'I-Q' 
         WHEN last_name LIKE 'R%' THEN 'R-Z' 
         WHEN last_name LIKE 'S%' THEN 'R-Z' 
         WHEN last_name LIKE 'T%' THEN 'R-Z' 
         WHEN last_name LIKE 'U%' THEN 'R-Z' 
         WHEN last_name LIKE 'V%' THEN 'R-Z' 
         WHEN last_name LIKE 'W%' THEN 'R-Z' 
         WHEN last_name LIKE 'X%' THEN 'R-Z' 
         WHEN last_name LIKE 'Y%' THEN 'R-Z' 
         WHEN last_name LIKE 'Z%' THEN 'R-Z' 
       END AS alpha_group
FROM employees;

-- Q3
SELECT COUNT(emp_no),
CASE WHEN birth_date LIKE 
END as 
FROM employees;

SELECT max(birth_date)
FROM employees;
-- 1965

SELECT min(birth_date)
FROM employees;
-- 1952
SELECT COUNT(emp_no) as count,
	CASE 
	WHEN birth_date LIKE '196%' THEN '60"s'
    WHEN birth_date LIKE '195%' THEN '50"s'
    END AS birth_decade
FROM employees
GROUP BY birth_decade;

-- Q4
SELECT *
FROM departments
GROUP BY dept_name;



SELECT ROUND(AVG(s.salary),0) AS Average_Salary,
	CASE WHEN d.dept_name LIKE 'Research' THEN 'R&D'
    WHEN d.dept_name LIKE 'Development' THEN 'R&D'
    WHEN d.dept_name LIKE 'Sales' THEN 'Sales & Marketing'
    WHEN d.dept_name LIKE 'Marketing' THEN 'Sales & Marketing'
    WHEN d.dept_name LIKE 'Production' THEN 'Prod & QM'
    WHEN d.dept_name LIKE 'Quality Management' THEN 'Prod & QM'
    WHEN d.dept_name LIKE 'Finance' THEN 'Finance & HR'
    WHEN d.dept_name LIKE 'Human Resources' THEN 'Finance & HR'
    ELSE 'Customer Service'
    END as combined_dept
FROM salaries s
JOIN dept_emp de
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date > now()
GROUP BY combined_dept;