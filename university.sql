-- University Database Setup
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    building VARCHAR(50),
    budget DECIMAL(12,2)
);

-- Create professors table
CREATE TABLE IF NOT EXISTS professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE,
    major_department_id INT,
    FOREIGN KEY (major_department_id) REFERENCES departments(department_id)
);

-- Create enrollments table
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    professor_id INT,
    semester VARCHAR(20),
    year INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

-- Insert departments data
INSERT INTO departments VALUES
(1, 'Computer Science', 'Engineering Building', 1200000.00),
(2, 'Mathematics', 'Science Building', 850000.00),
(3, 'Physics', 'Science Building', 950000.00),
(4, 'Biology', 'Life Sciences Building', 1100000.00),
(5, 'Chemistry', 'Science Building', 900000.00),
(6, 'Economics', 'Business Building', 750000.00),
(7, 'Psychology', 'Social Sciences Building', 800000.00);

-- Insert professors data
INSERT INTO professors VALUES
(101, 'Robert', 'Johnson', 'r.johnson@university.edu', '2005-08-15', 95000.00, 1),
(102, 'Emily', 'Williams', 'e.williams@university.edu', '2010-03-22', 85000.00, 1),
(103, 'Michael', 'Brown', 'm.brown@university.edu', '2008-07-10', 92000.00, 2),
(104, 'Sarah', 'Davis', 's.davis@university.edu', '2012-01-30', 78000.00, 3),
(105, 'David', 'Miller', 'd.miller@university.edu', '2015-09-18', 82000.00, 4),
(106, 'Jennifer', 'Wilson', 'j.wilson@university.edu', '2007-11-05', 105000.00, 5),
(107, 'Thomas', 'Moore', 't.moore@university.edu', '2018-04-12', 75000.00, 6),
(108, 'Lisa', 'Taylor', 'l.taylor@university.edu', '2014-06-25', 88000.00, 7),
(109, 'James', 'Anderson', 'j.anderson@university.edu', '2011-02-14', 91000.00, 1),
(110, 'Patricia', 'Thomas', 'p.thomas@university.edu', '2016-08-30', 79000.00, 2);

-- Insert courses data
INSERT INTO courses VALUES
(201, 'Introduction to Programming', 4, 1),
(202, 'Data Structures', 4, 1),
(203, 'Calculus I', 3, 2),
(204, 'Linear Algebra', 3, 2),
(205, 'Quantum Mechanics', 4, 3),
(206, 'Thermodynamics', 3, 3),
(207, 'Genetics', 4, 4),
(208, 'Organic Chemistry', 4, 5),
(209, 'Microeconomics', 3, 6),
(210, 'Cognitive Psychology', 3, 7),
(211, 'Database Systems', 4, 1),
(212, 'Algorithms', 4, 1),
(213, 'Calculus II', 3, 2),
(214, 'Differential Equations', 3, 2),
(215, 'Electromagnetism', 4, 3);

-- Insert students data
INSERT INTO students VALUES
(1001, 'John', 'Smith', 'john.smith@student.edu', '2020-09-01', 1),
(1002, 'Emma', 'Johnson', 'emma.johnson@student.edu', '2021-01-15', 2),
(1003, 'Daniel', 'Williams', 'daniel.williams@student.edu', '2020-09-01', 1),
(1004, 'Olivia', 'Brown', 'olivia.brown@student.edu', '2021-01-15', 3),
(1005, 'Liam', 'Jones', 'liam.jones@student.edu', '2022-09-01', 4),
(1006, 'Sophia', 'Garcia', 'sophia.garcia@student.edu', '2022-09-01', 5),
(1007, 'Noah', 'Miller', 'noah.miller@student.edu', '2020-09-01', 6),
(1008, 'Ava', 'Davis', 'ava.davis@student.edu', '2021-01-15', 7),
(1009, 'William', 'Rodriguez', 'william.rodriguez@student.edu', '2022-09-01', 1),
(1010, 'Isabella', 'Martinez', 'isabella.martinez@student.edu', '2023-01-15', 2),
(1011, 'James', 'Hernandez', 'james.hernandez@student.edu', '2020-09-01', 3),
(1012, 'Charlotte', 'Lopez', 'charlotte.lopez@student.edu', '2021-01-15', 4),
(1013, 'Benjamin', 'Gonzalez', 'benjamin.gonzalez@student.edu', '2022-09-01', 5),
(1014, 'Amelia', 'Wilson', 'amelia.wilson@student.edu', '2023-01-15', 6),
(1015, 'Elijah', 'Anderson', 'elijah.anderson@student.edu', '2020-09-01', 7);

