-- two dots ('..' - without quotes).
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(30)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


--List the following details of each employee: employee number, last name, first name,
--sex, and salary.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT last_name,first_name,hire_date FROM employees 
WHERE  date_part('year', hire_date)= 1986;

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.

SELECT dm.emp_no,dm.dept_no,e.first_name,e.last_name,dep.dept_name
FROM employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no=dm.emp_no
INNER JOIN departments as dep
ON dm.dept_no=dep.dept_no;

--List the department of each employee with the following information: employee number,
--last name, first name, and department name.

SELECT e.emp_no,e.first_name,e.last_name,dep.dept_name
FROM employees AS e
LEFT JOIN dept_emp as de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS dep
ON de.dept_no=dep.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules"
--and last names begin with "B."

SELECT first_name,last_name,sex FROM employees
WHERE 
first_name='Hercules' AND
SUBSTRING( last_name, 1, 1 )='B';


--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT e.first_name,e.last_name,e.emp_no,dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments  AS dep
ON de.dept_no=dep.dept_no
WHERE dept_name='Sales';

--List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT e.first_name,e.last_name,e.emp_no,dep.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no=de.emp_no
INNER JOIN departments  AS dep
ON de.dept_no=dep.dept_no
WHERE dept_name='Sales'
OR dept_name='Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name,count(last_name) AS "freq_lastname"
From employees 
GROUP BY last_name
ORDER BY "freq_lastname" DESC;
