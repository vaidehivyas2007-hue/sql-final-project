# University Course Management System

A relational database project built in MySQL that models a simplified university system — departments, students, courses, instructors, and enrollments — along with a set of SQL queries demonstrating CRUD operations, joins, aggregations, subqueries, window functions, and conditional logic.

## Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Entity Relationship Summary](#entity-relationship-summary)
- [Setup Instructions](#setup-instructions)
- [Sample Data](#sample-data)
- [Queries Included](#queries-included)
- [Tech Stack](#tech-stack)

## Overview

This project simulates a university's course management system. It covers:

- Database and table creation with primary/foreign key constraints
- Insertion of realistic sample data across 5 tables
- A full set of CRUD operations
- 16 practice queries covering filtering, joins, aggregation, subqueries, string functions, date functions, window functions, and `CASE` logic

## Database Schema

### Departments

| Column         | Type         | Constraints |
|----------------|--------------|-------------|
| DepartmentID   | INT          | PRIMARY KEY |
| DepartmentName | VARCHAR(100) |             |

### Students

| Column         | Type         | Constraints |
|----------------|--------------|-------------|
| StudentID      | INT          | PRIMARY KEY |
| FirstName      | VARCHAR(50)  |             |
| LastName       | VARCHAR(50)  |             |
| Email          | VARCHAR(100) |             |
| BirthDate      | DATE         |             |
| EnrollmentDate | DATE         |             |

### Courses

| Column        | Type         | Constraints                              |
|---------------|--------------|-------------------------------------------|
| CourseID      | INT          | PRIMARY KEY                                |
| CourseName    | VARCHAR(100) |                                             |
| DepartmentID  | INT          | FOREIGN KEY → Departments(DepartmentID)    |
| Credits       | INT          |                                             |

### Instructors

| Column        | Type          | Constraints                              |
|---------------|---------------|--------------------------------------------|
| InstructorID  | INT           | PRIMARY KEY                                |
| FirstName     | VARCHAR(50)   |                                             |
| LastName      | VARCHAR(50)   |                                             |
| Email         | VARCHAR(100)  |                                             |
| DepartmentID  | INT           | FOREIGN KEY → Departments(DepartmentID)    |
| Salary        | DECIMAL(10,2) |                                             |

### Enrollments

| Column         | Type | Constraints                        |
|----------------|------|--------------------------------------|
| EnrollmentID   | INT  | PRIMARY KEY                          |
| StudentID      | INT  | FOREIGN KEY → Students(StudentID)    |
| CourseID       | INT  | FOREIGN KEY → Courses(CourseID)      |
| EnrollmentDate | DATE |                                       |

## Entity Relationship Summary

```
Departments 1───* Courses
Departments 1───* Instructors
Students    1───* Enrollments *───1 Courses
```

- A **Department** can have many **Courses** and many **Instructors**.
- A **Student** can enroll in many **Courses** through the **Enrollments** table.
- A **Course** can have many **Students** enrolled through the **Enrollments** table.

## Setup Instructions

1. Open a MySQL client (CLI, Workbench, etc.).
2. Run the script top to bottom — it will:
   - Create the `university_course_management` database
   - Drop any existing tables with the same names
   - Create all 5 tables with proper constraints
   - Insert sample data
3. Run the numbered queries individually to explore the dataset.

```sql
CREATE DATABASE IF NOT EXISTS university_course_management;
USE university_course_management;
```

## Sample Data

| Table       | Rows |
|-------------|------|
| Departments | 5    |
| Students    | 12   |
| Courses     | 8    |
| Instructors | 5    |
| Enrollments | 25   |

## Queries Included

| # | Description |
|---|--------------|
| 1  | CRUD operations across all five tables (Create, Read, Update, Delete) |
| 2  | Students who enrolled after 2022 |
| 3  | Courses offered by the Mathematics department |
| 4  | Courses with more than 5 enrolled students |
| 5  | Students enrolled in **both** "Introduction to SQL" and "Data Structures" |
| 6  | Students enrolled in **either** "Introduction to SQL" or "Data Structures" |
| 7  | Average number of credits across all courses |
| 8  | Maximum salary among Computer Science instructors |
| 9  | Number of students enrolled per department |
| 10 | `INNER JOIN` — students matched with their enrolled courses |
| 11 | `LEFT JOIN` — all students, including those without enrollments |
| 12 | Subquery — students enrolled in courses with more than 10 students |
| 13 | Extracting the enrollment year using `YEAR()` |
| 14 | Concatenating instructor first and last names |
| 15 | Running total of enrolled students per course using a window function |
| 16 | Labeling students as "Senior" or "Junior" based on enrollment date using `CASE` |

## Tech Stack

- **Database:** MySQL
- **Concepts demonstrated:** DDL, DML, joins, aggregate functions, subqueries, window functions, conditional logic, date/string functions
