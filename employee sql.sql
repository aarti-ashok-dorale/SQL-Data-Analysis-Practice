create database company2;

use company2;

create table department(
did int primary key,
dname varchar(100) unique);

insert into department(did, dname) values
(4, 'Web Development'),
(5, 'Machine Learning');

select * from department; 

create table employees5(
eid int primary key,
ename varchar(100),
dob date,
designation varchar(100),
joinDate date,
city varchar(10) default "Pune",
address varchar(100),
gender enum("male", "female"),
contactNumber varchar(10) unique,
email varchar(100) unique,
salary decimal(10,2) check(salary > 0),
dept_id int, foreign key(dept_id) references department(did)
);

insert into employees5(eid, ename, dob, designation, joinDate, city, address, gender, contactNumber, email, salary, dept_id)values
(1, 'Aarti', '2000-05-03', 'HR', '2026-04-01', 'Pune', 'Magarpatta', 'female', '1234567890', 'aarti@gmail.com', 50000.00, 1),
(2, 'Bharti', '2000-06-10', 'HR', '2026-04-01', 'Pune', 'Hadapsar', 'female', '1234567891', 'bharti@gmail.com', 50000.00, 2),
(3, 'Rahul', '1999-08-15', 'Trainer', '2026-04-10', 'Mumbai', 'Andheri', 'male', '9876543210', 'rahul@gmail.com', 60000.00, 3),
(4, 'Sneha', '2001-01-20', 'Counselor', '2026-05-01', 'Nashik', 'College Road', 'female', '9876543211', 'sneha@gmail.com', 45000.00, 4),
(5, 'Amit', '1998-12-10', 'Manager', '2026-06-15', 'Nagpur', 'Residential School', 'male', '9876543212', 'amit@gmail.com', 70000.00, 5);

select * from employees5;

alter table employees5 rename column contactNumber to phoneNo;

alter table employees5 add column Age int;

alter table employees5 drop column Age;

describe employees5; --  to know datatype

alter table employees5 modify column designation varchar(101);

alter table employees5 modify column salary int check(salary>0);

update employees5 set designation= "abc" where eid=2;

update employees5 set Age = datediff(curDate(),dob)/365;

set sql_safe_updates=0; #safe mode off 


