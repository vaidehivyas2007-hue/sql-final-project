/* =========================================================
   FINAL PROJECT
   UNIVERSITY COURSE MANAGEMENT SYSTEM
   ========================================================= */


/* =========================================================
   STEP 1: CREATE DATABASE
   ========================================================= */

CREATE DATABASE IF NOT EXISTS university_course_management;

USE university_course_management;

(Database changed)


/* =========================================================
   STEP 2: DROP OLD TABLES
   ========================================================= */

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

(Query OK, 0 rows affected)


/* =========================================================
   STEP 3: CREATE DEPARTMENTS TABLE
   ========================================================= */

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

(Query OK, 0 rows affected)


/* =========================================================
   STEP 4: CREATE STUDENTS TABLE
   ========================================================= */

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

(Query OK, 0 rows affected)
/* =========================================================
   STEP 5: CREATE COURSES TABLE
   ========================================================= */

CREATE TABLE Courses
(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

(Query OK, 0 rows affected)

/* =========================================================
   STEP 6: CREATE INSTRUCTORS TABLE
   ========================================================= */

/*
   Salary is added because Query 8 asks for
   maximum salary of instructors.
*/

CREATE TABLE Instructors
(
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);
Query OK, 0 rows affected

/* =========================================================
   STEP 7: CREATE ENROLLMENTS TABLE
   ========================================================= */

CREATE TABLE Enrollments
(
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID),

    FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)
);


/* =========================================================
   STEP 8: INSERT DATA INTO DEPARTMENTS
   ========================================================= */

INSERT INTO Departments
(DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Commerce'),
(4, 'Physics'),
(5, 'English');

+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
|            3 | Commerce         |
|            4 | Physics          |
|            5 | English          |
+--------------+------------------+

/* =========================================================
   STEP 9: INSERT DATA INTO STUDENTS
   ========================================================= */

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Patel', 'rahul.patel@email.com', '2001-03-10', '2023-07-15'),
(4, 'Priya', 'Shah', 'priya.shah@email.com', '2000-11-20', '2024-01-10'),
(5, 'Amit', 'Mehta', 'amit.mehta@email.com', '1999-09-12', '2020-08-01'),
(6, 'Neha', 'Joshi', 'neha.joshi@email.com', '2001-06-18', '2023-08-01'),
(7, 'Riya', 'Desai', 'riya.desai@email.com', '2000-02-28', '2021-07-20'),
(8, 'Karan', 'Verma', 'karan.verma@email.com', '1998-12-05', '2019-08-01'),
(9, 'Sneha', 'Patel', 'sneha.patel@email.com', '2001-04-14', '2024-08-01'),
(10, 'Vivek', 'Shah', 'vivek.shah@email.com', '1999-10-22', '2022-07-15'),
(11, 'Anjali', 'Mehta', 'anjali.mehta@email.com', '2000-07-11', '2023-01-15'),
(12, 'Arjun', 'Joshi', 'arjun.joshi@email.com', '2001-01-30', '2025-01-10');

+-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com     | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com   | 1999-05-25 | 2021-08-01     |
|         3 | Rahul     | Patel    | rahul.patel@email.com  | 2001-03-10 | 2023-07-15     |
|         4 | Priya     | Shah     | priya.shah@email.com   | 2000-11-20 | 2024-01-10     |
|         5 | Amit      | Mehta    | amit.mehta@email.com   | 1999-09-12 | 2020-08-01     |
|         6 | Neha      | Joshi    | neha.joshi@email.com   | 2001-06-18 | 2023-08-01     |
|         7 | Riya      | Desai    | riya.desai@email.com   | 2000-02-28 | 2021-07-20     |
|         8 | Karan     | Verma    | karan.verma@email.com  | 1998-12-05 | 2019-08-01     |
|         9 | Sneha     | Patel    | sneha.patel@email.com  | 2001-04-14 | 2024-08-01     |
|        10 | Vivek     | Shah     | vivek.shah@email.com   | 1999-10-22 | 2022-07-15     |
|        11 | Anjali    | Mehta    | anjali.mehta@email.com | 2000-07-11 | 2023-01-15     |
|        12 | Arjun     | Joshi    | arjun.joshi@email.com  | 2001-01-30 | 2025-01-10     |
+-----------+-----------+----------+------------------------+------------+----------------+
12 rows in set (0.009 sec)


/* =========================================================
   STEP 10: INSERT DATA INTO COURSES
   ========================================================= */

INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Database Management', 1, 3),
(104, 'Calculus', 2, 4),
(105, 'Statistics', 2, 3),
(106, 'Linear Algebra', 2, 4),
(107, 'Accounting', 3, 3),
(108, 'Business Mathematics', 3, 3);

+----------+----------------------+--------------+---------+
| CourseID | CourseName           | DepartmentID | Credits |
+----------+----------------------+--------------+---------+
|      101 | Introduction to SQL  |            1 |       3 |
|      102 | Data Structures      |            1 |       4 |
|      103 | Database Management  |            1 |       3 |
|      104 | Calculus             |            2 |       4 |
|      105 | Statistics           |            2 |       3 |
|      106 | Linear Algebra       |            2 |       4 |
|      107 | Accounting           |            3 |       3 |
|      108 | Business Mathematics |            3 |       3 |
+----------+----------------------+--------------+---------+
8 rows in set (0.011 sec)

/* =========================================================
   STEP 11: INSERT DATA INTO INSTRUCTORS
   ========================================================= */

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 65000),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 70000),
(3, 'David', 'Brown', 'david.brown@univ.com', 1, 75000),
(4, 'Emma', 'Wilson', 'emma.wilson@univ.com', 3, 60000),
(5, 'Michael', 'Clark', 'michael.clark@univ.com', 2, 68000);

