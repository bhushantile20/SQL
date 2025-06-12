
-- TOP 30 SQL Query Questions commonly asked by interviewer

create database placement;

use placement;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    EmailID VARCHAR(100),
    ManagerID INT,
    DateOfJoining DATE,
    Dept VARCHAR(10),
    CompID INT
);



INSERT INTO Employee VALUES 
(1, 'NANDA', 'KUMAR', 50000, 'NANDA@GMAIL.COM', NULL, '2012-06-15', 'IT', 1001);

INSERT INTO Employee VALUES 
(2, 'BIPLAB', 'PARIDA', 30000, 'BPARIDA@YAHOO.COM', 1, '2015-12-21', 'IT', 1001);

INSERT INTO Employee VALUES 
(3, 'DISHA', 'PATEL', 50000, 'DISHAP@GMAIL.COM', NULL, '2013-08-21', 'HR', NULL);

INSERT INTO Employee VALUES 
(4, 'SIBA', 'PRASAD', 90000, 'SIBA@GMAIL.COM', 3, '2020-06-01', 'HR', 1002);

INSERT INTO Employee VALUES 
(5, 'ANUSHKA', 'SHARMA', 20000, 'SHARMAA@GMAIL.COM', 1, '2021-03-01', 'IT', NULL);

INSERT INTO Employee VALUES 
(6, 'SOMNATH', 'MAHA', 65000, 'SMAHA@GMAIL.COM', 3, '2019-05-07', 'IT', 1003);

select *from employee;


-- SQL INTERVIEW QUERIES SOLUTIONS

-- 1. Update DateOfJoining to 15-jul-2012 for empid = 1
UPDATE Employee SET DateOfJoining = '2012-07-15' WHERE EmpID = 1;

-- 2. Select all student name where age is greater than 22 (Assume table: Student, column: Age)
SELECT Name FROM Student WHERE Age > 22;

-- 3. Find all employee with Salary between 40000 and 80000
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 80000;

-- 4. Display full name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employee;

-- 5. Find name of employee beginning with S
SELECT * FROM Employee WHERE FirstName LIKE 'S%';

-- 6. Employees whose firstname ends with 'A' and contains exactly 5 letters
SELECT * FROM Employee WHERE FirstName LIKE '____A';

-- 7. Exclude employees with first names 'ANUSHKA' and 'SOMNATH'
SELECT * FROM Employee WHERE FirstName NOT IN ('ANUSHKA', 'SOMNATH');

-- 8. Display current date
SELECT CURRENT_DATE();

-- 9. Get day of last day of previous month
SELECT DAY(LAST_DAY(CURRENT_DATE - INTERVAL 1 MONTH));

-- 10. Replace A with '@' in first name
SELECT REPLACE(FirstName, 'A', '@') FROM Employee;

-- 11. Fetch domain from email address
SELECT SUBSTRING(EmailID, LOCATE('@', EmailID) + 1) AS Domain FROM Employee;

-- 12. Remove leading and trailing spaces in names
UPDATE Employee SET FirstName = TRIM(FirstName), LastName = TRIM(LastName);

-- 13. Employees who joined in year 2020
SELECT * FROM Employee WHERE YEAR(DateOfJoining) = 2020;

-- 14. Fetch only odd/even rows (MySQL 8+ window functions)
-- Odd rows
SELECT * FROM (SELECT *, ROW_NUMBER() OVER () AS rn FROM Employee) AS t WHERE MOD(rn, 2) = 1;
-- Even rows
SELECT * FROM (SELECT *, ROW_NUMBER() OVER () AS rn FROM Employee) AS t WHERE MOD(rn, 2) = 0;

-- 15. Create new table with structure and data
CREATE TABLE NewEmployee AS SELECT * FROM Employee;

-- 16. Create empty table with same structure
CREATE TABLE EmptyEmployee LIKE Employee;

-- 17. Top 3 highest salaries
SELECT * FROM Employee ORDER BY Salary DESC LIMIT 3;

-- 18. First and last employee (based on EmpID)
SELECT * FROM Employee ORDER BY EmpID ASC LIMIT 1;
SELECT * FROM Employee ORDER BY EmpID DESC LIMIT 1;

-- 19. Count of records
SELECT COUNT(*) FROM Employee;

-- 20. Department-wise count sorted ascending
SELECT Dept, COUNT(*) AS DeptCount FROM Employee GROUP BY Dept ORDER BY DeptCount ASC;

-- 21. Departments with less than 4 employees
SELECT Dept FROM Employee GROUP BY Dept HAVING COUNT(*) < 4;

-- 22. Department-wise max salary
SELECT Dept, MAX(Salary) FROM Employee GROUP BY Dept;

-- 23. Employee earning max salary in each department
SELECT * FROM Employee e WHERE Salary = (SELECT MAX(Salary) FROM Employee WHERE Dept = e.Dept);

-- 24. First 50% records (using window function or LIMIT)
SELECT * FROM Employee LIMIT (SELECT CEIL(COUNT(*) * 0.5) FROM Employee);

-- 25. Employees not having computer (CompID is NULL)
SELECT * FROM Employee WHERE CompID IS NULL;

-- 26. Employee with assigned computer details (Assume table: Computer with CompID, CompName)
SELECT e.*, c.CompName FROM Employee e JOIN Computer c ON e.CompID = c.CompID;

-- 27. Same as 26
SELECT e.*, c.CompName FROM Employee e JOIN Computer c ON e.CompID = c.CompID;

-- 28. All computers with employee name using it
SELECT c.*, e.FirstName, e.LastName FROM Computer c JOIN Employee e ON c.CompID = e.CompID;

-- 29. Delete duplicate records
DELETE e1 FROM Employee e1 JOIN Employee e2 ON e1.FirstName = e2.FirstName AND e1.LastName = e2.LastName AND e1.EmpID > e2.EmpID;

-- 30. Nth highest salary (Example: 3rd highest)
SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 1 OFFSET 2;


