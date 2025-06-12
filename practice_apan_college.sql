create database testdb;

use testdb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);


INSERT INTO users (name) VALUES ('Alice'), ('Bob');
  
  CREATE DATABASE tyjdbc1;
  
  USE tyjdbc1;


CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary FLOAT
);

select *from employee;

select *from employee;


create table customer(id int not null, name varchar(20) not null, age int  not null, address char(25), salary decimal(18,2), Primary key(ID));


select *from customer;


Insert into customer(id , name, age, address, salary) values (1,'Ramesh' ,32,'Ahemedabad',2000.00);

Insert into customer(id , name, age, address, salary) values (2,'Khilan' ,25,'Delhi',1500.00);

Insert into customer(id , name, age, address, salary) values (3,'kaushik' ,23,'Kota',2000.00);

Insert into customer(id , name, age, address, salary) values (4,'Chaitali' ,25,'Mumbai',6500.00);

Insert into customer(id , name, age, address, salary) values (5,'Hardik' ,27,'Bhopal',8500.00);

Insert into customer(id , name, age, address, salary) values (6,'komal' ,22,'MP',4500.00);

Insert into customer(id , name, age, address, salary) values (7,'Muffy' ,24,'Indore',10000.00);

-- WHERE clause
select id, name, salary
from customer 
where salary>2000;

select id , name , salary 
from customer 
where name ='hardik';

-- AND and OR conjunctive operators 

select id , name , salary 
from customer 
where salary> 2000 AND age<25;

-- OR 
select id, name , salary
from customer 
where salary > 2000 OR age<25;


-- UPDATE Query 

update customer 
set address='pune'
where id=6;

select *from customer;

update customer 
set address ='pune',salary=1000.00;

-- safe mode cha issue ahe error : 1175 la kas remove karych te google kar ani bagh ani try kar ki te command remember karun tehvsahhil 

-- DELETE 

Delete from customer 
where id=6;
select *from customer;


-- WILDCARD operators 
-- Like it is caluses that is used to compare a value to similar values using wildcard operators , There are two wild cards used in conjunction with the LIKE operator
-- the percent sign(%) 
-- the underscore(_)
-- 200% finds any values that start with 200.
select *from customer
where salary like'200%';

select *from customer
where salary like'%200%';

-- finds any value that have 00 in the second and third position 
select *from customer
where salary like'_00%';


-- bakich pan kar page 15 var practice makes mans perfect sarv kar practice 


-- Top , LIMIT, or ROWNUM clause 


select TOP 3 * from customer; -- it for sql server 

select *from customer LIMIT 3; -- it is for my sql server 

select *from customer where ROWNUM<=3; -- it if for the oracle server 




-- ORDER BY Clause 

-- it is used to sort data in acending order based on one or more columns ,
-- some database sort the databases sort the query results in an ascending order by default . 

-- ASC
select *from customer 
order by name , salary ;

-- deceding order 
select *from customer 
order by name DESC;


-- GROUP by clause : is used in collaboration with the select statement to arrange identical data into groups , THis groups By Caluse follows the where caluse in a SELECT statment and precedes the ORDER BY caluse 


-- jar aplyala sarv yachi total amount lagat asel tar apan sum() vapartoh 
select name ,
 sum(salary)from customer
 GROUP BY name;


select name ,sum(salary ) from customer GROUP BY name;



-- Distinct keyword 

-- it is used to elminate the duplicate records with the help of select query 
select salary from customer 
order by salary ;  -- for showing that the duplicate record are present 

select DISTINCT salary from customer 
order by salary ;
 -- now by using Distinct we get duplication free data with DISTINCT 


-- ALIAS query 
-- we can change the tabel and column name using given anohter name known as ALIAS 
-- it temporary changes the actual table name 
select  C.ID, C.NAME, C.AGE, O.AMOUNT
from CUSTOMER as C, ORDERS as O
where C.ID= O.customer_ID;
-- wrong yetay gpt la vichar kay zal te 


-- column alias 
-- change the name of columns page no 24 
select id as customer_Id, name as customer_Name
from customer
where salary is not null;


-- UNION clause 
select id ,name , amount, date 
from customer 
left join orders
on customer.id=orders.customer_id
UNION 
select id, name ,amount , date
from customer 
right join orders 
on customer.id=orders ,customer_id;

-- kahi tari error yetey order chi baghun ghe karan ata ch clear kar otherwise nanter load yeil 

-- The union ALL
SELECT ID, NAME, AMOUNT, DATE 
FROM CUSTOMERS 
LEFT JOIN ORDERS 
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID 
UNION ALL 
SELECT ID, NAME, AMOUNT, DATE 
FROM CUSTOMERS 
RIGHT JOIN ORDERS 
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;  


-- using joins 

-- it is used to combines records from two or more tables in a database 
-- a join is a means for combining fields from two tables by using values common to each 

 SELECT ID, NAME, AGE, AMOUNT 
FROM CUSTOMERS, ORDERS 
WHERE CUSTOMERS.ID = ORDERS.CUSTOMER_ID;



-- inner join 

select id, name, amount ,date 
from customer
inner join orderss
on customer.id=orders.customer_ID;



-- take all types of join till the page no of  36 it will improve your commad on database and it will give you edge in front of interviwer , hey ek as ahe ki tu yala master karu saktoh rather than programming 


-- constraint -- it a rules that infroce data columnns of a table 
-- these are used to limit the type of data that can go into the table 


-- NOT NULL constraint 
-- DEFAULT constraint 
-- UNIQUE constraint 


create table customers(
 id int not null, 
 name varchar(20) not null, 
 age int not null, 
 address char(50),
 salary decimal (18,2),
 primary key(ID)
 );