+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 65000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 70000.00 |
|            3 | David     | Brown    | david.brown@univ.com   |            1 | 75000.00 |
|            4 | Emma      | Wilson   | emma.wilson@univ.com   |            3 | 60000.00 |
|            5 | Michael   | Clark    | michael.clark@univ.com |            2 | 68000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
5 rows in set (0.013 sec)


/* =========================================================
   STEP 12: INSERT DATA INTO ENROLLMENTS
   ========================================================= */

INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 1, 102, '2022-08-02'),
(3, 1, 103, '2022-08-03'),

(4, 2, 101, '2021-08-01'),
(5, 2, 102, '2021-08-02'),

(6, 3, 101, '2023-07-15'),
(7, 3, 102, '2023-07-16'),

(8, 4, 101, '2024-01-10'),
(9, 4, 104, '2024-01-11'),

(10, 5, 101, '2020-08-01'),
(11, 5, 102, '2020-08-02'),
(12, 5, 103, '2020-08-03'),

(13, 6, 101, '2023-08-01'),
(14, 6, 102, '2023-08-02'),

(15, 7, 101, '2021-07-20'),
(16, 7, 105, '2021-07-21'),

(17, 8, 102, '2019-08-01'),
(18, 8, 103, '2019-08-02'),

(19, 9, 104, '2024-08-01'),
(20, 9, 105, '2024-08-02'),

(21, 10, 101, '2022-07-15'),
(22, 10, 102, '2022-07-16'),

(23, 11, 104, '2023-01-15'),
(24, 11, 105, '2023-01-16'),

(25, 12, 106, '2025-01-10');


+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         1 |      102 | 2022-08-02     |
|            3 |         1 |      103 | 2022-08-03     |
|            4 |         2 |      101 | 2021-08-01     |
|            5 |         2 |      102 | 2021-08-02     |
|            6 |         3 |      101 | 2023-07-15     |
|            7 |         3 |      102 | 2023-07-16     |
|            8 |         4 |      101 | 2024-01-10     |
|            9 |         4 |      104 | 2024-01-11     |
|           10 |         5 |      101 | 2020-08-01     |
|           11 |         5 |      102 | 2020-08-02     |
|           12 |         5 |      103 | 2020-08-03     |
|           13 |         6 |      101 | 2023-08-01     |
|           14 |         6 |      102 | 2023-08-02     |
|           15 |         7 |      101 | 2021-07-20     |
|           16 |         7 |      105 | 2021-07-21     |
|           17 |         8 |      102 | 2019-08-01     |
|           18 |         8 |      103 | 2019-08-02     |
|           19 |         9 |      104 | 2024-08-01     |
|           20 |         9 |      105 | 2024-08-02     |
|           21 |        10 |      101 | 2022-07-15     |
|           22 |        10 |      102 | 2022-07-16     |
|           23 |        11 |      104 | 2023-01-15     |
|           24 |        11 |      105 | 2023-01-16     |
|           25 |        12 |      106 | 2025-01-10     |
+--------------+-----------+----------+----------------+
25 rows in set (0.008 sec)

