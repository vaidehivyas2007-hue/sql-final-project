<div align="center">

# 🎓 University Course Management System

### A MySQL database project modeling departments, students, courses, instructors & enrollments

![MySQL](https://img.shields.io/badge/Database-MySQL-black?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-black?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-black?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-black?style=for-the-badge)

</div>

---

## 📖 Overview

This project simulates a **university course management system** — built entirely in **MySQL**. It covers real-world relational database design with:

- 🏛️ Database & table creation with primary/foreign key constraints
- 🌱 Insertion of realistic sample data across 5 tables
- 🔁 A complete set of CRUD operations
- 📊 16 practice queries covering filtering, joins, aggregation, subqueries, window functions, string/date functions, and `CASE` logic

---

## 🗂️ Table of Contents

| | |
|---|---|
| 📖 [Overview](#-overview) | 🧩 [Database Schema](#-database-schema) |
| 🔗 [Entity Relationships](#-entity-relationship-summary) | ⚙️ [Setup Instructions](#️-setup-instructions) |
| 🌱 [Sample Data](#-sample-data) | 📊 [Queries Included](#-queries-included) |
| 🛠️ [Tech Stack](#️-tech-stack) | |

---

## 🧩 Database Schema

<details open>
<summary><b>📁 Departments</b></summary>

| Column | Type | Constraints |
|---|---|---|
| `DepartmentID` | INT | 🔑 PRIMARY KEY |
| `DepartmentName` | VARCHAR(100) | |

</details>

<details open>
<summary><b>👨‍🎓 Students</b></summary>

| Column | Type | Constraints |
|---|---|---|
| `StudentID` | INT | 🔑 PRIMARY KEY |
| `FirstName` | VARCHAR(50) | |
| `LastName` | VARCHAR(50) | |
| `Email` | VARCHAR(100) | |
| `BirthDate` | DATE | |
| `EnrollmentDate` | DATE | |

</details>

<details open>
<summary><b>📚 Courses</b></summary>

| Column | Type | Constraints |
|---|---|---|
| `CourseID` | INT | 🔑 PRIMARY KEY |
| `CourseName` | VARCHAR(100) | |
| `DepartmentID` | INT | 🔗 FK → Departments(DepartmentID) |
| `Credits` | INT | |

</details>

<details open>
<summary><b>🧑‍🏫 Instructors</b></summary>

| Column | Type | Constraints |
|---|---|---|
| `InstructorID` | INT | 🔑 PRIMARY KEY |
| `FirstName` | VARCHAR(50) | |
| `LastName` | VARCHAR(50) | |
| `Email` | VARCHAR(100) | |
| `DepartmentID` | INT | 🔗 FK → Departments(DepartmentID) |
| `Salary` | DECIMAL(10,2) | |

</details>

<details open>
<summary><b>📝 Enrollments</b></summary>

| Column | Type | Constraints |
|---|---|---|
| `EnrollmentID` | INT | 🔑 PRIMARY KEY |
| `StudentID` | INT | 🔗 FK → Students(StudentID) |
| `CourseID` | INT | 🔗 FK → Courses(CourseID) |
| `EnrollmentDate` | DATE | |

</details>

---

## 🔗 Entity Relationship Summary

```
Departments  1───*  Courses
Departments  1───*  Instructors
Students     1───*  Enrollments  *───1  Courses
```

- 🏛️ A **Department** can have many **Courses** and many **Instructors**
- 👨‍🎓 A **Student** can enroll in many **Courses** via **Enrollments**
- 📚 A **Course** can have many **Students** enrolled via **Enrollments**

---

## ⚙️ Setup Instructions

```sql
-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS university_course_management;
USE university_course_management;

-- 2. Run the full script top to bottom
--    ✔ Drops old tables (if any)
--    ✔ Creates all 5 tables with constraints
--    ✔ Inserts sample data

-- 3. Run the numbered queries individually to explore the dataset
```

> 💡 **Tip:** Import the script into MySQL Workbench, DBeaver, or run it via the `mysql` CLI for the best experience.

---

## 🌱 Sample Data

<div align="center">

| Table | Rows |
|:---|:---:|
| 🏛️ Departments | **5** |
| 👨‍🎓 Students | **12** |
| 📚 Courses | **8** |
| 🧑‍🏫 Instructors | **5** |
| 📝 Enrollments | **25** |

</div>

---

## 📊 Queries Included

| # | Description |
|:---:|---|
| 1️⃣ | CRUD operations across all five tables (Create, Read, Update, Delete) |
| 2️⃣ | Students who enrolled after 2022 |
| 3️⃣ | Courses offered by the Mathematics department |
| 4️⃣ | Courses with more than 5 enrolled students |
| 5️⃣ | Students enrolled in **both** "Introduction to SQL" and "Data Structures" |
| 6️⃣ | Students enrolled in **either** "Introduction to SQL" or "Data Structures" |
| 7️⃣ | Average number of credits across all courses |
| 8️⃣ | Maximum salary among Computer Science instructors |
| 9️⃣ | Number of students enrolled per department |
| 🔟 | `INNER JOIN` — students matched with their enrolled courses |
| 11 | `LEFT JOIN` — all students, including those without enrollments |
| 12 | Subquery — students enrolled in courses with more than 10 students |
| 13 | Extracting the enrollment year using `YEAR()` |
| 14 | Concatenating instructor first and last names |
| 15 | Running total of enrolled students per course using a window function |
| 16 | Labeling students as "Senior" or "Junior" based on enrollment date using `CASE` |

---

## 🛠️ Tech Stack

<div align="center">

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)

</div>

**Concepts demonstrated:** DDL · DML · Joins · Aggregate Functions · Subqueries · Window Functions · Conditional Logic (`CASE`) · Date & String Functions

---

<div align="center">

⭐ **If you found this project useful, consider giving it a star!** ⭐

</div>
