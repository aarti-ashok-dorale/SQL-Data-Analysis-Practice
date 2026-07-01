create database library_management;

use library_management;

create table books (
    book_id int primary key,
    title varchar(100),
    author varchar(100),
    category varchar(50),
    available_copies int
);

insert into books values
(1, 'database systems', 'korth', 'computer', 10),
(2, 'c programming', 'dennis ritchie', 'programming', 5),
(3, 'python basics', 'guido van rossum', 'programming', 8),
(4, 'digital electronics', 'morris mano', 'electronics', 6),
(5, 'data structures', 'schaum', 'computer', 3);

select * from books;

create table students (
    student_id int primary key,
    student_name varchar(100),
    course varchar(50)
);

insert into students values
(101, 'arun', 'bca'),
(102, 'bhavana', 'bsc'),
(103, 'ajay', 'bca'),
(104, 'charan', 'bcom'),
(105, 'anitha', 'bca');

select * from students;

create table issue (
    issue_id int primary key,
    student_id int, foreign key (student_id) references students(student_id),
    book_id int, foreign key (book_id) references books(book_id),
    issue_date date,
    return_date date);
    
insert into issue values
(1, 101, 2, '2025-06-01', '2025-06-10'),
(2, 102, 1, '2025-06-03', '2025-06-12'),
(3, 103, 3, '2025-06-05', '2025-06-15');

select * from issue;

create table librarian (
    librarian_id int primary key,
    librarian_name varchar(100)
);

insert into librarian values
(1, 'ramesh'),
(2, 'suresh');

select * from librarian;


-- 1. display all books in the library
select * from books;

-- 2. show books written by a specific author
select * from books where author = 'dennis ritchie';

-- 3. find all students enrolled in a particular course
select * from students where course = 'bca';

-- 4. count total books available


-- 5. list books sorted alphabetically

-- 6. display books with available copies greater than 5

select * from books where available_copies > 5;

-- 7. find students whose names start with 'a'
select * from students where student_name like 'a%';

-- 8. show all issued books
select * from issue;

-- 9. count total students in the library system

-- 10. display books belonging to a specific category

select * from books where category = 'computer';