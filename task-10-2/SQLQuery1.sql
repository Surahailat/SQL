CREATE DATABASE SchoolSystem;

create table Teachers
(
ID int primary key,
FullName varchar(50) not null,
Email varchar(50) unique
)

create table TeacherDetails
(
ID int primary key,
Phone int not null,
 Salary decimal(10,2) ,
 TeachID int unique,
 foreign key (TeachID) references Teachers(ID)
)

create table Courses
(
ID int primary key,
CourseName varchar(50) not null,
Date date,
TeachID int ,
foreign key (TeachID) references Teachers(ID)
)

create table Students
(
ID int primary key,
FullName varchar(50) not null,
Email varchar(50) unique
)
create table StudentsCourse
(
Student_id int ,
courses_id int ,
primary key (Student_id,courses_id),
foreign key (Student_id) references Students(ID),
foreign key (courses_id) references Courses(ID)
)
insert into Teachers values
(1,'Ayman jaradat', 'ayman@gmail.com'),
(2,'batool aldalki', 'batool@gmail.com'),
(3,'amer abu alhayja', 'amer@gmail.com'),
(4,'salam almomani', 'salam@gmail.com'),
(5,'mohammad frehat', 'mohammad@gmail.com')

insert into TeacherDetails values
(1,07888,500.50,1),
(2,07900,600.00,3),
(3,07777,700.59,5),
(4,07787,350.00,2),
(5,07866,1000.00,4)

insert into Courses values
(1,'C#','2025-02-01',1),
(2,'HTML','2025-12-12',2),
(3,'CSS','2025-12-30',3),
(4,'DATABASE','2025-02-10',4),
(5,'JAVASCRIPT','2025-01-01',5)

insert into Students values
(1,'sura hailat','sura@gmail.com'),
(2,'rahaf smairat','rahaf@gmail.com'),
(3,'hala bani hamad','hala@gmail.com'),
(4,'rodainah alomari','rodainah@gmail.com'),
(5,'sajeda khasawneh','sajeda@gmail.com')

insert into StudentsCourse values
(1,2),
(3,1),
(2,2),
(4,5),
(1,3)

select * from Courses
select * from Teachers
select * from TeacherDetails