/* =========================================================
   QUERY 1: CRUD OPERATIONS ON ALL TABLES
   ========================================================= */


/* ---------- CREATE / INSERT ---------- */

INSERT INTO Departments
VALUES (99, 'Temporary Department');

INSERT INTO Students
VALUES
(99, 'Test', 'Student', 'test@email.com', '2000-01-01', '2025-01-01');

INSERT INTO Courses
VALUES
(999, 'Temporary Course', 99, 3);

INSERT INTO Instructors
VALUES
(99, 'Test', 'Instructor', 'test@univ.com', 99, 50000);

INSERT INTO Enrollments
VALUES
(999, 99, 999, '2025-01-01');

(Query OK, 1 row affected)


/* ---------- READ / SELECT ---------- */

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;



/* ---------- UPDATE ---------- */

UPDATE Departments
SET DepartmentName = 'Updated Department'
WHERE DepartmentID = 99;

UPDATE Students
SET FirstName = 'Updated'
WHERE StudentID = 99;

UPDATE Courses
SET CourseName = 'Updated Course'
WHERE CourseID = 999;

UPDATE Instructors
SET Salary = 55000
WHERE InstructorID = 99;

UPDATE Enrollments
SET EnrollmentDate = '2025-02-01'
WHERE EnrollmentID = 999;

(Query OK, 1 row affected)


/* ---------- DELETE ---------- */

DELETE FROM Enrollments
WHERE EnrollmentID = 999;

DELETE FROM Instructors
WHERE InstructorID = 99;

DELETE FROM Courses
WHERE CourseID = 999;

DELETE FROM Students
WHERE StudentID = 99;

DELETE FROM Departments
WHERE DepartmentID = 99;

(Query OK, 1 row affected)

/* =========================================================
   QUERY 2:
   Retrieve students who enrolled after 2022
   ========================================================= */

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';

+-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         3 | Rahul     | Patel    | rahul.patel@email.com  | 2001-03-10 | 2023-07-15     |
|         4 | Priya     | Shah     | priya.shah@email.com   | 2000-11-20 | 2024-01-10     |
|         6 | Neha      | Joshi    | neha.joshi@email.com   | 2001-06-18 | 2023-08-01     |
|         9 | Sneha     | Patel    | sneha.patel@email.com  | 2001-04-14 | 2024-08-01     |
|        11 | Anjali    | Mehta    | anjali.mehta@email.com | 2000-07-11 | 2023-01-15     |
|        12 | Arjun     | Joshi    | arjun.joshi@email.com  | 2001-01-30 | 2025-01-10     |
+-----------+-----------+----------+------------------------+------------+----------------+
6 rows in set (0.015 sec)

/* =========================================================
   QUERY 3:
   Courses offered by Mathematics department
   LIMIT 5
   ========================================================= */

SELECT
    c.CourseID,
    c.CourseName,
    c.Credits
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

| CourseID | CourseName     | Credits |
| -------: | -------------- | ------: |
|      104 | Calculus       |       4 |
|      105 | Statistics     |       3 |
|      106 | Linear Algebra |       4 |



/* =========================================================
   QUERY 4:
   Number of students enrolled in each course
   Only courses with more than 5 students
   ========================================================= */

SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

| CourseID | CourseName          | StudentCount |
| -------: | ------------------- | -----------: |
|      101 | Introduction to SQL |            8 |
|      102 | Data Structures     |            7 |



/* =========================================================
   QUERY 5:
   Students enrolled in BOTH
   Introduction to SQL and Data Structures
   ========================================================= */

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