alter table customers 
modify salary decimal (18,2)  NOT NULL;

-- ***** 
-- 2) default constraint : it provides

create  table  customers1 ( 
id int  not null, name varchar(20) not null, 
age int not null , 
address char(25),
salary decimal (18,2) default 5000.00, 
primary key(id)
);

alter table customers1
modify salary decimal (18,2) default 5000.00;

select *from customers1;


alter table customers1 
 alter column salary drop default;
 
 
 -- ******* 
 -- 3) unique contraint 

 -- unique constraint prevents   two records  from having identical value in column 
 
 create table customers2
 (
  id int  not null, 
  name varchar(20) not null, 
  age int  not null unique , 
  address char(25), 
  salary decimal(18,2),
  primary key(id)
  );
  
  
  alter table customers 
  modify age int not null unique;
  
  alter table customers2
  add constraint myuniqueConstraint unique (AGE,SALARY);
  
  
  -- to drop unqiue constraint , use the following sql query 
  alter  table customers2
  drop constraint myUniqueConstraint;
  -- if you are using  mysql then you can use the following syantax
  alter table customers2
  drop index myUniqueConstraint;
   


-- 4 ) primary key 

-- the primary key is a field in  a table which uniquely identidies 

use testdb;
create table customer3
( 
id int not null , 
name varchar(20) not null , 
age int not null, 
address char(25), 
salary decimal (18,2), 
primary key(ID));

alter table customer3
add  constraint PK_CUSTID primary key(ID , NAME);

-- ****** 

-- 5) foreign key 
-- it is used to link two tables together . this is sometime also called as a refrencing key .
-- A FOREIGN KEY A C COLUMN OR A  combination of  the column whose values match a primary key in a diffrent table .


create table orders 
(id int not null, date DATETIME,  customer_id int references customers(id), 
amount double,
primary key(id));

alter table orders 
add foreign key (customer_ID) references customer3(ID);


-- to drop foreign key constraint , use the follwing sql syntax
alter table orders 
DROP FOREIGN KEY ;




-- **********
-- 6) check constraint 

alter table customers
modify age int not null check(age>=18);

select *from customers;

  
  alter table customers  
  add constraint myCheckConstraint CHECK(AGE >=18);
  
  
  -- Droping constraint 
  
  alter table employees drop constraint employees_pk;
  
  alter table employees drop primary key ;
  
  
  
  
  
  -- *******************************************
  
  
   -- NULL values 
   
   -- this term is used to represent a missing value 
   -- A null value in  table is field that appears to be a blank 
   
-- Create the table
CREATE TABLE customers4 (
    id INT NOT NULL, 
    name VARCHAR(20) NOT NULL, 
    age INT NOT NULL, 
    address CHAR(25), 
    salary DECIMAL(18,2), 
    PRIMARY KEY(ID)
);

-- Insert the data

INSERT INTO customers4 (ID, NAME, AGE, ADDRESS, SALARY)
VALUES
    (1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
    (2, 'Khilan', 25, 'Delhi', NULL ),  -- Salary appears missing in original
    (3, 'kaushik', 23, 'Kota', 1500.00),
    (4, 'Chaitali', 25, 'Mumbai', 6500.00),
    (5, 'Hardik', 27, 'Bhopal', 8500.00);
    
    select *from customers4;
  
  
  -- kuth null ahe te sangyla hey vaprycha 
  
   SELECT ID, NAME, AGE, ADDRESS, SALARY 
FROM CUSTOMERS4
WHERE SALARY IS NULL; 



   -- to solve the error no 1175 SET SQL_SAFE_UPDATES = 0; 
   
   SET SQL_SAFE_UPDATES = 0;
 
-- first delete kel and ata new record add kela 

DELETE FROM customer3;

INSERT INTO customer3 (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 2000.00),
(3, 'kaushik', 23, 'Kota', 1500.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00);

-- parat chalu karych te dage update mode karna kadhi kadhi kahi important information delete houn jate 

SET SQL_SAFE_UPDATES = 1; 




-- **************************************************************************

-- ALTER 	TABLE command

alter table table_name 
drop index myuniqueconstraint; 

 -- alter table table_name;
-- drop primary key;
 
 -- add new column in existing table in this we add new column in customer3 table known as sex;
 alter table customer3
 add sex char(1);
 
 select *from customer3;
 
 -- kaam zal ata delete karych lagech  using drop column_name ;
 alter table customer3
 drop sex;
 
 
 -- ****************************************************************************
 
 -- TRUNCATE TABLE 
	-- it is used to delete complete data from the existing table 
    -- you can also use drop table command to delte the complete table but truncate will remove complete table structure from the database and you need to re create this table once again id you wish you store data.
    
    Truncate table customer3;
    
    -- i faced the problem error code: 1701 
    -- solution 
    -- Disable foreign key checks temporarily
          SET FOREIGN_KEY_CHECKS = 0;
  Truncate table customer3;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

select *from customer3;
-- Insert your new data
INSERT INTO customer3 (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 2000.00),
(3, 'kaushik', 23, 'Kota', 1500.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00);


   SET SQL_SAFE_UPDATES = 0;

-- *****************************************************************************
-- GROUP BY CLAUSE: 
-- It is used in collaboration with the SELECT statment to arrange idetntical data into groups. 
-- This group BY caluse follows the where clause in a select statment  and precedes the order by caluse . 

select name , sum(salary ) from customer3
group by name;    -- by usnig this command we merege two column and used 
-- select ne fakt ek ch selct hote by using group by we jointly display the column data 
 
 select name , sum(salary)  from customer3
 group by name;


-- ******************************************************************************************
-- Usinig VIEWS  