-- Insert enrollments data
INSERT INTO enrollments VALUES
(5001, 1001, 201, 101, 'Fall', 2020, 'A'),
(5002, 1001, 202, 102, 'Spring', 2021, 'B+'),
(5003, 1001, 211, 109, 'Fall', 2021, 'A-'),
(5004, 1002, 203, 103, 'Fall', 2020, 'B'),
(5005, 1002, 204, 110, 'Spring', 2021, 'A'),
(5006, 1003, 201, 101, 'Fall', 2020, 'C+'),
(5007, 1003, 212, 102, 'Spring', 2021, 'B'),
(5008, 1004, 205, 104, 'Fall', 2021, 'A-'),
(5009, 1004, 206, 104, 'Spring', 2022, 'B+'),
(5010, 1005, 207, 105, 'Fall', 2022, 'A'),
(5011, 1006, 208, 106, 'Fall', 2022, 'B'),
(5012, 1007, 209, 107, 'Spring', 2021, 'C'),
(5013, 1008, 210, 108, 'Fall', 2021, 'A'),
(5014, 1009, 201, 101, 'Fall', 2022, 'B+'),
(5015, 1010, 203, 103, 'Spring', 2023, 'A-'),
(5016, 1011, 205, 104, 'Fall', 2022, 'B'),
(5017, 1012, 207, 105, 'Spring', 2023, 'A'),
(5018, 1013, 208, 106, 'Fall', 2022, 'C+'),
(5019, 1014, 209, 107, 'Spring', 2023, 'B-'),
(5020, 1015, 210, 108, 'Fall', 2022, 'A');

-- Solutions to Practice Questions

-- 1. List all professors in the Computer Science department
SELECT p.* 
FROM professors p
JOIN departments d ON p.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 2. Find all courses with more than 3 credits
SELECT * FROM courses WHERE credits > 3;

-- 3. Display students who enrolled in 2020
SELECT * FROM students WHERE YEAR(enrollment_date) = 2020;

-- 4. Find the average salary of professors in each department
SELECT d.department_name, AVG(p.salary) AS avg_salary
FROM professors p
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name;

-- 5. List all courses along with their department names
SELECT c.*, d.department_name
FROM courses c
JOIN departments d ON c.department_id = d.department_id;

-- 6. Find professors hired before 2010
SELECT * FROM professors WHERE YEAR(hire_date) < 2010;

-- 7. Count the number of students in each major department
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s ON d.department_id = s.major_department_id
GROUP BY d.department_name;

-- 8. Find students with a GPA equivalent of A (grade 'A' or 'A-') in any course
SELECT DISTINCT s.*
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.grade IN ('A', 'A-');

-- 9. List all enrollments for the Fall 2021 semester
SELECT * FROM enrollments 
WHERE semester = 'Fall' AND year = 2021;

-- 10. Find the highest paid professor in each department
WITH RankedProfessors AS (
    SELECT p.*, d.department_name,
           RANK() OVER (PARTITION BY p.department_id ORDER BY p.salary DESC) AS salary_rank
    FROM professors p
    JOIN departments d ON p.department_id = d.department_id
)
SELECT professor_id, first_name, last_name, salary, department_name
FROM RankedProfessors
WHERE salary_rank = 1;

-- 11. List students who haven't enrolled in any courses
SELECT s.*
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 12. Find the total budget of all departments in the Science Building
SELECT SUM(budget) AS total_budget
FROM departments
WHERE building = 'Science Building';

-- 13. List professors who teach more than one course
SELECT p.professor_id, p.first_name, p.last_name, COUNT(e.course_id) AS courses_taught
FROM professors p
JOIN enrollments e ON p.professor_id = e.professor_id
GROUP BY p.professor_id, p.first_name, p.last_name
HAVING COUNT(e.course_id) > 1;

-- 14. Find the most popular course (with the most enrollments)
SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC
LIMIT 1;

-- 15. Calculate the total number of credits each student has taken
SELECT s.student_id, s.first_name, s.last_name, SUM(c.credits) AS total_credits
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- 16. List students who changed their major (have enrollments in courses from different departments than their major)
SELECT DISTINCT s.student_id, s.first_name, s.last_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.department_id != s.major_department_id;

-- 17. Find the department with the highest average professor salary
SELECT d.department_name, AVG(p.salary) AS avg_salary
FROM professors p
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- 18. List all courses that have no enrollments
SELECT c.*
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 19. Find students who have taken courses from at least 3 different departments
SELECT s.student_id, s.first_name, s.last_name, COUNT(DISTINCT c.department_id) AS dept_count
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT c.department_id) >= 3;

