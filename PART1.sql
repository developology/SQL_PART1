create database CompanyDB;
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DepartmentID INT,
    JoiningDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Sales');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) VALUES
(1, 'John', 'Doe', 28, 50000.00, 2, '2022-01-15'),
(2, 'Jane', 'Smith', 35, 65000.00, 2, '2021-11-03'),
(3, 'Michael', 'Brown', 40, 75000.00, 1, '2019-07-22'),
(4, 'Emily', 'Davis', 25, 45000.00, 3, '2023-03-19'),
(5, 'Robert', 'Wilson', 30, 55000.00, 2, '2022-05-10'),
(6, 'Linda', 'Johnson', 42, 70000.00, 1, '2018-09-08'),
(7, 'David', 'Lee', 38, 60000.00, 3, '2020-06-11'),
(8, 'Sophia', 'Miller', 27, 48000.00, 1, '2023-02-27'),
(9, 'James', 'Taylor', 33, 52000.00, 2, '2021-12-30'),
(10, 'Olivia', 'Anderson', 29, 49000.00, 3, '2023-04-15');


-- Write a query to display all employees along with their department names.
Select Departments.departmentID, departments.departmentname ,
concat(employees.FirstName,' ',employees.LastName) as FullName, employees.Salary 
from employees left JOIN Departments 
on employees.departmentID = Departments.departmentID;


-- Write a query to calculate the average salary of employees in each department.
SELECT Departments.DepartmentID, Departments.DepartmentName, AVG(Employees.Salary) AS AverageSalary
from Employees LEFT JOIN Departments on Employees.DepartmentID = Departments.DepartmentID
group by Departments.DepartmentID, Departments.DepartmentName;


-- Write a query to display all employees who have joined in the last 2 years.
-- easily select the difference between current and joining date and print only those who difference is less than 2 year span
select CONCAT(employees.FirstName,'',employees.LastName) as FullName, employees.joiningDate from Employees;
SELECT employees.joiningDate , DATEDIFF(CURDATE(), employees.joiningDate) AS NoofJoiningdays FROM Employees
where DATEDIFF(CURDATE(), employees.joiningDate)<=730;


-- Write a query to find the department with the highest number of employees.
SELECT Employees.DepartmentID, COUNT(Employees.EmployeeID) AS Total_Employees
FROM Employees
GROUP BY Employees.DepartmentID
ORDER BY Total_Employees DESC
LIMIT 1;


-- Update the salary of employees whose age is greater than 40 by increasing it by 10%.
select employees.age, employees.salary, (((employees.salary*10)/100)+ employees.salary) as Updated_Salary 
from employees where employees.age >=40;


-- Write a query to delete all employees from the department named 'Sales'.
-- delete employees.*, department.departmentName from employees left join departments on department.departmentname='Sales';
select employees.FirstName, employees.LastName, Departments.DepartmentName
from Employees 
left JOIN Departments ON employees.DepartmentID = Departments.DepartmentID
where Departments.DepartmentName = 'Sales';


-- Create a view named HighEarnerEmployees that displays the EmployeeID, FirstName, LastName, and Salary of employees earning more than 100000.
create view HighEarnerEmployees AS 
select employees.employeeID, concat(employees.firstname,' ',employees.lastname) as FullName, employees.salary 
from employees where employees.salary > 60000;


-- Write a query using a common table expression (CTE) to find employees who report to the same department and have salaries greater than the average salary of that department.
WITH AvgSalaries AS (
SELECT DepartmentID, AVG(Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID
) 
SELECT FirstName, LastName, Salary FROM Employees
JOIN AvgSalaries a ON employees.DepartmentID = a.DepartmentID WHERE employees.Salary > a.AvgSalary;
