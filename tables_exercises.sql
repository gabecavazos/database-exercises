USE employees;
SHOW TABLES;
DESCRIBE employees;
-- 5. int, date, string, bool
-- 6. Which table(s) do you think contain a numeric type column?
-- All but Departments
-- 7. Which table(s) do you think contain a string type column?
-- All but salaries
-- 8. Which table(s) do you think contain a date type column?
-- All but Departments
-- 9. What is the relationship between the employees and the departments tables?
-- dept_emp and dept_manager
SHOW CREATE TABLE dept_manager;