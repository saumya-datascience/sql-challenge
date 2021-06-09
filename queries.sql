--1)List the following details of each employee: employee number, last name, first name,
--sex, and salary.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no=s.emp_no;

--2)List first name, last name, and hire date for employees who were hired in 1986.

SELECT last_name,first_name,hire_date FROM employees 
WHERE  date_part('year', hire_date)= 1986;

--3)List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.

SELECT dm.emp_no,dm.dept_no,e.first_name,e.last_name,dep.dept_name
FROM employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no=dm.emp_no
INNER JOIN departments as dep
ON dm.dept_no=dep.dept_no;

--4)List the department of each employee with the following information: employee number,
--last name, first name, and department name.

SELECT e.emp_no,e.first_name,e.last_name,dep.dept_name
FROM employees AS e
LEFT JOIN dept_emp as de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS dep
ON de.dept_no=dep.dept_no;

--5)List first name, last name, and sex for employees whose first name is "Hercules"
--and last names begin with "B."

SELECT first_name,last_name,sex FROM employees
WHERE 
first_name='Hercules' AND
SUBSTRING( last_name, 1, 1 )='B';


--6)List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT e.first_name,e.last_name,e.emp_no,dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments  AS dep
ON de.dept_no=dep.dept_no
WHERE dept_name='Sales';

--7)List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT e.first_name,e.last_name,e.emp_no,dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments  AS dep
ON de.dept_no=dep.dept_no
WHERE dept_name='Sales'
OR dept_name='Development';

--8)In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name,count(last_name) AS "freq_lastname"
From employees 
GROUP BY last_name
ORDER BY "freq_lastname" DESC;
