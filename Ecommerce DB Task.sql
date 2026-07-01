create database Ecommerce;
use Ecommerce;

create table category(
cat_id int primary key,
cat_name varchar(50));

insert into category values
(1, "Electronics"),
(2, "Clothing"), 
(3, "Books");

select * from category;

create table product(
prod_id int primary key,
prod_name varchar(50), 
price int,
cat_id int,foreign key(cat_id) references category(cat_id));

insert into product values
(101,'Laptop',55000,1),
(102,'Mobile',20000,1),
(103,'T-Shirt',700,2),
(104,'SQL Book',500,3);


select * from product;

create table customer (
    cust_id int primary key,
    cust_name varchar(50),
    address varchar(100),
    prod_id int
);

insert into customer values
(1,'Rahul','Pune',101),
(2,'Priya','Mumbai',102),
(3,'Aarti','Nagpur',104);

select * from customer;

create table orders1(
 or_id int primary key,
 qty int,
 payment_method varchar(50),
 prod_id int,
 cust_id int, foreign key (prod_id) references product(prod_id));
 
insert into orders1 (or_id, qty, payment_method, prod_id, cust_id) values
(1001, 2, 'UPI', 101, 1),
(1002, 1, 'Cash', 102, 2),
(1003, 3, 'Card', 104, 3),
(1004, 1, 'Net Banking', 103, 1),
(1005, 2, 'Credit Card', 102, 3); 

select * from orders1; 

-- alter table
alter table customer add phone varchar(15);
describe customer;

-- update values
update customer set phone = '9876543210' where cust_id = 1;

update customer set phone = '9876501234' where cust_id = 2;

update customer set phone = '9876512345' where cust_id = 3;

select * from customer;

-- operators
-- greater than 
select * from product where price > 1000;

-- less than
select * from product where price < 1000;

-- equal to
select * from category where cat_id = 1;

-- and operator
select * from product where price > 1000 and cat_id = 1;

-- or operator
select * from product where cat_id = 1 or cat_id = 2;

-- not operator
select * from product where not cat_id = 3;

-- between operator
select * from product where price between 500 and 30000;

-- in operator
select * from category where cat_id in (1,2);

-- like operator
select * from customer where cust_name like 'P%';

-- is operator
select * from customer where phone is not null;