| StudentID | FirstName | LastName |
| --------: | --------- | -------- |
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
|         3 | Rahul     | Patel    |
|         5 | Amit      | Mehta    |
|         6 | Neha      | Joshi    |
|        10 | Vivek     | Shah     |



/* =========================================================
   QUERY 6:
   Students enrolled in EITHER
   Introduction to SQL OR Data Structures
   ========================================================= */

SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures');

| StudentID | FirstName | LastName |
| --------: | --------- | -------- |
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
|         3 | Rahul     | Patel    |
|         4 | Priya     | Shah     |
|         5 | Amit      | Mehta    |
|         6 | Neha      | Joshi    |
|         7 | Riya      | Desai    |
|         8 | Karan     | Verma    |
|        10 | Vivek     | Shah     |



/* =========================================================
   QUERY 7:
   Average number of credits for all courses
   ========================================================= */

SELECT AVG(Credits) AS AverageCredits
FROM Courses;

+----------------+
| AverageCredits |
+----------------+
|         3.3750 |
+----------------+

/* =========================================================
   QUERY 8:
   Maximum salary of instructors
   in Computer Science department
   ========================================================= */

SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

+----------------+
| MaximumSalary  |
+----------------+
|       75000.00 |
+----------------+

/* =========================================================
   QUERY 9:
   Count number of students enrolled in each department
   ========================================================= */

SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Courses c
ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

| DepartmentID | DepartmentName   | StudentCount |
| -----------: | ---------------- | -----------: |
|            1 | Computer Science |            9 |
|            2 | Mathematics      |            5 |
|            3 | Commerce         |            0 |
|            4 | Physics          |            0 |
|            5 | English          |            0 |



/* =========================================================
   QUERY 10:
   INNER JOIN
   Retrieve students and corresponding courses
   ========================================================= */

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

| StudentID | FirstName | LastName | CourseName          |
| --------: | --------- | -------- | ------------------- |
|         1 | John      | Doe      | Introduction to SQL |
|         1 | John      | Doe      | Data Structures     |
|         1 | John      | Doe      | Database Management |
|         2 | Jane      | Smith    | Introduction to SQL |
|         2 | Jane      | Smith    | Data Structures     |
|         3 | Rahul     | Patel    | Introduction to SQL |
|         3 | Rahul     | Patel    | Data Structures     |
|         4 | Priya     | Shah     | Introduction to SQL |
|         4 | Priya     | Shah     | Calculus            |
|         5 | Amit      | Mehta    | Introduction to SQL |
|         5 | Amit      | Mehta    | Data Structures     |
|         5 | Amit      | Mehta    | Database Management |
|         6 | Neha      | Joshi    | Introduction to SQL |
|         6 | Neha      | Joshi    | Data Structures     |
|         7 | Riya      | Desai    | Introduction to SQL |
|         7 | Riya      | Desai    | Statistics          |
|         8 | Karan     | Verma    | Data Structures     |
|         8 | Karan     | Verma    | Database Management |
|         9 | Sneha     | Patel    | Calculus            |
|         9 | Sneha     | Patel    | Statistics          |
|        10 | Vivek     | Shah     | Introduction to SQL |
|        10 | Vivek     | Shah     | Data Structures     |
|        11 | Anjali    | Mehta    | Calculus            |
|        11 | Anjali    | Mehta    | Statistics          |
|        12 | Arjun     | Joshi    | Linear Algebra      |



/* =========================================================
   QUERY 11:
   LEFT JOIN
   Retrieve ALL students and their courses, if any
   ========================================================= */

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;

