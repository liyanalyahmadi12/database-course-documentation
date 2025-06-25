Create Database AgrPractice

use AgrPractice

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Categories;

SELECT name 
FROM sys.tables 
ORDER BY name;


CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
);

CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);


--Instructors 
INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 
-- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 
-- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 
-- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3);

---------------BEGINNER LEVEL------------------------
--COUNT TOTAL STU
SELECT COUNT (*) AS total_students FROM Students;

--COUNT TOTAL ENR
SELECT COUNT(*) AS total_enrollments FROM Enrollments;

--FIND AVRAGE
SELECT CourseID, AVG(rating) AS average_rating
FROM Enrollments
GROUP BY CourseID;

--COURSE PER INTRA
SELECT InstructorID, COUNT(*) AS course_count
FROM Courses
GROUP BY InstructorID;

--NUMBER OF CAT
SELECT CategoryID, COUNT(*) AS total_courses
FROM Courses
GROUP BY CategoryID;

--NUM OF STU BY ENR
SELECT CourseID, COUNT(StudentID) AS students_enrolled
FROM Enrollments
GROUP BY CourseID;

--NUM OF STU BY COR
SELECT CourseID, COUNT(StudentID) AS students_enrolled
FROM Enrollments
GROUP BY CourseID;

--AVRAGE PRICE PER CAT
SELECT CourseID, AVG(price) AS average_price
FROM Courses
GROUP BY CategoryID;

--MAX COURSE PRICE
SELECT MAX(price) AS max_price FROM Courses;

--MIN MAX AVG
SELECT CourseID,
       MIN(rating) AS min_rating,
       MAX(rating) AS max_rating,
       AVG(rating) AS avg_rating
FROM Enrollments
GROUP BY CourseID;


----STUDENT RATE 5
SELECT COUNT(*) AS five_star_ratings
FROM Enrollments
WHERE rating = 5;







