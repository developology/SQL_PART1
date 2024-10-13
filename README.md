# SQL_PART1

Question:
Create a database named CompanyDB and add the following tables:

1- Departments

a) DepartmentID - INT, Primary Key

b) DepartmentName - VARCHAR(100)

2- Employees

a) EmployeeID - INT, Primary Key

b) FirstName - VARCHAR(50)

c) LastName - VARCHAR(50)

d) Age - INT

e) Salary - DECIMAL(10, 2)

f) DepartmentID - INT, Foreign Key referencing Departments(DepartmentID)

g) JoiningDate - DATE

Insert at least 3 records into the Departments table and at least 10 records into the Employees table with different details.

Tasks:

1. Write a query to display all employees along with their department names.

2. Write a query to calculate the average salary of employees in each department.

3. Write a query to display all employees who have joined in the last 2 years.

4. Write a query to find the department with the highest number of employees.

5. Update the salary of employees whose age is greater than 40 by increasing it by 10%.

6. Write a query to delete all employees from the department named 'Sales'.

7. Create a view named HighEarnerEmployees that displays the EmployeeID, FirstName, LastName, and Salary of employees earning more than 100000.

8. Write a query using a common table expression (CTE) to find employees who report to the same department and have salaries greater than the average salary of that department.
