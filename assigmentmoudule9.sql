DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS title CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_mangers

  CREATE TABLE employees (
  emp_no INT NOT NULL,	
  emp_title_id VARCHAR NOT NULL,
  birth_date DATE NOT NULL,	
  first_name VARCHAR (30) NOT NULL,
  last_name VARCHAR (30) NOT NULL,
  sex  VARCHAR (10) NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title_id) REFERENCES title (title_id)
);
-- 	to view table input ok
	SELECT * FROM employees;
-- create title table
 CREATE TABLE title (
  title_id VARCHAR NOT NULL,	
  title VARCHAR NOT NULL,
  PRIMARY KEY (title_id)
  
);
-- 	to view table input ok
	SELECT * FROM title;
	
-- create department table	

  CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,	
  dept_name VARCHAR NOT NULL,
  
  PRIMARY KEY (dept_no)

);
-- 	to view table input ok
SELECT * FROM departments;

-- create department table	
  CREATE TABLE dept_managers (
  dept_no VARCHAR NOT NULL,	
  emp_no INT NOT NULL,
  
  PRIMARY KEY (dept_no,emp_no),
  FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
 
);
-- 	to view table input ok
SELECT * FROM dept_managers;

-- create dept_emp table	
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,	
  
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 
);
-- 	to view table input OK
SELECT * FROM dept_emp ;

-- create salaries table	
CREATE TABLE salaries (
  emp_no INT NOT NULL,	
  salary INT NOT NULL,
  
  PRIMARY KEY (emp_no, salary)
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
 
);
-- 	to view table input OK
SELECT * FROM salaries ;

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


