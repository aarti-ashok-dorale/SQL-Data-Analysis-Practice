create database school;

use school;

CREATE TABLE course (
    cid int primary key,
    cname varchar(100) unique not null,
    duration decimal(10,2),
    fees decimal(20,2) check(fees>0),
    trainer_name varchar(100) not null,
    start_date date,
    end_date date,
    c_Mode enum("online", "offline"),
    certificate enum("yes", "no"),   
    c_level enum("beginner", "intermediate", "advanced") not null 
); 

insert into course(cid, cname, duration, fees,  trainer_name,  start_date, end_date, c_Mode, certificate, c_level)values
(3, 'Python', 4.0, 40000, 'Sarika Mam', '2026-05-01', '2026-08-31', 'offline', 'yes', 'beginner'),
(4, 'Java Full Stack', 6.0, 55000, 'Rohit Sir', '2026-05-15', '2026-11-15', 'online', 'yes', 'intermediate'),
(5, 'Web Development', 5.0, 48000, 'Riya Mam', '2026-06-01', '2026-10-31', 'offline', 'yes', 'beginner'),
(6, 'Power BI', 2.5, 30000, 'Priyanka Mam', '2026-06-10', '2026-08-25', 'online', 'yes', 'beginner'),
(7, 'Tableau', 3.0, 32000, 'Sarika Mam', '2026-07-01', '2026-09-30', 'offline', 'yes', 'intermediate'),
(8, 'SQL', 2.0, 25000, 'Rohit Sir', '2026-07-15', '2026-09-15', 'online', 'no', 'beginner'),
(9, 'Machine Learning', 7.0, 65000, 'Anjali Mam', '2026-08-01', '2027-02-28', 'offline', 'yes', 'advanced'),
(10, 'Cloud Computing', 5.5, 60000, 'Riya Mam', '2026-08-15', '2027-01-31', 'online', 'yes', 'intermediate');

select * from course;

CREATE TABLE subject (
    sid int primary key,
    sname varchar(100) unique not null,
    duration decimal(10,2),
    trainer_name varchar(100) not null,
    total_marks int check(total_marks>0),
    passing_marks int,
    subject_type enum("theory", "practical"),
    semester int,
    cid int, foreign key(cid) references course(cid)
); 

insert into subject(sid, sname, duration, trainer_name, total_marks, passing_marks, subject_type, semester, cid) values
(1, "python", 1, "priyanka mam", 67, 40, "practical", 1, 1),
(2, "powerBI", 1, "priyanka mam", 85, 40, "practical", 1, 2),
(3, "Tableau", 1, "sarika mam", 75, 40, "Practical", 1, 3),
(4, "excel", 1, "riy mam", 80, 40, "practical", 1, 4),
(5, 'Java', 2, 'Anjali Mam', 90, 40, 'Practical', 1, 5),
(6, 'C Programming', 2, 'Rohit Sir', 80, 40, 'Practical', 1, 6),
(7, 'DBMS', 1, 'Priyanka Mam', 75, 40, 'Theory', 1, 7),
(8, 'Data Structures', 2, 'Sarika Mam', 85, 40, 'Theory', 2, 8),
(9, 'HTML', 1, 'Riya Mam', 70, 40, 'Practical', 2, 9),
(10, 'CSS', 1, 'Riya Mam', 70, 40, 'Practical', 2, 10);

select * from subject;

CREATE TABLE teacher (
    tid int primary key,
	cid int, foreign key(cid) references course(cid),
    tname varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15) unique,
    qualification varchar(100) not null,
    experience int check(experience>1)
);

insert into teacher(tid, cid, tname, email, phone, qualification, experience) values
(1, 1, 'Priyanka Mam', 'priyanka@gmail.com', '1234567890', 'MBA', 5),
(2, 2, 'Sarika Mam', 'sarika@gmail.com', '1234567891', 'MCA', 4),
(3, 3, 'Riya Mam', 'riya@gmail.com', '1234567892', 'B.Tech', 3),
(4, 4, 'Rohit Sir', 'rohit@gmail.com', '1234567893', 'M.Tech', 6),
(5, 5, 'Anjali Mam', 'anjali@gmail.com', '1234567894', 'M.Sc', 5),
(6, 6, 'Neha Mam', 'neha@gmail.com', '1234567895', 'MBA', 4),
(7, 7, 'Amit Sir', 'amit@gmail.com', '1234567896', 'MCA', 7),
(8, 8, 'Pooja Mam', 'pooja@gmail.com', '1234567897', 'M.Tech', 3),
(9, 9, 'Kiran Sir', 'kiran@gmail.com', '1234567898', 'B.Tech', 5),
(10, 10, 'Sneha Mam', 'sneha@gmail.com', '1234567899', 'M.Sc', 4);

select * from teacher;

CREATE TABLE student (
    stud_id int primary key,
	cid int, foreign key(cid) references course(cid),
    tid int, foreign key (tid) references teacher(tid),
    sname varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15) unique,
    dob date,
    gender enum("male", "female"),
    address VARCHAR(255)	
);

insert into student(stud_id, cid, tid, sname, email, phone, dob, gender, address) values
(1, 1, 1, "aarti", "aarti2004@gmail.com", "9325538477", "2004-04-01", "female", "Ahilyanagar"),
(2, 2, 2, 'Sneha', 'sneha2003@gmail.com', '9325538478', '2003-06-15', 'Female', 'Pune'),
(3, 3, 3, 'Rahul', 'rahul2004@gmail.com', '9325538479', '2004-08-20', 'Male', 'Mumbai'),
(4, 4, 4, 'Priya', 'priya2003@gmail.com', '9325538480', '2003-11-10', 'Female', 'Nashik'),
(5, 5, 5, 'Aman', 'aman2004@gmail.com', '9325538481', '2004-02-25', 'Male', 'Nagpur'),
(6, 6, 6, 'Pooja', 'pooja2005@gmail.com', '9325538482', '2005-01-12', 'Female', 'Satara'),
(7, 7, 7, 'Karan', 'karan2003@gmail.com', '9325538483', '2003-09-30', 'Male', 'Kolhapur'),
(8, 8, 8, 'Neha', 'neha2004@gmail.com', '9325538484', '2004-12-18', 'Female', 'Solapur'),
(9, 9, 9, 'Rohan', 'rohan2005@gmail.com', '9325538485', '2005-03-05', 'Male', 'Aurangabad'),
(10, 10, 10, 'Kavita', 'kavita2004@gmail.com', '9325538486', '2004-07-22', 'Female', 'Sangli');

select * from student;