-- 20. Calculate the average grade per course (convert letter grades to numerical values: A=4, B=3, etc.)
SELECT c.course_id, c.course_name, 
       AVG(CASE 
           WHEN e.grade = 'A' THEN 4
           WHEN e.grade = 'A-' THEN 3.7
           WHEN e.grade = 'B+' THEN 3.3
           WHEN e.grade = 'B' THEN 3
           WHEN e.grade = 'B-' THEN 2.7
           WHEN e.grade = 'C+' THEN 2.3
           WHEN e.grade = 'C' THEN 2
           ELSE 0
       END) AS avg_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 21. List professors who have never taught a course
SELECT p.*
FROM professors p
LEFT JOIN enrollments e ON p.professor_id = e.professor_id
WHERE e.enrollment_id IS NULL;

-- 22. Find the student with the highest cumulative GPA
WITH StudentGPAs AS (
    SELECT s.student_id, s.first_name, s.last_name,
           AVG(CASE 
               WHEN e.grade = 'A' THEN 4
               WHEN e.grade = 'A-' THEN 3.7
               WHEN e.grade = 'B+' THEN 3.3
               WHEN e.grade = 'B' THEN 3
               WHEN e.grade = 'B-' THEN 2.7
               WHEN e.grade = 'C+' THEN 2.3
               WHEN e.grade = 'C' THEN 2
               ELSE 0
           END) AS gpa
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT * FROM StudentGPAs
ORDER BY gpa DESC
LIMIT 1;

-- 23. List all courses taught by Professor Robert Johnson
SELECT c.*
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN professors p ON e.professor_id = p.professor_id
WHERE p.first_name = 'Robert' AND p.last_name = 'Johnson';

-- 24. Find departments where the total student enrollments exceed the department budget divided by 1000
SELECT d.department_id, d.department_name, 
       COUNT(e.enrollment_id) AS enrollments,
       d.budget,
       d.budget/1000 AS budget_threshold
FROM departments d
JOIN courses c ON d.department_id = c.department_id
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY d.department_id, d.department_name, d.budget
HAVING COUNT(e.enrollment_id) > (d.budget/1000);

-- 25. List students who have taken all courses offered by their major department
SELECT s.student_id, s.first_name, s.last_name
FROM students s
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM courses c
    WHERE c.department_id = s.major_department_id
    AND NOT EXISTS (
        SELECT 1
        FROM enrollments e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
);

-- 26. Find the semester with the most enrollments
SELECT semester, year, COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY semester, year
ORDER BY enrollment_count DESC
LIMIT 1;

-- 27. Calculate the percentage of professors making more than $85,000 in each department
SELECT d.department_name,
       COUNT(CASE WHEN p.salary > 85000 THEN 1 END) AS high_earners,
       COUNT(*) AS total_professors,
       (COUNT(CASE WHEN p.salary > 85000 THEN 1 END) * 100.0 / COUNT(*)) AS percentage
FROM professors p
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name;

-- 28. List students who have the same major as Emma Johnson
SELECT s.*
FROM students s
WHERE s.major_department_id = (
    SELECT major_department_id 
    FROM students 
    WHERE first_name = 'Emma' AND last_name = 'Johnson'
)
AND NOT (s.first_name = 'Emma' AND s.last_name = 'Johnson');

-- 29. Find courses that are offered by departments with budgets over $1,000,000
SELECT c.*
FROM courses c
JOIN departments d ON c.department_id = d.department_id
WHERE d.budget > 1000000;

-- 30. Calculate the average time (in years) professors have been at the university by department
SELECT d.department_name, 
       AVG(TIMESTAMPDIFF(YEAR, p.hire_date, CURDATE())) AS avg_years
FROM professors p
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name;

-- 31. List students who have taken at least one course with each professor in their major department
SELECT s.student_id, s.first_name, s.last_name
FROM students s
WHERE NOT EXISTS (
    SELECT p.professor_id
    FROM professors p
    WHERE p.department_id = s.major_department_id
    AND NOT EXISTS (
        SELECT 1
        FROM enrollments e
        JOIN courses c ON e.course_id = c.course_id
        WHERE e.student_id = s.student_id
        AND e.professor_id = p.professor_id
        AND c.department_id = s.major_department_id
    )
);

-- 32. Find departments where the average professor salary is higher than the university-wide average
WITH DeptAvg AS (
    SELECT d.department_id, d.department_name, AVG(p.salary) AS dept_avg
    FROM professors p
    JOIN departments d ON p.department_id = d.department_id
    GROUP BY d.department_id, d.department_name
),
UnivAvg AS (
    SELECT AVG(salary) AS univ_avg FROM professors
)
SELECT da.*
FROM DeptAvg da, UnivAvg ua
WHERE da.dept_avg > ua.univ_avg;