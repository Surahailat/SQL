-- library_staff Table
CREATE TABLE library_staff (
ID int primary key IDENTITY,
Name varchar(50) not null,
Phone varchar(50),
Assigned_Section char(10),
Employment_Date date 
);

-- Members Table
CREATE TABLE Members (
ID int primary key IDENTITY,
Name varchar(50) not null,
Phone varchar(50),
Email varchar(100),
Membership_Type  varchar(100),
Registration_Date date 
);


-- Categories Table
CREATE TABLE Categories (
ID int primary key IDENTITY,
Name varchar(100),
Description varchar(100)
);


-- Books Table
CREATE TABLE Books (
ID int primary key IDENTITY,
Title varchar(100) not null,
Author varchar(100),
Genre varchar(100),
Publication_Year  int,
Availability_Status varchar(50),
Registration_Date date,
Categories_ID int ,
FOREIGN KEY (Categories_ID) REFERENCES Categories(ID)
);

-- Reservations Table
CREATE TABLE Reservations (
ID int primary key IDENTITY,
Member_id int,
 Book_id int,
Reservation_Date date ,
Status varchar(50),
FOREIGN KEY (Member_id) REFERENCES Members(ID),
FOREIGN KEY (Book_id) REFERENCES Books(ID)

);

-- borrowing Table
CREATE TABLE Borrowing (
ID int primary key IDENTITY,
Member_id int,
Book_id int,
Borrowing_date date ,
due_date date ,
return_date date ,
FinancialFines_id int,
FOREIGN KEY (Member_id) REFERENCES Members(ID),
FOREIGN KEY (Book_id) REFERENCES Books(ID),
);


-- Financial fines  Table
CREATE TABLE Financial_Fines  (
ID int primary key IDENTITY,
Amount decimal(10,2),
Payment_Status  varchar(100),
borrowing_id int unique,
FOREIGN KEY (borrowing_id) REFERENCES Borrowing(ID)
);

-- Insert into Categories
INSERT INTO Categories (Name, Description) VALUES
('Fiction', 'Novels and storybooks'),
('Science', 'Books related to science and research'),
('History', 'Historical books and documents'),
('Technology', 'Tech and programming books'),
('Business', 'Books about management and finance'),
('Arts', 'Creative and artistic books'),
('Education', 'Educational materials and references');


-- Insert into Books
INSERT INTO Books (Title, Author, Genre, Publication_Year, Availability_Status, Registration_Date, Categories_ID) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 'Available', '2024-01-10', 1),
('Sapiens', 'Yuval Noah Harari', 'History', 2011, 'Available', '2024-01-11', 3),
('The Art of Computer Programming', 'Donald Knuth', 'Technology', 1968, 'Borrowed', '2024-01-12', 4),
('The Lean Startup', 'Eric Ries', 'Business', 2011, 'Available', '2024-01-13', 5),
('A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 'Available', '2024-01-14', 2),
('The War of Art', 'Steven Pressfield', 'Arts', 2002, 'Available', '2024-01-15', 6),
('Educated', 'Tara Westover', 'Education', 2018, 'Available', '2024-01-16', 7);

-- Insert into Members
INSERT INTO Members ( Name, Phone, Email, Membership_Type, Registration_Date) VALUES
('Alice Johnson', '1234567890', 'alice@example.com', 'Premium', '2024-01-05'),
('Bob Smith', '0987654321', 'bob@example.com', 'Standard', '2024-01-06'),
('Charlie Brown', '1112223333', 'charlie@example.com', 'Premium', '2024-01-07'),
('David Miller', '4445556666', 'david@example.com', 'Basic', '2024-01-08'),
('Eve Adams', '7778889999', 'eve@example.com', 'Standard', '2024-01-09'),
('Frank White', '1011121314', 'frank@example.com', 'Premium', '2024-01-10'),
('Grace Hall', '1516171819', 'grace@example.com', 'Basic', '2024-01-11');
select * from Members;
-- Insert into Library Staff
INSERT INTO Library_Staff ( Name, Phone, Assigned_Section, Employment_Date) VALUES
('John Doe', '5551234567', 'Fiction', '2020-05-10'),
('Jane Smith', '5557654321', 'Science', '2019-07-15'),
('Emma Wilson', '5551112222', 'History', '2021-09-20'),
('Liam Johnson', '5553334444', 'Technology', '2018-11-30'),
('Olivia Brown', '5555556666', 'Business', '2017-02-14'),
('Noah Davis', '5557778888', 'Arts', '2022-04-25'),
('Sophia Martinez', '5559990000', 'Education', '2016-06-05');

-- Insert into Reservations
INSERT INTO Reservations (Member_ID, Book_ID, Reservation_Date, Status) VALUES
(1, 3, '2024-02-01', 'Pending'),
(2, 5, '2024-02-02', 'Approved'),
(3, 1, '2024-02-03', 'Cancelled'),
(4, 7, '2024-02-04', 'Pending'),
(5, 2, '2024-02-05', 'Approved'),
(6, 6, '2024-02-06', 'Pending'),
(7, 4, '2024-02-07', 'Approved');

-- Insert into Borrowing
INSERT INTO Borrowing (Member_ID, Book_ID, Borrowing_Date, Due_Date, Return_Date, FinancialFines_ID) VALUES
(1, 3, '2024-01-15', '2024-02-15', NULL, NULL),
(2, 5, '2024-01-16', '2024-02-16', NULL, NULL),
(3, 1, '2024-01-17', '2024-02-17', '2024-02-05', NULL),
(4, 7, '2024-01-18', '2024-02-18', NULL, NULL),
(5, 2, '2024-01-19', '2024-02-19', '2024-02-06', NULL),
(6, 6, '2024-01-20', '2024-02-20', NULL, NULL),
(7, 4, '2024-01-21', '2024-02-21', '2024-02-07', NULL);


-- Insert into Financial Fines
INSERT INTO Financial_Fines (Amount, Payment_Status, Borrowing_ID) VALUES
(5.00, 'Unpaid', 3),
(3.50, 'Paid', 5),
(7.00, 'Unpaid', 7),
(2.00, 'Paid', 1),
(6.00, 'Unpaid', 2),
(4.00, 'Paid', 4),
(8.50, 'Unpaid', 6);

--Q1
select * from Members where Registration_Date='01-01-2025';

--Q2
select * from Books where Title='To Kill a Mockingbird';

--Q3
alter table  Members add Email varchar(100);

--Q4
INSERT INTO Members values ('Sura Hailat', '782583925', 'sura@gmail.com', 'Premium', '2024-01-05');

--Q5
select *from Members 
join Reservations on Member_id=Members.ID;

--Q6
select *from Members 
join Borrowing on Member_id=Members.ID
join Books on Borrowing.Book_id=Books.ID
where Title='Sapiens';

--Q7
select * from Members
join Reservations on Reservations.Member_id=Members.ID
join Books on Reservations.Book_id=Books.ID
where Reservations.Status = 'Approved' and Books.Title ='The War of Art';

--Q8
select * from Members
join Borrowing on Borrowing.Member_id=Members.ID
where Borrowing.return_date>Borrowing.due_date;

--Q9
select Books.Title,count(Borrowing.Book_id) as BorrowingTimes
from Books
join Borrowing on Borrowing.Book_id = Books.ID
group by Books.Title
having count(Borrowing.Book_id)>3;

--Q10
select * from Members
join Borrowing on Members.ID = Borrowing.Member_id
where Borrowing.Borrowing_date between '01-01-2024' and '10-01-2024';

--Q11
select Count(*)
from Books
where Books.Availability_Status = 'Available';