| StudentID | FirstName | LastName | CourseName          |
| --------: | --------- | -------- | ------------------- |
|         1 | John      | Doe      | Introduction to SQL |
|         1 | John      | Doe      | Data Structures     |
|         1 | John      | Doe      | Database Management |
|         2 | Jane      | Smith    | Introduction to SQL |
|         2 | Jane      | Smith    | Data Structures     |
|         3 | Rahul     | Patel    | Introduction to SQL |
|         3 | Rahul     | Patel    | Data Structures     |
|         4 | Priya     | Shah     | Introduction to SQL |
|         4 | Priya     | Shah     | Calculus            |
|         5 | Amit      | Mehta    | Introduction to SQL |
|         5 | Amit      | Mehta    | Data Structures     |
|         5 | Amit      | Mehta    | Database Management |
|         6 | Neha      | Joshi    | Introduction to SQL |
|         6 | Neha      | Joshi    | Data Structures     |
|         7 | Riya      | Desai    | Introduction to SQL |
|         7 | Riya      | Desai    | Statistics          |
|         8 | Karan     | Verma    | Data Structures     |
|         8 | Karan     | Verma    | Database Management |
|         9 | Sneha     | Patel    | Calculus            |
|         9 | Sneha     | Patel    | Statistics          |
|        10 | Vivek     | Shah     | Introduction to SQL |
|        10 | Vivek     | Shah     | Data Structures     |
|        11 | Anjali    | Mehta    | Calculus            |
|        11 | Anjali    | Mehta    | Statistics          |
|        12 | Arjun     | Joshi    | Linear Algebra      |


/* =========================================================
   QUERY 12:
   SUBQUERY
   Students enrolled in courses having
   more than 10 students
   ========================================================= */

SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
WHERE e.CourseID IN
(
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);

Empty set

/* =========================================================
   QUERY 13:
   Extract year from EnrollmentDate
   ========================================================= */

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

| StudentID | FirstName | LastName | EnrollmentYear |
| --------: | --------- | -------- | -------------: |
|         1 | John      | Doe      |           2022 |
|         2 | Jane      | Smith    |           2021 |
|         3 | Rahul     | Patel    |           2023 |
|         4 | Priya     | Shah     |           2024 |
|         5 | Amit      | Mehta    |           2020 |
|         6 | Neha      | Joshi    |           2023 |
|         7 | Riya      | Desai    |           2021 |
|         8 | Karan     | Verma    |           2019 |
|         9 | Sneha     | Patel    |           2024 |
|        10 | Vivek     | Shah     |           2022 |
|        11 | Anjali    | Mehta    |           2023 |
|        12 | Arjun     | Joshi    |           2025 |


/* =========================================================
   QUERY 14:
   Concatenate instructor first and last name
   ========================================================= */

SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;

| InstructorID | InstructorName |
| -----------: | -------------- |
|            1 | Alice Johnson  |
|            2 | Bob Lee        |
|            3 | David Brown    |
|            4 | Emma Wilson    |
|            5 | Michael Clark  |


/* =========================================================
   QUERY 15:
   Running total of students enrolled in courses
   ========================================================= */

SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS StudentCount,
    SUM(COUNT(e.StudentID))
    OVER
    (
        ORDER BY c.CourseID
    ) AS RunningTotal
FROM Courses c
LEFT JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

| CourseID | CourseName           | StudentCount | RunningTotal |
| -------: | -------------------- | -----------: | -----------: |
|      101 | Introduction to SQL  |            8 |            8 |
|      102 | Data Structures      |            7 |           15 |
|      103 | Database Management  |            3 |           18 |
|      104 | Calculus             |            3 |           21 |
|      105 | Statistics           |            3 |           24 |
|      106 | Linear Algebra       |            1 |           25 |
|      107 | Accounting           |            0 |           25 |
|      108 | Business Mathematics |            0 |           25 |



/* =========================================================
   QUERY 16:
   Label students as Senior or Junior
   More than 4 years = Senior
   Otherwise = Junior
   ========================================================= */

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,

    CASE
        WHEN EnrollmentDate <
             DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel

FROM Students;

| StudentID | FirstName | LastName | StudentLevel |
| --------: | --------- | -------- | ------------ |
|         1 | John      | Doe      | Senior       |
|         2 | Jane      | Smith    | Senior       |
|         3 | Rahul     | Patel    | Junior       |
|         4 | Priya     | Shah     | Junior       |
|         5 | Amit      | Mehta    | Senior       |
|         6 | Neha      | Joshi    | Junior       |
|         7 | Riya      | Desai    | Senior       |
|         8 | Karan     | Verma    | Senior       |
|         9 | Sneha     | Patel    | Junior       |
|        10 | Vivek     | Shah     | Senior       |
|        11 | Anjali    | Mehta    | Junior       |
|        12 | Arjun     | Joshi    | Junior       |
