
--1 CREATE QUERIES by joining tables
-- Use Join to list salary by employee
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex,
	   sal.Salary
FROM employees as emp
	 LEFT JOIN salaries as sal
	 ON(emp.emp_no =sal.emp_no)
	 ORDER BY emp.emp_no;

--2 list employee by hired date

SELECT emp.last_name,
	   emp.first_name,
	   emp.hire_date
FROM employees as emp
WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;

-- 3-list department manager ok

SELECT dept_managers.dept_no,
	   departments.dept_name, 
	   employees.emp_no,
	   employees.last_name, 
	   employees.first_name
FROM dept_managers
	INNER JOIN employees ON(employees.emp_no = dept_managers.emp_no)
	INNER JOIN departments ON (dept_managers.dept_no = departments.dept_no);


-- 4 list department number
	   
SELECT dept_emp.dept_no, employees.emp_no, 
employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;	   
	      
	   
-- 5 list name hecules last name begins with B ok
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex
FROM employees as emp
WHERE emp.first_name = 'Hercules'
and emp.last_name LIKE 'B%';

-- -- 6 stuck on this one
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
-- 	   dept_emp.dept_no
	   departments.dept_name
FROM employees as emp
JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no =dept_emp.dept_no

WHERE dept_name LIKE 'Sales%';

-- 7 
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   departments.dept_name
FROM employees as emp
JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no =dept_emp.dept_no

WHERE dept_name LIKE 'Sales%' Or dept_name LIKE 'Develop%';


-- 8 list the frequency counts in decending order ok

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


