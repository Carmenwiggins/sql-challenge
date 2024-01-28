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



