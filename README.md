# sql-challenge ...And the fun begins!!!
Its Time for some Data Engineering and Analysis using SQL!
# Employee Database: A Mystery in Two Parts



## A little background Story

Finally i have been hired as a new data engineer at Pewlett Hackard!! Dream Job! My first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this assignment, I designed  tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, I will perform:

1. Data Engineering

3. Data Analysis


#### Data Modeling

Inspected the CSVs and sketched out an ERD of the tables. 

![ERD.png](https://github.com/saumya-datascience/sql-challenge/blob/main/QuickDBD-export%20(1).png)

#  RESULTS AND ANALYSIS
## Data Engineering

* Used the information I have to create a table schema for each of the six CSV files. Remembered to specify data types, primary keys, foreign keys, and other constraints.
### Result 1
* [table schema](https://github.com/saumya-datascience/sql-challenge/blob/main/schema.sql)


### Data Analysis

Once  completed database, following analysis was done

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
### Result 2
[query.sql](https://github.com/saumya-datascience/sql-challenge/blob/main/queries.sql)

## Bonus (Optional) But ofcourse I did it!!!!

As i examined the data i got suspicious that the data was fake.  I surmise that my boss has  handed me spurious data in order to test the data engineering skills of a new employee. To confirm my hunch, I decided to take the following steps to generate a visualization of the data, with which I will confront my boss:

1. Imported the SQL database into Pandas. (Yes, I could read the CSVs directly in Pandas, but I am, after all, trying to prove my technical mettle.) 
2. Created a histogram to visualize the most common salary ranges for employees.
3. Created a bar chart of average salary by title.
### Result 3
[BONUS.ipnyb](https://github.com/saumya-datascience/sql-challenge/blob/main/bonus.ipynb)

THE END!
