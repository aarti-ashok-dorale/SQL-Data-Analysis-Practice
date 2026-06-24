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

CREATE TABLE teacher (
    tid int primary key,
	cid int, foreign key(cid) references course(cid),
    tname varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15) unique,
    qualification varchar(100) not null,
    experience int check(experience>1)
);

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

