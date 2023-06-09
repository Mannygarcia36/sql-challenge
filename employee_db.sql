CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no)
	UNIQUE (dept_name)
);

CREATE TABLE Dept_Emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
    );
CREATE TABLE dept_Manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no)
	);

	
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (emp_no)
);
	
CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR(50) NOT NULL,
	PRIMARY KEY (title_id),
	FOREIGN KEY(title_id) REFERENCES Employees (emp_title_id)
);

/* 1.List the following details of each employee: employee number, last name, 
first name, sex, and salary.*/
SELECT employee_number, last_name, first_name, sex, salary
FROM employees;

/*2.List first name, last name, and hire date for employees who were hired 
in 1986.*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/*3.List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, 
first name.*/
SELECT departments.department_number, departments.department_name, 
employees.employee_number, employees.last_name, employees.first_name, 
departments.manager_employee_number
FROM departments
JOIN employees ON departments.manager_employee_number = employees.employee_number;

/*4.List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
SELECT employees.employee_number, employees.last_name, employees.first_name, 
employees.department_number, departments.department_name
FROM employees
JOIN departments ON employees.department_number = departments.department_number;

/*5.List first name, last name, and sex for employees whose first name is 
"Hercules" and last names begin with "B."*/
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

/*6.List all employees in the Sales department, including their employee number, 
last name, first name, and department name.*/
SELECT employee_number, last_name, first_name
FROM employees
WHERE department_number = 'Sales';

/*7.List all employees in the Sales and Development departments, including 
their employee number, last name, first name, and department name.*/
SELECT employees.employee_number, employees.last_name, employees.first_name, 
departments.department_name
FROM employees
JOIN departments ON employees.department_number = departments.department_number
WHERE departments.department_name IN ('Sales', 'Development');

/*8.In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;



