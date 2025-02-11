create database School_Management_System;



CREATE TABLE Classes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    class_code VARCHAR(50) NOT NULL,
    room_number int,
    schedule VARCHAR(255)
);
create table Students
(
ID INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE,
	Classes_id int ,
	FOREIGN KEY (Classes_id) REFERENCES Classes(ID)
);
CREATE TABLE Family_Info (
    ID INT PRIMARY KEY IDENTITY(1,1),
    student_id INT UNIQUE,
    fatherName VARCHAR(100),
    phone VARCHAR(15) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(ID) 
);
ALTER TABLE Family_Info 
ALTER COLUMN phone VARCHAR(15) NOT NULL;

CREATE TABLE Courses (
    ID INT PRIMARY KEY IDENTITY(1,1),
    nameCourses VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    resource VARCHAR(255)
);
CREATE TABLE StudentsCourses (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(ID),
    FOREIGN KEY (course_id) REFERENCES Courses(ID)
);
CREATE TABLE Assignments (
    ID INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    name VARCHAR(100) NOT NULL,
    description varchar(100),
    date DATE,
    state varchar(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(ID)
);
Create Table  attendance (
	ID int primary key identity(1,1),
	attendance_date date,
	Type_of_absence varchar(50),
	student_id int unique ,
	FOREIGN KEY (student_id) REFERENCES Students(ID),
);



INSERT INTO Students (name, date_of_birth, address, email, Classes_id)
VALUES 
('Ali Ahmed', '2005-06-15', 'Cairo, Egypt', 'ali.ahmed@example.com', 1),
('Sara Mohamed', '2006-04-22', 'Alexandria, Egypt', 'sara.mohamed@example.com', 2),
('Hassan Khaled', '2004-12-05', 'Giza, Egypt', 'hassan.khaled@example.com', 1),
('Mona Adel', '2007-01-30', 'Luxor, Egypt', 'mona.adel@example.com', 3),
('Omar Tarek', '2005-09-10', 'Aswan, Egypt', 'omar.tarek@example.com', 2);
select * from Students

INSERT INTO Family_Info (student_id, fatherName, phone)
VALUES 
(7, 'Ahmed Ali', '078888'),
(6, 'Mohamed Youssef', '077777'),
(3, 'Khaled Hassan','079888'),
(4, 'Adel Sami', '078880'),
(5, 'Tarek Ibrahim', '077766');
select * from Family_Info

INSERT INTO Courses (nameCourses, description, resource)
VALUES 
('Mathematics', 'Advanced Math Course', 'math_resources.pdf'),
('Physics', 'Basic Physics Concepts', 'physics_book.pdf'),
('History', 'World History Overview', 'history_notes.docx'),
('Programming', 'Introduction to Python', 'python_tutorial.pdf'),
('English', 'English Literature', 'english_lit.pdf');
select * from Courses


INSERT INTO StudentsCourses (student_id, course_id)
VALUES 
(5, 1),
(7, 2),
(6, 3),
(3, 4),
(4, 5);


INSERT INTO Classes (class_code, room_number, schedule)
VALUES 
('MTH101', 101, 'Sun-Tue-Thu 10:00-12:00'),
('PHY102', 102, 'Mon-Wed 09:00-11:00'),
('HIS103', 103, 'Sun-Tue 12:00-14:00'),
('PRG104', 104, 'Wed-Fri 08:00-10:00'),
('ENG105', 105, 'Mon-Wed-Fri 11:00-13:00');


INSERT INTO Assignments (student_id, name, description, date, state)
VALUES 
(7, 'Math Homework', 'Solve algebra equations', '2024-02-01', 'pass'),
(6, 'Physics Lab', 'Complete experiment report', '2024-02-05', 'failed'),
(3, 'History Essay', 'Write about ancient Egypt', '2024-02-07', 'pass'),
(4, 'Python Project', 'Build a simple calculator', '2024-02-10', 'pass'),
(5, 'English Summary', 'Summarize a short story', '2024-02-12', 'failed');


INSERT INTO Attendance (attendance_date, Type_of_absence, student_id)
VALUES 
('2024-02-01', 'absence', 7),
('2024-02-03', 'leaving', 6),
('2024-02-05', 'late', 3),
('2024-02-07', 'absence', 4),
('2024-02-10', 'leaving', 5);


--Q1
SELECT * FROM Students WHERE date_of_birth = '2007-01-30';

--Q2
SELECT * FROM Courses WHERE nameCourses = 'Programming';

--Q3
ALTER TABLE Students ADD  Email VARCHAR(100);

--Q4
INSERT INTO Students (name, date_of_birth, address, email)
VALUES ('sura', '2000-10-18', 'bait ras, irbid', 'sura@gmail.com');

--Q5
SELECT s.*
FROM Students s
JOIN Family_Info f ON s.ID = f.student_id;

--Q6
SELECT s.*
FROM Students s
JOIN StudentsCourses sc ON s.ID = sc.student_id
JOIN Courses c ON sc.course_id = c.ID
WHERE c.nameCourses = 'Mathematics';

--Q7
SELECT s.*
FROM Students s
JOIN Assignments a ON s.ID = a.student_id
WHERE a.name = 'SQL Assignment' AND a.state = 'pass';

--Q8
SELECT s.*
FROM Students s
JOIN Attendance a ON s.ID = a.student_id
WHERE a.Type_of_absence = 'leaving'
AND a.attendance_date BETWEEN '2024-01-01' AND '2024-01-05';


